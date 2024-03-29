#!/bin/sh

#ssh root@your_public_ipv4<<EOF
ssh root@13.233.200.52<<EOF
  cd fashtop_django_om
  git pull 
  pip install -r requirements.txt
  source env/bin/activate
  ./manage.py migrate
  sudo systemctl restart nginx
  sudo service gunicorn restart
  sudo service nginx restart
  exit
EOF
