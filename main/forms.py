from django.forms import ModelForm
from django.contrib.auth.forms import UserCreationForm
from django.contrib.auth.models import User
from django import forms
from django.db import models


class RegisterForm(UserCreationForm):

    email = forms.EmailField(
        required=True,
        help_text='Required. Add a valid email address',
        widget=forms.EmailInput(
            attrs={
                "placeholder": "E-mail",
            }
        ),
    )

    class Meta:
        model = User
        fields = ['username', 'email', 'password1', 'password2']
