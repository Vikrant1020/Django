#!/bin/bash 

cd /home/ubuntu
sudo apt update
sudo apt install python3-pip python3-dev nginx -y
pip install -r requirements.txt
sudo systemctl restart nginx
sudo systemctl restart gunicorn
