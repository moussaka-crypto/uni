#!/bin/bash

# Nagios on Debian 10

# Mit script und date vorher & nachher noch mal testen

# a Michels VM

echo "+--------------------------------------------------------+"
echo "| FeTS Praktikum 04 - Nagios                             |"
echo "+--------------------------------------------------------+"
echo "| Server-Skript zur Installation des Nagios Core Paketes |"
echo "|                                                        |"
echo "| Wichtig:                                               |"
echo "|         - dies ist nur die Nagios Installation (Server)|"
echo "|         - das VM Anpassungsskript muss VORHER          |"
echo "|           ausgefuehrt werden !                         |"
echo "|         - die Installation benötigt etwas Zeit und     |"
echo "|           CPU Resourcen.                               |"
echo "+--------------------------------------------------------+"
read -p "Druecken Sie [Enter] zum Start der Installation..." anykey

# Folgende Anpassungen muessen nur bei VM-Version 01 gemacht werden. In v02 bereits integriert
CHECK_VERSION_INDICATOR=$(sudo cat /etc/sudoers.d/itsadmin | wc -l)
if [ $CHECK_VERSION_INDICATOR -eq 0 ]
then
	sudo bash -c "echo \"itsadmin    ALL=(ALL) NOPASSWD: ALL\" > /etc/sudoers.d/itsadmin ; chmod 0440 /etc/sudoers.d/itsadmin"

	sudo sed -i "s/ftp.halifax.rwth-aachen.de/ftp.de.debian.org/g" /etc/apt/sources.list

	sudo apt-get update
	sudo apt-get install -y build-essential module-assistant gcc make perl dkms
	sudo m-a prepare
fi


	# Prerequisites
	# Perform these steps to install the pre-requisite packages.

	sudo apt-get update
	sudo apt-get install -y autoconf gcc libc6 make wget --quiet unzip apache2 apache2-utils php libgd-dev


# Download und Installation von Nagios
# Downloading the Source
echo "+--------------------------------------------------------+"
echo "| Download der Quellen                                   |"
echo "+--------------------------------------------------------+"

cd /home/itsadmin
wget --quiet -O nagioscore.tar.gz https://github.com/NagiosEnterprises/nagioscore/releases/download/nagios-4.4.6/nagios-4.4.6.tar.gz
tar xzf nagioscore.tar.gz

# Compile
echo "+--------------------------------------------------------+"
echo "| Kompilieren der Quellen  (make all)                    |"
echo "+--------------------------------------------------------+"

cd /home/itsadmin/nagios-*/
./configure --with-httpd-conf=/etc/apache2/sites-enabled
make all


# Create User And Group
# This creates the nagios user and group. The www-data user is also added to the nagios group.
echo "+--------------------------------------------------------+"
echo "| Systemanpassungen und Installation                     |"
echo "+--------------------------------------------------------+"

sudo make install-groups-users
sudo usermod -a -G nagios www-data

# Install Binaries
# This step installs the binary files, CGIs, and HTML files.

sudo make install

# Install Service / Daemon
# This installs the service or daemon files and also configures them to start on boot.

sudo make install-daemoninit



# Information on starting and stopping services will be explained further on.


# Install Command Mode

# This installs and configures the external command file.

sudo make install-commandmode


# Install Configuration Files

# This installs the *SAMPLE* configuration files. These are required as Nagios needs some configuration files to allow it to start.

sudo make install-config

# Install Apache Config Files
# This installs the Apache web server configuration files and configures the Apache settings.
echo "+--------------------------------------------------------+"
echo "| Anpassung Apache2 Webserver für Interface              |"
echo "+--------------------------------------------------------+"

sudo make install-webconf
sudo a2enmod rewrite
sudo a2enmod cgi


# Configure Firewall
# You need to allow port 80 inbound traffic on the local firewall so you can reach the Nagios Core web interface.
echo "+--------------------------------------------------------+"
echo "| Anpassung der lokalen Firewall (iptables)              |"
echo "+--------------------------------------------------------+"

sudo iptables -I INPUT -p tcp --destination-port 80 -j ACCEPT

sudo apt-get install -y debconf-utils
sudo debconf-set-selections <<< 'iptables-persistent   iptables-persistent/autosave_v4 boolean true'
sudo debconf-set-selections <<< 'iptables-persistent   iptables-persistent/autosave_v6 boolean false'
sudo apt-get install -y iptables-persistent

# Answer yes to saving existing rules


# Create nagiosadmin User Account

# You'll need to create an Apache user account to be able to log into Nagios.

# The following command will create a user account called nagiosadmin and you will be prompted to provide a password for the account.

# sudo htpasswd -c /usr/local/nagios/etc/htpasswd.users nagiosadmin

# PW nagiosadmin set via command line ...
sudo htpasswd -b -c /usr/local/nagios/etc/htpasswd.users nagiosadmin nagiosadmin


# When adding additional users in the future, you need to remove -c from the above command otherwise it will replace the existing nagiosadmin user (and any other users you may have added).



# Installing The Nagios Plugins

# Nagios Core needs plugins to operate properly. The following steps will walk you through installing Nagios Plugins.

# These steps install nagios-plugins 2.2.3. Newer versions will become available in the future and you can use those in the following installation steps. Please see the releases page on GitHub for all available versions.

# Please note that the following steps install most of the plugins that come in the Nagios Plugins package. However there are some plugins that require other libraries which are not included in those instructions. Please refer to the following KB article for detailed installation instructions:

# Documentation - Installing Nagios Plugins From Source


# Prerequisites

# Make sure that you have the following packages installed.

sudo apt-get install -y autoconf gcc libc6 libmcrypt-dev make libssl-dev wget bc gawk dc build-essential snmp libnet-snmp-perl gettext


# Downloading The Source
echo "+--------------------------------------------------------+"
echo "| Download der NagiosPlugin-Quellen                      |"
echo "+--------------------------------------------------------+"

cd /home/itsadmin
wget --quiet --no-check-certificate -O nagios-plugins.tar.gz  https://github.com/nagios-plugins/nagios-plugins/releases/download/release-2.3.3/nagios-plugins-2.3.3.tar.gz
tar zxf nagios-plugins.tar.gz

# Compile + Install
echo "+--------------------------------------------------------+"
echo "| Kompilieren der NagiosPlugin-Quellen  (make all)       |"
echo "+--------------------------------------------------------+"
cd /home/itsadmin/nagios-plugins-*/
# Only needed when cloning from Git ...
# ./tools/setup
./configure
make
sudo make install

# Start Apache Web Server
# Need to restart it because it is already running.
echo "+--------------------------------------------------------+"
echo "| Starten der Dienste und laden des Webinterfaces        |"
echo "+--------------------------------------------------------+"
sudo systemctl --no-pager -l restart apache2.service


# Start Service / Daemon

# This command starts Nagios Core.

sudo systemctl --no-pager -l restart nagios.service


# Test Nagios

# Nagios is now running, to confirm this you need to log into the Nagios Web Interface.

# Point your web browser to the ip address or FQDN of your Nagios Core server, for example:

#sudo -u itsadmin firefox http://10.0.0.11/nagios &


# You will be prompted for a username and password. The username is nagiosadmin (you created it in a previous step) and the password is what you provided earlier.


# Service / Daemon Commands

# Different Linux distributions have different methods of starting / stopping / restarting / status Nagios.

# sudo systemctl start nagios.service
# sudo systemctl stop nagios.service
# sudo systemctl restart nagios.service
sudo systemctl --no-pager -l status nagios.service
# sudo systemctl enable nagios.service


# NRPE
echo "+--------------------------------------------------------+"
echo "| Download der NRPE Quellen                              |"
echo "+--------------------------------------------------------+"
cd /home/itsadmin
# git clone https://github.com/NagiosEnterprises/nrpe.git -b nrpe-4.0.3
wget --quiet --no-check-certificate -O nrpe.tar.gz  https://github.com/NagiosEnterprises/nrpe/releases/download/nrpe-4.0.3/nrpe-4.0.3.tar.gz
tar zxf nrpe.tar.gz

echo "+--------------------------------------------------------+"
echo "| Kompilieren der NRPE Quellen  (make all)               |"
echo "+--------------------------------------------------------+"
cd nrpe-*
./configure
# ./configure --with-ssl=/usr/bin/openssl --with-ssl-lib=/usr/lib/x86_64-linux-gnu 
make check_nrpe
sudo cp src/check_nrpe /usr/local/nagios/libexec/

#------------------------------------------
echo "+--------------------------------------------------------+"
echo "| Nagios Installation ist abgeschlossen - viel Erfolg!   |"
echo "+--------------------------------------------------------+"