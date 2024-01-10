export my_hostname="itsserver"
export my_ip_suffix="11"

echo "+--------------------------------+"
echo "| FeTS - Fehlertolerante Systeme |" 
echo "+--------------------------------+"
echo "Praktikum: Versuch 4, Nagios Server"
echo "Version:   v2023-10-23"
echo "Host:      $my_hostname"
echo "IP:        192.168.205.11"
echo "Skript muss als root ausgefuehrt werden."

if [ -z "${my_hostname}" ] ; then echo "Variable my_hostname nicht gesetzt!" ; fi
if [ -z "${my_ip_suffix}" ] ; then echo "Variable my_ip_suffix nicht gesetzt!" ; fi

echo "-------------------------"
echo "- Anpassung lokaler IP Adresse"
#sudo /bin/sed -i "s/10.0.0.51/10.0.0.${my_ip_suffix}/g" /etc/network/interfaces
# Debian 10 bis 2023
sudo /bin/sed -i "s/10.0.0.51/192.168.205.${my_ip_suffix}/g" /etc/network/interfaces
# Debian 11 ab 2023
sudo /bin/sed -i "s/192.168.205.51/192.168.205.${my_ip_suffix}/g" /etc/network/interfaces

echo "-------------------------"
echo "- Anpassung lokaler Hosts Tabelle"
sudo tee /etc/hosts <<EOF
127.0.0.1 localhost
127.0.1.1 ${my_hostname}.itsdomain.local ${my_hostname}
# Altes Praktikumsnetz
#10.0.0.11 itsserver.itsdomain.local itsserver
#10.0.0.51 itsclient.itsdomain.local itsclient
192.168.205.11 itsserver.itsdomain.local itsserver
192.168.205.51 itsclient.itsdomain.local itsclient
EOF

echo "-------------------------"
echo "- Anpassung Hostname"
sudo tee /etc/hostname <<EOF
${my_hostname}
EOF

echo "-------------------------"
echo "Anpassungen abgeschlossen"
echo ""
echo "!!!---!!!---!!!---!!!---!!!---"
echo "Bitte starten Sie die VM neu"
echo "!!!---!!!---!!!---!!!---!!!---"