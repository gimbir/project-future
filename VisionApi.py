import os, io
from google.cloud import vision
from main.models import Image as Images
from main.models import Objects
from main.models import ImageObjects
from main.models import Labels
from main.models import ImageLabels

# from models import *
from numpy import random

from Pillow_Utility import draw_borders, Image
import pandas as pd
from django.conf import settings


def Vision(fileName):
    os.environ[
        'GOOGLE_APPLICATION_CREDENTIALS'
    ] = r'CloudVisionServiceAccountToken.json'
    client = vision.ImageAnnotatorClient()

    file_name = fileName

    image_path = os.path.join(settings.MEDIA_ROOT, str(file_name))

    with io.open(image_path, 'rb') as image_file:
        content = image_file.read()

    image = vision.Image(content=content)
    response = client.object_localization(image=image)
    response_label = client.label_detection(image=image)
    object_anno = response.localized_object_annotations
    labels = response_label.label_annotations

    for obj in object_anno:
        if not Objects.objects.filter(obj_name=obj.name).exists():
            Objects.objects.create(obj_name=obj.name)
        ImageObjects.objects.create(
            obj_id=Objects.objects.get(obj_name=obj.name).pk,
            img_id=Images.objects.get(img=file_name).pk,
            score=obj.score,
        )

    for label in labels:
        if not Labels.objects.filter(label_name=label.description).exists():
            Labels.objects.create(label_name=label.description)
        ImageLabels.objects.create(
            label_id=Labels.objects.get(label_name=label.description).pk,
            img_id=Images.objects.get(img=file_name).pk,
            score=label.score,
        )

    pillow_image = Image.open(image_path)
    obj_index = 0

    for obj in object_anno:
        r, g, b = (0, 255, 0)
        obj_index += 1
        draw_borders(
            pillow_image,
            obj.bounding_poly,
            (r, g, b),
            pillow_image.size,
            str(obj_index),
        )
    pillow_image.save(fp=image_path)
