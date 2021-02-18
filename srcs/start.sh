#!/bin/bash
service mysql start
service php7.3-fpm start
# Configure a wordpress database
echo "CREATE DATABASE wordpress;"| mysql -u root --skip-password
echo "CREATE USER 'bryella'@'localhost' IDENTIFIED BY '1234';"| mysql -u root --skip-password
echo "GRANT ALL PRIVILEGES ON wordpress.* TO 'bryella'@'localhost' WITH GRANT OPTION;"| mysql -u root --skip-password
echo "FLUSH PRIVILEGES;"| mysql -u root --skip-password
echo "update mysql.user set plugin='' where user LIKE 'bryella%';"| mysql -u root --skip-password
service nginx start
bash