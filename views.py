import datetime
import profile
import random
import smtplib

from django.contrib.auth import authenticate, logout, login
from django.contrib.auth.decorators import login_required
from django.contrib.auth.hashers import check_password, make_password
from django.contrib.auth.models import Group
from django.core.files.storage import FileSystemStorage
from django.http import HttpResponse, JsonResponse
from django.shortcuts import render, redirect

# Create your views here.
from django.views.decorators.cache import never_cache

from news_detection.models import *







def login1(request):
    return render(request,'login.html')

def login_post(request):
    username=request.POST['textfield']
    password=request.POST['textfield2']
    data=authenticate(request,username=username,password=password)
    if data is not None:
        login(request,data)
        if data.is_superuser:
            return HttpResponse("<script>alert('login sucessfull');window.location='/adminhome';</script>")
        elif data.groups.filter(name='subadmin').exists():
            obj=subadmin.objects.get(LOGIN=data)
            request.session['sid']=obj.id
            return HttpResponse("<script>alert('login sucessfull');window.location='/subadminhome';</script>")
        elif data.groups.filter(name='reporter').exists():
            obj=reporter.objects.get(LOGIN=data)
            request.session['rid']=obj.id
            return HttpResponse("<script>alert('login sucessfull');window.location='/reporterhome';</script>")
        else:
            return HttpResponse("<script>alert('wrong credentials');window.location='/';</script>")
    else:
        return HttpResponse("<script>alert('wrong credentials');window.location='/';</script>")



def adminhome(request):
    return render(request,'admin/adminindex.html')

@login_required
@never_cache
def add_area(request):
    return render(request,'admin/addarea.html')

@login_required
@never_cache
def add_post(request):
    District=request.POST['select']
    ar=request.POST['textfield2']
    latitude=request.POST['latitude']
    longitude=request.POST['longitude']
    if area.objects.filter(areas=ar).exists():
        return HttpResponse("<script>alert('already existed ');window.location='/adminhome';</script>")

    obj=area()
    obj.district=District
    obj.areas=ar
    obj.latitude=latitude
    obj.longitude=longitude
    obj.save()
    return HttpResponse("<script>alert('area added');window.location='/view_area';</script>")



@login_required
@never_cache
def view_area(request):
    data=area.objects.all()
    return render(request,'admin/View_Area.html',{'data':data})

@login_required
@never_cache
def edit_area(request,id):
    data=area.objects.get(id=id)
    return render(request,'admin/edit_area.html',{'data':data})

@login_required
@never_cache
def edit_area_post(request,id):
    District = request.POST['select']
    ar = request.POST['textfield2']
    latitude = request.POST['latitude']
    longitude = request.POST['longitude']
    area.objects.filter(id=id).update(district=District,areas=ar,latitude=latitude,longitude=longitude)
    return HttpResponse("<script>alert('area updated');window.location='/view_area';</script>")

@login_required
@never_cache
def delete_area(request,id):
    area.objects.get(id=id).delete()
    return HttpResponse("<script>alert('area deleted');window.location='/view_area';</script>")

@login_required
@never_cache
def subadmin_add(request):
    return render(request,'admin/subadmin_add.html')


@login_required
@never_cache
def subadmin_add_post(request):
    Name = request.POST['textfield']
    photo = request.FILES['files']
    email = request.POST['textfield3']
    phone = request.POST['textfield4']
    fs=FileSystemStorage()
    path=fs.save(photo.name,photo)

    pw=str(random.randint(1111,9999))
    print('password: ',pw)
    if subadmin.objects.filter(name=Name).exists():
        return HttpResponse("<script>alert('already existed ');window.location='/adminhome';</script>")
    obj1 = User()
    obj1.username = email
    obj1.password=make_password(pw)
    obj1.save()
    obj1.groups.add(Group.objects.get(name='subadmin'))


    obj=subadmin()
    obj.name=Name
    obj.photo=fs.url(path)
    obj.email=email
    obj.phone=phone
    obj.LOGIN=obj1
    obj.save()
    return HttpResponse("<script>alert('subadmin added');window.location='/view_subadmin';</script>")



@login_required
@never_cache
def view_subadmin(request):
   data=subadmin.objects.all()
   return render(request,'admin/view_subadmin.html',{'data':data})


@login_required
@never_cache
def edit_subadmin(request,id):
    data = subadmin.objects.get(id=id)
    return render(request, 'admin/edit_subadmin.html', {'data': data})


@login_required
@never_cache
def edit_subadmin_post(request,id):
    Name=request.POST['textfield']
    email=request.POST['textfield3']
    phone=request.POST['textfield4']
    if 'textfield2' in request.FILES:
        photo = request.FILES['textfield2']

        fs = FileSystemStorage()
        path = fs.save(photo.name, photo)
        subadmin.objects.filter(id=id).update(photo=fs.url(path))

    subadmin.objects.filter(id=id).update(name=Name,email=email,phone=phone)
    return HttpResponse("<script>alert('subadmin updated');window.location='/view_subadmin';</script>")


@login_required
@never_cache
def delete_subadmin(request,id):
    subadmin.objects.get(id=id).delete()
    return HttpResponse("<script>alert('subadmin deleted');window.location='/view_subadmin';</script>")



@login_required
@never_cache
def view_area_allocation(request):
    data=areaallocation.objects.all()
    return render(request,'admin/view_area_allocation.html',{'data':data})

@login_required
@never_cache
def view_complaint(request):
    data=complaint.objects.all()
    return render(request,'admin/view_complaint.html',{'data':data})

@login_required
@never_cache
def send_reply(request,id):
    return render(request,'admin/send_reply.html',{'id':id})

@login_required
@never_cache
def send_reply_post(request,id):
    reply=request.POST['textarea']
    complaint.objects.filter(id=id).update(reply=reply,replydate=datetime.datetime.now().date())
    return HttpResponse("<script>alert('send');window.location='/adminhome';</script>")

@login_required
@never_cache
def change_password(request):
    return render(request,'admin/change_pass.html')

@login_required
@never_cache
def change_password_post(request):
    current=request.POST['textfield']
    new=request.POST['textfield2']
    confirm=request.POST['textfield3']
    if new!=confirm:
        return HttpResponse("<script>alert('Password mismatched');window.location='/change_password';</script>")
    data=check_password(current,request.user.password)
    if data:
        user=request.user
        user.set_password(new)
        user.save()

        return HttpResponse("<script>alert('Password changed');window.location='/adminhome';</script>")
    return HttpResponse("<script>alert('Password invalid');window.location='/change_password';</script>")

@login_required
@never_cache
def view_detection(request):
    data=detection.objects.all()
    return render(request,'admin/view_detection.html',{'data':data})

@login_required
@never_cache
def view_feedback(request):
    data=feedback.objects.all()
    return render(request,'admin/view_feedback.html',{'data':data})


@login_required
@never_cache
def view_news(request):
    # Support both HTML rendering for admin and JSON API for the mobile app.
    # The client can request JSON by adding `?format=json` or `?json=1`,
    # or by sending `Accept: application/json`.
    accept = request.META.get('HTTP_ACCEPT', '')
    wants_json = request.GET.get('format') == 'json' or request.GET.get('json') == '1' or 'application/json' in accept

    data_qs = news.objects.all()
    if wants_json:
        message = []
        for i in data_qs:
            message.append({
                "id": i.id,
                "title": i.title,
                "newss": i.newss,
                "image": str(i.image) if i.image else "",
                "video": str(i.video) if i.video else "",
                "date": i.date.strftime("%d-%m-%Y %H:%M") if hasattr(i, 'date') and i.date else "",
                "status": i.status
            })
        return JsonResponse({"status": 'ok', 'data': message})

    # Default: render admin HTML page
    return render(request, 'admin/view_news.html', {'data': data_qs})


@login_required
@never_cache
def view_user(request):
    data=users.objects.all()
    return render(request,'admin/view_user.html',{'data':data})


@login_required
@never_cache
def home(request):
    return render(request,'admin/Home.html')

@login_required
@never_cache
def allocate_area(request):
    data=area.objects.all()
    return render(request,'admin/view_area_allocation.html',{'data':data})


@login_required
@never_cache
def allocate_area_post(request,id):
    data = subadmin.objects.all()
    return render(request,'admin/area_drop.html',{'data':data,'id':id})


@login_required
@never_cache
def allocate_area_post1(request,id):
    area=request.POST['select']
    obj=areaallocation()
    obj.AREA_id=id
    obj.SUBADMIN_id=area
    obj.date=datetime.datetime.now().date()
    obj.save()
    return HttpResponse("<script>alert('allocated');window.location='/adminhome';</script>")


@login_required
@never_cache
def view_reporter(request):
    data=reporter.objects.all()
    return render(request,'admin/view_reporter.html',{'data':data})


def logouts(request):
    logout(request)
    return redirect('/')




#--------------------------------SUBADMIN-----------------


@login_required
@never_cache
def subadminhome(request):
    return render(request,'subadmin/subadminindex.html')


@login_required
@never_cache
def subadmin_change_password(request):
    return render(request,'subadmin/change_pass_subadmin.html')

@login_required
@never_cache
def subadmin_change_password_post(request):
    current=request.POST['textfield']
    new=request.POST['textfield2']
    confirm=request.POST['textfield3']
    if new!=confirm:
        return HttpResponse("<script>alert('Password mismatched');window.location='/subadmin_change_password';</script>")
    data=check_password(current,request.user.password)
    if data:
        user=request.user
        user.set_password(new)
        user.save()

        return HttpResponse("<script>alert('Password changed');window.location='/subadminhome';</script>")
    return HttpResponse("<script>alert('Password invalid');window.location='/subadmin_change_password';</script>")


@login_required
@never_cache
def view_profile(request):
     # sid=request.session['sid']
    data=subadmin.objects.get(id=request.session['sid'])
    return render(request,'subadmin/view_profile.html',{'data':data})


@login_required
@never_cache
def edit_profile(request):
    Name=request.POST['textfield']
    email=request.POST['textfield3']
    phone=request.POST['textfield4']
    if 'fileField' in request.FILES:
        photo = request.FILES['fileField']

        fs = FileSystemStorage()
        path = fs.save(photo.name, photo)
        subadmin.objects.filter(id=request.session['sid']).update(photo=fs.url(path))

    subadmin.objects.filter(id=request.session['sid']).update(name=Name,email=email,phone=phone)
    return HttpResponse("<script>alert('Profile edited');window.location='/view_profile';</script>")


@login_required
@never_cache
def add_news(request,id):
    data=news.objects.all()
    return render(request,'subadmin/add_news_subadmin.html',{'data':data,'id':id})



@login_required
@never_cache
def add_news_post(request,id):
    title=request.POST['textfield']
    newss=request.POST['textfield2']
    image=request.FILES['fileField']
    fs = FileSystemStorage()
    path = fs.save(image.name, image)
    video=request.FILES['fileField2']
    fs = FileSystemStorage()
    path1 = fs.save(video.name,video)

    if news.objects.filter(title=title).exists():
        return HttpResponse("<script>alert('already existed ');window.location='/subadminhome';</script>")
    obj=news()
    obj.title=title
    obj.status='pending'
    obj.date=datetime.datetime.now().date()
    obj.newss=newss
    obj.image=fs.url(path)
    obj.video=fs.url(path1)
    obj.date=datetime.datetime.now().date()
    obj.AREAALLOCATION_id=id
    obj.save()
    return HttpResponse("<script>alert('news added');window.location='/view_areas';</script>")



@login_required
@never_cache
def view_news_sub(request):
    data = news.objects.all()
    return render(request, 'subadmin/view_news_subadmin.html', {'data': data})


@login_required
@never_cache
def edit_news(request,id):
    data=news.objects.get(id=id)
    return render(request,'subadmin/edit_news_subadmin.html',{'data':data})


@login_required
@never_cache
def edit_news_post(request,id):
    Title = request.POST['textfield']
    News = request.POST['textfield2']
    if 'fileField' in request.FILES:
        image = request.FILES['fileField']

        fs = FileSystemStorage()
        path = fs.save(image.name, image)
        news.objects.filter(id=id).update(image=fs.url(path))
    if 'fileField2' in request.FILES:
        video = request.FILES['fileField2']

        fs = FileSystemStorage()
        path1 = fs.save(video.name, video)
        news.objects.filter(id=id).update(video=fs.url(path1))

        news.objects.filter(id=id).update(title=Title, newss=News)
    return HttpResponse("<script>alert('News edited');window.location='/view_news_sub';</script>")



@login_required
@never_cache
def delete_news(request,id):
    area.objects.get(id=id).delete()
    return HttpResponse("<script>alert('News deleted');window.location='/view_news_subadmin.html';</script>")


@login_required
@never_cache
def view_verify_news(request):
    data=news.objects.filter(status='pending')
    return render(request,'subadmin/view_and_verify.html',{'data':data})


@login_required
@never_cache
def accept_news(request,id):
    news.objects.filter(id=id).update(status='accepted')
    return HttpResponse("<script>alert('accepted');window.location='/view_verified_news';</script>")


@login_required
@never_cache
def reject_news(request,id):
    news.objects.filter(id=id).update(status='reject')
    return HttpResponse("<script>alert('rejected');window.location='/view_verify_news';</script>")


@login_required
@never_cache
def view_verified_news(request):
    data=news.objects.filter(status='accepted',AREAALLOCATION__SUBADMIN=request.session['sid'])
    return render(request,'subadmin/view_and_verified.html',{'data':data})


@login_required
@never_cache
def view_feedbacks(request):
    data = feedback.objects.all()
    return render(request, 'subadmin/view_feedback_subadmin.html', {'data': data})


@login_required
@never_cache
def view_areas(request):
    data=areaallocation.objects.all()
    return render(request,'subadmin/View_Area.html',{'data':data})


@login_required
@never_cache
def view_all_news(request):
    data=news.objects.filter(status='accepted')
    return render(request,'subadmin/view_all_news.html',{'data':data})


@login_required
@never_cache
def add_reporter(request,id):
    data=reporter.objects.all()
    return render(request,'subadmin/reporter_add.html',{'id':id,'data':data})


@login_required
@never_cache
def add_reporter_post(request,id):
    Name = request.POST['textfield']
    photo = request.FILES['fileField']
    email = request.POST['textfield3']
    phone = request.POST['textfield4']
    fs = FileSystemStorage()
    path = fs.save(photo.name, photo)

    pw = str(random.randint(1111, 9999))
    print(pw)

    if reporter.objects.filter(email=email).exists():
        return HttpResponse("<script>alert('already existed ');window.location='/subadminhome';</script>")
    obj1 = User()
    obj1.username = email
    obj1.password = make_password(pw)
    obj1.save()
    obj1.groups.add(Group.objects.get(name='reporter'))

    obj = reporter()
    obj.name = Name
    obj.photo = fs.url(path)
    obj.email = email
    obj.phone = phone
    obj.LOGIN = obj1
    obj.AREAALLOCATION_id=id
    obj.save()
    return HttpResponse("<script>alert('reporter added');window.location='/view_reporter';</script>")



@login_required
@never_cache
def view_repoter(request):
    data = reporter.objects.all()
    return render(request, 'subadmin/view_reporter.html', {'data': data})








#--------------------------------Reporter-----------------


@login_required
@never_cache
def reporterhome(request):
    return render(request,'reporter/reporterindex.html')


@login_required
@never_cache
def view_profile_rep(request):
    data=reporter.objects.get(id=request.session['rid'])
    return render(request,'reporter/view_profile_rep.html',{'data':data})


@login_required
@never_cache
def edit_profile_rep_post(request):
    name=request.POST['textfield']
    phone=request.POST['textfield2']
    email=request.POST['textfield3']
    if 'fileField' in request.FILES:
        photo = request.FILES['fileField']

        fs = FileSystemStorage()
        path = fs.save(photo.name, photo)
        reporter.objects.filter(id=request.session['rid']).update(photo=fs.url(path))

    reporter.objects.filter(id=request.session['rid']).update(name=name,phone=phone,email=email)
    return HttpResponse("<script>alert('Profile edited');window.location='/view_profile_rep';</script>")


@login_required
@never_cache
def add_news_rep(request):
    return render(request,'reporter/add_news_rep.html')


@login_required
@never_cache
def add_news_rep_post(request):
    title=request.POST['textfield']
    newss=request.POST['textfield2']
    image=request.FILES['fileField']
    fs = FileSystemStorage()
    path = fs.save(image.name, image)
    video=request.FILES['fileField2']
    fs = FileSystemStorage()
    path1 = fs.save(video.name,video)
    date=request.POST['textfield3']

    if news.objects.filter(title=title).exists():
        return HttpResponse("<script>alert('already existed ');window.location='/reporterindex';</script>")
    obj=news()
    obj.title=title
    obj.status='pending'
    obj.date=datetime.datetime.now().date()
    obj.newss=newss
    obj.image=fs.url(path)
    obj.video=fs.url(path1)
    obj.date=datetime.datetime.now().date()
    obj.AREAALLOCATION_id= reporter.objects.get(id=request.session['rid']).AREAALLOCATION_id
    obj.save()
    return HttpResponse("<script>alert('news added');window.location='/add_news_rep';</script>")



@login_required
@never_cache
def view_news_rep(request):
    data = news.objects.all()
    return render(request, 'reporter/view_news_reporter.html', {'data': data})


@login_required
@never_cache
def edit_news_rep(request,id):
    data=news.objects.get(id=id)
    return render(request,'reporter/edit_news_rep.html',{'data':data})


@login_required
@never_cache
def edit_news_rep_post(request,id):
    Title = request.POST['textfield']
    News = request.POST['textfield2']
    if 'fileField' in request.FILES:
        image = request.FILES['fileField']

        fs = FileSystemStorage()
        path = fs.save(image.name, image)
        news.objects.filter(id=id).update(image=fs.url(path))
    if 'fileField2' in request.FILES:
        video = request.FILES['fileField2']

        fs = FileSystemStorage()
        path1 = fs.save(video.name, video)
        news.objects.filter(id=id).update(video=fs.url(path1))

        news.objects.filter(id=id).update(title=Title, newss=News)
    Date=request.POST['textfield3']
    return HttpResponse("<script>alert('News edited');window.location='/view_news_rep';</script>")




@login_required
@never_cache
def change_password_rep(request):
    return render(request,'reporter/change_pass_rep.html')


@login_required
@never_cache
def change_password_rep_post(request):
    current=request.POST['textfield']
    new=request.POST['textfield2']
    confirm=request.POST['textfield3']
    if new!=confirm:
        return HttpResponse("<script>alert('Password mismatched');window.location='/change_pass_rep';</script>")
    data=check_password(current,request.user.password)
    if data:
        user=request.user
        user.set_password(new)
        user.save()

        return HttpResponse("<script>alert('Password changed');window.location='/reporterhome';</script>")
    return HttpResponse("<script>alert('Password invalid');window.location='/change_pass_rep';</script>")


@login_required
@never_cache
def comment_like1(request):
    data=comment_like.objects.all()
    return render(request, 'reporter/comment_like_rep.html', {'data': data})





#------------------------------User---------------------------------------


def load_area(request):
    areas = area.objects.all()
    data = []

    for a in areas:
        data.append({
            'id': a.id,
            'areas': a.areas,
            'district': a.district,
        })

    return JsonResponse({'status': 'ok', 'data': data})



def register_users(request):
    name=request.POST['name']
    email=request.POST['email']
    phone=request.POST['phone']
    area=request.POST['area_id']
    password=request.POST['password']
    newpassword=request.POST['confirm']
    ob=User()
    ob.username=email
    ob.password=make_password(password)
    ob.save()
    ob.groups.add(Group.objects.get(name='user'))

    obj=users()
    obj.name=name
    obj.email=email
    obj.phone=phone
    obj.AREA_id=area
    obj.LOGIN=ob
    obj.save()
    return JsonResponse({"status":'ok'})


def view_areasss(request):

    data=area.objects.all()
    message=[]
    for i in data:
        message.append({
            "id":i.id,
            "district":i.district,
            "areas":i.areas,
            "latitude":i.latitude,
            "longitude":i.longitude
        })
    return JsonResponse({"status":'ok','message':message})




def view_newss(request):
    data=news.objects.all()
    message=[]
    for i in data:
        message.append({
            "id":i.id,
            "title":i.title,
            "newss":i.newss,
            "image":i.image,
            "video":i.video,
            "date":i.date,
            "status":i.status
        })
    return JsonResponse({"status":'ok','data':message})



def view_news_by_area(request):
    data=news.objects.all()
    message=[]
    for i in data:
        message.append({
            "id":i.id,
            "areas":i.AREAALLOCATION.AREA.areas,
            "district":i.AREAALLOCATION.AREA.district,
            "title":i.title,
            "newss":i.newss,
            "image":i.image,
            "video":i.video,
            "date":i.date,
            "status":i.status

        })
    return JsonResponse({"status":'ok','data':message})




def send_complaints(request):
    uid=request.POST['uid']
    complaints=request.POST['complaint']

    obj=complaint()
    obj.complaint=complaints
    obj.complaintdate=datetime.datetime.now().date()
    obj.USER_id=uid
    obj.reply='pending'
    obj.save()
    return JsonResponse({"status":'ok'})




def send_feedbacks(request):
    uid=request.POST['uid']
    feedbacks=request.POST['feedback']

    obj=feedback()
    obj.feedback=feedbacks
    obj.date=datetime.datetime.now().date()

    obj.USER_id=uid
    obj.save()
    return JsonResponse({"status":'ok'})




def user_change_password(request):
    uid=request.POST['uid']
    lid=users.objects.get(id=uid).LOGIN_id
    confirm_password=request.POST['confirm_password']
    User.objects.filter(id=lid).update(password=make_password(confirm_password))
    return JsonResponse({"status":'ok'})



def login1_post(request):
    username=request.POST['username']
    password=request.POST['password']
    data=authenticate(request,username=username,password=password)
    if data is not None:
        login(request,data)
        if data.groups.filter(name='user').exists():
            obj=users.objects.get(LOGIN=data)
            uid=obj.id
            return JsonResponse({"status": 'ok','uid':str(uid)})
        return JsonResponse({"status": 'invalid'})
    return JsonResponse({"status": 'invalid'})


# forgetpwd


def forgotemail(request):
    import random
    import smtplib
    email = request.POST['email']
    print(email)
    data = User.objects.filter(username=email)
    print(data)
    if data.exists():
        otp = str(random.randint(000000, 999999))
        print(otp)
        # *✨ Python Email Codeimport smtplib*

        from email.mime.text import MIMEText
        from email.mime.multipart import MIMEMultipart

        # ✅ Gmail credentials (use App Password, not real password)
        try:
            sender_email = "smartfuddonation@gmail.com"
            receiver_email = "receiver_email@gmail.com"  # change to actual recipient
            app_password = "your_16_char_app_password"
            # Setup SMTP
            server = smtplib.SMTP("smtp.gmail.com", 587)
            server.starttls()
            server.login(sender_email, app_password)

            # Create the email
            msg = MIMEMultipart("alternative")
            msg["From"] = sender_email
            msg["To"] = receiver_email
            msg["Subject"] = "🔑 Forgot Password "

            # Plain text (backup)
            # text = f"""
            # Hello,

            # Your password for Smart Donation Website is: {pwd}

            # Please keep it safe and do not share it with anyone.
            # """

            # HTML (attractive)
            html = f"""
                <!DOCTYPE html>
                <html>
                <head>
                    <meta charset="UTF-8">
                    <meta name="viewport" content="width=device-width, initial-scale=1.0">
                    <title>Password Reset OTP</title>
                </head>
                <body style="font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif; 
                            line-height: 1.6; color: #333; max-width: 600px; margin: 0 auto; padding: 20px;">

                    <div style="background: linear-gradient(135deg, #667eea 0%, #764ba2 100%); 
                                padding: 30px; text-align: center; border-radius: 10px 10px 0 0;">
                        <h1 style="color: white; margin: 0; font-size: 28px;">
                            🔐 Smart Donation
                        </h1>
                    </div>

                    <div style="background-color: #f9f9f9; padding: 40px 30px; border-radius: 0 0 10px 10px; 
                                border: 1px solid #eaeaea;">

                        <h2 style="color: #2d3748; margin-top: 0;">Password Reset Request</h2>

                        <p style="color: #4a5568; font-size: 16px;">
                            Hello,
                        </p>

                        <p style="color: #4a5568; font-size: 16px;">
                            You requested to reset your password. Use the OTP below to proceed:
                        </p>

                        <div style="background: white; border-radius: 8px; padding: 20px; 
                                    text-align: center; margin: 30px 0; border: 2px dashed #cbd5e0;">
                            <div style="font-size: 32px; font-weight: bold; letter-spacing: 10px; 
                                        color: #2c7be5; margin: 10px 0;">
                                {otp}
                            </div>
                            <div style="font-size: 14px; color: #718096; margin-top: 10px;">
                                (Valid for 10 minutes)
                            </div>
                        </div>

                        <p style="color: #4a5568; font-size: 16px;">
                            Enter this code on the password reset page to complete the process.
                        </p>

                        <div style="background-color: #fef3c7; border-left: 4px solid #d97706; 
                                    padding: 15px; margin: 25px 0; border-radius: 4px;">
                            <p style="color: #92400e; margin: 0; font-size: 14px;">
                                ⚠️ <strong>Security tip:</strong> Never share this OTP with anyone. 
                                Our team will never ask for your password or OTP.
                            </p>
                        </div>

                        <p style="color: #718096; font-size: 14px;">
                            If you didn't request this password reset, please ignore this email or 
                            contact our support team if you have concerns.
                        </p>

                        <hr style="border: none; border-top: 1px solid #e2e8f0; margin: 30px 0;">

                        <p style="text-align: center; color: #a0aec0; font-size: 12px;">
                            This is an automated email from Smart Donation System.<br>
                            © {datetime.now().year} Smart Donation. All rights reserved.
                        </p>

                    </div>
                </body>
                </html>
                """

            # Attach both versions
            # msg.attach(MIMEText(text, "plain"))
            msg.attach(MIMEText(html, "html"))

            # Send email
            server.send_message(msg)
            print("✅ Email sent successfully!", otp)

            # Close connection
            server.quit()

        except Exception as e:
            print("❌ Error loading email credentials:", e)
            return JsonResponse({'status': "ok", 'otpp': otp})

        return JsonResponse({'status': 'ok', 'otpp': otp})
    return JsonResponse({'status': "not found"})


def forgotpass(request):
    email = request.POST['email']
    npass = request.POST['password']
    cpass = request.POST['confirmpassword']
    print(email, npass, cpass)
    if npass == cpass:
        User.objects.filter(username=email).update(password=make_password(npass))
        return JsonResponse({'status': 'ok'})
    return JsonResponse({'status': 'invalid'})




def forgotpassword(request):
    return render(request,"forgotpassword.html")
def forgotpasswordbuttonclick(request):
    email = request.POST['textfield']
    if User.objects.filter(username=email).exists():
        from email.mime.text import MIMEText
        from email.mime.multipart import MIMEMultipart

        # ✅ Gmail credentials (use App Password, not real password)
        sender_email = "projectaiml04@gmail.com"
        receiver_email = email  # change to actual recipient
        app_password = "xgez pukg auip wwpo"  # App Password from Google
        pwd = str(random.randint(1100,9999))  # Example password to send
        request.session['otp'] = pwd
        request.session['email'] = email

        # Setup SMTP
        server = smtplib.SMTP("smtp.gmail.com", 587)
        server.starttls()
        server.login(sender_email, app_password)

        # Create the email
        msg = MIMEMultipart("alternative")
        msg["From"] = sender_email
        msg["To"] = receiver_email
        msg["Subject"] = "Your OTP"

        # Plain text (backup)
        # text = f"""
        # Hello,

        # Your password for Smart Donation Website is: {pwd}

        # Please keep it safe and do not share it with anyone.
        # """

        # HTML (attractive)
        html = f"""
        <html>
          <body style="font-family: Arial, sans-serif; color: #333;">
            <h2 style="color:#2c7be5;">Wastemanagement</h2>
            <p>Hello,</p>
            <p>Your OTP is:</p>
            <p style="padding:10px; background:#f4f4f4; 
                      border:1px solid #ddd; 
                      display:inline-block;
                      font-size:18px;
                      font-weight:bold;
                      color:#2c7be5;">
              {pwd}
            </p>
            <p>Please keep it safe and do not share it with anyone.</p>
            <hr>
            <small style="color:gray;">This is an automated email from Wastemanagement System.</small>
          </body>
        </html>
        """

        # Attach both versions
        # msg.attach(MIMEText(text, "plain"))
        msg.attach(MIMEText(html, "html"))

        # Send email
        server.send_message(msg)
        print("✅ Email sent successfully!")

        # Close connection
        server.quit()
        return HttpResponse("<script>window.location='/otp'</script>")
    else:
        return HttpResponse("<script>alert('Email not found');window.location='/forgotpassword'</script>")


def otp(request):
    return render(request,"otp.html")
def otpbuttonclick(request):
    otp  = request.POST["textfield"]
    if otp == str(request.session['otp']):
        return HttpResponse("<script>window.location='/forgotpswdpswed'</script>")
    else:
        return HttpResponse("<script>alert('incorrect otp');window.location='/otp'</script>")

def forgotpswdpswed(request):
    return render(request,"forgotpswdpswed.html")
def forgotpswdpswedbuttonclick(request):
    np = request.POST["password"]
    User.objects.filter(username=request.session['email']).update(password=make_password(np))
    return HttpResponse("<script>alert('password has been changed');window.location='/' </script>")





from django.http import JsonResponse

import datetime
import pickle
from tensorflow.keras.models import load_model
from tensorflow.keras.preprocessing.sequence import pad_sequences

# load model once
model = load_model(r"C:\Users\ASUS\PycharmProjects\fake_news_detection\news_detection\fake_news_cnn_model.h5")

with open(r"C:\Users\ASUS\PycharmProjects\fake_news_detection\news_detection\tokenizer.pkl", "rb") as f:
    tokenizer = pickle.load(f)

max_len = 200


def send_newss(request):
    uid = request.POST['uid']
    news = request.POST['news']

    seq = tokenizer.texts_to_sequences([news])
    padded = pad_sequences(seq, maxlen=max_len, padding="post")

    prediction = model.predict(padded)[0][0]
    result = "real" if prediction > 0.5 else "fake"

    detection.objects.create(
        news=news,
        USER_id=uid,
        status=result
    )

    return JsonResponse({
        "status": "ok",
        "prediction": result
    })


# def view_detection(request):
#     uid = request.GET['uid']
#
#     data = detection.objects.filter(USER_id=uid).order_by('-date')
#
#     news_list = []
#     for i in data:
#         news_list.append({
#             "news": i.news,
#             "status": i.status,
#             "date": i.date.strftime("%d-%m-%Y %H:%M")
#         })
#
#     return JsonResponse({"status": "ok", "data": news_list})

#
# import requests
# from django.shortcuts import render
# from django.conf import settings
# import google.generativeai as genai
#
#
# def check_news_url(request):
#     result = None
#
#     if request.method == "POST":
#         url = request.POST.get("news_url")
#
#         try:
#             # Fetch article HTML
#             response = requests.get(url, timeout=8, headers={
#                 "User-Agent": "Mozilla/5.0"
#             })
#
#             article_text = response.text[:6000]  # prevent token overload
#
#             # Configure Gemini
#             genai.configure(api_key=settings.GEMINI_API_KEY)
#
#             model = genai.GenerativeModel("gemini-2.5-flash")
#
#             prompt = f"""
# You are a professional fake news detection system.
#
# Analyze the following webpage content and determine:
#
# 1. Is this news REAL or FAKE?
# 2. Give confidence percentage.
# 3. Give short reason.
#
# Respond strictly in this format:
#
# Verdict: REAL or FAKE
# Confidence: XX%
# Reason: <short explanation>
#
# Content:
# {article_text}
#             """
#
#             gemini_response = model.generate_content(prompt)
#             result = gemini_response.text
#
#         except Exception as e:
#             result = f"Error occurred: {str(e)}"
#
#     return render(request, "check_url.html", {"result": result})




import re
import requests
from django.shortcuts import render
from django.conf import settings
import google.generativeai as genai


# def check_news_url(request):
#     result = None
#
#     if request.method == "POST":
#         url = request.POST.get("news_url")
#         print(url)
#         resp = requests.get(url, timeout=8, headers={"User-Agent": "Mozilla/5.0"})
#         page_text = resp.text
#
#
#         content_snippet = re.sub(r"\s+", " ", page_text)[:6000]
#
#         # Configure Gemini
#         genai.configure(api_key=getattr(settings, "GEMINI_API_KEY", ""))
#         model = genai.GenerativeModel("gemini-2.5-flash")
#
#         prompt = f"""
#         You are a professional fake news detection system.
#
#         Analyze the following webpage content and determine:
#
#         1. Is this content REAL or FAKE?
#         2. Give a short reason (1 sentence).
#
#         Respond strictly in this format:
#
#         Verdict: REAL or FAKE
#         Reason: <short explanation>
#
#         Content:
#         {content_snippet}
#         """
#
#         gemini_response = model.generate_content(prompt)
#         result_text = getattr(gemini_response, "text", str(gemini_response))
#
#         # Parse the verdict
#         verdict_match = re.search(r"Verdict:\s*(REAL|FAKE)", result_text, re.IGNORECASE)
#         if verdict_match:
#             verdict = verdict_match.group(1).upper()
#         else:
#             # fallback heuristic
#             verdict = "FAKE" if "fake" in result_text.lower() or "not credible" in result_text.lower() else "REAL"
#
#         prediction = "real" if verdict == "REAL" else "fake"
#
#
#         return JsonResponse({"status": "ok", "prediction": prediction, "raw": result_text})



import requests
import re
from urllib.parse import urlparse
from bs4 import BeautifulSoup
from django.http import JsonResponse
from django.views.decorators.csrf import csrf_exempt
from django.conf import settings
import google.generativeai as genai

# @csrf_exempt
# def check_news_url(request):
#     if request.method != "POST":
#         return JsonResponse({"status": "error", "message": "Invalid request method"})
#
#     url = request.POST.get("news_url", "").strip()
#     if not url:
#         return JsonResponse({"status": "error", "message": "No URL provided"})
#
#     # Add https:// if missing
#     if not url.startswith(("http://", "https://")):
#         url = "https://" + url
#
#     # Validate URL
#     parsed = urlparse(url)
#     if not parsed.netloc:
#         return JsonResponse({"status": "error", "message": "Invalid URL format"})
#
#     print("aaaaaaaaaaaaaaaa")
#     resp = requests.get(url, timeout=8, headers={"User-Agent": "Mozilla/5.0"})
#     html = resp.text
#     soup = BeautifulSoup(html, "html.parser")
#     title_tag = soup.find("title")
#     title = title_tag.text.strip() if title_tag else "No Title Found"
#     print(title,"kkkkkkk")
#
#     # Gemini AI analysis
#     try:
#         print("aaaaaaaaaaaaaaa")
#         genai.configure(api_key=settings.GEMINI_API_KEY)
#         model = genai.GenerativeModel("gemini-2.5-flash")
#
#         prompt = f"""
# You are a professional fake news detection system.
#
# Analyze the following news article URL and title.
#
# Consider:
# - Suspicious URL (typosquatting, unusual TLD, brand impersonation)
# - Suspicious, exaggerated, or clickbaity title
# - Any mismatch between title and expected source credibility
#
# Respond ONLY in this exact format:
#
# Verdict: REAL or FAKE
# Reason: Short explanation (1 sentence)
#
# URL: {url}
# Title: {title}
# """
#         print(prompt+"dddddd")
#         response = model.generate_content(prompt)
#         result_text = getattr(response, "text", str(response)).strip()
#
#         # Extract verdict
#         match = re.search(r"Verdict:\s*(REAL|FAKE)", result_text, re.IGNORECASE)
#         verdict = match.group(1).upper() if match else "FAKE"
#         prediction = "real" if verdict == "REAL" else "fake"
#
#         print(prediction,"ppppppp")
#
#         return JsonResponse({
#             "status": "ok",
#             "prediction": prediction,
#             "title": title,
#             "raw": result_text
#         })
#
#     except Exception as e:
#         return JsonResponse({
#             "status": "error",
#             "message": f"AI processing failed: {str(e)}"
#         })


# from urllib.parse import urlparse
# import socket
# import requests
# from bs4 import BeautifulSoup
# import re
# from django.http import JsonResponse
# from django.conf import settings
# import google.generativeai as genai
#
# def check_news_url(request):
#     if request.method != "POST":
#         return JsonResponse({"status": "error", "message": "Invalid request method"})
#
#     url = request.POST.get("news_url", "").strip()
#     if not url:
#         return JsonResponse({"status": "error", "message": "No URL provided"})
#
#     # Add https if missing
#     if not url.startswith(("http://", "https://")):
#         url = "https://" + url
#
#     # Validate URL
#     parsed = urlparse(url)
#     if not parsed.netloc:
#         return JsonResponse({"status": "error", "message": "Invalid URL format"})
#
#     # Optional: Block private IPs to prevent SSRF
#     host = parsed.hostname
#     ip = socket.gethostbyname(host)
#     if ip.startswith(("127.", "10.", "192.168.")):
#         return JsonResponse({"status": "error", "message": "Private IP not allowed"})
#
#     # Fetch webpage
#     resp = requests.get(url, timeout=8, headers={"User-Agent": "Mozilla/5.0"})
#     html = resp.text
#
#     # Extract title
#     soup = BeautifulSoup(html, "html.parser")
#     title_tag = soup.find("title")
#     title = title_tag.text.strip() if title_tag else "No Title Found"
#
#     # Configure Gemini
#     genai.configure(api_key=settings.GEMINI_API_KEY)
#     model = genai.GenerativeModel("gemini-2.5-flash")
#
#     prompt = f"""
# You are a professional fake news detection system.
# Analyze the following news article title and URL.
#
# 1. Is this content REAL or FAKE?
# 2. Give a short reason (1 sentence).
#
# Respond strictly in this format:
#
# Verdict: REAL or FAKE
# Reason: <short explanation>
#
# Title: {title}
# URL: {url}
# """
#
#     print(prompt + " dddddd")  # debugging
#
#     response = model.generate_content(prompt)
#     result_text = getattr(response, "text", str(response)).strip()
#
#     # Parse verdict
#     match = re.search(r"Verdict:\s*(REAL|FAKE)", result_text, re.IGNORECASE)
#     verdict = match.group(1).upper() if match else "FAKE"
#     prediction = "real" if verdict == "REAL" else "fake"
#
#     print(prediction, "ppppppp")  # should always print now
#
#     return JsonResponse({
#         "status": "ok",
#         "prediction": prediction,
#         "title": title,
#         "raw": result_text
#     })



from django.http import JsonResponse
from urllib.parse import urlparse
import requests
from bs4 import BeautifulSoup
import re
import google.generativeai as genai
from django.conf import settings

def check_news_url(request):
    if request.method != "POST":
        return JsonResponse({"status": "error", "message": "Invalid request method"})

    # 1️⃣ Get URL from POST
    url = request.POST.get("news_url", "").strip()
    if not url:
        return JsonResponse({"status": "error", "message": "No URL provided"})

    # 2️⃣ Add https if missing
    if not url.startswith(("http://", "https://")):
        url = "https://" + url

    # 3️⃣ Validate URL
    parsed = urlparse(url)
    if not parsed.netloc:
        return JsonResponse({"status": "error", "message": "Invalid URL format"})

    # 4️⃣ Fetch webpage and extract title
    resp = requests.get(url, timeout=8, headers={"User-Agent": "Mozilla/5.0"})
    html = resp.text
    soup = BeautifulSoup(html, "html.parser")
    title_tag = soup.find("title")
    title = title_tag.text.strip() if title_tag else "No Title Found"

    print(title, "dddddd")  # Debug: show extracted title

    # 5️⃣ Configure Gemini
    genai.configure(api_key=settings.GEMINI_API_KEY)
    model = genai.GenerativeModel("gemini-2.5-flash")

    # 6️⃣ Prepare prompt with title only
    prompt = f"""
You are a professional fake news detection system.

Analyze the following news title and determine:

1. Is this news REAL or FAKE?
2. Give a short reason (1 sentence).

Respond strictly in this format:

Verdict: REAL or FAKE
Reason: <short explanation>

Title:
{title}
"""
    print(prompt + " dddddd")  # Debug: show prompt

    # Gemini call (linear, no try-catch)
    genai.configure(api_key=settings.GEMINI_API_KEY)
    model = genai.GenerativeModel("gemini-2.5-flash")
    response = model.generate_content(prompt)
    result_text = getattr(response, "text", str(response)).strip()
    print("Raw Gemini response:", result_text)

    # Extract verdict
    match = re.search(r"Verdict:\s*(REAL|FAKE)", result_text, re.IGNORECASE)
    verdict = match.group(1).upper() if match else "FAKE"
    prediction = "real" if verdict == "REAL" else "fake"
    print("Prediction:", prediction)


    # 9️⃣ Return JSON
    return JsonResponse({
        "status": "ok",
        "prediction": prediction,
        "title": title,

    })