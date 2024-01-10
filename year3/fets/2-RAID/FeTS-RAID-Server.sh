export my_hostname=itsserver
export my_ip_suffix=11

# Installation eines erforderlichen Tools
sudo apt install lsscsi -qq

if [ -z "${my_hostname}" ] ; then echo "Variable my_hostname nicht gesetzt!" ; fi
if [ -z "${my_ip_suffix}" ] ; then echo "Variable my_ip_suffix nicht gesetzt!" ; fi

echo "- Anpassung Netzwerk IP auf Praktikumsversuch"
#sudo /bin/sed -i "s/10.0.0.51/10.0.0.${my_ip_suffix}/g" /etc/network/interfaces
# Changes for Debian 10
sudo /bin/sed -i "s/10.0.0.51/192.168.205.${my_ip_suffix}/g" /etc/network/interfaces
# Changes for Debian 11
sudo /bin/sed -i "s/192.168.205.51/192.168.205.${my_ip_suffix}/g" /etc/network/interfaces
echo "- Anpassung Hosts-Datei auf Praktikumsversuch"
sudo tee /etc/hosts <<EOF
127.0.0.1 localhost
127.0.1.1 ${my_hostname}.itsdomain.local ${my_hostname}
# Altes FeTS Praktikumsnetz
#10.0.0.11 itsserver.itsdomain.local itsserver
#10.0.0.21 itsjumphost.itsdomain.local itsjumphost
#10.0.0.51 itsclient.itsdomain.local itsclient
192.168.205.11 itsserver.itsdomain.local itsserver
192.168.205.21 itsjumphost.itsdomain.local itsjumphost
192.168.205.51 itsclient.itsdomain.local itsclient
EOF
sudo tee /etc/hostname <<EOF
${my_hostname}
EOF
echo "- Anpassung Beendet. Bitte starten Sie die VM mit 'sudo reboot' neu"
