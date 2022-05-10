#!/bin/bash 

gunicorn --bind 0.0.0.0:8000 first.wsgi & 

echo "server {
          listen 80;
          server_name 18.183.88.141;

          location /static/ {
                    root /home/ubuntu/static/;
          }        

          location / {
          proxy_pass http://18.183.88.141:8000;
          }
}" > /etc/nginx/sites-available/first


sudo ln -s /etc/nginx/sites-available/first /etc/nginx/sites-enabled/

sudo rm /etc/nginx//sites-enabled/default

sudo systemctl restart nginx

