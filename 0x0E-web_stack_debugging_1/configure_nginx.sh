#!/bin/bash

# Install Nginx
apt-get update
apt-get install -y nginx

# Check Nginx status
systemctl status nginx

# Configure Nginx to listen on port 80
cat > /etc/nginx/sites-available/default <<EOL
server {
    listen 80 default_server;
    listen [::]:80 default_server;

    root /var/www/html;
    index index.html index.htm;

    server_name _;

    location / {
        try_files $uri $uri/ =404;
    }
}
EOL

# Enable the default site configuration
ln -s /etc/nginx/sites-available/default /etc/nginx/sites-enabled/

# Test Nginx configuration
nginx -t

# Reload Nginx to apply the changes
systemctl reload nginx

