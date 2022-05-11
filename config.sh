#!/bin/bash 

cd /home/ubuntu

source env/bin/activate

gunicorn --bind 0.0.0.0:8000 first.wsgi &  

echo "server {
          listen 80;
          server_name seasiadevops.co.vu;

          location /static/ {
                    root /home/ubuntu/static/;
          }        

          location / {
          proxy_pass http://http://seasiadevops.co.vu;
          }
}" > /etc/nginx/sites-available/first


sudo ln -s /etc/nginx/sites-available/first /etc/nginx/sites-enabled/

sudo rm /etc/nginx//sites-enabled/default

sudo systemctl restart nginx

