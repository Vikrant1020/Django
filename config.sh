#!/bin/bash 

cd /home/ubuntu

source env/bin/activate

gunicorn --bind localhost:8000 first.wsgi &  

echo "server {
          listen 80;
          server_name  localhost;

          location /static/ {
                    root /home/ubuntu/static/;
          }        

          location / {
          proxy_pass http:/loaclhost:8000;
          }
}" > /etc/nginx/sites-available/first


sudo ln -s /etc/nginx/sites-available/first /etc/nginx/sites-enabled/

sudo rm /etc/nginx//sites-enabled/default

sudo systemctl restart nginx

