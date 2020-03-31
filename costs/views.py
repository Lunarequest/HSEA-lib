from django.shortcuts import render, redirect
from .models import grade
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