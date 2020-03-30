from django.db import models

# Create your models here.


class books(models.Model):
    ISBN = models.PositiveIntegerField(primary_key=True)
    Name = models.CharField(max_length=1000)


class book_ind(models.Model):
    Ind_Book_ID = models.PositiveIntegerField(primary_key=True)
    ISBN = models.ForeignKey(books, on_delete=models.CASCADE)
    Name = models.CharField(max_length=1000)


class Issues(models.Model):
    Ind_Book_ID = models.PositiveIntegerField(primary_key=True)
    ISBN = models.ForeignKey(books, on_delete=models.CASCADE)
    Name = models.CharField(max_length=1000)
    student_id = models.PositiveIntegerField()
    issue_date = models.DateField()
    return_date = models.DateField()
