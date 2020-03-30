from django.shortcuts import render, redirect
from django.contrib.auth import authenticate, logout, login
from django.contrib import messages
# Create your views here.
def logins(request):
    if(request.method == "POST"):
        username = request.POST['usr']
        password =  request.POST['pswd']
        user  = authenticate(username=username, password=password)
        if user is not None:
            login(request, user)
            return redirect("/select")
        else:
            messages.info(request,'invalid login')
            return redirect("/login", locals())
    else:
        return render(request,'login.html')

def logouts(request):
    logout(request)
    return redirect("/")