from django.shortcuts import render, redirect

# Create your views here.
def page(request):
    if request.user.groups.filter(name__in=['teacher']) or request.user.groups.filter(name__in=['student']):
        response = render(request,'sel/c.html')
        return response
    else:
        return redirect("/error/402")