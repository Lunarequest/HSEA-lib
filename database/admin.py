from django.contrib import admin
from .models import books, book_ind, Issues, Late_dues
# Register your models here.
admin.site.register(books)
admin.site.register(book_ind)
admin.site.register(Issues)
admin.site.register(Late_dues)