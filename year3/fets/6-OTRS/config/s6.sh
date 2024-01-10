#!/bin/bash
###add: Itsm
#copy Config.pm
sudo docker exec demootrs_otrs cp /opt/otrs/Kernel/demo_otrs/s6/s6.pm /opt/otrs/Kernel/Config.pm
#add faq article
sudo docker exec demootrs_otrs su - otrs -c 'perl /opt/otrs/bin/otrs.Console.pl Custom::Admin::FAQ::Import "/opt/otrs/Kernel/demo_otrs/s6/s6.csv"'

#check mysqld config at /etc/my.cnf in demootrs_mariadb
if sudo docker exec demootrs_mariadb grep -q max_allowed_packet=20M /etc/my.cnf; then
  sudo docker exec demootrs_mariadb mysql -u root --password="changeme" -e "SET GLOBAL max_allowed_packet=67108864;"
  echo "Warning: MariaDB does not have the required settings for OTRS loaded!"
  echo "set global variable 'max_allowed_packet'"
  sudo docker exec demootrs_mariadb mysql -u otrs --password="changeme" -e "SHOW VARIABLES LIKE 'max_allowed_packet';"
fi
#restart webserver inside container
sudo docker exec demootrs_otrs  supervisorctl restart httpd
#install additional packages 
#curl -o ftp://ftp.otrs.org/pub/otrs/itsm/bundle6/
#FAQ
#LATEST=$(curl -s4 ftp://ftp.otrs.org/pub/otrs/packages/ | grep -Eo 'FAQ-[0-9].[0-9].[0-9]+' | tr "[:blank:]" "\n" | sort -V | tail -n 1)
#if [ ! -f ./volumes/backup/$LATEST.opm ]; then
#  sudo docker exec -it demootrs_otrs curl -o /var/otrs/backups/$LATEST.opm ftp://ftp.otrs.org/pub/otrs/itsm/bundle6/$LATEST.opm
#else 
#echo "File $LATEST.opm already existing."
#fi
#sudo docker exec -it demootrs_otrs curl -o /var/otrs/backups/DynamicFieldConfigItem.opm https://opar.perl-services.de/package/download/1508
sudo cp ./config/ITSM-*.opm ./volumes/backup/
sudo docker exec demootrs_otrs  su - otrs -c 'perl /opt/otrs/bin/otrs.Console.pl Admin::Package::Install /var/otrs/backups/ITSM-*'
sudo docker exec demootrs_otrs  su - otrs -c 'perl /opt/otrs/bin/otrs.Console.pl Admin::Package::Install /opt/otrs/Kernel/demo_otrs/s6/DynamicFieldITSMConfigItem-6.0.1.opm'
sudo docker exec demootrs_otrs  su - otrs -c 'perl /opt/otrs/bin/otrs.Console.pl Admin::Group::UserLink --group-name "itsm-configitem" --user-name "admin@firma.de" --permission "rw"'
sudo docker exec demootrs_otrs  su - otrs -c 'perl /opt/otrs/bin/otrs.Console.pl Admin::Group::UserLink --group-name "itsm-service" --user-name "admin@firma.de" --permission "rw"'
sudo docker exec demootrs_otrs  su - otrs -c 'perl /opt/otrs/bin/otrs.Console.pl Admin::Group::UserLink --group-name "itsm-change" --user-name "admin@firma.de" --permission "rw"'
sudo docker exec demootrs_otrs  su - otrs -c 'perl /opt/otrs/bin/otrs.Console.pl Admin::Group::UserLink --group-name "itsm-change-builder" --user-name "admin@firma.de" --permission "rw"'
sudo docker exec demootrs_otrs  su - otrs -c 'perl /opt/otrs/bin/otrs.Console.pl Admin::Group::UserLink --group-name "itsm-change-manager" --user-name "admin@firma.de" --permission "rw"'

sudo docker exec demootrs_otrs  su - otrs -c 'perl /opt/otrs/bin/otrs.Console.pl agent::Group::UserLink --group-name "itsm-configitem" --user-name "agent@firma.de" --permission "rw"'
sudo docker exec demootrs_otrs  su - otrs -c 'perl /opt/otrs/bin/otrs.Console.pl agent::Group::UserLink --group-name "itsm-service" --user-name "agent@firma.de" --permission "rw"'
sudo docker exec demootrs_otrs  su - otrs -c 'perl /opt/otrs/bin/otrs.Console.pl agent::Group::UserLink --group-name "itsm-change" --user-name "agent@firma.de" --permission "rw"'
sudo docker exec demootrs_otrs  su - otrs -c 'perl /opt/otrs/bin/otrs.Console.pl agent::Group::UserLink --group-name "itsm-change-builder" --user-name "agent@firma.de" --permission "rw"'
sudo docker exec demootrs_otrs  su - otrs -c 'perl /opt/otrs/bin/otrs.Console.pl agent::Group::UserLink --group-name "itsm-change-manager" --user-name "agent@firma.de" --permission "rw"'

sudo docker exec demootrs_otrs  su - otrs -c 'perl /opt/otrs/bin/otrs.Console.pl agent::Group::UserLink --group-name "itsm-configitem" --user-name "agent@digicam.firma.de" --permission "rw"'
sudo docker exec demootrs_otrs  su - otrs -c 'perl /opt/otrs/bin/otrs.Console.pl agent::Group::UserLink --group-name "itsm-service" --user-name "agent@digicam.firma.de" --permission "rw"'
sudo docker exec demootrs_otrs  su - otrs -c 'perl /opt/otrs/bin/otrs.Console.pl agent::Group::UserLink --group-name "itsm-change" --user-name "agent@digicam.firma.de" --permission "rw"'
sudo docker exec demootrs_otrs  su - otrs -c 'perl /opt/otrs/bin/otrs.Console.pl agent::Group::UserLink --group-name "itsm-change-builder" --user-name "agent@digicam.firma.de" --permission "rw"'
sudo docker exec demootrs_otrs  su - otrs -c 'perl /opt/otrs/bin/otrs.Console.pl agent::Group::UserLink --group-name "itsm-change-manager" --user-name "agent@digicam.firma.de" --permission "rw"'
sudo docker exec demootrs_otrs  su - otrs -c 'perl /opt/otrs/bin/otrs.Console.pl agent::Group::UserLink --group-name "itsm-configitem" --user-name "agent-1stlvl@digicam.firma.de" --permission "ro"'
sudo docker exec demootrs_otrs  su - otrs -c 'perl /opt/otrs/bin/otrs.Console.pl agent::Group::UserLink --group-name "itsm-service" --user-name "agent-1stlvl@digicam.firma.de" --permission "ro"'
sudo docker exec demootrs_otrs  su - otrs -c 'perl /opt/otrs/bin/otrs.Console.pl agent::Group::UserLink --group-name "itsm-change" --user-name "agent-1stlvl@digicam.firma.de" --permission "ro"'
sudo docker exec demootrs_otrs  su - otrs -c 'perl /opt/otrs/bin/otrs.Console.pl agent::Group::UserLink --group-name "itsm-change-builder" --user-name "agent-1stlvl@digicam.firma.de" --permission "ro"'
sudo docker exec demootrs_otrs  su - otrs -c 'perl /opt/otrs/bin/otrs.Console.pl agent::Group::UserLink --group-name "itsm-change-manager" --user-name "agent-1stlvl@digicam.firma.de" --permission "ro"'
sudo docker exec demootrs_otrs  su - otrs -c 'perl /opt/otrs/bin/otrs.Console.pl agent::Group::UserLink --group-name "itsm-configitem" --user-name "agent-2ndlvl@digicam.firma.de" --permission "rw"'
sudo docker exec demootrs_otrs  su - otrs -c 'perl /opt/otrs/bin/otrs.Console.pl agent::Group::UserLink --group-name "itsm-service" --user-name "agent-2ndlvl@digicam.firma.de" --permission "rw"'
sudo docker exec demootrs_otrs  su - otrs -c 'perl /opt/otrs/bin/otrs.Console.pl agent::Group::UserLink --group-name "itsm-change" --user-name "agent-2ndlvl@digicam.firma.de" --permission "rw"'
sudo docker exec demootrs_otrs  su - otrs -c 'perl /opt/otrs/bin/otrs.Console.pl agent::Group::UserLink --group-name "itsm-change-builder" --user-name "agent-2ndlvl@digicam.firma.de" --permission "rw"'
sudo docker exec demootrs_otrs  su - otrs -c 'perl /opt/otrs/bin/otrs.Console.pl agent::Group::UserLink --group-name "itsm-change-manager" --user-name "agent-2ndlvl@digicam.firma.de" --permission "rw"'
sudo docker exec demootrs_otrs  su - otrs -c 'perl /opt/otrs/bin/otrs.Console.pl agent::Group::UserLink --group-name "itsm-configitem" --user-name "agent-3rdlvl@digicam.firma.de" --permission "rw"'
sudo docker exec demootrs_otrs  su - otrs -c 'perl /opt/otrs/bin/otrs.Console.pl agent::Group::UserLink --group-name "itsm-service" --user-name "agent-3rdlvl@digicam.firma.de" --permission "rw"'
sudo docker exec demootrs_otrs  su - otrs -c 'perl /opt/otrs/bin/otrs.Console.pl agent::Group::UserLink --group-name "itsm-change" --user-name "agent-3rdlvl@digicam.firma.de" --permission "rw"'
sudo docker exec demootrs_otrs  su - otrs -c 'perl /opt/otrs/bin/otrs.Console.pl agent::Group::UserLink --group-name "itsm-change-builder" --user-name "agent-3rdlvl@digicam.firma.de" --permission "rw"'
sudo docker exec demootrs_otrs  su - otrs -c 'perl /opt/otrs/bin/otrs.Console.pl agent::Group::UserLink --group-name "itsm-change-manager" --user-name "agent-3rdlvl@digicam.firma.de" --permission "rw"'

sudo docker exec demootrs_otrs  su - otrs -c 'perl /opt/otrs/bin/otrs.Console.pl agent::Group::UserLink --group-name "itsm-configitem" --user-name "agent@medoptics.firma.de" --permission "rw"'
sudo docker exec demootrs_otrs  su - otrs -c 'perl /opt/otrs/bin/otrs.Console.pl agent::Group::UserLink --group-name "itsm-service" --user-name "agent@medoptics.firma.de" --permission "rw"'
sudo docker exec demootrs_otrs  su - otrs -c 'perl /opt/otrs/bin/otrs.Console.pl agent::Group::UserLink --group-name "itsm-change" --user-name "agent@medoptics.firma.de" --permission "rw"'
sudo docker exec demootrs_otrs  su - otrs -c 'perl /opt/otrs/bin/otrs.Console.pl agent::Group::UserLink --group-name "itsm-change-builder" --user-name "agent@medoptics.firma.de" --permission "rw"'
sudo docker exec demootrs_otrs  su - otrs -c 'perl /opt/otrs/bin/otrs.Console.pl agent::Group::UserLink --group-name "itsm-change-manager" --user-name "agent@medoptics.firma.de" --permission "rw"'
sudo docker exec demootrs_otrs  su - otrs -c 'perl /opt/otrs/bin/otrs.Console.pl agent::Group::UserLink --group-name "itsm-configitem" --user-name "agent-1stlvl@medoptics.firma.de" --permission "ro"'
sudo docker exec demootrs_otrs  su - otrs -c 'perl /opt/otrs/bin/otrs.Console.pl agent::Group::UserLink --group-name "itsm-service" --user-name "agent-1stlvl@medoptics.firma.de" --permission "ro"'
sudo docker exec demootrs_otrs  su - otrs -c 'perl /opt/otrs/bin/otrs.Console.pl agent::Group::UserLink --group-name "itsm-change" --user-name "agent-1stlvl@medoptics.firma.de" --permission "ro"'
sudo docker exec demootrs_otrs  su - otrs -c 'perl /opt/otrs/bin/otrs.Console.pl agent::Group::UserLink --group-name "itsm-change-builder" --user-name "agent-1stlvl@medoptics.firma.de" --permission "ro"'
sudo docker exec demootrs_otrs  su - otrs -c 'perl /opt/otrs/bin/otrs.Console.pl agent::Group::UserLink --group-name "itsm-change-manager" --user-name "agent-1stlvl@medoptics.firma.de" --permission "ro"'
sudo docker exec demootrs_otrs  su - otrs -c 'perl /opt/otrs/bin/otrs.Console.pl agent::Group::UserLink --group-name "itsm-configitem" --user-name "agent-2ndlvl@medoptics.firma.de" --permission "rw"'
sudo docker exec demootrs_otrs  su - otrs -c 'perl /opt/otrs/bin/otrs.Console.pl agent::Group::UserLink --group-name "itsm-service" --user-name "agent-2ndlvl@medoptics.firma.de" --permission "rw"'
sudo docker exec demootrs_otrs  su - otrs -c 'perl /opt/otrs/bin/otrs.Console.pl agent::Group::UserLink --group-name "itsm-change" --user-name "agent-2ndlvl@medoptics.firma.de" --permission "rw"'
sudo docker exec demootrs_otrs  su - otrs -c 'perl /opt/otrs/bin/otrs.Console.pl agent::Group::UserLink --group-name "itsm-change-builder" --user-name "agent-2ndlvl@medoptics.firma.de" --permission "rw"'
sudo docker exec demootrs_otrs  su - otrs -c 'perl /opt/otrs/bin/otrs.Console.pl agent::Group::UserLink --group-name "itsm-change-manager" --user-name "agent-2ndlvl@medoptics.firma.de" --permission "rw"'
sudo docker exec demootrs_otrs  su - otrs -c 'perl /opt/otrs/bin/otrs.Console.pl agent::Group::UserLink --group-name "itsm-configitem" --user-name "agent-3rdlvl@medoptics.firma.de" --permission "rw"'
sudo docker exec demootrs_otrs  su - otrs -c 'perl /opt/otrs/bin/otrs.Console.pl agent::Group::UserLink --group-name "itsm-service" --user-name "agent-3rdlvl@medoptics.firma.de" --permission "rw"'
sudo docker exec demootrs_otrs  su - otrs -c 'perl /opt/otrs/bin/otrs.Console.pl agent::Group::UserLink --group-name "itsm-change" --user-name "agent-3rdlvl@medoptics.firma.de" --permission "rw"'
sudo docker exec demootrs_otrs  su - otrs -c 'perl /opt/otrs/bin/otrs.Console.pl agent::Group::UserLink --group-name "itsm-change-builder" --user-name "agent-3rdlvl@medoptics.firma.de" --permission "rw"'
sudo docker exec demootrs_otrs  su - otrs -c 'perl /opt/otrs/bin/otrs.Console.pl agent::Group::UserLink --group-name "itsm-change-manager" --user-name "agent-3rdlvl@medoptics.firma.de" --permission "rw"'

sudo docker exec demootrs_otrs  su - otrs -c 'perl /opt/otrs/bin/otrs.Console.pl agent::Group::UserLink --group-name "itsm-configitem" --user-name "agent@intellieyes.firma.de" --permission "rw"'
sudo docker exec demootrs_otrs  su - otrs -c 'perl /opt/otrs/bin/otrs.Console.pl agent::Group::UserLink --group-name "itsm-service" --user-name "agent@intellieyes.firma.de" --permission "rw"'
sudo docker exec demootrs_otrs  su - otrs -c 'perl /opt/otrs/bin/otrs.Console.pl agent::Group::UserLink --group-name "itsm-change" --user-name "agent@intellieyes.firma.de" --permission "rw"'
sudo docker exec demootrs_otrs  su - otrs -c 'perl /opt/otrs/bin/otrs.Console.pl agent::Group::UserLink --group-name "itsm-change-builder" --user-name "agent@intellieyes.firma.de" --permission "rw"'
sudo docker exec demootrs_otrs  su - otrs -c 'perl /opt/otrs/bin/otrs.Console.pl agent::Group::UserLink --group-name "itsm-change-manager" --user-name "agent@intellieyes.firma.de" --permission "rw"'
sudo docker exec demootrs_otrs  su - otrs -c 'perl /opt/otrs/bin/otrs.Console.pl agent::Group::UserLink --group-name "itsm-configitem" --user-name "agent-dach-1stlvl@intellieyes.firma.de" --permission "ro"'
sudo docker exec demootrs_otrs  su - otrs -c 'perl /opt/otrs/bin/otrs.Console.pl agent::Group::UserLink --group-name "itsm-service" --user-name "agent-dach-1stlvl@intellieyes.firma.de" --permission "ro"'
sudo docker exec demootrs_otrs  su - otrs -c 'perl /opt/otrs/bin/otrs.Console.pl agent::Group::UserLink --group-name "itsm-change" --user-name "agent-dach-1stlvl@intellieyes.firma.de" --permission "ro"'
sudo docker exec demootrs_otrs  su - otrs -c 'perl /opt/otrs/bin/otrs.Console.pl agent::Group::UserLink --group-name "itsm-change-builder" --user-name "agent-dach-1stlvl@intellieyes.firma.de" --permission "ro"'
sudo docker exec demootrs_otrs  su - otrs -c 'perl /opt/otrs/bin/otrs.Console.pl agent::Group::UserLink --group-name "itsm-change-manager" --user-name "agent-dach-1stlvl@intellieyes.firma.de" --permission "ro"'
sudo docker exec demootrs_otrs  su - otrs -c 'perl /opt/otrs/bin/otrs.Console.pl agent::Group::UserLink --group-name "itsm-configitem" --user-name "agent-dach-2ndlvl@intellieyes.firma.de" --permission "rw"'
sudo docker exec demootrs_otrs  su - otrs -c 'perl /opt/otrs/bin/otrs.Console.pl agent::Group::UserLink --group-name "itsm-service" --user-name "agent-dach-2ndlvl@intellieyes.firma.de" --permission "rw"'
sudo docker exec demootrs_otrs  su - otrs -c 'perl /opt/otrs/bin/otrs.Console.pl agent::Group::UserLink --group-name "itsm-change" --user-name "agent-dach-2ndlvl@intellieyes.firma.de" --permission "rw"'
sudo docker exec demootrs_otrs  su - otrs -c 'perl /opt/otrs/bin/otrs.Console.pl agent::Group::UserLink --group-name "itsm-change-builder" --user-name "agent-dach-2ndlvl@intellieyes.firma.de" --permission "rw"'
sudo docker exec demootrs_otrs  su - otrs -c 'perl /opt/otrs/bin/otrs.Console.pl agent::Group::UserLink --group-name "itsm-change-manager" --user-name "agent-dach-2ndlvl@intellieyes.firma.de" --permission "rw"'
sudo docker exec demootrs_otrs  su - otrs -c 'perl /opt/otrs/bin/otrs.Console.pl agent::Group::UserLink --group-name "itsm-configitem" --user-name "agent-dach-3rdlvl@intellieyes.firma.de" --permission "rw"'
sudo docker exec demootrs_otrs  su - otrs -c 'perl /opt/otrs/bin/otrs.Console.pl agent::Group::UserLink --group-name "itsm-service" --user-name "agent-dach-3rdlvl@intellieyes.firma.de" --permission "rw"'
sudo docker exec demootrs_otrs  su - otrs -c 'perl /opt/otrs/bin/otrs.Console.pl agent::Group::UserLink --group-name "itsm-change" --user-name "agent-dach-3rdlvl@intellieyes.firma.de" --permission "rw"'
sudo docker exec demootrs_otrs  su - otrs -c 'perl /opt/otrs/bin/otrs.Console.pl agent::Group::UserLink --group-name "itsm-change-builder" --user-name "agent-dach-3rdlvl@intellieyes.firma.de" --permission "rw"'
sudo docker exec demootrs_otrs  su - otrs -c 'perl /opt/otrs/bin/otrs.Console.pl agent::Group::UserLink --group-name "itsm-change-manager" --user-name "agent-dach-3rdlvl@intellieyes.firma.de" --permission "rw"'
sudo docker exec demootrs_otrs  su - otrs -c 'perl /opt/otrs/bin/otrs.Console.pl agent::Group::UserLink --group-name "itsm-configitem" --user-name "agent-china-1stlvl@intellieyes.firma.de" --permission "ro"'
sudo docker exec demootrs_otrs  su - otrs -c 'perl /opt/otrs/bin/otrs.Console.pl agent::Group::UserLink --group-name "itsm-service" --user-name "agent-china-1stlvl@intellieyes.firma.de" --permission "ro"'
sudo docker exec demootrs_otrs  su - otrs -c 'perl /opt/otrs/bin/otrs.Console.pl agent::Group::UserLink --group-name "itsm-change" --user-name "agent-china-1stlvl@intellieyes.firma.de" --permission "ro"'
sudo docker exec demootrs_otrs  su - otrs -c 'perl /opt/otrs/bin/otrs.Console.pl agent::Group::UserLink --group-name "itsm-change-builder" --user-name "agent-china-1stlvl@intellieyes.firma.de" --permission "ro"'
sudo docker exec demootrs_otrs  su - otrs -c 'perl /opt/otrs/bin/otrs.Console.pl agent::Group::UserLink --group-name "itsm-change-manager" --user-name "agent-china-1stlvl@intellieyes.firma.de" --permission "ro"'
sudo docker exec demootrs_otrs  su - otrs -c 'perl /opt/otrs/bin/otrs.Console.pl agent::Group::UserLink --group-name "itsm-configitem" --user-name "agent-china-2ndlvl@intellieyes.firma.de" --permission "rw"'
sudo docker exec demootrs_otrs  su - otrs -c 'perl /opt/otrs/bin/otrs.Console.pl agent::Group::UserLink --group-name "itsm-service" --user-name "agent-china-2ndlvl@intellieyes.firma.de" --permission "rw"'
sudo docker exec demootrs_otrs  su - otrs -c 'perl /opt/otrs/bin/otrs.Console.pl agent::Group::UserLink --group-name "itsm-change" --user-name "agent-china-2ndlvl@intellieyes.firma.de" --permission "rw"'
sudo docker exec demootrs_otrs  su - otrs -c 'perl /opt/otrs/bin/otrs.Console.pl agent::Group::UserLink --group-name "itsm-change-builder" --user-name "agent-china-2ndlvl@intellieyes.firma.de" --permission "rw"'
sudo docker exec demootrs_otrs  su - otrs -c 'perl /opt/otrs/bin/otrs.Console.pl agent::Group::UserLink --group-name "itsm-change-manager" --user-name "agent-china-2ndlvl@intellieyes.firma.de" --permission "rw"'
sudo docker exec demootrs_otrs  su - otrs -c 'perl /opt/otrs/bin/otrs.Console.pl agent::Group::UserLink --group-name "itsm-configitem" --user-name "agent-china-3rdlvl@intellieyes.firma.de" --permission "rw"'
sudo docker exec demootrs_otrs  su - otrs -c 'perl /opt/otrs/bin/otrs.Console.pl agent::Group::UserLink --group-name "itsm-service" --user-name "agent-china-3rdlvl@intellieyes.firma.de" --permission "rw"'
sudo docker exec demootrs_otrs  su - otrs -c 'perl /opt/otrs/bin/otrs.Console.pl agent::Group::UserLink --group-name "itsm-change" --user-name "agent-china-3rdlvl@intellieyes.firma.de" --permission "rw"'
sudo docker exec demootrs_otrs  su - otrs -c 'perl /opt/otrs/bin/otrs.Console.pl agent::Group::UserLink --group-name "itsm-change-builder" --user-name "agent-china-3rdlvl@intellieyes.firma.de" --permission "rw"'
sudo docker exec demootrs_otrs  su - otrs -c 'perl /opt/otrs/bin/otrs.Console.pl agent::Group::UserLink --group-name "itsm-change-manager" --user-name "agent-china-3rdlvl@intellieyes.firma.de" --permission "rw"'


#add dynamicfields
#sudo docker exec demootrs_otrs  su - otrs -c 'perl /opt/otrs/bin/otrs.Console.pl Custom::Admin::DynamicField::Add --name HardwareItem --label "Config Item" --type ITSMConfigItemReference --file HardwareItem.yml --path "/opt/otrs/Kernel/demo_otrs/s6/dynamicfield"'

#add general catalog entries
#add config item configurations
#create CIs ?!

#update processes

#add generic agent
sudo docker exec demootrs_otrs su - otrs -c '/opt/otrs/bin/otrs.Console.pl Custom::Admin::GenericAgent::Add --name "stop cronjob" --file /s6.yml --path "/opt/otrs/Kernel/demo_otrs/s6/"'

