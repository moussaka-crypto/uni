#!/bin/bash

#########################################################
# This script is used to install the MoniTutor client   #
# and set up the user/system to run the client.         #
#                                                       #
# Made by the lovely ITS team at FH Aachen under the    #
# supervision of Prof. Dr. rer. nat. Andreas Claßen     #
#                                                       #
# Usage: ./install_monitutor.sh                         #
#########################################################

# TODO: Change to correct IP
# Wechsel zu neuer Subdomain. Von fb5 auf itslab
#HOST=monitutor.fb5.fh-aachen.de
HOST=monitutor.itslab.fh-aachen.de
# Comment out for insecure connection
# INSECURE=--no-check-certificate

# Check if the script is run as root
if [ "$EUID" -ne 0 ]
  then echo "Das Skript bitte als root ausführen"
  exit
fi

# Check if the script is run on a supported OS
if [ -f /etc/os-release ]; then
    . /etc/os-release
    OS=$NAME
    VER=$VERSION_ID
else
    echo "Das Skript wird nur auf den bereitgestellten Distributionen unterstützt"
    exit
fi

# Auskommentiert wegen Wechsel zu Sectigo CA
# Import and activate DFN CA Certificates
#wget http://cdp.pca.dfn.de/dfn-ca-global-g2/pub/cacert/cacert.pem -O /tmp/DFN-Verein_Global_Issuing_CA.pem
#wget http://cdp.pca.dfn.de/global-root-g2-ca/pub/cacert/cacert.pem -O /tmp/DFN-Verein_Certification_Authority_2.pem
#mv /tmp/DFN-Verein_Global_Issuing_CA.pem /usr/local/share/ca-certificates/DFN-Verein_Global_Issuing_CA.crt
#mv /tmp/DFN-Verein_Certification_Authority_2.pem /usr/local/share/ca-certificates/DFN-Verein_Certification_Authority_2.crt
#update-ca-certificates

# List of missing packages
apt-get update
apt-get -qq install bind9-dnsutils -y

# Copy this install script to /usr/local/bin/install_monitutor.sh
if [ ! -f /usr/local/bin/install_monitutor.sh ]; then
    cp $(basename $0) /usr/local/bin/install_monitutor.sh
    chmod +x /usr/local/bin/install_monitutor.sh
fi

# Check if client is already installed
if [ -f /usr/local/bin/monitutor_client ]; then    
    # Check for updates
    LATEST=$(curl https://$HOST/MoniTutor/static/client/current_version.txt)
    # Get current version
    CURRENT=$(monitutor_client --version | cut -d' ' -f2)
    # Compare versions
    if [ "$LATEST" != "$CURRENT" ]; then
        wget $INSECURE https://$HOST/MoniTutor/static/client/monitutor_client -O /usr/local/bin/monitutor_client
        chmod +x /usr/local/bin/monitutor_client
    fi
else
    wget $INSECURE https://$HOST/MoniTutor/static/client/monitutor_client -O /usr/local/bin/monitutor_client
    chmod +x /usr/local/bin/monitutor_client
fi

# Just update the client
if [ "$1" = "--update" ]; then
    exit
fi

# Continue with installation
clear
echo "MoniTutor Benutzername:"
read USER_NAME
clear
echo "Das HMAC-SECRET finden Sie in Ihren Profileinstellungen unter https://monitutor.itslab.fh-aachen.de/MoniTutor/default/user/profile"
echo "MoniTutor HMAC-Secret:"
read USER_SECRET
clear
#echo "Auf welchem Host führen sie das Skript aus? (itsserver/itsclient)"
#read HOSTNAME
HOSTNAME=$(hostname)

echo "----> Lese Namen aus den Systemeinstellungen: $HOSTNAME"
echo "----> Bitte warten Sie auf die Rueckmeldung des Dienstes"

if [ -f /etc/systemd/system/monitunnel.service ];
then
        echo "--> Alten Monitunnel-Dienst erkannt ..."
        if [ $(systemctl is-active monitunnel.service) = "active" ]
        then
                echo "--> Entferne alten Monitunnel-Dienst ..."
                systemctl stop monitunnel.service
                systemctl disable monitunnel.service
                rm /etc/systemd/system/monitunnel.service
                sleep 2
        fi
fi

echo "--> Setze neuen Monitunnel-Konfiguration ein ..."
cp monitunnel.service /etc/systemd/system/monitunnel.service
sed -i s/USER_NAME/$USER_NAME/ /etc/systemd/system/monitunnel.service
sed -i s/USER_SECRET/$USER_SECRET/ /etc/systemd/system/monitunnel.service
sed -i s/HOSTNAME/$HOSTNAME/ /etc/systemd/system/monitunnel.service

echo "--> Starte neuen Monitunnel-Dienst ..."
# Enable and start service
systemctl daemon-reload
sleep 2
systemctl enable monitunnel.service
systemctl start monitunnel.service
sleep 3
systemctl --no-pager status monitunnel.service
