#!/bin/sh

#ssh root@your_public_ipv4<<EOF
ssh root@15.206.168.138<<EOF
  cd fashtop_django_om
  git pull 
  source env/bin/activate
  ./manage.py migrate
  sudo systemctl restart nginx
  sudo service gunicorn restart
  sudo service nginx restart
  exit
EOF