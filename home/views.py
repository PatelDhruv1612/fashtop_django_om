from django.contrib.auth import login
from django.shortcuts import render,redirect
from django.contrib.auth.models import User
from django.contrib.auth import authenticate,logout
from django.contrib import messages

# Create your views here.

def home(request):
     if request.user.is_anonymous:
         return redirect('loginuser')
     return render(request,'index.html')

def loginuser(request):
    if request.method == 'POST':
        username = request.POST.get('username')
        password = request.POST.get('password')
        user = authenticate(username=username, password=password)
        if user is not None:
            login(request, user) 
            return redirect('/')
            
        else:
           messages.error(request, 'Invalid username or password')
        
      

    return render(request, 'login.html')


def logoutuser(request):
    logout(request)

    return redirect('loginuser') 

def signup(request):
    if request.method =="POST":
        passworduser = request.POST.get('password')
        repassworduser = request.POST.get('repassword')
        usernameuser = request. POST.get('username')


        if passworduser == repassworduser:
            try:
                # Check if the username already exists
                existing_user = User.objects.get(username=usernameuser)
                messages.error(request, 'Username already exists. Please choose a different one.')
            except User.DoesNotExist:
                # Username is unique, create the user
                user = User.objects.create_user(username=usernameuser, password=passworduser)
                user.save()
                return redirect('loginuser')
        else:
            messages.error(request,'Repassword dose not match!')
    return render(request,'signup.html')


def offers(request):
    return render(request,'offers.html')