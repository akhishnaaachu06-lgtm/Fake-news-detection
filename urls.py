"""fake_news_detection URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/3.2/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""
from django.conf import settings
from django.conf.urls.static import static
from django.contrib import admin
from django.urls import path

from news_detection import views

urlpatterns = [
    path('admin/', admin.site.urls),
    path('view_area',views.view_area),
    path('view_area_allocation',views.view_area_allocation),
    path('view_complaint',views.view_complaint),
    path('view_detection',views.view_detection),
    path('view_feedback',views.view_feedback),
    path('view_news',views.view_news),
    path('view_user',views.view_user),
    path('home',views.home),
    path('add_area',views.add_area),
    path('add_post',views.add_post),
    path('',views.login1),
    path('adminhome',views.adminhome),
    path('login_post',views.login_post),
    path('edit_area/<id>',views.edit_area),
    path('edit_area_post/<id>',views.edit_area_post),
    path('delete_area/<id>',views.delete_area),
    path('subadmin_add',views.subadmin_add),
    path('subadmin_add_post',views.subadmin_add_post),
    path('view_subadmin',views.view_subadmin),
    path('edit_subadmin/<id>',views.edit_subadmin),
    path('edit_subadmin_post/<id>',views.edit_subadmin_post),
    path('delete_subadmin/<id>',views.delete_subadmin),
    path('send_reply/<id>',views.send_reply),
    path('send_reply_post/<id>',views.send_reply_post),
    path('change_password',views.change_password),
    path('change_password_post',views.change_password_post),
    path('allocate_area',views.allocate_area),
    path('allocate_area_post/<id>',views.allocate_area_post),
    path('allocate_area_post1/<id>',views.allocate_area_post1),
    path('view_reporter',views.view_reporter),

    #----------------subadmin---------------------------------
    path('subadminhome',views.subadminhome),
    path('subadmin_change_password',views.subadmin_change_password),
    path('subadmin_change_password_post',views.subadmin_change_password_post),
    path('view_profile',views.view_profile),
    path('edit_profile',views.edit_profile),
    path('add_news/<id>',views.add_news),
    path('add_news_post/<id>',views.add_news_post),
    path('view_news_sub',views.view_news_sub),
    path('edit_news/<id>',views.edit_news),
    path('edit_news_post/<id>',views.edit_news_post),
    path('delete_news/<id>',views.delete_news),
    path('view_verify_news',views.view_verify_news),
    path('accept_news/<id>',views.accept_news),
    path('reject_news/<id>',views.reject_news),
    path('view_verified_news',views.view_verified_news),
    path('view_feedbacks',views.view_feedbacks),
    path('view_areas',views.view_areas),
    path('view_all_news',views.view_all_news),
    path('add_reporter/<id>',views.add_reporter),
    path('add_reporter_post/<id>',views.add_reporter_post),
    path('view_repoter',views.view_repoter),
    path('reporterhome',views.reporterhome),
    path('view_profile_rep',views.view_profile_rep),
    path('edit_profile_rep_post',views.edit_profile_rep_post),
    path('add_news_rep',views.add_news_rep),
    path('add_news_rep_post',views.add_news_rep_post),
    path('view_news_rep',views.view_news_rep),
    path('edit_news_rep/<id>',views.edit_news_rep),
    path('edit_news_rep_post/<id>',views.edit_news_rep_post),
    path('change_password_rep',views.change_password_rep),
    path('change_password_rep_post',views.change_password_rep_post),
    path('comment_like1',views.comment_like1),
    path('logouts',views.logouts),

    #-----------------------user-------------------------------
    path('register_users',views.register_users),
    path('view_areasss',views.view_areasss),
    path('view_newss',views.view_newss),
    path('view_news_by_area',views.view_news_by_area),
    path('send_complaints',views.send_complaints),
    path('send_feedbacks',views.send_feedbacks),
    path('user_change_password',views.user_change_password),
    path('login1_post',views.login1_post),
    path('load_area',views.load_area),



    path('forgotemail', views.forgotemail),
    path('forgotpass', views.forgotpass),



    path('forgotpassword',views.forgotpassword),
    path('forgotpasswordbuttonclick',views.forgotpasswordbuttonclick),
    path('otp',views.otp),
    path('otpbuttonclick',views.otpbuttonclick),
    path('forgotpswdpswed',views.forgotpswdpswed),
    path('forgotpswdpswedbuttonclick',views.forgotpswdpswedbuttonclick),

    path('send_newss', views.send_newss),
    path('view_news', views.view_news),
    path('check_news_url', views.check_news_url),




]

urlpatterns+=static(settings.MEDIA_URL,document_root=settings.MEDIA_ROOT)