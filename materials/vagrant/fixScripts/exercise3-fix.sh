#!/bin/bash
sudo sed -i '/<Location "\/">/,/<\/Location>/d' /etc/apache2/sites-available/000-default.conf
sudo chown -R www-data:www-data /var/www/html
sudo systemctl restart apache2