from django.urls import path
from . import views
app_name="costs"
urlpatterns = [
    path("", views.display, name="main"),
    path("create_grade", views.create_grade, name="cg"),
    path("view_grade", views.view_grade, name="view_g"),
    path("add_student", views.add_student, name="biba"),
    path("view_student/<int:pk>/<str:pk1>", views.view_students, name="view_with_pk"),
    path("edit_student/<int:pk>", views.edit_student, name="edit_student")
]