from datetime import datetime, timedelta
from django.shortcuts import render, redirect, HttpResponse
from .models import books, book_ind, Issues, Late_dues
# Create your views here.
def display(request):
    items = books.objects.all()
    item2 = book_ind.objects.all()
    item3 = Issues.objects.all()
    response = render(request, 'lib/db.html', locals())
    return response

def add_main(request):
    if request.method == "POST":
        ISBN = request.POST['ISBN']
        Name = request.POST['name']
        openq = books(ISBN=ISBN, Name=Name)
        openq.save()
        return redirect("/database")
    else:
        response = render(request,"lib/add_main.html")
        return response

def add_hsea(request, pk):
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


def issue_book(request):
    if request.method == "POST":
        """need to add auth for student id"""
        Student_id = request.POST['student_id']
        HSEA_code = request.POST['code']
        if Issues.objects.filter( Ind_Book_ID=HSEA_code).exists():
            return render(request, "bdalready_issued.html")
        else:
            issue_date = datetime.now()
            return_date = datetime.now() + timedelta(days=7)
            x = book_ind.objects.values('Name').filter(pk=HSEA_code).values_list('Name', flat=True)
            Name = x[0]
            x = book_ind.objects.values('ISBN').filter(pk=HSEA_code).values_list('ISBN', flat=True)
            ISBN = x[0]
            link = books.objects.get(pk=ISBN)
            openi = Issues(Ind_Book_ID=HSEA_code, ISBN=ISBN, Name=Name, student_id=Student_id, issue_date=issue_date, return_date=return_date, Link=link)
            print(openi)
            openi.save()
            return redirect("/select")
    else:
        response = render(request, 'student/issue.html')
        return response

def returns(request, pk):
    Issues.objects.filter(pk=pk).delete()
    response = redirect("/database")
    return response
def pull(request):
    if request.method == "POST":
        student_id = request.POST["student_id"]
        items = Issues.objects.filter(student_id=student_id)
        response = render(request, "student/view_db.html", locals())
        return response
    else:
        response = render(request, "student/get_id.html")
        return response

def late(request):
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
            q = Late_dues(Link=Link, student_id=S_id, Ind_Book_ID=HSEA_code,return_date=ret_date, delay=z)
            q.save()
    items = Late_dues.objects.all()
    response = render(request, "lib/late.html", locals())
    return response