#!/bin/bash
###add: queues, groups, escalation
#copy Config.pm
sudo docker exec demootrs_otrs cp /opt/otrs/Kernel/demo_otrs/s4/s4.pm /opt/otrs/Kernel/Config.pm
#add faq article
sudo docker exec demootrs_otrs su - otrs -c 'perl /opt/otrs/bin/otrs.Console.pl Custom::Admin::FAQ::Import "/opt/otrs/Kernel/demo_otrs/s4/s4.csv"'

#add mail accounts
sudo docker exec demootrs_mail add-account agent-dach@firma.de otrs 
sudo docker exec demootrs_mail add-account agent-benelux@firma.de otrs 
sudo docker exec demootrs_mail add-account agent-latam@firma.de otrs 
sudo docker exec demootrs_mail add-account agent-nam@firma.de otrs 
sudo docker exec demootrs_mail add-account agent-europe@firma.de otrs 
sudo docker exec demootrs_mail add-account agent-america@firma.de otrs 
sudo docker exec demootrs_mail add-account agent-worldwide@firma.de otrs 
sudo docker exec demootrs_mail add-account agent-1stlvl-dach@firma.de otrs 
sudo docker exec demootrs_mail add-account agent-1stlvl-benelux@firma.de otrs 
sudo docker exec demootrs_mail add-account agent-1stlvl-latam@firma.de otrs 
sudo docker exec demootrs_mail add-account agent-1stlvl-nam@firma.de otrs 
sudo docker exec demootrs_mail add-account agent-1stlvl-europe@firma.de otrs 
sudo docker exec demootrs_mail add-account agent-1stlvl-america@firma.de otrs 
sudo docker exec demootrs_mail add-account agent-1stlvl-worldwide@firma.de otrs 
sudo docker exec demootrs_mail add-account agent-2ndlvl-dach@firma.de otrs 
sudo docker exec demootrs_mail add-account agent-2ndlvl-benelux@firma.de otrs 
sudo docker exec demootrs_mail add-account agent-2ndlvl-latam@firma.de otrs 
sudo docker exec demootrs_mail add-account agent-2ndlvl-nam@firma.de otrs 
sudo docker exec demootrs_mail add-account agent-2ndlvl-europe@firma.de otrs 
sudo docker exec demootrs_mail add-account agent-2ndlvl-america@firma.de otrs 
sudo docker exec demootrs_mail add-account agent-2ndlvl-worldwide@firma.de otrs 
sudo docker exec demootrs_mail add-account agent-3rdlvl-dach@firma.de otrs 
sudo docker exec demootrs_mail add-account agent-3rdlvl-benelux@firma.de otrs 
sudo docker exec demootrs_mail add-account agent-3rdlvl-latam@firma.de otrs 
sudo docker exec demootrs_mail add-account agent-3rdlvl-nam@firma.de otrs 
sudo docker exec demootrs_mail add-account agent-3rdlvl-europe@firma.de otrs 
sudo docker exec demootrs_mail add-account agent-3rdlvl-america@firma.de otrs 
sudo docker exec demootrs_mail add-account agent-3rdlvl-worldwide@firma.de otrs 

sudo docker exec demootrs_mail add-account customer-dach@firma.de otrs 
sudo docker exec demootrs_mail add-account customer-benelux@firma.de otrs 
sudo docker exec demootrs_mail add-account customer-latam@firma.de otrs 
sudo docker exec demootrs_mail add-account customer-nam@firma.de otrs 
sudo docker exec demootrs_mail add-account customer-europe@firma.de otrs 
sudo docker exec demootrs_mail add-account customer-america@firma.de otrs 
sudo docker exec demootrs_mail add-account customer-worldwide@firma.de otrs 
sudo docker exec demootrs_otrs sudo docker exec demootrs_mailclient rm -rf /home/developer/.sylpheed-2.0/
sudo docker exec demootrs_otrs sudo docker cp /opt/otrs/Kernel/demo_otrs/s4/mailbox/. demootrs_mailclient:/home/developer/.sylpheed-2.0

#add customer
sudo docker exec demootrs_otrs  su - otrs -c 'perl /opt/otrs/bin/otrs.Console.pl Admin::CustomerCompany::Add --name "DACH" --customer-id "102"'
sudo docker exec demootrs_otrs  su - otrs -c 'perl /opt/otrs/bin/otrs.Console.pl Admin::CustomerCompany::Add --name "BENELUX" --customer-id "103"'
sudo docker exec demootrs_otrs  su - otrs -c 'perl /opt/otrs/bin/otrs.Console.pl Admin::CustomerCompany::Add --name "NAM" --customer-id "104"'
sudo docker exec demootrs_otrs  su - otrs -c 'perl /opt/otrs/bin/otrs.Console.pl Admin::CustomerCompany::Add --name "LATAM" --customer-id "105"'
sudo docker exec demootrs_otrs  su - otrs -c 'perl /opt/otrs/bin/otrs.Console.pl Admin::CustomerCompany::Add --name "EUROPE" --customer-id "106"'
sudo docker exec demootrs_otrs  su - otrs -c 'perl /opt/otrs/bin/otrs.Console.pl Admin::CustomerCompany::Add --name "AMERICA" --customer-id "107"'
sudo docker exec demootrs_otrs  su - otrs -c 'perl /opt/otrs/bin/otrs.Console.pl Admin::CustomerCompany::Add --name "WORLDWIDE" --customer-id "108"'

#add cutomeruser
sudo docker exec demootrs_otrs  su - otrs -c 'perl /opt/otrs/bin/otrs.Console.pl Admin::CustomerUser::Add --user-name "customer-dach@firma.de" --first-name Privat --last-name Kunde --email-address "customer-dach@firma.de" --password "otrs" --customer-id "102"'
sudo docker exec demootrs_otrs  su - otrs -c 'perl /opt/otrs/bin/otrs.Console.pl Admin::CustomerUser::Add --user-name "customer-benelux@firma.de" --first-name Prive --last-name Client --email-address "customer-benelux@firma.de" --password "otrs" --customer-id "103"'
sudo docker exec demootrs_otrs  su - otrs -c 'perl /opt/otrs/bin/otrs.Console.pl Admin::CustomerUser::Add --user-name "customer-nam@firma.de" --first-name Private --last-name Customer --email-address "customer-nam@firma.de" --password "otrs" --customer-id "104"'
sudo docker exec demootrs_otrs  su - otrs -c 'perl /opt/otrs/bin/otrs.Console.pl Admin::CustomerUser::Add --user-name "customer-latam@firma.de" --first-name Privadamente --last-name Cliente --email-address "customer-latam@firma.de" --password "otrs" --customer-id "105"'
sudo docker exec demootrs_otrs  su - otrs -c 'perl /opt/otrs/bin/otrs.Console.pl Admin::CustomerUser::Add --user-name "customer-europe@firma.de" --first-name Prive --last-name Client --email-address "customer-europe@firma.de" --password "otrs" --customer-id "106"'
sudo docker exec demootrs_otrs  su - otrs -c 'perl /opt/otrs/bin/otrs.Console.pl Admin::CustomerUser::Add --user-name "customer-america@firma.de" --first-name Private --last-name Customer --email-address "customer-america@firma.de" --password "otrs" --customer-id "107"'
sudo docker exec demootrs_otrs  su - otrs -c 'perl /opt/otrs/bin/otrs.Console.pl Admin::CustomerUser::Add --user-name "customer-worldwide@firma.de" --first-name Private --last-name Customer --email-address "customer-worldwide@firma.de" --password "otrs" --customer-id "108"'


#add groups
sudo docker exec demootrs_otrs  su - otrs -c 'perl /opt/otrs/bin/otrs.Console.pl Admin::Group::Add --name "DACH"'
sudo docker exec demootrs_otrs  su - otrs -c 'perl /opt/otrs/bin/otrs.Console.pl Admin::Group::Add --name "BENELUX"'
sudo docker exec demootrs_otrs  su - otrs -c 'perl /opt/otrs/bin/otrs.Console.pl Admin::Group::Add --name "LATAM"'
sudo docker exec demootrs_otrs  su - otrs -c 'perl /opt/otrs/bin/otrs.Console.pl Admin::Group::Add --name "NAM"'
sudo docker exec demootrs_otrs  su - otrs -c 'perl /opt/otrs/bin/otrs.Console.pl Admin::Group::Add --name "EUROPE"'
sudo docker exec demootrs_otrs  su - otrs -c 'perl /opt/otrs/bin/otrs.Console.pl Admin::Group::Add --name "AMERICA"'
sudo docker exec demootrs_otrs  su - otrs -c 'perl /opt/otrs/bin/otrs.Console.pl Admin::Group::Add --name "WORLDWIDE"'
sudo docker exec demootrs_otrs  su - otrs -c 'perl /opt/otrs/bin/otrs.Console.pl Admin::Group::Add --name "DACH::1stlvl"'
sudo docker exec demootrs_otrs  su - otrs -c 'perl /opt/otrs/bin/otrs.Console.pl Admin::Group::Add --name "DACH::2ndlvl"'
sudo docker exec demootrs_otrs  su - otrs -c 'perl /opt/otrs/bin/otrs.Console.pl Admin::Group::Add --name "DACH::3rdlvl"'
sudo docker exec demootrs_otrs  su - otrs -c 'perl /opt/otrs/bin/otrs.Console.pl Admin::Group::Add --name "BENELUX::1stlvl"'
sudo docker exec demootrs_otrs  su - otrs -c 'perl /opt/otrs/bin/otrs.Console.pl Admin::Group::Add --name "BENELUX::2ndlvl"'
sudo docker exec demootrs_otrs  su - otrs -c 'perl /opt/otrs/bin/otrs.Console.pl Admin::Group::Add --name "BENELUX::3rdlvl"'
sudo docker exec demootrs_otrs  su - otrs -c 'perl /opt/otrs/bin/otrs.Console.pl Admin::Group::Add --name "NAM::1stlvl"'
sudo docker exec demootrs_otrs  su - otrs -c 'perl /opt/otrs/bin/otrs.Console.pl Admin::Group::Add --name "NAM::2ndlvl"'
sudo docker exec demootrs_otrs  su - otrs -c 'perl /opt/otrs/bin/otrs.Console.pl Admin::Group::Add --name "NAM::3rdlvl"'
sudo docker exec demootrs_otrs  su - otrs -c 'perl /opt/otrs/bin/otrs.Console.pl Admin::Group::Add --name "LATAM::1stlvl"'
sudo docker exec demootrs_otrs  su - otrs -c 'perl /opt/otrs/bin/otrs.Console.pl Admin::Group::Add --name "LATAM::2ndlvl"'
sudo docker exec demootrs_otrs  su - otrs -c 'perl /opt/otrs/bin/otrs.Console.pl Admin::Group::Add --name "LATAM::3rdlvl"'
sudo docker exec demootrs_otrs  su - otrs -c 'perl /opt/otrs/bin/otrs.Console.pl Admin::Group::Add --name "EUROPE::1stlvl"'
sudo docker exec demootrs_otrs  su - otrs -c 'perl /opt/otrs/bin/otrs.Console.pl Admin::Group::Add --name "EUROPE::2ndlvl"'
sudo docker exec demootrs_otrs  su - otrs -c 'perl /opt/otrs/bin/otrs.Console.pl Admin::Group::Add --name "EUROPE::3rdlvl"'
sudo docker exec demootrs_otrs  su - otrs -c 'perl /opt/otrs/bin/otrs.Console.pl Admin::Group::Add --name "AMERICA::1stlvl"'
sudo docker exec demootrs_otrs  su - otrs -c 'perl /opt/otrs/bin/otrs.Console.pl Admin::Group::Add --name "AMERICA::2ndlvl"'
sudo docker exec demootrs_otrs  su - otrs -c 'perl /opt/otrs/bin/otrs.Console.pl Admin::Group::Add --name "AMERICA::3rdlvl"'
sudo docker exec demootrs_otrs  su - otrs -c 'perl /opt/otrs/bin/otrs.Console.pl Admin::Group::Add --name "WORLDWIDE::1stlvl"'
sudo docker exec demootrs_otrs  su - otrs -c 'perl /opt/otrs/bin/otrs.Console.pl Admin::Group::Add --name "WORLDWIDE::2ndlvl"'
sudo docker exec demootrs_otrs  su - otrs -c 'perl /opt/otrs/bin/otrs.Console.pl Admin::Group::Add --name "WORLDWIDE::3rdlvl"'

#add roles
sudo docker exec demootrs_otrs  su - otrs -c 'perl /opt/otrs/bin/otrs.Console.pl Admin::Role::Add --name "Agent::General"'
sudo docker exec demootrs_otrs  su - otrs -c 'perl /opt/otrs/bin/otrs.Console.pl Admin::Role::Add --name "Agent::1st-Lvl::DACH"'
sudo docker exec demootrs_otrs  su - otrs -c 'perl /opt/otrs/bin/otrs.Console.pl Admin::Role::Add --name "Agent::1st-Lvl::BENELUX"'
sudo docker exec demootrs_otrs  su - otrs -c 'perl /opt/otrs/bin/otrs.Console.pl Admin::Role::Add --name "Agent::1st-Lvl::LATAM"'
sudo docker exec demootrs_otrs  su - otrs -c 'perl /opt/otrs/bin/otrs.Console.pl Admin::Role::Add --name "Agent::1st-Lvl::NAM"'
sudo docker exec demootrs_otrs  su - otrs -c 'perl /opt/otrs/bin/otrs.Console.pl Admin::Role::Add --name "Agent::2nd-Lvl::DACH"'
sudo docker exec demootrs_otrs  su - otrs -c 'perl /opt/otrs/bin/otrs.Console.pl Admin::Role::Add --name "Agent::2nd-Lvl::BENELUX"'
sudo docker exec demootrs_otrs  su - otrs -c 'perl /opt/otrs/bin/otrs.Console.pl Admin::Role::Add --name "Agent::2nd-Lvl::LATAM"'
sudo docker exec demootrs_otrs  su - otrs -c 'perl /opt/otrs/bin/otrs.Console.pl Admin::Role::Add --name "Agent::2nd-Lvl::NAM"'
sudo docker exec demootrs_otrs  su - otrs -c 'perl /opt/otrs/bin/otrs.Console.pl Admin::Role::Add --name "Agent::3rd-Lvl::DACH"'
sudo docker exec demootrs_otrs  su - otrs -c 'perl /opt/otrs/bin/otrs.Console.pl Admin::Role::Add --name "Agent::3rd-Lvl::BENELUX"'
sudo docker exec demootrs_otrs  su - otrs -c 'perl /opt/otrs/bin/otrs.Console.pl Admin::Role::Add --name "Agent::3rd-Lvl::LATAM"'
sudo docker exec demootrs_otrs  su - otrs -c 'perl /opt/otrs/bin/otrs.Console.pl Admin::Role::Add --name "Agent::3rd-Lvl::NAM"'
sudo docker exec demootrs_otrs  su - otrs -c 'perl /opt/otrs/bin/otrs.Console.pl Admin::Role::Add --name "Agent::1st-Lvl::EUROPE"'
sudo docker exec demootrs_otrs  su - otrs -c 'perl /opt/otrs/bin/otrs.Console.pl Admin::Role::Add --name "Agent::1st-Lvl::AMERICA"'
sudo docker exec demootrs_otrs  su - otrs -c 'perl /opt/otrs/bin/otrs.Console.pl Admin::Role::Add --name "Agent::2nd-Lvl::EUROPE"'
sudo docker exec demootrs_otrs  su - otrs -c 'perl /opt/otrs/bin/otrs.Console.pl Admin::Role::Add --name "Agent::2nd-Lvl::AMERICA"'
sudo docker exec demootrs_otrs  su - otrs -c 'perl /opt/otrs/bin/otrs.Console.pl Admin::Role::Add --name "Agent::3rd-Lvl::EUROPE"'
sudo docker exec demootrs_otrs  su - otrs -c 'perl /opt/otrs/bin/otrs.Console.pl Admin::Role::Add --name "Agent::3rd-Lvl::AMERICA"'
sudo docker exec demootrs_otrs  su - otrs -c 'perl /opt/otrs/bin/otrs.Console.pl Admin::Role::Add --name "Agent::1st-Lvl::WORLDWIDE"'
sudo docker exec demootrs_otrs  su - otrs -c 'perl /opt/otrs/bin/otrs.Console.pl Admin::Role::Add --name "Agent::2nd-Lvl::WORLDWIDE"'
sudo docker exec demootrs_otrs  su - otrs -c 'perl /opt/otrs/bin/otrs.Console.pl Admin::Role::Add --name "Agent::3rd-Lvl::WORLDWIDE"'

#Link Group-Role
sudo docker exec demootrs_otrs su - otrs -c '/opt/otrs/bin/otrs.Console.pl Admin::Group::RoleLink --group-name "DACH" --role-name "Agent::1st-Lvl::DACH" --permission "rw"'
sudo docker exec demootrs_otrs su - otrs -c '/opt/otrs/bin/otrs.Console.pl Admin::Group::RoleLink --group-name "DACH::1stlvl" --role-name "Agent::1st-Lvl::DACH" --permission "rw"'
sudo docker exec demootrs_otrs su - otrs -c '/opt/otrs/bin/otrs.Console.pl Admin::Group::RoleLink --group-name "DACH::2ndlvl" --role-name "Agent::1st-Lvl::DACH" --permission "ro" --permission "move_into" --permission "create"'
sudo docker exec demootrs_otrs su - otrs -c '/opt/otrs/bin/otrs.Console.pl Admin::Group::RoleLink --group-name "EUROPE::1stlvl" --role-name "Agent::1st-Lvl::DACH" --permission "ro" --permission "move_into" --permission "create"'

sudo docker exec demootrs_otrs su - otrs -c '/opt/otrs/bin/otrs.Console.pl Admin::Group::RoleLink --group-name "BENELUX" --role-name "Agent::1st-Lvl::BENELUX" --permission "rw"'
sudo docker exec demootrs_otrs su - otrs -c '/opt/otrs/bin/otrs.Console.pl Admin::Group::RoleLink --group-name "BENELUX::1stlvl" --role-name "Agent::1st-Lvl::BENELUX" --permission "rw"'
sudo docker exec demootrs_otrs su - otrs -c '/opt/otrs/bin/otrs.Console.pl Admin::Group::RoleLink --group-name "BENELUX::2ndlvl" --role-name "Agent::1st-Lvl::BENELUX" --permission "ro" --permission "move_into" --permission "create"'
sudo docker exec demootrs_otrs su - otrs -c '/opt/otrs/bin/otrs.Console.pl Admin::Group::RoleLink --group-name "EUROPE::1stlvl" --role-name "Agent::1st-Lvl::BENELUX" --permission "ro" --permission "move_into" --permission "create"'

sudo docker exec demootrs_otrs su - otrs -c '/opt/otrs/bin/otrs.Console.pl Admin::Group::RoleLink --group-name "NAM" --role-name "Agent::1st-Lvl::NAM" --permission "rw"'
sudo docker exec demootrs_otrs su - otrs -c '/opt/otrs/bin/otrs.Console.pl Admin::Group::RoleLink --group-name "NAM::1stlvl" --role-name "Agent::1st-Lvl::NAM" --permission "rw"'
sudo docker exec demootrs_otrs su - otrs -c '/opt/otrs/bin/otrs.Console.pl Admin::Group::RoleLink --group-name "NAM::2ndlvl" --role-name "Agent::1st-Lvl::NAM" --permission "ro" --permission "move_into" --permission "create"'
sudo docker exec demootrs_otrs su - otrs -c '/opt/otrs/bin/otrs.Console.pl Admin::Group::RoleLink --group-name "EUROPE::1stlvl" --role-name "Agent::1st-Lvl::NAM" --permission "ro" --permission "move_into" --permission "create"'

sudo docker exec demootrs_otrs su - otrs -c '/opt/otrs/bin/otrs.Console.pl Admin::Group::RoleLink --group-name "LATAM" --role-name "Agent::1st-Lvl::LATAM" --permission "rw"'
sudo docker exec demootrs_otrs su - otrs -c '/opt/otrs/bin/otrs.Console.pl Admin::Group::RoleLink --group-name "LATAM::1stlvl" --role-name "Agent::1st-Lvl::LATAM" --permission "rw"'
sudo docker exec demootrs_otrs su - otrs -c '/opt/otrs/bin/otrs.Console.pl Admin::Group::RoleLink --group-name "LATAM::2ndlvl" --role-name "Agent::1st-Lvl::LATAM" --permission "ro" --permission "move_into" --permission "create"'
sudo docker exec demootrs_otrs su - otrs -c '/opt/otrs/bin/otrs.Console.pl Admin::Group::RoleLink --group-name "EUROPE::1stlvl" --role-name "Agent::1st-Lvl::LATAM" --permission "ro" --permission "move_into" --permission "create"'

sudo docker exec demootrs_otrs su - otrs -c '/opt/otrs/bin/otrs.Console.pl Admin::Group::RoleLink --group-name "EUROPE" --role-name "Agent::1st-Lvl::EUROPE" --permission "rw"'
sudo docker exec demootrs_otrs su - otrs -c '/opt/otrs/bin/otrs.Console.pl Admin::Group::RoleLink --group-name "EUROPE::1stlvl" --role-name "Agent::1st-Lvl::EUROPE" --permission "rw"'
sudo docker exec demootrs_otrs su - otrs -c '/opt/otrs/bin/otrs.Console.pl Admin::Group::RoleLink --group-name "DACH::1stlvl" --role-name "Agent::1st-Lvl::EUROPE" --permission "rw"'
sudo docker exec demootrs_otrs su - otrs -c '/opt/otrs/bin/otrs.Console.pl Admin::Group::RoleLink --group-name "BENELUX::1stlvl" --role-name "Agent::1st-Lvl::EUROPE" --permission "rw"'
sudo docker exec demootrs_otrs su - otrs -c '/opt/otrs/bin/otrs.Console.pl Admin::Group::RoleLink --group-name "EUROPE::2ndlvl" --role-name "Agent::1st-Lvl::EUROPE" --permission "ro" --permission "move_into" --permission "create"'
sudo docker exec demootrs_otrs su - otrs -c '/opt/otrs/bin/otrs.Console.pl Admin::Group::RoleLink --group-name "AMERICA" --role-name "Agent::1st-Lvl::AMERICA" --permission "rw"'
sudo docker exec demootrs_otrs su - otrs -c '/opt/otrs/bin/otrs.Console.pl Admin::Group::RoleLink --group-name "AMERICA::1stlvl" --role-name "Agent::1st-Lvl::AMERICA" --permission "rw"'
sudo docker exec demootrs_otrs su - otrs -c '/opt/otrs/bin/otrs.Console.pl Admin::Group::RoleLink --group-name "NAM::1stlvl" --role-name "Agent::1st-Lvl::AMERICA" --permission "rw"'
sudo docker exec demootrs_otrs su - otrs -c '/opt/otrs/bin/otrs.Console.pl Admin::Group::RoleLink --group-name "LATAM::1stlvl" --role-name "Agent::1st-Lvl::AMERICA" --permission "rw"'
sudo docker exec demootrs_otrs su - otrs -c '/opt/otrs/bin/otrs.Console.pl Admin::Group::RoleLink --group-name "AMERICA::2ndlvl" --role-name "Agent::1st-Lvl::AMERICA" --permission "ro" --permission "move_into" --permission "create"'
sudo docker exec demootrs_otrs su - otrs -c '/opt/otrs/bin/otrs.Console.pl Admin::Group::RoleLink --group-name "WORLDWIDE" --role-name "Agent::1st-Lvl::WORLDWIDE" --permission "rw"'
sudo docker exec demootrs_otrs su - otrs -c '/opt/otrs/bin/otrs.Console.pl Admin::Group::RoleLink --group-name "WORLDWIDE::1stlvl" --role-name "Agent::1st-Lvl::WORLDWIDE" --permission "rw"'
sudo docker exec demootrs_otrs su - otrs -c '/opt/otrs/bin/otrs.Console.pl Admin::Group::RoleLink --group-name "EUROPE::1stlvl" --role-name "Agent::1st-Lvl::WORLDWIDE" --permission "rw"'
sudo docker exec demootrs_otrs su - otrs -c '/opt/otrs/bin/otrs.Console.pl Admin::Group::RoleLink --group-name "AMERICA::1stlvl" --role-name "Agent::1st-Lvl::WORLDWIDE" --permission "rw"'
sudo docker exec demootrs_otrs su - otrs -c '/opt/otrs/bin/otrs.Console.pl Admin::Group::RoleLink --group-name "WORLDWIDE::2ndlvl" --role-name "Agent::1st-Lvl::WORLDWIDE" --permission "ro" --permission "move_into" --permission "create"'
#link 2ndlvl agents
sudo docker exec demootrs_otrs su - otrs -c '/opt/otrs/bin/otrs.Console.pl Admin::Group::RoleLink --group-name "DACH" --role-name "Agent::2nd-Lvl::DACH" --permission "rw"'
sudo docker exec demootrs_otrs su - otrs -c '/opt/otrs/bin/otrs.Console.pl Admin::Group::RoleLink --group-name "DACH::2ndlvl" --role-name "Agent::2nd-Lvl::DACH" --permission "rw"'
sudo docker exec demootrs_otrs su - otrs -c '/opt/otrs/bin/otrs.Console.pl Admin::Group::RoleLink --group-name "DACH::3rdlvl" --role-name "Agent::2nd-Lvl::DACH" --permission "ro" --permission "move_into" --permission "create"'
sudo docker exec demootrs_otrs su - otrs -c '/opt/otrs/bin/otrs.Console.pl Admin::Group::RoleLink --group-name "DACH::1stlvl" --role-name "Agent::2nd-Lvl::DACH" --permission "ro" --permission "move_into" --permission "create"'
sudo docker exec demootrs_otrs su - otrs -c '/opt/otrs/bin/otrs.Console.pl Admin::Group::RoleLink --group-name "EUROPE::2ndlvl" --role-name "Agent::2nd-Lvl::DACH" --permission "ro" --permission "move_into" --permission "create"'

sudo docker exec demootrs_otrs su - otrs -c '/opt/otrs/bin/otrs.Console.pl Admin::Group::RoleLink --group-name "BENELUX" --role-name "Agent::2nd-Lvl::BENELUX" --permission "rw"'
sudo docker exec demootrs_otrs su - otrs -c '/opt/otrs/bin/otrs.Console.pl Admin::Group::RoleLink --group-name "BENELUX::2ndlvl" --role-name "Agent::2nd-Lvl::BENELUX" --permission "rw"'
sudo docker exec demootrs_otrs su - otrs -c '/opt/otrs/bin/otrs.Console.pl Admin::Group::RoleLink --group-name "BENELUX::1stlvl" --role-name "Agent::2nd-Lvl::BENELUX" --permission "ro" --permission "move_into" --permission "create"'
sudo docker exec demootrs_otrs su - otrs -c '/opt/otrs/bin/otrs.Console.pl Admin::Group::RoleLink --group-name "BENELUX::3rdlvl" --role-name "Agent::2nd-Lvl::BENELUX" --permission "ro" --permission "move_into" --permission "create"'
sudo docker exec demootrs_otrs su - otrs -c '/opt/otrs/bin/otrs.Console.pl Admin::Group::RoleLink --group-name "EUROPE::2ndlvl" --role-name "Agent::2nd-Lvl::BENELUX" --permission "ro" --permission "move_into" --permission "create"'

sudo docker exec demootrs_otrs su - otrs -c '/opt/otrs/bin/otrs.Console.pl Admin::Group::RoleLink --group-name "NAM" --role-name "Agent::2nd-Lvl::NAM" --permission "rw"'
sudo docker exec demootrs_otrs su - otrs -c '/opt/otrs/bin/otrs.Console.pl Admin::Group::RoleLink --group-name "NAM::2ndlvl" --role-name "Agent::2nd-Lvl::NAM" --permission "rw"'
sudo docker exec demootrs_otrs su - otrs -c '/opt/otrs/bin/otrs.Console.pl Admin::Group::RoleLink --group-name "NAM::1stlvl" --role-name "Agent::2nd-Lvl::NAM" --permission "ro" --permission "move_into" --permission "create"'
sudo docker exec demootrs_otrs su - otrs -c '/opt/otrs/bin/otrs.Console.pl Admin::Group::RoleLink --group-name "NAM::3rdlvl" --role-name "Agent::2nd-Lvl::NAM" --permission "ro" --permission "move_into" --permission "create"'
sudo docker exec demootrs_otrs su - otrs -c '/opt/otrs/bin/otrs.Console.pl Admin::Group::RoleLink --group-name "EUROPE::2ndlvl" --role-name "Agent::2nd-Lvl::NAM" --permission "ro" --permission "move_into" --permission "create"'

sudo docker exec demootrs_otrs su - otrs -c '/opt/otrs/bin/otrs.Console.pl Admin::Group::RoleLink --group-name "LATAM" --role-name "Agent::2nd-Lvl::LATAM" --permission "rw"'
sudo docker exec demootrs_otrs su - otrs -c '/opt/otrs/bin/otrs.Console.pl Admin::Group::RoleLink --group-name "LATAM::2ndlvl" --role-name "Agent::2nd-Lvl::LATAM" --permission "rw"'
sudo docker exec demootrs_otrs su - otrs -c '/opt/otrs/bin/otrs.Console.pl Admin::Group::RoleLink --group-name "LATAM::1stlvl" --role-name "Agent::2nd-Lvl::LATAM" --permission "ro" --permission "move_into" --permission "create"'
sudo docker exec demootrs_otrs su - otrs -c '/opt/otrs/bin/otrs.Console.pl Admin::Group::RoleLink --group-name "LATAM::3rdlvl" --role-name "Agent::2nd-Lvl::LATAM" --permission "ro" --permission "move_into" --permission "create"'
sudo docker exec demootrs_otrs su - otrs -c '/opt/otrs/bin/otrs.Console.pl Admin::Group::RoleLink --group-name "EUROPE::2ndlvl" --role-name "Agent::2nd-Lvl::LATAM" --permission "ro" --permission "move_into" --permission "create"'

sudo docker exec demootrs_otrs su - otrs -c '/opt/otrs/bin/otrs.Console.pl Admin::Group::RoleLink --group-name "EUROPE" --role-name "Agent::2nd-Lvl::EUROPE" --permission "rw"'
sudo docker exec demootrs_otrs su - otrs -c '/opt/otrs/bin/otrs.Console.pl Admin::Group::RoleLink --group-name "EUROPE::2ndlvl" --role-name "Agent::2nd-Lvl::EUROPE" --permission "rw"'
sudo docker exec demootrs_otrs su - otrs -c '/opt/otrs/bin/otrs.Console.pl Admin::Group::RoleLink --group-name "DACH::2ndlvl" --role-name "Agent::2nd-Lvl::EUROPE" --permission "rw"'
sudo docker exec demootrs_otrs su - otrs -c '/opt/otrs/bin/otrs.Console.pl Admin::Group::RoleLink --group-name "BENELUX::2ndlvl" --role-name "Agent::2nd-Lvl::EUROPE" --permission "rw"'
sudo docker exec demootrs_otrs su - otrs -c '/opt/otrs/bin/otrs.Console.pl Admin::Group::RoleLink --group-name "EUROPE::3rdlvl" --role-name "Agent::2nd-Lvl::EUROPE" --permission "ro" --permission "move_into" --permission "create"'
sudo docker exec demootrs_otrs su - otrs -c '/opt/otrs/bin/otrs.Console.pl Admin::Group::RoleLink --group-name "EUROPE::1stlvl" --role-name "Agent::2nd-Lvl::EUROPE" --permission "ro" --permission "move_into" --permission "create"'

sudo docker exec demootrs_otrs su - otrs -c '/opt/otrs/bin/otrs.Console.pl Admin::Group::RoleLink --group-name "AMERICA" --role-name "Agent::2nd-Lvl::AMERICA" --permission "rw"'
sudo docker exec demootrs_otrs su - otrs -c '/opt/otrs/bin/otrs.Console.pl Admin::Group::RoleLink --group-name "AMERICA::2ndlvl" --role-name "Agent::2nd-Lvl::AMERICA" --permission "rw"'
sudo docker exec demootrs_otrs su - otrs -c '/opt/otrs/bin/otrs.Console.pl Admin::Group::RoleLink --group-name "NAM::2ndlvl" --role-name "Agent::2nd-Lvl::AMERICA" --permission "rw"'
sudo docker exec demootrs_otrs su - otrs -c '/opt/otrs/bin/otrs.Console.pl Admin::Group::RoleLink --group-name "LATAM::2ndlvl" --role-name "Agent::2nd-Lvl::AMERICA" --permission "rw"'
sudo docker exec demootrs_otrs su - otrs -c '/opt/otrs/bin/otrs.Console.pl Admin::Group::RoleLink --group-name "AMERICA::3rdlvl" --role-name "Agent::2nd-Lvl::AMERICA" --permission "ro" --permission "move_into" --permission "create"'
sudo docker exec demootrs_otrs su - otrs -c '/opt/otrs/bin/otrs.Console.pl Admin::Group::RoleLink --group-name "AMERICA::1stlvl" --role-name "Agent::2nd-Lvl::AMERICA" --permission "ro" --permission "move_into" --permission "create"'

sudo docker exec demootrs_otrs su - otrs -c '/opt/otrs/bin/otrs.Console.pl Admin::Group::RoleLink --group-name "WORLDWIDE" --role-name "Agent::2nd-Lvl::WORLDWIDE" --permission "rw"'
sudo docker exec demootrs_otrs su - otrs -c '/opt/otrs/bin/otrs.Console.pl Admin::Group::RoleLink --group-name "WORLDWIDE::2ndlvl" --role-name "Agent::2nd-Lvl::WORLDWIDE" --permission "rw"'
sudo docker exec demootrs_otrs su - otrs -c '/opt/otrs/bin/otrs.Console.pl Admin::Group::RoleLink --group-name "EUROPE::2ndlvl" --role-name "Agent::2nd-Lvl::WORLDWIDE" --permission "rw"'
sudo docker exec demootrs_otrs su - otrs -c '/opt/otrs/bin/otrs.Console.pl Admin::Group::RoleLink --group-name "AMERICA::2ndlvl" --role-name "Agent::2nd-Lvl::WORLDWIDE" --permission "rw"'
sudo docker exec demootrs_otrs su - otrs -c '/opt/otrs/bin/otrs.Console.pl Admin::Group::RoleLink --group-name "WORLDWIDE::3rdlvl" --role-name "Agent::2nd-Lvl::WORLDWIDE" --permission "ro" --permission "move_into" --permission "create"'
sudo docker exec demootrs_otrs su - otrs -c '/opt/otrs/bin/otrs.Console.pl Admin::Group::RoleLink --group-name "WORLDWIDE::1stlvl" --role-name "Agent::2nd-Lvl::WORLDWIDE" --permission "ro" --permission "move_into" --permission "create"'


#link 3rd lvl agents
sudo docker exec demootrs_otrs su - otrs -c '/opt/otrs/bin/otrs.Console.pl Admin::Group::RoleLink --group-name "DACH" --role-name "Agent::3rd-Lvl::DACH" --permission "rw"'
sudo docker exec demootrs_otrs su - otrs -c '/opt/otrs/bin/otrs.Console.pl Admin::Group::RoleLink --group-name "DACH::3rdlvl" --role-name "Agent::3rd-Lvl::DACH" --permission "rw"'
sudo docker exec demootrs_otrs su - otrs -c '/opt/otrs/bin/otrs.Console.pl Admin::Group::RoleLink --group-name "EUROPE::3rdlvl" --role-name "Agent::3rd-Lvl::DACH" --permission "ro" --permission "move_into" --permission "create"'
sudo docker exec demootrs_otrs su - otrs -c '/opt/otrs/bin/otrs.Console.pl Admin::Group::RoleLink --group-name "DACH::2ndlvl" --role-name "Agent::3rd-Lvl::BENELUX" --permission "ro" --permission "move_into" --permission "create"'

sudo docker exec demootrs_otrs su - otrs -c '/opt/otrs/bin/otrs.Console.pl Admin::Group::RoleLink --group-name "BENELUX" --role-name "Agent::3rd-Lvl::BENELUX" --permission "rw"'
sudo docker exec demootrs_otrs su - otrs -c '/opt/otrs/bin/otrs.Console.pl Admin::Group::RoleLink --group-name "BENELUX::3rdlvl" --role-name "Agent::3rd-Lvl::BENELUX" --permission "rw"'
sudo docker exec demootrs_otrs su - otrs -c '/opt/otrs/bin/otrs.Console.pl Admin::Group::RoleLink --group-name "EUROPE::3rdlvl" --role-name "Agent::3rd-Lvl::BENELUX" --permission "ro" --permission "move_into" --permission "create"'
sudo docker exec demootrs_otrs su - otrs -c '/opt/otrs/bin/otrs.Console.pl Admin::Group::RoleLink --group-name "BENELUX::2ndlvl" --role-name "Agent::3rd-Lvl::BENELUX" --permission "ro" --permission "move_into" --permission "create"'

sudo docker exec demootrs_otrs su - otrs -c '/opt/otrs/bin/otrs.Console.pl Admin::Group::RoleLink --group-name "NAM" --role-name "Agent::3rd-Lvl::NAM" --permission "rw"'
sudo docker exec demootrs_otrs su - otrs -c '/opt/otrs/bin/otrs.Console.pl Admin::Group::RoleLink --group-name "NAM::3rdlvl" --role-name "Agent::3rd-Lvl::NAM" --permission "rw"'
sudo docker exec demootrs_otrs su - otrs -c '/opt/otrs/bin/otrs.Console.pl Admin::Group::RoleLink --group-name "EUROPE::3rdlvl" --role-name "Agent::3rd-Lvl::NAM" --permission "ro" --permission "move_into" --permission "create"'
sudo docker exec demootrs_otrs su - otrs -c '/opt/otrs/bin/otrs.Console.pl Admin::Group::RoleLink --group-name "NAM::2ndlvl" --role-name "Agent::3rd-Lvl::NAM" --permission "ro" --permission "move_into" --permission "create"'

sudo docker exec demootrs_otrs su - otrs -c '/opt/otrs/bin/otrs.Console.pl Admin::Group::RoleLink --group-name "LATAM" --role-name "Agent::3rd-Lvl::LATAM" --permission "rw"'
sudo docker exec demootrs_otrs su - otrs -c '/opt/otrs/bin/otrs.Console.pl Admin::Group::RoleLink --group-name "LATAM::3rdlvl" --role-name "Agent::3rd-Lvl::LATAM" --permission "rw"'
sudo docker exec demootrs_otrs su - otrs -c '/opt/otrs/bin/otrs.Console.pl Admin::Group::RoleLink --group-name "EUROPE::3rdlvl" --role-name "Agent::3rd-Lvl::LATAM" --permission "ro" --permission "move_into" --permission "create"'
sudo docker exec demootrs_otrs su - otrs -c '/opt/otrs/bin/otrs.Console.pl Admin::Group::RoleLink --group-name "LATAM::2ndlvl" --role-name "Agent::3rd-Lvl::LATAM" --permission "ro" --permission "move_into" --permission "create"'

sudo docker exec demootrs_otrs su - otrs -c '/opt/otrs/bin/otrs.Console.pl Admin::Group::RoleLink --group-name "EUROPE" --role-name "Agent::3rd-Lvl::EUROPE" --permission "rw"'
sudo docker exec demootrs_otrs su - otrs -c '/opt/otrs/bin/otrs.Console.pl Admin::Group::RoleLink --group-name "EUROPE::3rdlvl" --role-name "Agent::3rd-Lvl::EUROPE" --permission "rw"'
sudo docker exec demootrs_otrs su - otrs -c '/opt/otrs/bin/otrs.Console.pl Admin::Group::RoleLink --group-name "DACH::3rdlvl" --role-name "Agent::3rd-Lvl::EUROPE" --permission "rw"'
sudo docker exec demootrs_otrs su - otrs -c '/opt/otrs/bin/otrs.Console.pl Admin::Group::RoleLink --group-name "BENELUX::3rdlvl" --role-name "Agent::3rd-Lvl::EUROPE" --permission "rw"'
sudo docker exec demootrs_otrs su - otrs -c '/opt/otrs/bin/otrs.Console.pl Admin::Group::RoleLink --group-name "EUROPE::2ndlvl" --role-name "Agent::3rd-Lvl::EUROPE" --permission "ro" --permission "move_into" --permission "create"'
sudo docker exec demootrs_otrs su - otrs -c '/opt/otrs/bin/otrs.Console.pl Admin::Group::RoleLink --group-name "DACH::2ndlvl" --role-name "Agent::3rd-Lvl::EUROPE" --permission "ro" --permission "move_into" --permission "create"'
sudo docker exec demootrs_otrs su - otrs -c '/opt/otrs/bin/otrs.Console.pl Admin::Group::RoleLink --group-name "BENELUX::2ndlvl" --role-name "Agent::3rd-Lvl::EUROPE" --permission "ro" --permission "move_into" --permission "create"'

sudo docker exec demootrs_otrs su - otrs -c '/opt/otrs/bin/otrs.Console.pl Admin::Group::RoleLink --group-name "AMERICA" --role-name "Agent::3rd-Lvl::AMERICA" --permission "rw"'
sudo docker exec demootrs_otrs su - otrs -c '/opt/otrs/bin/otrs.Console.pl Admin::Group::RoleLink --group-name "AMERICA::3rdlvl" --role-name "Agent::3rd-Lvl::AMERICA" --permission "rw"'
sudo docker exec demootrs_otrs su - otrs -c '/opt/otrs/bin/otrs.Console.pl Admin::Group::RoleLink --group-name "NAM::3rdlvl" --role-name "Agent::3rd-Lvl::AMERICA" --permission "rw"'
sudo docker exec demootrs_otrs su - otrs -c '/opt/otrs/bin/otrs.Console.pl Admin::Group::RoleLink --group-name "LATAM::3rdlvl" --role-name "Agent::3rd-Lvl::AMERICA" --permission "rw"'
sudo docker exec demootrs_otrs su - otrs -c '/opt/otrs/bin/otrs.Console.pl Admin::Group::RoleLink --group-name "AMERICA::2ndlvl" --role-name "Agent::3rd-Lvl::AMERICA" --permission "ro" --permission "move_into" --permission "create"'
sudo docker exec demootrs_otrs su - otrs -c '/opt/otrs/bin/otrs.Console.pl Admin::Group::RoleLink --group-name "NAM::2ndlvl" --role-name "Agent::3rd-Lvl::AMERICA" --permission "ro" --permission "move_into" --permission "create"'
sudo docker exec demootrs_otrs su - otrs -c '/opt/otrs/bin/otrs.Console.pl Admin::Group::RoleLink --group-name "LATAM::2ndlvl" --role-name "Agent::3rd-Lvl::AMERICA" --permission "ro" --permission "move_into" --permission "create"'


sudo docker exec demootrs_otrs su - otrs -c '/opt/otrs/bin/otrs.Console.pl Admin::Group::RoleLink --group-name "WORLDWIDE" --role-name "Agent::3rd-Lvl::WORLDWIDE" --permission "rw"'
sudo docker exec demootrs_otrs su - otrs -c '/opt/otrs/bin/otrs.Console.pl Admin::Group::RoleLink --group-name "WORLDWIDE::3rdlvl" --role-name "Agent::3rd-Lvl::WORLDWIDE" --permission "rw"'
sudo docker exec demootrs_otrs su - otrs -c '/opt/otrs/bin/otrs.Console.pl Admin::Group::RoleLink --group-name "EUROPE::3rdlvl" --role-name "Agent::3rd-Lvl::WORLDWIDE" --permission "rw"'
sudo docker exec demootrs_otrs su - otrs -c '/opt/otrs/bin/otrs.Console.pl Admin::Group::RoleLink --group-name "AMERICA::3rdlvl" --role-name "Agent::3rd-Lvl::WORLDWIDE" --permission "rw"'
sudo docker exec demootrs_otrs su - otrs -c '/opt/otrs/bin/otrs.Console.pl Admin::Group::RoleLink --group-name "WORLDWIDE::2ndlvl" --role-name "Agent::3rd-Lvl::WORLDWIDE" --permission "ro" --permission "move_into" --permission "create"'
sudo docker exec demootrs_otrs su - otrs -c '/opt/otrs/bin/otrs.Console.pl Admin::Group::RoleLink --group-name "EUROPE::2ndlvl" --role-name "Agent::3rd-Lvl::WORLDWIDE" --permission "ro" --permission "move_into" --permission "create"'
sudo docker exec demootrs_otrs su - otrs -c '/opt/otrs/bin/otrs.Console.pl Admin::Group::RoleLink --group-name "AMERICA::2ndlvl" --role-name "Agent::3rd-Lvl::WORLDWIDE" --permission "ro" --permission "move_into" --permission "create"'

#add queues
sudo docker exec demootrs_otrs su - otrs -c 'perl /opt/otrs/bin/otrs.Console.pl Admin::Queue::Add  --name "1st Level DACH" --group "DACH::1stlvl" --system-address-name "support@firma.de"'
sudo docker exec demootrs_otrs su - otrs -c 'perl /opt/otrs/bin/otrs.Console.pl Admin::Queue::Add  --name "1st Level BENELUX" --group "BENELUX::1stlvl" --system-address-name "support@firma.de"'
sudo docker exec demootrs_otrs su - otrs -c 'perl /opt/otrs/bin/otrs.Console.pl Admin::Queue::Add  --name "1st Level LATAM" --group "LATAM::1stlvl" --system-address-name "support@firma.de"'
sudo docker exec demootrs_otrs su - otrs -c 'perl /opt/otrs/bin/otrs.Console.pl Admin::Queue::Add  --name "1st Level NAM" --group "NAM::1stlvl" --system-address-name "support@firma.de"'
sudo docker exec demootrs_otrs su - otrs -c 'perl /opt/otrs/bin/otrs.Console.pl Admin::Queue::Add  --name "2nd Level DACH" --group "DACH::2ndlvl" --system-address-name "support@firma.de"'
sudo docker exec demootrs_otrs su - otrs -c 'perl /opt/otrs/bin/otrs.Console.pl Admin::Queue::Add  --name "2nd Level BENELUX" --group "BENELUX::2ndlvl" --system-address-name "support@firma.de"'
sudo docker exec demootrs_otrs su - otrs -c 'perl /opt/otrs/bin/otrs.Console.pl Admin::Queue::Add  --name "2nd Level LATAM" --group "LATAM::2ndlvl" --system-address-name "support@firma.de"'
sudo docker exec demootrs_otrs su - otrs -c 'perl /opt/otrs/bin/otrs.Console.pl Admin::Queue::Add  --name "2nd Level NAM" --group "NAM::2ndlvl" --system-address-name "support@firma.de"'
sudo docker exec demootrs_otrs su - otrs -c 'perl /opt/otrs/bin/otrs.Console.pl Admin::Queue::Add  --name "3rd Level DACH" --group "DACH::3rdlvl" --system-address-name "support@firma.de"'
sudo docker exec demootrs_otrs su - otrs -c 'perl /opt/otrs/bin/otrs.Console.pl Admin::Queue::Add  --name "3rd Level BENELUX" --group "BENELUX::3rdlvl" --system-address-name "support@firma.de"'
sudo docker exec demootrs_otrs su - otrs -c 'perl /opt/otrs/bin/otrs.Console.pl Admin::Queue::Add  --name "3rd Level LATAM" --group "LATAM::3rdlvl" --system-address-name "support@firma.de"'
sudo docker exec demootrs_otrs su - otrs -c 'perl /opt/otrs/bin/otrs.Console.pl Admin::Queue::Add  --name "3rd Level NAM" --group "NAM::3rdlvl" --system-address-name "support@firma.de"'
sudo docker exec demootrs_otrs su - otrs -c 'perl /opt/otrs/bin/otrs.Console.pl Admin::Queue::Add --name "1st Level EUROPE" --group "EUROPE::1stlvl" --system-address-name "support@firma.de"'
sudo docker exec demootrs_otrs su - otrs -c 'perl /opt/otrs/bin/otrs.Console.pl Admin::Queue::Add --name "1st Level AMERICA" --group "AMERICA::1stlvl" --system-address-name "support@firma.de"'
sudo docker exec demootrs_otrs su - otrs -c 'perl /opt/otrs/bin/otrs.Console.pl Admin::Queue::Add --name "2nd Level EUROPE" --group "EUROPE::2ndlvl" --system-address-name "support@firma.de"'
sudo docker exec demootrs_otrs su - otrs -c 'perl /opt/otrs/bin/otrs.Console.pl Admin::Queue::Add --name "2nd Level AMERICA" --group "AMERICA::2ndlvl" --system-address-name "support@firma.de"'
sudo docker exec demootrs_otrs su - otrs -c 'perl /opt/otrs/bin/otrs.Console.pl Admin::Queue::Add --name "3rd Level EUROPE" --group "EUROPE::3rdlvl" --system-address-name "support@firma.de"'
sudo docker exec demootrs_otrs su - otrs -c 'perl /opt/otrs/bin/otrs.Console.pl Admin::Queue::Add --name "3rd Level AMERICA" --group "AMERICA::3rdlvl" --system-address-name "support@firma.de"'
sudo docker exec demootrs_otrs su - otrs -c 'perl /opt/otrs/bin/otrs.Console.pl Admin::Queue::Add  --name "1st Level WORLDWIDE" --group "WORLDWIDE::1stlvl" --system-address-name "support@firma.de"'
sudo docker exec demootrs_otrs su - otrs -c 'perl /opt/otrs/bin/otrs.Console.pl Admin::Queue::Add  --name "2nd Level WORLDWIDE" --group "WORLDWIDE::2ndlvl" --system-address-name "support@firma.de"'
sudo docker exec demootrs_otrs su - otrs -c 'perl /opt/otrs/bin/otrs.Console.pl Admin::Queue::Add  --name "3rd Level WORLDWIDE" --group "WORLDWIDE::3rdlvl" --system-address-name "support@firma.de"'

#add agents
sudo docker exec demootrs_otrs  su - otrs -c 'perl /opt/otrs/bin/otrs.Console.pl Admin::User::Add --user-name "agent-dach@firma.de" --first-name Agent --last-name DACH --email-address "agent-dach@firma.de" --password "otrs"'
sudo docker exec demootrs_otrs  su - otrs -c 'perl /opt/otrs/bin/otrs.Console.pl Admin::User::Add --user-name "agent-benelux@firma.de" --first-name Agent --last-name BENELUX --email-address "agent-benelux@firma.de" --password "otrs"'
sudo docker exec demootrs_otrs  su - otrs -c 'perl /opt/otrs/bin/otrs.Console.pl Admin::User::Add --user-name "agent-latam@firma.de" --first-name Agent --last-name LATAM --email-address "agent-latam@firma.de" --password "otrs"'
sudo docker exec demootrs_otrs  su - otrs -c 'perl /opt/otrs/bin/otrs.Console.pl Admin::User::Add --user-name "agent-nam@firma.de" --first-name Agent --last-name NAM --email-address "agent-nam@firma.de" --password "otrs"'
sudo docker exec demootrs_otrs  su - otrs -c 'perl /opt/otrs/bin/otrs.Console.pl Admin::User::Add --user-name "agent-europe@firma.de" --first-name Agent --last-name EUROPE --email-address "agent-europe@firma.de" --password "otrs"'
sudo docker exec demootrs_otrs  su - otrs -c 'perl /opt/otrs/bin/otrs.Console.pl Admin::User::Add --user-name "agent-america@firma.de" --first-name Agent --last-name AMERICA --email-address "agent-america@firma.de" --password "otrs"'
sudo docker exec demootrs_otrs  su - otrs -c 'perl /opt/otrs/bin/otrs.Console.pl Admin::User::Add --user-name "agent-worldwide@firma.de" --first-name Agent --last-name WORLDWIDE --email-address "agent-worldwide@firma.de" --password "otrs"'
#add 1stlvl agents
sudo docker exec demootrs_otrs  su - otrs -c 'perl /opt/otrs/bin/otrs.Console.pl Admin::User::Add --user-name "agent-1stlvl-dach@firma.de" --first-name Agent --last-name DACH --email-address "agent-1stlvl-dach@firma.de" --password "otrs"'
sudo docker exec demootrs_otrs  su - otrs -c 'perl /opt/otrs/bin/otrs.Console.pl Admin::User::Add --user-name "agent-1stlvl-benelux@firma.de" --first-name Agent --last-name BENELUX --email-address "agent-1stlvl-benelux@firma.de" --password "otrs"'
sudo docker exec demootrs_otrs  su - otrs -c 'perl /opt/otrs/bin/otrs.Console.pl Admin::User::Add --user-name "agent-1stlvl-latam@firma.de" --first-name Agent --last-name LATAM --email-address "agent-1stlvl-latam@firma.de" --password "otrs"'
sudo docker exec demootrs_otrs  su - otrs -c 'perl /opt/otrs/bin/otrs.Console.pl Admin::User::Add --user-name "agent-1stlvl-nam@firma.de" --first-name Agent --last-name NAM --email-address "agent-1stlvl-nam@firma.de" --password "otrs"'
sudo docker exec demootrs_otrs  su - otrs -c 'perl /opt/otrs/bin/otrs.Console.pl Admin::User::Add --user-name "agent-1stlvl-europe@firma.de" --first-name Agent --last-name EUROPE --email-address "agent-1stlvl-europe@firma.de" --password "otrs"'
sudo docker exec demootrs_otrs  su - otrs -c 'perl /opt/otrs/bin/otrs.Console.pl Admin::User::Add --user-name "agent-1stlvl-america@firma.de" --first-name Agent --last-name AMERICA --email-address "agent-1stlvl-america@firma.de" --password "otrs"'
sudo docker exec demootrs_otrs  su - otrs -c 'perl /opt/otrs/bin/otrs.Console.pl Admin::User::Add --user-name "agent-1stlvl-worldwide@firma.de" --first-name Agent --last-name WORLDWIDE --email-address "agent-1stlvl-worldwide@firma.de" --password "otrs"'
#add 2ndlvl agents
sudo docker exec demootrs_otrs  su - otrs -c 'perl /opt/otrs/bin/otrs.Console.pl Admin::User::Add --user-name "agent-2ndlvl-dach@firma.de" --first-name Agent --last-name DACH --email-address "agent-2ndlvl-dach@firma.de" --password "otrs"'
sudo docker exec demootrs_otrs  su - otrs -c 'perl /opt/otrs/bin/otrs.Console.pl Admin::User::Add --user-name "agent-2ndlvl-benelux@firma.de" --first-name Agent --last-name BENELUX --email-address "agent-2ndlvl-benelux@firma.de" --password "otrs"'
sudo docker exec demootrs_otrs  su - otrs -c 'perl /opt/otrs/bin/otrs.Console.pl Admin::User::Add --user-name "agent-2ndlvl-latam@firma.de" --first-name Agent --last-name LATAM --email-address "agent-2ndlvl-latam@firma.de" --password "otrs"'
sudo docker exec demootrs_otrs  su - otrs -c 'perl /opt/otrs/bin/otrs.Console.pl Admin::User::Add --user-name "agent-2ndlvl-nam@firma.de" --first-name Agent --last-name NAM --email-address "agent-2ndlvl-nam@firma.de" --password "otrs"'
sudo docker exec demootrs_otrs  su - otrs -c 'perl /opt/otrs/bin/otrs.Console.pl Admin::User::Add --user-name "agent-2ndlvl-europe@firma.de" --first-name Agent --last-name EUROPE --email-address "agent-2ndlvl-europe@firma.de" --password "otrs"'
sudo docker exec demootrs_otrs  su - otrs -c 'perl /opt/otrs/bin/otrs.Console.pl Admin::User::Add --user-name "agent-2ndlvl-america@firma.de" --first-name Agent --last-name AMERICA --email-address "agent-2ndlvl-america@firma.de" --password "otrs"'
sudo docker exec demootrs_otrs  su - otrs -c 'perl /opt/otrs/bin/otrs.Console.pl Admin::User::Add --user-name "agent-2ndlvl-worldwide@firma.de" --first-name Agent --last-name WORLDWIDE --email-address "agent-2ndlvl-worldwide@firma.de" --password "otrs"'
#add 3rdlvl agents
sudo docker exec demootrs_otrs  su - otrs -c 'perl /opt/otrs/bin/otrs.Console.pl Admin::User::Add --user-name "agent-3rdlvl-dach@firma.de" --first-name Agent --last-name DACH --email-address "agent-3rdlvl-dach@firma.de" --password "otrs"'
sudo docker exec demootrs_otrs  su - otrs -c 'perl /opt/otrs/bin/otrs.Console.pl Admin::User::Add --user-name "agent-3rdlvl-benelux@firma.de" --first-name Agent --last-name BENELUX --email-address "agent-3rdlvl-benelux@firma.de" --password "otrs"'
sudo docker exec demootrs_otrs  su - otrs -c 'perl /opt/otrs/bin/otrs.Console.pl Admin::User::Add --user-name "agent-3rdlvl-latam@firma.de" --first-name Agent --last-name LATAM --email-address "agent-3rdlvl-latam@firma.de" --password "otrs"'
sudo docker exec demootrs_otrs  su - otrs -c 'perl /opt/otrs/bin/otrs.Console.pl Admin::User::Add --user-name "agent-3rdlvl-nam@firma.de" --first-name Agent --last-name NAM --email-address "agent-3rdlvl-nam@firma.de" --password "otrs"'
sudo docker exec demootrs_otrs  su - otrs -c 'perl /opt/otrs/bin/otrs.Console.pl Admin::User::Add --user-name "agent-3rdlvl-europe@firma.de" --first-name Agent --last-name EUROPE --email-address "agent-3rdlvl-europe@firma.de" --password "otrs"'
sudo docker exec demootrs_otrs  su - otrs -c 'perl /opt/otrs/bin/otrs.Console.pl Admin::User::Add --user-name "agent-3rdlvl-america@firma.de" --first-name Agent --last-name AMERICA --email-address "agent-3rdlvl-america@firma.de" --password "otrs"'
sudo docker exec demootrs_otrs  su - otrs -c 'perl /opt/otrs/bin/otrs.Console.pl Admin::User::Add --user-name "agent-3rdlvl-worldwide@firma.de" --first-name Agent --last-name WORLDWIDE --email-address "agent-3rdlvl-worldwide@firma.de" --password "otrs"'


#link agents-role
sudo docker exec demootrs_otrs su - otrs -c '/opt/otrs/bin/otrs.Console.pl Admin::Role::UserLink --user-name "agent-dach@firma.de" --role-name "Agent::1st-Lvl::DACH"'
sudo docker exec demootrs_otrs su - otrs -c '/opt/otrs/bin/otrs.Console.pl Admin::Role::UserLink --user-name "agent-benelux@firma.de" --role-name "Agent::1st-Lvl::BENELUX"'
sudo docker exec demootrs_otrs su - otrs -c '/opt/otrs/bin/otrs.Console.pl Admin::Role::UserLink --user-name "agent-latam@firma.de" --role-name "Agent::1st-Lvl::LATAM"'
sudo docker exec demootrs_otrs su - otrs -c '/opt/otrs/bin/otrs.Console.pl Admin::Role::UserLink --user-name "agent-nam@firma.de" --role-name "Agent::1st-Lvl::NAM"'
sudo docker exec demootrs_otrs su - otrs -c '/opt/otrs/bin/otrs.Console.pl Admin::Role::UserLink --user-name "agent-dach@firma.de" --role-name "Agent::2nd-Lvl::DACH"'
sudo docker exec demootrs_otrs su - otrs -c '/opt/otrs/bin/otrs.Console.pl Admin::Role::UserLink --user-name "agent-benelux@firma.de" --role-name "Agent::2nd-Lvl::BENELUX"'
sudo docker exec demootrs_otrs su - otrs -c '/opt/otrs/bin/otrs.Console.pl Admin::Role::UserLink --user-name "agent-latam@firma.de" --role-name "Agent::2nd-Lvl::LATAM"'
sudo docker exec demootrs_otrs su - otrs -c '/opt/otrs/bin/otrs.Console.pl Admin::Role::UserLink --user-name "agent-nam@firma.de" --role-name "Agent::2nd-Lvl::NAM"'
sudo docker exec demootrs_otrs su - otrs -c '/opt/otrs/bin/otrs.Console.pl Admin::Role::UserLink --user-name "agent-dach@firma.de" --role-name "Agent::3rd-Lvl::DACH"'
sudo docker exec demootrs_otrs su - otrs -c '/opt/otrs/bin/otrs.Console.pl Admin::Role::UserLink --user-name "agent-benelux@firma.de" --role-name "Agent::3rd-Lvl::BENELUX"'
sudo docker exec demootrs_otrs su - otrs -c '/opt/otrs/bin/otrs.Console.pl Admin::Role::UserLink --user-name "agent-latam@firma.de" --role-name "Agent::3rd-Lvl::LATAM"'
sudo docker exec demootrs_otrs su - otrs -c '/opt/otrs/bin/otrs.Console.pl Admin::Role::UserLink --user-name "agent-nam@firma.de" --role-name "Agent::3rd-Lvl::NAM"'

sudo docker exec demootrs_otrs su - otrs -c '/opt/otrs/bin/otrs.Console.pl Admin::Role::UserLink --user-name "agent-1stlvl-dach@firma.de" --role-name "Agent::1st-Lvl::DACH"'
sudo docker exec demootrs_otrs su - otrs -c '/opt/otrs/bin/otrs.Console.pl Admin::Role::UserLink --user-name "agent-1stlvl-benelux@firma.de" --role-name "Agent::1st-Lvl::BENELUX"'
sudo docker exec demootrs_otrs su - otrs -c '/opt/otrs/bin/otrs.Console.pl Admin::Role::UserLink --user-name "agent-1stlvl-latam@firma.de" --role-name "Agent::1st-Lvl::LATAM"'
sudo docker exec demootrs_otrs su - otrs -c '/opt/otrs/bin/otrs.Console.pl Admin::Role::UserLink --user-name "agent-1stlvl-nam@firma.de" --role-name "Agent::1st-Lvl::NAM"'
sudo docker exec demootrs_otrs su - otrs -c '/opt/otrs/bin/otrs.Console.pl Admin::Role::UserLink --user-name "agent-2ndlvl-dach@firma.de" --role-name "Agent::2nd-Lvl::DACH"'
sudo docker exec demootrs_otrs su - otrs -c '/opt/otrs/bin/otrs.Console.pl Admin::Role::UserLink --user-name "agent-2ndlvl-benelux@firma.de" --role-name "Agent::2nd-Lvl::BENELUX"'
sudo docker exec demootrs_otrs su - otrs -c '/opt/otrs/bin/otrs.Console.pl Admin::Role::UserLink --user-name "agent-2ndlvl-latam@firma.de" --role-name "Agent::2nd-Lvl::LATAM"'
sudo docker exec demootrs_otrs su - otrs -c '/opt/otrs/bin/otrs.Console.pl Admin::Role::UserLink --user-name "agent-2ndlvl-nam@firma.de" --role-name "Agent::2nd-Lvl::NAM"'
sudo docker exec demootrs_otrs su - otrs -c '/opt/otrs/bin/otrs.Console.pl Admin::Role::UserLink --user-name "agent-3rdlvl-dach@firma.de" --role-name "Agent::3rd-Lvl::DACH"'
sudo docker exec demootrs_otrs su - otrs -c '/opt/otrs/bin/otrs.Console.pl Admin::Role::UserLink --user-name "agent-3rdlvl-benelux@firma.de" --role-name "Agent::3rd-Lvl::BENELUX"'
sudo docker exec demootrs_otrs su - otrs -c '/opt/otrs/bin/otrs.Console.pl Admin::Role::UserLink --user-name "agent-3rdlvl-latam@firma.de" --role-name "Agent::3rd-Lvl::LATAM"'
sudo docker exec demootrs_otrs su - otrs -c '/opt/otrs/bin/otrs.Console.pl Admin::Role::UserLink --user-name "agent-3rdlvl-nam@firma.de" --role-name "Agent::3rd-Lvl::NAM"'


sudo docker exec demootrs_otrs su - otrs -c '/opt/otrs/bin/otrs.Console.pl Admin::Role::UserLink --user-name "agent-europe@firma.de" --role-name "Agent::1st-Lvl::EUROPE"'
sudo docker exec demootrs_otrs su - otrs -c '/opt/otrs/bin/otrs.Console.pl Admin::Role::UserLink --user-name "agent-america@firma.de" --role-name "Agent::1st-Lvl::AMERICA"'
sudo docker exec demootrs_otrs su - otrs -c '/opt/otrs/bin/otrs.Console.pl Admin::Role::UserLink --user-name "agent-europe@firma.de" --role-name "Agent::2nd-Lvl::EUROPE"'
sudo docker exec demootrs_otrs su - otrs -c '/opt/otrs/bin/otrs.Console.pl Admin::Role::UserLink --user-name "agent-america@firma.de" --role-name "Agent::2nd-Lvl::AMERICA"'
sudo docker exec demootrs_otrs su - otrs -c '/opt/otrs/bin/otrs.Console.pl Admin::Role::UserLink --user-name "agent-europe@firma.de" --role-name "Agent::3rd-Lvl::EUROPE"'
sudo docker exec demootrs_otrs su - otrs -c '/opt/otrs/bin/otrs.Console.pl Admin::Role::UserLink --user-name "agent-america@firma.de" --role-name "Agent::3rd-Lvl::AMERICA"'

sudo docker exec demootrs_otrs su - otrs -c '/opt/otrs/bin/otrs.Console.pl Admin::Role::UserLink --user-name "agent-1stlvl-europe@firma.de" --role-name "Agent::1st-Lvl::EUROPE"'
sudo docker exec demootrs_otrs su - otrs -c '/opt/otrs/bin/otrs.Console.pl Admin::Role::UserLink --user-name "agent-1stlvl-america@firma.de" --role-name "Agent::1st-Lvl::AMERICA"'
sudo docker exec demootrs_otrs su - otrs -c '/opt/otrs/bin/otrs.Console.pl Admin::Role::UserLink --user-name "agent-2ndlvl-europe@firma.de" --role-name "Agent::2nd-Lvl::EUROPE"'
sudo docker exec demootrs_otrs su - otrs -c '/opt/otrs/bin/otrs.Console.pl Admin::Role::UserLink --user-name "agent-2ndlvl-america@firma.de" --role-name "Agent::2nd-Lvl::AMERICA"'
sudo docker exec demootrs_otrs su - otrs -c '/opt/otrs/bin/otrs.Console.pl Admin::Role::UserLink --user-name "agent-3rdlvl-europe@firma.de" --role-name "Agent::3rd-Lvl::EUROPE"'
sudo docker exec demootrs_otrs su - otrs -c '/opt/otrs/bin/otrs.Console.pl Admin::Role::UserLink --user-name "agent-3rdlvl-america@firma.de" --role-name "Agent::3rd-Lvl::AMERICA"'

sudo docker exec demootrs_otrs su - otrs -c '/opt/otrs/bin/otrs.Console.pl Admin::Role::UserLink --user-name "agent-1stlvl-worldwide@firma.de" --role-name "Agent::1st-Lvl::WORLDWIDE"'
sudo docker exec demootrs_otrs su - otrs -c '/opt/otrs/bin/otrs.Console.pl Admin::Role::UserLink --user-name "agent-2ndlvl-worldwide@firma.de" --role-name "Agent::2nd-Lvl::WORLDWIDE"'
sudo docker exec demootrs_otrs su - otrs -c '/opt/otrs/bin/otrs.Console.pl Admin::Role::UserLink --user-name "agent-3rdlvl-worldwide@firma.de" --role-name "Agent::3rd-Lvl::WORLDWIDE"'

sudo docker exec demootrs_otrs su - otrs -c '/opt/otrs/bin/otrs.Console.pl Admin::Role::UserLink --user-name "agent@firma.de" --role-name "Agent::1st-Lvl::WORLDWIDE"'
sudo docker exec demootrs_otrs su - otrs -c '/opt/otrs/bin/otrs.Console.pl Admin::Role::UserLink --user-name "agent@firma.de" --role-name "Agent::2nd-Lvl::WORLDWIDE"'
sudo docker exec demootrs_otrs su - otrs -c '/opt/otrs/bin/otrs.Console.pl Admin::Role::UserLink --user-name "admin" --role-name "Agent::3rd-Lvl::WORLDWIDE"'
sudo docker exec demootrs_otrs su - otrs -c '/opt/otrs/bin/otrs.Console.pl Admin::Role::UserLink --user-name "admin" --role-name "Agent::1st-Lvl::DACH"'
sudo docker exec demootrs_otrs su - otrs -c '/opt/otrs/bin/otrs.Console.pl Admin::Role::UserLink --user-name "admin" --role-name "Agent::1st-Lvl::BENELUX"'
sudo docker exec demootrs_otrs su - otrs -c '/opt/otrs/bin/otrs.Console.pl Admin::Role::UserLink --user-name "admin" --role-name "Agent::1st-Lvl::LATAM"'
sudo docker exec demootrs_otrs su - otrs -c '/opt/otrs/bin/otrs.Console.pl Admin::Role::UserLink --user-name "admin" --role-name "Agent::1st-Lvl::NAM"'
sudo docker exec demootrs_otrs su - otrs -c '/opt/otrs/bin/otrs.Console.pl Admin::Role::UserLink --user-name "admin" --role-name "Agent::2nd-Lvl::DACH"'
sudo docker exec demootrs_otrs su - otrs -c '/opt/otrs/bin/otrs.Console.pl Admin::Role::UserLink --user-name "admin" --role-name "Agent::2nd-Lvl::BENELUX"'
sudo docker exec demootrs_otrs su - otrs -c '/opt/otrs/bin/otrs.Console.pl Admin::Role::UserLink --user-name "admin" --role-name "Agent::2nd-Lvl::LATAM"'
sudo docker exec demootrs_otrs su - otrs -c '/opt/otrs/bin/otrs.Console.pl Admin::Role::UserLink --user-name "admin" --role-name "Agent::2nd-Lvl::NAM"'
sudo docker exec demootrs_otrs su - otrs -c '/opt/otrs/bin/otrs.Console.pl Admin::Role::UserLink --user-name "admin" --role-name "Agent::3rd-Lvl::DACH"'
sudo docker exec demootrs_otrs su - otrs -c '/opt/otrs/bin/otrs.Console.pl Admin::Role::UserLink --user-name "admin" --role-name "Agent::3rd-Lvl::BENELUX"'
sudo docker exec demootrs_otrs su - otrs -c '/opt/otrs/bin/otrs.Console.pl Admin::Role::UserLink --user-name "admin" --role-name "Agent::3rd-Lvl::LATAM"'
sudo docker exec demootrs_otrs su - otrs -c '/opt/otrs/bin/otrs.Console.pl Admin::Role::UserLink --user-name "admin" --role-name "Agent::3rd-Lvl::NAM"'
sudo docker exec demootrs_otrs su - otrs -c '/opt/otrs/bin/otrs.Console.pl Admin::Role::UserLink --user-name "admin" --role-name "Agent::1st-Lvl::EUROPE"'
sudo docker exec demootrs_otrs su - otrs -c '/opt/otrs/bin/otrs.Console.pl Admin::Role::UserLink --user-name "admin" --role-name "Agent::1st-Lvl::AMERICA"'
sudo docker exec demootrs_otrs su - otrs -c '/opt/otrs/bin/otrs.Console.pl Admin::Role::UserLink --user-name "admin" --role-name "Agent::2nd-Lvl::EUROPE"'
sudo docker exec demootrs_otrs su - otrs -c '/opt/otrs/bin/otrs.Console.pl Admin::Role::UserLink --user-name "admin" --role-name "Agent::2nd-Lvl::AMERICA"'
sudo docker exec demootrs_otrs su - otrs -c '/opt/otrs/bin/otrs.Console.pl Admin::Role::UserLink --user-name "admin" --role-name "Agent::3rd-Lvl::EUROPE"'
sudo docker exec demootrs_otrs su - otrs -c '/opt/otrs/bin/otrs.Console.pl Admin::Role::UserLink --user-name "admin" --role-name "Agent::3rd-Lvl::AMERICA"'


#add dynamic fields
sudo docker exec demootrs_otrs  su - otrs -c 'perl /opt/otrs/bin/otrs.Console.pl Custom::Admin::DynamicField::Add --name Market --label "Market" --type Dropdown --file Market.yml --path "/opt/otrs/Kernel/demo_otrs/s4/dynamicfield"'

#update autoresponse
sudo docker exec demootrs_otrs su - otrs -c 'perl /opt/otrs/bin/otrs.Console.pl Custom::Admin::AutoResponse::Update --name "default reply (after new ticket has been created)" --subject "Re: <OTRS_TICKET_Title> - Ticket received" --response "Dear &lt;OTRS_CUSTOMER_REALNAME&gt;,<br/><br/>thank you very much for your message.&nbsp;<br/>We have received your request. Your case number is <a href=&lt;OTRS_CONFIG_HttpType&gt;://&lt;OTRS_CONFIG_FQDN&gt;/&lt;OTRS_CONFIG_ScriptAlias&gt;customer.pl?Action=CustomerTicketZoom;TicketNumber=&lt;OTRS_TICKET_TicketNumber&gt;>&lt;OTRS_TICKET_TicketNumber&gt;</a>.<br />We will contact you when your request is complete or we need any more information.<br/><br/>Kind regards,<br/>Support &lt;OTRS_TICKET_DynamicField_Market&gt;<br/>Mayer GmbH" --system-address-name  "support@firma.de" --ID "1" --type "1"'
#update autoresponse
sudo docker exec demootrs_otrs su - otrs -c 'perl /opt/otrs/bin/otrs.Console.pl Custom::Admin::AutoResponse::Update --name "default reject" --subject "Re: <OTRS_TICKET_Title> - Ticket received" --response "Dear &lt;OTRS_CUSTOMER_REALNAME&gt;,<br/><br/>thank you very much for your message.&nbsp;<br/>Unfortunately the mail address you have written to is invalid and so your email will not be answered.<br />Please contact your regional customer support.<br/><br/>Kind regards,<br/>Support &lt;OTRS_TICKET_DynamicField_Market&gt;<br/>Mayer GmbH" --system-address-name  "support@firma.de" --type "2" --ID "2"'
#link autoresponses
sudo docker exec   demootrs_otrs  su - otrs -c 'perl /opt/otrs/bin/otrs.Console.pl Custom::Admin::AutoResponse::Link --responseID "1 2 3 4" --queue-name "1st Level DACH"'
sudo docker exec   demootrs_otrs  su - otrs -c 'perl /opt/otrs/bin/otrs.Console.pl Custom::Admin::AutoResponse::Link --responseID "1 2 3 4" --queue-name "1st Level BENELUX"'
sudo docker exec   demootrs_otrs  su - otrs -c 'perl /opt/otrs/bin/otrs.Console.pl Custom::Admin::AutoResponse::Link --responseID "1 2 3 4" --queue-name "1st Level NAM"'
sudo docker exec   demootrs_otrs  su - otrs -c 'perl /opt/otrs/bin/otrs.Console.pl Custom::Admin::AutoResponse::Link --responseID "1 2 3 4" --queue-name "1st Level LATAM"'
sudo docker exec   demootrs_otrs  su - otrs -c 'perl /opt/otrs/bin/otrs.Console.pl Custom::Admin::AutoResponse::Link --responseID "2" --queue-name "2nd Level EUROPE"'
sudo docker exec   demootrs_otrs  su - otrs -c 'perl /opt/otrs/bin/otrs.Console.pl Custom::Admin::AutoResponse::Link --responseID "2" --queue-name "2nd Level AMERICA"'
sudo docker exec   demootrs_otrs  su - otrs -c 'perl /opt/otrs/bin/otrs.Console.pl Custom::Admin::AutoResponse::Link --responseID "2" --queue-name "3rd Level WORLDWIDE"'

#add notifications
sudo docker exec demootrs_otrs su - otrs -c 'perl /opt/otrs/bin/otrs.Console.pl Custom::Admin::Notification::Add --file "Export_Notification_Ticket_closed.yml" --path "/opt/otrs/Kernel/demo_otrs/s4/notification"'
sudo docker exec demootrs_otrs su - otrs -c 'perl /opt/otrs/bin/otrs.Console.pl Custom::Admin::Notification::Add --file "Export_Notification_Ticket_merged.yml" --path "/opt/otrs/Kernel/demo_otrs/s4/notification"'
sudo docker exec demootrs_otrs su - otrs -c 'perl /opt/otrs/bin/otrs.Console.pl Custom::Admin::Notification::Add --file "Export_Notification_Ticket_pending_auto_close.yml" --path "/opt/otrs/Kernel/demo_otrs/s4/notification"'

#add genericagents
sudo docker exec demootrs_otrs su - otrs -c '/opt/otrs/bin/otrs.Console.pl Custom::Admin::GenericAgent::Add --name "Market<->Queue DACH" --file DACH.yml --path "/opt/otrs/Kernel/demo_otrs/s4/genericagent"'
sudo docker exec demootrs_otrs su - otrs -c '/opt/otrs/bin/otrs.Console.pl Custom::Admin::GenericAgent::Add --name "Market<->Queue BENELUX" --file BENELUX.yml --path "/opt/otrs/Kernel/demo_otrs/s4/genericagent"'
sudo docker exec demootrs_otrs su - otrs -c '/opt/otrs/bin/otrs.Console.pl Custom::Admin::GenericAgent::Add --name "Market<->Queue NAM" --file NAM.yml --path "/opt/otrs/Kernel/demo_otrs/s4/genericagent"'
sudo docker exec demootrs_otrs su - otrs -c '/opt/otrs/bin/otrs.Console.pl Custom::Admin::GenericAgent::Add --name "Market<->Queue LATAM" --file LATAM.yml --path "/opt/otrs/Kernel/demo_otrs/s4/genericagent"'
sudo docker exec demootrs_otrs su - otrs -c '/opt/otrs/bin/otrs.Console.pl Custom::Admin::GenericAgent::Add --name "Market<->Queue EUROPE" --file EUROPE.yml --path "/opt/otrs/Kernel/demo_otrs/s4/genericagent"'
sudo docker exec demootrs_otrs su - otrs -c '/opt/otrs/bin/otrs.Console.pl Custom::Admin::GenericAgent::Add --name "Market<->Queue AMERICA" --file AMERICA.yml --path "/opt/otrs/Kernel/demo_otrs/s4/genericagent"'
sudo docker exec demootrs_otrs su - otrs -c '/opt/otrs/bin/otrs.Console.pl Custom::Admin::GenericAgent::Add --name "Market<->Queue WORLDWIDE" --file WORLDWIDE.yml --path "/opt/otrs/Kernel/demo_otrs/s4/genericagent"'
sudo docker exec demootrs_otrs su - otrs -c '/opt/otrs/bin/otrs.Console.pl Custom::Admin::GenericAgent::Delete --name "Move Incidents"'
sudo docker exec demootrs_otrs su - otrs -c '/opt/otrs/bin/otrs.Console.pl Custom::Admin::GenericAgent::Delete --name "Move Service Requests"'

#add Service
sudo docker exec demootrs_otrs su - otrs -c '/opt/otrs/bin/otrs.Console.pl Admin::Service::Add --name Standard'
#Add queue
sudo docker exec demootrs_otrs  su - otrs -c 'perl /opt/otrs/bin/otrs.Console.pl Custom::Admin::SLA::Add --name Basic --services "1" --first-response-time "2" --update-time "4" --solution-time "6" --services "1"'
#Link customeruser<->service
sudo docker exec demootrs_otrs  su - otrs -c 'perl /opt/otrs/bin/otrs.Console.pl Custom::Admin::Service::Link --customeruser "admin" --service "1"'

#add acls
sudo docker exec demootrs_otrs su - otrs -c '/opt/otrs/bin/otrs.Console.pl Custom::Admin::ACL::Add --file AAM_Customer_DACH.yml --path "/opt/otrs/Kernel/demo_otrs/s4/acl"'
sudo docker exec demootrs_otrs su - otrs -c '/opt/otrs/bin/otrs.Console.pl Custom::Admin::ACL::Add --file AAM_Customer_BENELUX.yml --path "/opt/otrs/Kernel/demo_otrs/s4/acl"'
sudo docker exec demootrs_otrs su - otrs -c '/opt/otrs/bin/otrs.Console.pl Custom::Admin::ACL::Add --file AAM_Customer_NAM.yml --path "/opt/otrs/Kernel/demo_otrs/s4/acl"'
sudo docker exec demootrs_otrs su - otrs -c '/opt/otrs/bin/otrs.Console.pl Custom::Admin::ACL::Add --file AAM_Customer_LATAM.yml --path "/opt/otrs/Kernel/demo_otrs/s4/acl"'
sudo docker exec demootrs_otrs su - otrs -c '/opt/otrs/bin/otrs.Console.pl Custom::Admin::ACL::Add --file AAM_Agent_DACH.yml --path "/opt/otrs/Kernel/demo_otrs/s4/acl"'
sudo docker exec demootrs_otrs su - otrs -c '/opt/otrs/bin/otrs.Console.pl Custom::Admin::ACL::Add --file AAM_Agent_BENELUX.yml --path "/opt/otrs/Kernel/demo_otrs/s4/acl"'
sudo docker exec demootrs_otrs su - otrs -c '/opt/otrs/bin/otrs.Console.pl Custom::Admin::ACL::Add --file AAM_Agent_NAM.yml --path "/opt/otrs/Kernel/demo_otrs/s4/acl"'
sudo docker exec demootrs_otrs su - otrs -c '/opt/otrs/bin/otrs.Console.pl Custom::Admin::ACL::Add --file AAM_Agent_LATAM.yml --path "/opt/otrs/Kernel/demo_otrs/s4/acl"'
sudo docker exec demootrs_otrs su - otrs -c '/opt/otrs/bin/otrs.Console.pl Custom::Admin::ACL::Add --file AAM_Agent_EUROPE.yml --path "/opt/otrs/Kernel/demo_otrs/s4/acl"'
sudo docker exec demootrs_otrs su - otrs -c '/opt/otrs/bin/otrs.Console.pl Custom::Admin::ACL::Add --file AAM_Agent_AMERICA.yml --path "/opt/otrs/Kernel/demo_otrs/s4/acl"'
sudo docker exec demootrs_otrs su - otrs -c '/opt/otrs/bin/otrs.Console.pl Custom::Admin::ACL::Add --file AAM_Agent_WORLDWIDE.yml --path "/opt/otrs/Kernel/demo_otrs/s4/acl"'
sudo docker exec demootrs_otrs su - otrs -c '/opt/otrs/bin/otrs.Console.pl Custom::Admin::ACL::Add --file AAM_Admin_Market.yml --path "/opt/otrs/Kernel/demo_otrs/s4/acl"'
sudo docker exec demootrs_otrs su - otrs -c '/opt/otrs/bin/otrs.Console.pl Custom::Admin::ACL::Add --file AAA_Hide_all_markets.yml --path "/opt/otrs/Kernel/demo_otrs/s4/acl"'

#add generic agent
sudo docker exec demootrs_otrs su - otrs -c '/opt/otrs/bin/otrs.Console.pl Custom::Admin::GenericAgent::Add --name "load step 05" --file /s4.yml --path "/opt/otrs/Kernel/demo_otrs/s4/"'


