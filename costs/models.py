from django.db import models

# Create your models here.
class grade(models.Model):
    Grade = models.PositiveIntegerField()
    Section = models.CharField(max_length=1000)