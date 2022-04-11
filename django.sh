#!/bin/bash
apt install python3-pip -y
pip install django
python3 manage.py runserver 0.0.0.0:8000 & sleep 30
