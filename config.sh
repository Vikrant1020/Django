#!/bin/bash 

cd /home/ubuntu

source env/bin/activate
sudo fuser -k 8000/tcp

gunicorn --bind 0.0.0.0:8000 first.wsgi &>/dev/null & 

echo "server {
listen 80;
server_name 18.183.2.22;

location /static/ {
root /home/ubuntu/static/;
 }

location/{

proxy_pass http://18.183.2.22:8000;
 }

}" > /etc/nginx/sites-available/Nginx


#mv /home/ubuntu/NGINX /etc/nginx/sites-available 

sudo ln -s /etc/nginx/sites-available/NGINX /etc/nginx/sites-enabled/

sudo rm /etc/nginx//sites-enabled/default

sudo systemctl restart nginx

