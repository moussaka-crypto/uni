export my_hostname=itsclient
export my_ip_suffix=51

if [ -z "${my_hostname}" ] ; then echo "Variable my_hostname nicht gesetzt!" ; fi
if [ -z "${my_ip_suffix}" ] ; then echo "Variable my_ip_suffix nicht gesetzt!" ; fi
#sudo /bin/sed -i "s/10.0.0.51/10.0.0.${my_ip_suffix}/g" /etc/network/interfaces
sudo /bin/sed -i "s/10.0.0.51/192.168.205.${my_ip_suffix}/g" /etc/network/interfaces
sudo tee /etc/hosts <<EOF
127.0.0.1 localhost
127.0.1.1 ${my_hostname}.itsdomain.local ${my_hostname}
# Altes FeTS Praktikumsnetz
#10.0.0.11 itsserver.itsdomain.local itsserver
#10.0.0.21 itsjumphost.itsdomain.local itsjumphost
#10.0.0.51 itsclient.itsdomain.local itsclient
192.168.205.51 itsclient.itsdomain.local itsclient
EOF
sudo tee /etc/hostname <<EOF
${my_hostname}
EOF
sudo reboot
