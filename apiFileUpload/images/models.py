from django.db import models

# Create your models here.
class Image(models.Model):
    url = models.ImageField(upload_to='images')
    created_at = models.DateTimeField(auto_now_add=True)