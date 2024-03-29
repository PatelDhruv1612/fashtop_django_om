#!/usr/bin/env bash

sudo chown -R ubuntu:ubuntu ~/fashtop_django_om
virtualenv /home/ubuntu/fashtop_django_om/venv
source /home/ubuntu/fashtop_django_om/venv/bin/activate
pip install -r /home/ubuntu/fashtop_django_om/requirements.txt