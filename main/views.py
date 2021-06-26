import json
from django.core import paginator
from django.http.response import HttpResponse
from django.shortcuts import render, redirect
from django.http import HttpResponseRedirect
from django.views.generic import TemplateView
from django.contrib.auth import login, authenticate, logout, get_user_model
from django.contrib.auth.forms import UserCreationForm
from django.contrib import messages
from django.urls import reverse
from .models import *
from .forms import RegisterForm
from django.conf import settings
import VisionApi
import TranslateAPI
from django.http import JsonResponse
from django.core.paginator import Paginator
import django.core.exceptions


def base(request, name):
    return render(request, 'main/base.html')


def main(request):
    current_url = request.resolver_match.url_name
    form = RegisterForm()
    if request.method == "POST":
        # Register
        if request.POST.get('submit') == 'register':
            form = RegisterForm(request.POST)

            # Register Success
            if form.is_valid():
                username = form.cleaned_data.get('username')
                raw_password = form.cleaned_data.get('password1')
                form.save()
                msg = 'Register Successful!'
                msgtype = 0
                msgcolor = 'bg-success'
                user = authenticate(username=username, password=raw_password)
                login(request, user)
                return HttpResponseRedirect(request.META.get('HTTP_REFERER', '/'))

            # Register Failed
            else:
                msg = form.errors
                msgtype = 1
                msgcolor = 'bg-danger'
        # Login
        elif request.POST.get('submit') == 'login':
            username = request.POST.get('username')
            password = request.POST.get('password')

            user = authenticate(request, username=username, password=password)

            # Login Success
            if user is not None:
                login(request, user)
                msg = 'Welcome, ' + username
                msgtype = 2
                msgcolor = 'bg-success'
                return HttpResponseRedirect(request.META.get('HTTP_REFERER', '/'))

            # Login Failed
            else:
                msg = 'Username or password is incorrect'
                msgtype = 3
                msgcolor = 'bg-warning'

        # Upload
        elif request.POST.get('submit') == 'translate':
            image_file = request.FILES.get('img')
            if image_file:
                if image_file.size < 2621440:
                    if request.user.is_authenticated:
                        Image.objects.create(
                            user=request.user.id, img=image_file, login=True
                        )
                    else:
                        Image.objects.create(user=0, img=image_file, login=False)
                    img_name = str(Image.objects.last().img)
                    VisionApi.Vision(img_name)

                    url = 'main/' + current_url + '.html'
                    return HttpResponseRedirect(
                        reverse(current_url) + f'?image={img_name}'
                    )
                else:
                    msg = 'Image size can not be bigger than 2.5 MB.'
                    msgtype = 3
                    msgcolor = 'bg-warning'
                    current_url = 'home'
            else:
                msg = 'Please insert an image.'
                msgtype = 3
                msgcolor = 'bg-warning'
                current_url = 'home'
        context = {
            'msg': msg,
            'msgtype': msgtype,
            'msgcolor': msgcolor,
            'form': form,
        }
        url = 'main/' + current_url + '.html'
        return render(request, url, context=context)
    # GET Requests
    else:
        list_obj = list(())
        list_lbl = list(())
        langs = []
        images = []
        page_obj = ""
        obj_filter = ""
        if current_url == "translate":

            imgname = request.GET.get('image')
            # Get object ID
            objid = list(
                (
                    ImageObjects.objects.filter(
                        img_id=Image.objects.get(img=imgname).pk
                    ).values_list('obj_id', flat=True)
                )
            )
            # Get Object names
            image_objects = list(())
            for obj in objid:
                image_objects.append(Objects.objects.get(pk=obj).obj_name)
            # Get Object scores
            obj_score = list(
                (
                    ImageObjects.objects.filter(
                        img_id=Image.objects.get(img=imgname).pk
                    ).values_list('score', flat=True)
                )
            )
            # Format scores as .2f%
            score_index = 0
            for score in obj_score:
                score *= 100
                obj_score[score_index] = "{:.2f}".format(score)
                score_index += 1

            # Get label ID
            label_id = list(
                (
                    ImageLabels.objects.filter(
                        img_id=Image.objects.get(img=imgname).pk
                    ).values_list('label_id', flat=True)
                )
            )
            # Get label names
            image_labels = list(())
            for lbl in label_id:
                image_labels.append(Labels.objects.get(pk=lbl).label_name)
            # Get Label scores
            label_score = list(
                (
                    ImageLabels.objects.filter(
                        img_id=Image.objects.get(img=imgname).pk
                    ).values_list('score', flat=True)
                )
            )

            score_index = 0
            for score in label_score:
                score *= 100
                label_score[score_index] = "{:.2f}".format(score)
                score_index += 1

            list_obj = list(zip(image_objects, obj_score))
            list_lbl = list(zip(image_labels, label_score))

            # Get languages
            langs = []
            for i in range(len(Languages.objects.all())):
                langs.append(
                    {
                        "language": Languages.objects.get(pk=i + 1).language,
                        "name": Languages.objects.get(pk=i + 1).name,
                    }
                )
        elif current_url == "gallery":
            # Get Images(Gallery)
            all_objs = []
            filter_obj = request.GET.get('object')
            filter_score = request.GET.get('slider')
            filter_rate = request.GET.get('filter_rate')
            for img in Image.objects.all():
                obj_names = ""
                filter_bool = False
                myImages_bool = False
                score_bool = False
                rate_bool = False
                id = img.pk
                # Get Objects for img title
                if ImageObjects.objects.filter(img_id=id).all():
                    obj_id = (
                        ImageObjects.objects.filter(img_id=id)
                        .order_by('-score')[0]
                        .obj_id
                    )
                    obj_name = Objects.objects.get(id=obj_id).obj_name
                else:
                    obj_names = "No object detected."
                    obj_name = "No object detected."
                    filter_bool = True
                # Get all object names
                all_objs = list(
                    ImageObjects.objects.filter(img_id=id)
                    .values_list('obj_id', flat=True)
                    .distinct()
                )
                for obj in all_objs:
                    object_names = Objects.objects.get(id=obj).obj_name
                    if (filter_obj == None) or (object_names == filter_obj):
                        obj_names = obj_names + str(object_names) + " "
                        filter_bool = True

                if filter_score != None:
                    if filter_obj == None:
                        for obj in ImageObjects.objects.filter(img_id=id).all():
                            if obj.score >= (float(filter_score) / 100):
                                score_bool = True
                                break
                            else:
                                score_bool = False
                    else:
                        obj_id = Objects.objects.get(obj_name=filter_obj).id
                        for obj in ImageObjects.objects.filter(
                            img_id=id, obj_id=obj_id
                        ).all():
                            if obj.score >= (float(filter_score) / 100):
                                score_bool = True
                                break
                            else:
                                score_bool = False
                else:
                    score_bool = True
                    # Get usernames

                User = get_user_model()
                if img.user != 0:
                    users = User.objects.get(id=img.user).username
                else:
                    users = "Guest"

                # Get image rate avg
                rates = list(
                    Rating.objects.filter(img_id=id).values_list('score', flat=True)
                )
                if rates:
                    avg = sum(rates) / len(rates)
                else:
                    avg = "No Rate"

                if filter_rate != None:
                    if avg != "No Rate":
                        if avg >= float(filter_rate):
                            rate_bool = True
                        else:
                            rate_bool = False
                else:
                    rate_bool = True

                # My images filter
                current_user = request.user.id
                if request.GET.get('myImages'):
                    if current_user == img.user:
                        myImages_bool = True
                    else:
                        myImages_bool = False
                else:
                    myImages_bool = True

                if filter_bool and myImages_bool and score_bool and rate_bool:
                    images.append(
                        {
                            "img": str(img.img),
                            "image_title": obj_name,
                            "user": users,
                            "objects": obj_names,
                            "date": str(img.date),
                            "rate": avg,
                        }
                    )
            # endfor

            paginator = Paginator(images, 8)
            page_number = request.GET.get('page')
            page_obj = paginator.get_page(page_number)

            # Filter Objects
            obj_filter = Objects.objects.values('obj_name').order_by('obj_name')

        url = 'main/' + current_url + '.html'
        return render(
            request,
            url,
            {
                'obj_filter': obj_filter,
                'page_obj': page_obj,
                'images': images,
                'langs': langs,
                'list_obj': list_obj,
                'list_lbl': list_lbl,
                'form': form,
                'title': current_url.capitalize(),
                'url': current_url,
            },
        )


def TranslateResult(request):
    tl = request.GET.get("tl")
    text = request.GET.get('text')
    result = TranslateAPI.translate(text, tl)
    return JsonResponse({'result': result}, status=200)


def rating(request):
    current_user = request.user.id
    rate = request.GET.get('rate')
    image = request.GET.get('image')
    img_id = Image.objects.get(img=image).pk
    if not Rating.objects.filter(img_id=img_id, user_id=current_user).exists():
        Rating.objects.create(img_id=img_id, user_id=current_user, score=rate)
    else:
        current_rate = Rating.objects.get(img_id=img_id, user_id=current_user)
        current_rate.score = rate
        current_rate.save()
    return JsonResponse({'result': 'Rating successful..'}, status=200)

