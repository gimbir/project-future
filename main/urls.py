from django.urls import path
from . import views
from django.conf import settings
from django.conf.urls.static import static

urlpatterns = [
    path('', views.main, name='home'),
    path('about/', views.main, name='about'),
    path('gallery/', views.main, name='gallery'),
    path('translate/', views.main, name='translate'),
    path('TranslateResult/', views.TranslateResult, name='TranslateResult'),
    path('rating/', views.rating, name='rating'),
]