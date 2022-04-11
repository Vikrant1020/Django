#!/bin/bash
ls
apt install python3-pip -y
pip install django
python3 manage.py test
