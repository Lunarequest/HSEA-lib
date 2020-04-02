from datetime import datetime, timedelta
from django.shortcuts import render, redirect, HttpResponse
from django.contrib import messages
from django.core.mail import send_mail
from .models import books, book_ind, Issues, Late_dues
from costs.models import student, grade
# Create your views here.
def display(request, q=None):
     if request.user.groups.filter(name__in=['teacher']):
        try:
            q = request.GET['q']
            search = Issues.objects.filter(pk=q)
            response  = render(request, 'lib/db.html', locals())
            return response
        except:
            items = books.objects.all()
            item2 = book_ind.objects.all()
            item3 = Issues.objects.all()
            response = render(request, 'lib/db.html', locals())
            return response
     else:
         return redirect('/error/402')
def add_main(request):
    if request.user.groups.filter(name__in=['teacher']):
        if request.method == "POST":
            ISBN = request.POST['ISBN']
            Name = request.POST['name']
            openq = books(ISBN=ISBN, Name=Name)
            openq.save()
            return redirect("/database")
        else:
            response = render(request,"lib/add_main.html")
            return response
    else:
        return redirect('/error/402')
def add_hsea(request, pk):
    if request.user.groups.filter(name__in=['teacher']):
        if request.method == "POST":
            code = request.POST['HSEA']
            Name = books.objects.values('Name').filter(ISBN=pk).values_list('Name', flat=True)
            Name = Name[0]
            link = books.objects.get(ISBN=pk)
            openind = book_ind(Ind_Book_ID=code, ISBN=pk, Name=Name, Link=link)
            openind.save()
            return redirect('/database')
        else:
            loc = books.objects.values('Name').filter(ISBN=pk).values_list("Name",flat=True)
            loc = loc[0]
            response = render(request, 'lib/add_hsea.html', locals())
            return response
    else:
        return redirect("/error/402")

def issue_book(request):
    if request.method == "POST":
        Student_id = request.POST['student_id']
        if student.objects.filter(Student_id=Student_id).exists():
            HSEA_code = request.POST['code']
            if Issues.objects.filter( Ind_Book_ID=HSEA_code).exists():
                return render(request, "lib/already_issued.html")
            elif book_ind.objects.filter(pk=HSEA_code).exists():
                issue_date = datetime.now()
                return_date = datetime.now() + timedelta(days=7)
                x = book_ind.objects.values('Name').filter(pk=HSEA_code).values_list('Name', flat=True)
                Name = x[0]
                x = book_ind.objects.values('ISBN').filter(pk=HSEA_code).values_list('ISBN', flat=True)
                ISBN = x[0]
                link = books.objects.get(pk=ISBN)
                openi = Issues(Ind_Book_ID=HSEA_code, ISBN=ISBN, Name=Name, student_id=Student_id, issue_date=issue_date, return_date=return_date, Link=link)
                openi.save()
                return redirect("/select")
            else:
                messages.info(request, "The HSEA code does not exist")
                return redirect("/library/issue")
        else:
                messages.info(request, "The Student id does not exist")
                return redirect("/library/issue")
    else:
        response = render(request, 'student/issue.html')
        return response

def returns(request, pk):
    if request.user.groups.filter(name__in=['teacher']):
        Issues.objects.filter(pk=pk).delete()
        response = redirect("/database")
        return response
    else:
        return redirect("/error/402")
def pull(request):
    if request.user.groups.filter(name__in=['teacher']):
        if request.method == "POST":
            student_id = request.POST["student_id"]
            if student.objects.filter(Student_id=student_id).exists():
                items = Issues.objects.filter(student_id=student_id)
                response = render(request, "student/view_db.html", locals())
                return response
            else:
                messages.info(request,"The supplied student id does not exist")
                return redirect("/library/issued_books")
        else:
            response = render(request, "student/get_id.html")
            return response
    else:
        return redirect("/error/402")

def late(request):
    if request.user.groups.filter(name__in=['teacher']):
        late_books = Issues.objects.filter(return_date__lt=datetime.now())
        for book in late_books.iterator():
            S_id = book.student_id
            HSEA_code =  book.Ind_Book_ID
            ret_date = book.return_date
            Link = Issues.objects.get(pk=HSEA_code)
            if Late_dues.objects.filter(Ind_Book_ID=HSEA_code).exists():
                pass
            else:
                delta = datetime.now().date() -ret_date
                z = delta.days
                row = book_ind.objects.values("Name").filter(pk=HSEA_code).values_list("Name", flat=True)
                Name = row[0]
                q = Late_dues(Link=Link, student_id=S_id, Ind_Book_ID=HSEA_code,return_date=ret_date, delay=z , Name=Name)
                q.save()
        items = Late_dues.objects.all()
        response = render(request, "lib/late.html", locals())
        return response
    else:
        return redirect("/error/402")

def report(request):
    if request.user.groups.filter(name__in=['teacher']):
        late_dues = Late_dues.objects.all()
        for account in late_dues.iterator():
            student_id = account.student_id
            grades = student.objects.values("student_grade").filter(pk=student_id).values_list("student_grade", flat=True)
            grades = grades[0]
            section = student.objects.values("section").filter(pk=student_id).values_list("section", flat=True)
            section = section[0]
            name = student.objects.values("Student_Name").filter(pk=student_id).values_list("Student_Name", flat=True)
            name = name[0]
            gradx = grade.objects.filter(Grade=grades).filter(Section=section)
            for x in gradx:
                email1 = x.email_1
                email2 = x.email_2
                message = f"""Dear Sir/Madam

    {name} has not returned the book {account.Name} please ensure it returned
    at the soonest possible.
                        """
                send_mail(
                'Late returns',
                message,
                'teampaasta@gmail.com',
                [email1, email2],
                fail_silently=True
    )
        return redirect("/database/latebooks")
    else:
        return redirect("/error/402")

def no_perms(request):
    return render(request,"no_perms.html")