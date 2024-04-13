#!/usr/bin/bash

echo "Pull Finished"
sudo systemctl daemon-reload
gunicorn --bind 0.0.0.0:8000 fashTOP.wsgi
# ---sudo systemctl restart nginx
