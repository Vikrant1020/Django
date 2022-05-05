#!/bin/bash 


echo "[Unit]
Description=gunicorn socket

[Socket]
ListenStream=/run/gunicorn.sock

[Install]
WantedBy=sockets.target
" > /etc/systemd/system/gunicorn.socket

echo " [Unit]
Description=gunicorn daemon
Requires=gunicorn.socket
After=network.target

[Service]
User=ubuntu
Group=www-data
WorkingDirectory=/home/ubuntu/
ExecStart=/home/ubuntu/env/bin/gunicorn \
          --access-logfile - \
          --workers 3 \
          --bind unix:/run/gunicorn.sock \
          first.wsgi:application

[Install]
WantedBy=multi-user.target"  >  /etc/systemd/system/gunicorn.service



echo "server {
    listen 80;
    server_name 35.76.122.109;

    location = /favicon.ico { access_log off; log_not_found off; }
    location /static/ {
        root /home/ubuntu/;
    }

    location / {
        include proxy_params;
        proxy_pass http://unix:/run/gunicorn.sock;
    }
}" > /etc/nginx/sites-available/first


sudo ln -s /etc/nginx/sites-available/first /etc/nginx/sites-enabled/

sudo rm default


sudo systemctl restart nginx
sudo systemctl restart gunicorn
