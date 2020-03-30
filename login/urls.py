from django.urls import path
from . import views
urlpatterns = [
    path('', views.logins, name='login'),
    path('logout', views.logouts, name='logout')

]