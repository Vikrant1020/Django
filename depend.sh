#!/bin/bash 

cd /home/ubuntu
sudo apt update
sudo apt install python3-pip python3-dev nginx -y
pip install django gunicorn

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
          textutils.wsgi:application

[Install]
WantedBy=multi-user.target"  >  /etc/systemd/system/gunicorn.service

sudo systemctl restart nginx
sudo systemctl restart gunicorn
