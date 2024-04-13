#!/usr/bin/bash 

sed -i 's/\[]/\["13.201.51.52"]/' /home/ubuntu/fashtop_django_om/fashTOP/settings.py

python manage.py migrate 
# python manage.py makemigrations     
python manage.py collectstatic
sudo service gunicorn restart
sudo ufw allow 8000
gunicorn --bind 0.0.0.0:8000 fashTOP.wsgi
#--- sudo service nginx restart
# sudo tail -f /var/log/nginx/error.log
# sudo systemctl reload nginx
# sudo tail -f /var/log/nginx/error.log
# sudo nginx -t
# sudo systemctl restart gunicorn
# sudo systemctl status gunicorn
# sudo systemctl status nginx
# Check the status
# systemctl status gunicorn
# Restart:
# systemctl restart gunicorn
# sudo systemctl status nginx
