#!/bin/bash

#touch all files once to avoid an installation error
find /var/lib/mysql -type f -exec touch {} \;

#enable login from all IPs
sed -i -e "s/^bind-address[[:space:]]*=[[:space:]]*127.0.0.1/bind-address = 0.0.0.0/" /etc/mysql/mysql.conf.d/mysqld.cnf

#start mysql server
service mysql start

#init database for webserver
mysql -u root <<"EOF"
CREATE USER 'itsadmin'@'%' IDENTIFIED BY 'itsadmin';
CREATE DATABASE reisekosten_db;
GRANT ALL PRIVILEGES ON reisekosten_db.* TO 'itsadmin'@'%';
quit
EOF

# Run forever ...
tail -f /dev/null
