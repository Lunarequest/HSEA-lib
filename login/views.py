from django.shortcuts import render, redirect
from django.contrib.auth import authenticate
from django.contrib import messages
# Create your views here.
def login(request):
    if(request.method == "POST"):
        username = request.POST['usr']
        password =  request.POST['pswd']
        user  = authenticate(username=username, password=password)
        if user is not None:
            return redirect("/select")
        else:
            messages.info(request,'invalid login')
            return redirect("/login", locals())
    else:
        return render(request,'login.html')