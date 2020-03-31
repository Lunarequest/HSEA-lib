from django.urls import path
from . import views

urlpatterns = [
    path("", views.display, name="main"),
    path("create_grade", views.create_grade, name="cg"),
    path("view_grade", views.view_grade, name="view_g")
]