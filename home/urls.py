from django.contrib import admin
from django.urls import path
from home import views

urlpatterns = [
    path('',views.home,name='home'),
    path('loginuser',views.loginuser,name='loginuser'),
    path('logoutuser',views.logoutuser,name= 'logoutuser'),
    path('signup',views.signup,name= 'signup'),
    path('offers',views.offers,name='offers'),
]