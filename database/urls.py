from django.urls import path
from . import views
app_name = 'db'

urlpatterns=[
    path('/issue', views.issue_book, name='issue'),
    path('', views.display, name = "display"),
    path('/add', views.add_main, name = "Add_main"),
    path('/issued_books', views.pull, name = "get_student_id"),
    path('*/add_HSEA/<int:pk>', views.add_hsea, name="add_id_with_pk"),
    path('*/return/<int:pk>',  views.returns, name="return_with_pk"),
    
]