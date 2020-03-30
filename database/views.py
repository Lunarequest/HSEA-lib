from django.shortcuts import render, redirect
from .models import books, book_ind, Issues


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
        pass
    else:
        loc = books.objects.values('Name').filter(ISBN=pk).values_list("Name",flat=True)
        loc = loc[0]
        response = render(request, 'lib/add_hsea.html', locals())
        return response