from django.db import models
from datetime import datetime
import django.utils.timezone
import os
from uuid import uuid4
from django.contrib.auth import get_user_model

# from .views import wrapper

# Create your models here.
class Image(models.Model):
    user = models.IntegerField()
    img = models.ImageField(
        upload_to='',
    )
    date = models.DateField(default=django.utils.timezone.now)
    login = models.BooleanField()


class Objects(models.Model):
    obj_name = models.TextField(max_length=100, unique=True)


class ImageObjects(models.Model):
    obj = models.ForeignKey(Objects, on_delete=models.CASCADE, related_name='obj_id')
    img = models.ForeignKey(Image, on_delete=models.CASCADE, related_name='obj_img_id')
    score = models.FloatField()


class Labels(models.Model):
    label_name = models.TextField(max_length=100, unique=True)


class ImageLabels(models.Model):
    label = models.ForeignKey(Labels, on_delete=models.CASCADE, related_name='label_id')
    img = models.ForeignKey(Image, on_delete=models.CASCADE, related_name='lbl_img_id')
    score = models.FloatField()


class Languages(models.Model):
    language = models.TextField(unique=True)
    name = models.TextField()


class Rating(models.Model):
    img = models.ForeignKey(Image, on_delete=models.CASCADE, related_name='rate_img_id')
    user = models.ForeignKey(
        get_user_model(), on_delete=models.CASCADE, related_name='user'
    )
    score = models.FloatField()