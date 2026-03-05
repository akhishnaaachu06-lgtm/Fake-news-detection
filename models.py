from django.contrib.auth.models import User
from django.db import models

class subadmin(models.Model):
    name=models.CharField(max_length=100)
    photo=models.CharField(max_length=100)
    email=models.CharField(max_length=100)
    phone=models.CharField(max_length=100)
    LOGIN=models.ForeignKey(User,on_delete=models.CASCADE)

class area(models.Model):
    district=models.CharField(max_length=100)
    areas=models.CharField(max_length=100)
    latitude=models.CharField(max_length=100)
    longitude=models.CharField(max_length=100)

class areaallocation(models.Model):
    AREA=models.ForeignKey(area,on_delete=models.CASCADE)
    SUBADMIN=models.ForeignKey(subadmin,on_delete=models.CASCADE)
    date_current=models.CharField(max_length=100)

class users(models.Model):
    name=models.CharField(max_length=100)
    email=models.CharField(max_length=100)
    phone  =models.CharField(max_length=100)
    AREA = models.ForeignKey(area, on_delete=models.CASCADE)
    LOGIN = models.ForeignKey(User, on_delete=models.CASCADE)

class complaint(models.Model):
    USER= models.ForeignKey(users, on_delete=models.CASCADE)
    complaint=models.CharField(max_length=100)
    complaintdate=models.CharField(max_length=100)
    reply=models.CharField(max_length=100)
    replydate=models.CharField(max_length=100)

class feedback(models.Model):
    USER = models.ForeignKey(users, on_delete=models.CASCADE)
    feedback=models.CharField(max_length=100)
    date=models.CharField(max_length=100)

class detection(models.Model):
    USER = models.ForeignKey(users, on_delete=models.CASCADE)
    news=models.CharField(max_length=1000)
    date=models.CharField(max_length=100)
    status=models.CharField(max_length=100)

class news(models.Model):
    AREAALLOCATION=models.ForeignKey(areaallocation , on_delete=models.CASCADE)
    title=models.CharField(max_length=100)
    newss=models.CharField(max_length=100)
    image=models.CharField(max_length=100)
    video=models.CharField(max_length=100)
    date=models.CharField(max_length=100)
    status=models.CharField(max_length=100)

class reporter(models.Model):
    AREAALLOCATION=models.ForeignKey(areaallocation , on_delete=models.CASCADE)
    name=models.CharField(max_length=100)
    photo=models.CharField(max_length=100)
    email=models.CharField(max_length=100)
    phone=models.CharField(max_length=100)
    LOGIN = models.ForeignKey(User, on_delete=models.CASCADE)

class comment_like(models.Model):
    USER = models.ForeignKey(users, on_delete=models.CASCADE)
    NEWS=models.ForeignKey(news, on_delete=models.CASCADE)
    like_comment=models.CharField(max_length=100)
    date=models.CharField(max_length=100)


