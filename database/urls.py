from django.urls import path
from . import views
app_name = 'db'

urlpatterns=[
    path('', views.display, name = "display"),
    path('/add', views.add_main, name = "Add_main"),
    path('*/add_HSEA/<int:pk>', views.add_hsea, name="add_id_with_pk"),
    path('*/Issue/<int:pk>', views.issue_book, name='issue_with_pk')
]