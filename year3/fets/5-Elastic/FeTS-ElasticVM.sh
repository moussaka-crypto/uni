export my_hostname="itsclient"
export my_ip_suffix="51"

echo "+--------------------------------+"
echo "| FeTS - Fehlertolerante Systeme |" 
echo "+--------------------------------+"
echo "Praktikum: Versuch 5, Elastic Stack"
echo "Version:   v2022-10-24"
echo "Host:      $my_hostname"
echo "IP:        192.168.205.$my_ip_suffix"
echo "Skript muss als root ausgefuehrt werden."

if [ -z "${my_hostname}" ] ; then echo "Variable my_hostname nicht gesetzt!" ; fi
if [ -z "${my_ip_suffix}" ] ; then echo "Variable my_ip_suffix nicht gesetzt!" ; fi

echo "-------------------------"
echo "- Anpassung lokaler IP Adresse"
sudo /bin/sed -i "s/10.0.0.51/192.168.205.${my_ip_suffix}/g" /etc/network/interfaces

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

vm_RAM=$(sudo cat /proc/meminfo | grep MemTotal | grep -o -E '[0-9]+')

#echo "+--------------------------------------------------------+"
#echo "| FeTS Praktikum 05 - Elastic Search                     |"
#echo "+--------------------------------------------------------+"
#echo "| Skript zur Systemanpassung							   |"
#echo "|                                                        |"
#echo "| Wichtig:                                               |"
#echo "|         - Beachten Sie die Hinweise in der Anleitung   |"
#echo "|         - Diese VM benötigt ausreichend RAM (!)        |"
#echo "+--------------------------------------------------------+"
#echo "|                                                        |"

echo "+--------------------------------------------------------+"

if [ $vm_RAM -eq 2043260 ] || [ $vm_RAM -lt 2097152 ]
then    
	echo "| Sie betreiben die VM mit 2048 MB RAM - das ist wenig   |"
	echo "| Unzureichend RAM kann bei diesem Versuch zu Problemen  |"
	echo "| bzw. Nebeneffekten fuehren. Sofern es moeglich ist,    |"
	echo "| erhoehen Sie bitte die RAM-Einstellungen der VM.       |"
	echo "| VirtualBox -> VM ändern -> System -> Hauptspeicher     |"
	echo "| Wir empfehlen - wenn möglich - min 4GB RAM für die VM  |"
elif [ $vm_RAM -gt 2097152 ]
then 
	echo "| Sie betreiben die VM mit mehr als 2048 MB RAM.         |"
	echo "| Kommt es zu hohen Ladezeiten oder unerwartetem         |"
	echo "| Verhalten, passen Sie die RAM Einstellungen der VM an. |"
	echo "|                                                        |"
	echo "| Auf den FH Terminalrechnern nutzen Sie bitte 6GB RAM.  |"
else
	echo "| Sie verwenden $vm_RAM kB RAM. Bitte beruecksichtigen   |"
	echo "| Sie den Bedarf des Versuchs.                           |"
fi
echo "+--------------------------------------------------------+"
read -p "Druecken Sie [Enter] zum Fortfahren..." anykey

echo "-------------------------"
echo "Anpassungen abgeschlossen"
echo ""
echo "!!!---!!!---!!!---!!!---!!!---"
echo "Bitte starten Sie die VM neu"
echo "!!!---!!!---!!!---!!!---!!!---"

