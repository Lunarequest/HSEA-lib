from django.contrib import admin
from .models import books, book_ind, Issues
# Register your models here.
admin.site.register(books)
admin.site.register(book_ind)
admin.site.register(Issues)