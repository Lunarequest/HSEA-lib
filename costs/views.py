from django.shortcuts import render, redirect
from django.contrib import messages
from .models import grade, student
# Create your views here.
def display(request):
    response = render(request, "costs/main.html")
    return response


def create_grade(request):
    if request.method == "POST":
        Grade = request.POST["Grade"]
        Section = request.POST["sec"]
        q = grade(Grade=Grade, Section=Section)
        q.save()
        return redirect("/admin_panel")
    else:
        response = render(request, "costs/Gcreate.html")
        return response

def view_grade(request):
    items = grade.objects.all()
    response = render(request,"costs/Gview.html",locals())
    return response

def add_student(request):
    if request.method == "POST":
        s_grade = request.POST["Grade"]
        section = request.POST["sec"]
        Name = request.POST["s_name"]
        student_id = request.POST["s_id"]
        if grade.objects.filter(Grade=s_grade).filter(Section=section).exists():
            if student.objects.filter(pk=student_id).exists():
                messages.info(request, "Student ID is not unique")
                return redirect("/admin_panel/add_student")
            else:
                Link = grade.objects.get(Grade=s_grade)
                q = student( Student_id=student_id, student_grade=s_grade, section=section, Student_Name=Name, Link=Link)
                q.save()
                return redirect("/admin_panel")
        else:
            messages.info(request, "The grade or section does not exist")
            return redirect("/admin_panel/add_student")
    else:
        response = render(request, "costs/add_stu.html")
        return response

def view_students(request, pk, pk1):
    items = student.objects.filter(student_grade=pk).filter(section=pk1)
    response = render(request, "costs/view_students.html", locals())
    return response

def edit_student(request,pk):
    if request.method == "POST":
        name = request.POST["name"]
        student.objects.filter(pk=pk).update(Student_Name=name)
        return redirect("/admin_panel/view_grade")
    else:
        response = render(request, "costs/edit_student.html")
        return response