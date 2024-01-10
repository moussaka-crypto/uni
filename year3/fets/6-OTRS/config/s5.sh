#!/bin/bash
###add: queues, groups, escalation
#copy Config.pm
sudo docker exec demootrs_otrs cp /opt/otrs/Kernel/demo_otrs/s5/s5.pm /opt/otrs/Kernel/Config.pm
#add faq article
sudo docker exec demootrs_otrs su - otrs -c 'perl /opt/otrs/bin/otrs.Console.pl Custom::Admin::FAQ::Import "/opt/otrs/Kernel/demo_otrs/s5/s5.csv"'

#add groups
sudo docker exec demootrs_otrs  su - otrs -c 'perl /opt/otrs/bin/otrs.Console.pl Admin::Group::Add --name "digicam"'
sudo docker exec demootrs_otrs  su - otrs -c 'perl /opt/otrs/bin/otrs.Console.pl Admin::Group::Add --name "digicam::1stlvl"'
sudo docker exec demootrs_otrs  su - otrs -c 'perl /opt/otrs/bin/otrs.Console.pl Admin::Group::Add --name "digicam::2ndlvl"'
sudo docker exec demootrs_otrs  su - otrs -c 'perl /opt/otrs/bin/otrs.Console.pl Admin::Group::Add --name "digicam::3rdlvl"'
sudo docker exec demootrs_otrs  su - otrs -c 'perl /opt/otrs/bin/otrs.Console.pl Admin::Group::Add --name "digicam::PRIVATE"'
sudo docker exec demootrs_otrs  su - otrs -c 'perl /opt/otrs/bin/otrs.Console.pl Admin::Group::Add --name "digicam::BUSINESS"'
sudo docker exec demootrs_otrs  su - otrs -c 'perl /opt/otrs/bin/otrs.Console.pl Admin::Group::Add --name "medoptics"'
sudo docker exec demootrs_otrs  su - otrs -c 'perl /opt/otrs/bin/otrs.Console.pl Admin::Group::Add --name "medoptics::1stlvl"'
sudo docker exec demootrs_otrs  su - otrs -c 'perl /opt/otrs/bin/otrs.Console.pl Admin::Group::Add --name "medoptics::2ndlvl"'
sudo docker exec demootrs_otrs  su - otrs -c 'perl /opt/otrs/bin/otrs.Console.pl Admin::Group::Add --name "medoptics::3rdlvl"'
sudo docker exec demootrs_otrs  su - otrs -c 'perl /opt/otrs/bin/otrs.Console.pl Admin::Group::Add --name "intelliEyes"'
sudo docker exec demootrs_otrs  su - otrs -c 'perl /opt/otrs/bin/otrs.Console.pl Admin::Group::Add --name "intelliEyes::DACH"'
sudo docker exec demootrs_otrs  su - otrs -c 'perl /opt/otrs/bin/otrs.Console.pl Admin::Group::Add --name "intelliEyes::CHINA"'
sudo docker exec demootrs_otrs  su - otrs -c 'perl /opt/otrs/bin/otrs.Console.pl Admin::Group::Add --name "intelliEyes::1stlvl"'
sudo docker exec demootrs_otrs  su - otrs -c 'perl /opt/otrs/bin/otrs.Console.pl Admin::Group::Add --name "intelliEyes::2ndlvl"'
sudo docker exec demootrs_otrs  su - otrs -c 'perl /opt/otrs/bin/otrs.Console.pl Admin::Group::Add --name "intelliEyes::3rdlvl"'

#add roles
sudo docker exec demootrs_otrs  su - otrs -c 'perl /opt/otrs/bin/otrs.Console.pl Admin::Role::Add --name "IntelliEyes::General"'
sudo docker exec demootrs_otrs  su - otrs -c 'perl /opt/otrs/bin/otrs.Console.pl Admin::Role::Add --name "IntelliEyes::1st-Lvl::WORLDWIDE"'
sudo docker exec demootrs_otrs  su - otrs -c 'perl /opt/otrs/bin/otrs.Console.pl Admin::Role::Add --name "IntelliEyes::1st-Lvl::DACH"'
sudo docker exec demootrs_otrs  su - otrs -c 'perl /opt/otrs/bin/otrs.Console.pl Admin::Role::Add --name "IntelliEyes::1st-Lvl::CHINA"'
sudo docker exec demootrs_otrs  su - otrs -c 'perl /opt/otrs/bin/otrs.Console.pl Admin::Role::Add --name "IntelliEyes::2nd-Lvl::WORLDWIDE"'
sudo docker exec demootrs_otrs  su - otrs -c 'perl /opt/otrs/bin/otrs.Console.pl Admin::Role::Add --name "IntelliEyes::2nd-Lvl::DACH"'
sudo docker exec demootrs_otrs  su - otrs -c 'perl /opt/otrs/bin/otrs.Console.pl Admin::Role::Add --name "IntelliEyes::2nd-Lvl::CHINA"'
sudo docker exec demootrs_otrs  su - otrs -c 'perl /opt/otrs/bin/otrs.Console.pl Admin::Role::Add --name "IntelliEyes::3rd-Lvl::WORLDWIDE"'
sudo docker exec demootrs_otrs  su - otrs -c 'perl /opt/otrs/bin/otrs.Console.pl Admin::Role::Add --name "IntelliEyes::3rd-Lvl::DACH"'
sudo docker exec demootrs_otrs  su - otrs -c 'perl /opt/otrs/bin/otrs.Console.pl Admin::Role::Add --name "IntelliEyes::3rd-Lvl::CHINA"'
sudo docker exec demootrs_otrs  su - otrs -c 'perl /opt/otrs/bin/otrs.Console.pl Admin::Role::Add --name "Digicam::General"'
sudo docker exec demootrs_otrs  su - otrs -c 'perl /opt/otrs/bin/otrs.Console.pl Admin::Role::Add --name "Digicam::1st-Lvl"'
sudo docker exec demootrs_otrs  su - otrs -c 'perl /opt/otrs/bin/otrs.Console.pl Admin::Role::Add --name "Digicam::2nd-Lvl"'
sudo docker exec demootrs_otrs  su - otrs -c 'perl /opt/otrs/bin/otrs.Console.pl Admin::Role::Add --name "Digicam::3rd-Lvl"'
sudo docker exec demootrs_otrs  su - otrs -c 'perl /opt/otrs/bin/otrs.Console.pl Admin::Role::Add --name "Digicam::1st-Lvl::PRIVATE"'
sudo docker exec demootrs_otrs  su - otrs -c 'perl /opt/otrs/bin/otrs.Console.pl Admin::Role::Add --name "Digicam::2nd-Lvl::PRIVATE"'
sudo docker exec demootrs_otrs  su - otrs -c 'perl /opt/otrs/bin/otrs.Console.pl Admin::Role::Add --name "Digicam::3rd-Lvl::PRIVATE"'
sudo docker exec demootrs_otrs  su - otrs -c 'perl /opt/otrs/bin/otrs.Console.pl Admin::Role::Add --name "Digicam::1st-Lvl::BUSINESS"'
sudo docker exec demootrs_otrs  su - otrs -c 'perl /opt/otrs/bin/otrs.Console.pl Admin::Role::Add --name "Digicam::2nd-Lvl::BUSINESS"'
sudo docker exec demootrs_otrs  su - otrs -c 'perl /opt/otrs/bin/otrs.Console.pl Admin::Role::Add --name "Digicam::3rd-Lvl::BUSINESS"'
sudo docker exec demootrs_otrs  su - otrs -c 'perl /opt/otrs/bin/otrs.Console.pl Admin::Role::Add --name "Medoptics::General"'
sudo docker exec demootrs_otrs  su - otrs -c 'perl /opt/otrs/bin/otrs.Console.pl Admin::Role::Add --name "Medoptics::1st-Lvl"'
sudo docker exec demootrs_otrs  su - otrs -c 'perl /opt/otrs/bin/otrs.Console.pl Admin::Role::Add --name "Medoptics::2nd-Lvl"'
sudo docker exec demootrs_otrs  su - otrs -c 'perl /opt/otrs/bin/otrs.Console.pl Admin::Role::Add --name "Medoptics::3rd-Lvl"'
  

#link group-role
sudo docker exec demootrs_otrs su - otrs -c '/opt/otrs/bin/otrs.Console.pl Admin::Group::RoleLink --group-name "digicam" --role-name "Digicam::1st-Lvl" --permission "rw"'
sudo docker exec demootrs_otrs su - otrs -c '/opt/otrs/bin/otrs.Console.pl Admin::Group::RoleLink --group-name "digicam::1stlvl" --role-name "Digicam::1st-Lvl" --permission "rw"'
sudo docker exec demootrs_otrs su - otrs -c '/opt/otrs/bin/otrs.Console.pl Admin::Group::RoleLink --group-name "digicam::PRIVATE" --role-name "Digicam::1st-Lvl" --permission "rw"'
sudo docker exec demootrs_otrs su - otrs -c '/opt/otrs/bin/otrs.Console.pl Admin::Group::RoleLink --group-name "digicam::BUSINESS" --role-name "Digicam::1st-Lvl" --permission "rw"'
sudo docker exec demootrs_otrs su - otrs -c '/opt/otrs/bin/otrs.Console.pl Admin::Group::RoleLink --group-name "digicam::2ndlvl" --role-name "Digicam::1st-Lvl" --permission "move_into"'
sudo docker exec demootrs_otrs su - otrs -c '/opt/otrs/bin/otrs.Console.pl Admin::Group::RoleLink --group-name "digicam::3rdlvl" --role-name "Digicam::1st-Lvl" --permission "ro"'
sudo docker exec demootrs_otrs su - otrs -c '/opt/otrs/bin/otrs.Console.pl Admin::Group::RoleLink --group-name "digicam" --role-name "Digicam::1st-Lvl::PRIVATE" --permission "rw"'
sudo docker exec demootrs_otrs su - otrs -c '/opt/otrs/bin/otrs.Console.pl Admin::Group::RoleLink --group-name "digicam::1stlvl" --role-name "Digicam::1st-Lvl::PRIVATE" --permission "rw"'
sudo docker exec demootrs_otrs su - otrs -c '/opt/otrs/bin/otrs.Console.pl Admin::Group::RoleLink --group-name "digicam::PRIVATE" --role-name "Digicam::1st-Lvl::PRIVATE" --permission "rw"'
sudo docker exec demootrs_otrs su - otrs -c '/opt/otrs/bin/otrs.Console.pl Admin::Group::RoleLink --group-name "digicam::2ndlvl" --role-name "Digicam::1st-Lvl::PRIVATE" --permission "move_into"'
sudo docker exec demootrs_otrs su - otrs -c '/opt/otrs/bin/otrs.Console.pl Admin::Group::RoleLink --group-name "digicam::3rdlvl" --role-name "Digicam::1st-Lvl::PRIVATE" --permission "ro"'
sudo docker exec demootrs_otrs su - otrs -c '/opt/otrs/bin/otrs.Console.pl Admin::Group::RoleLink --group-name "digicam" --role-name "Digicam::1st-Lvl::BUSINESS" --permission "rw"'
sudo docker exec demootrs_otrs su - otrs -c '/opt/otrs/bin/otrs.Console.pl Admin::Group::RoleLink --group-name "digicam::1stlvl" --role-name "Digicam::1st-Lvl::BUSINESS" --permission "rw"'
sudo docker exec demootrs_otrs su - otrs -c '/opt/otrs/bin/otrs.Console.pl Admin::Group::RoleLink --group-name "digicam::BUSINESS" --role-name "Digicam::1st-Lvl::BUSINESS" --permission "rw"'
sudo docker exec demootrs_otrs su - otrs -c '/opt/otrs/bin/otrs.Console.pl Admin::Group::RoleLink --group-name "digicam::2ndlvl" --role-name "Digicam::1st-Lvl::BUSINESS" --permission "move_into"'
sudo docker exec demootrs_otrs su - otrs -c '/opt/otrs/bin/otrs.Console.pl Admin::Group::RoleLink --group-name "digicam::3rdlvl" --role-name "Digicam::1st-Lvl::BUSINESS" --permission "ro"'
sudo docker exec demootrs_otrs su - otrs -c '/opt/otrs/bin/otrs.Console.pl Admin::Group::RoleLink --group-name "digicam" --role-name "Digicam::2nd-Lvl" --permission "rw"'
sudo docker exec demootrs_otrs su - otrs -c '/opt/otrs/bin/otrs.Console.pl Admin::Group::RoleLink --group-name "digicam::1stlvl" --role-name "Digicam::2nd-Lvl" --permission "move_into"'
sudo docker exec demootrs_otrs su - otrs -c '/opt/otrs/bin/otrs.Console.pl Admin::Group::RoleLink --group-name "digicam::PRIVATE" --role-name "Digicam::2nd-Lvl" --permission "rw"'
sudo docker exec demootrs_otrs su - otrs -c '/opt/otrs/bin/otrs.Console.pl Admin::Group::RoleLink --group-name "digicam::BUSINESS" --role-name "Digicam::2nd-Lvl" --permission "rw"'
sudo docker exec demootrs_otrs su - otrs -c '/opt/otrs/bin/otrs.Console.pl Admin::Group::RoleLink --group-name "digicam::2ndlvl" --role-name "Digicam::2nd-Lvl" --permission "rw"'
sudo docker exec demootrs_otrs su - otrs -c '/opt/otrs/bin/otrs.Console.pl Admin::Group::RoleLink --group-name "digicam::3rdlvl" --role-name "Digicam::2nd-Lvl" --permission "move_into"'
sudo docker exec demootrs_otrs su - otrs -c '/opt/otrs/bin/otrs.Console.pl Admin::Group::RoleLink --group-name "digicam" --role-name "Digicam::3rd-Lvl" --permission "rw"'
sudo docker exec demootrs_otrs su - otrs -c '/opt/otrs/bin/otrs.Console.pl Admin::Group::RoleLink --group-name "digicam::1stlvl" --role-name "Digicam::3rd-Lvl" --permission "move_into"'
sudo docker exec demootrs_otrs su - otrs -c '/opt/otrs/bin/otrs.Console.pl Admin::Group::RoleLink --group-name "digicam::PRIVATE" --role-name "Digicam::3rd-Lvl" --permission "rw"'
sudo docker exec demootrs_otrs su - otrs -c '/opt/otrs/bin/otrs.Console.pl Admin::Group::RoleLink --group-name "digicam::BUSINESS" --role-name "Digicam::3rd-Lvl" --permission "rw"'
sudo docker exec demootrs_otrs su - otrs -c '/opt/otrs/bin/otrs.Console.pl Admin::Group::RoleLink --group-name "digicam::2ndlvl" --role-name "Digicam::3rd-Lvl" --permission "rw"'
sudo docker exec demootrs_otrs su - otrs -c '/opt/otrs/bin/otrs.Console.pl Admin::Group::RoleLink --group-name "digicam::3rdlvl" --role-name "Digicam::3rd-Lvl" --permission "rw"'

sudo docker exec demootrs_otrs su - otrs -c '/opt/otrs/bin/otrs.Console.pl Admin::Group::RoleLink --group-name "medoptics" --role-name "Medoptics::1st-Lvl" --permission "rw"'
sudo docker exec demootrs_otrs su - otrs -c '/opt/otrs/bin/otrs.Console.pl Admin::Group::RoleLink --group-name "medoptics::1stlvl" --role-name "Medoptics::1st-Lvl" --permission "rw"'
sudo docker exec demootrs_otrs su - otrs -c '/opt/otrs/bin/otrs.Console.pl Admin::Group::RoleLink --group-name "medoptics::2ndlvl" --role-name "Medoptics::1st-Lvl" --permission "move_into"'
sudo docker exec demootrs_otrs su - otrs -c '/opt/otrs/bin/otrs.Console.pl Admin::Group::RoleLink --group-name "medoptics::3rdlvl" --role-name "Medoptics::1st-Lvl" --permission "move_into"'
sudo docker exec demootrs_otrs su - otrs -c '/opt/otrs/bin/otrs.Console.pl Admin::Group::RoleLink --group-name "medoptics" --role-name "Medoptics::2nd-Lvl" --permission "rw"'
sudo docker exec demootrs_otrs su - otrs -c '/opt/otrs/bin/otrs.Console.pl Admin::Group::RoleLink --group-name "medoptics::1stlvl" --role-name "Medoptics::2nd-Lvl" --permission "move_into"'
sudo docker exec demootrs_otrs su - otrs -c '/opt/otrs/bin/otrs.Console.pl Admin::Group::RoleLink --group-name "medoptics::2ndlvl" --role-name "Medoptics::2nd-Lvl" --permission "rw"'
sudo docker exec demootrs_otrs su - otrs -c '/opt/otrs/bin/otrs.Console.pl Admin::Group::RoleLink --group-name "medoptics::3rdlvl" --role-name "Medoptics::2nd-Lvl" --permission "move_into"'
sudo docker exec demootrs_otrs su - otrs -c '/opt/otrs/bin/otrs.Console.pl Admin::Group::RoleLink --group-name "medoptics" --role-name "Medoptics::3rd-Lvl" --permission "rw"'
sudo docker exec demootrs_otrs su - otrs -c '/opt/otrs/bin/otrs.Console.pl Admin::Group::RoleLink --group-name "medoptics::1stlvl" --role-name "Medoptics::3rd-Lvl" --permission "move_into"'
sudo docker exec demootrs_otrs su - otrs -c '/opt/otrs/bin/otrs.Console.pl Admin::Group::RoleLink --group-name "medoptics::2ndlvl" --role-name "Medoptics::3rd-Lvl" --permission "move_into"'
sudo docker exec demootrs_otrs su - otrs -c '/opt/otrs/bin/otrs.Console.pl Admin::Group::RoleLink --group-name "medoptics::3rdlvl" --role-name "Medoptics::3rd-Lvl" --permission "rw"'

sudo docker exec demootrs_otrs su - otrs -c '/opt/otrs/bin/otrs.Console.pl Admin::Group::RoleLink --group-name "intelliEyes::DACH" --role-name "IntelliEyes::1st-Lvl::DACH" --permission "rw"'
sudo docker exec demootrs_otrs su - otrs -c '/opt/otrs/bin/otrs.Console.pl Admin::Group::RoleLink --group-name "intelliEyes::1stlvl" --role-name "IntelliEyes::1st-Lvl::DACH" --permission "rw"'
sudo docker exec demootrs_otrs su - otrs -c '/opt/otrs/bin/otrs.Console.pl Admin::Group::RoleLink --group-name "intelliEyes::2ndlvl" --role-name "IntelliEyes::1st-Lvl::DACH" --permission "rw"'
sudo docker exec demootrs_otrs su - otrs -c '/opt/otrs/bin/otrs.Console.pl Admin::Group::RoleLink --group-name "intelliEyes::3rdlvl" --role-name "IntelliEyes::1st-Lvl::DACH" --permission "rw"'
sudo docker exec demootrs_otrs su - otrs -c '/opt/otrs/bin/otrs.Console.pl Admin::Group::RoleLink --group-name "intelliEyes::DACH" --role-name "IntelliEyes::2nd-Lvl::DACH" --permission "rw"'
sudo docker exec demootrs_otrs su - otrs -c '/opt/otrs/bin/otrs.Console.pl Admin::Group::RoleLink --group-name "intelliEyes::1stlvl" --role-name "IntelliEyes::2nd-Lvl::DACH" --permission "rw"'
sudo docker exec demootrs_otrs su - otrs -c '/opt/otrs/bin/otrs.Console.pl Admin::Group::RoleLink --group-name "intelliEyes::2ndlvl" --role-name "IntelliEyes::2nd-Lvl::DACH" --permission "move_into"'
sudo docker exec demootrs_otrs su - otrs -c '/opt/otrs/bin/otrs.Console.pl Admin::Group::RoleLink --group-name "intelliEyes::3rdlvl" --role-name "IntelliEyes::2nd-Lvl::DACH" --permission "move_into"'
sudo docker exec demootrs_otrs su - otrs -c '/opt/otrs/bin/otrs.Console.pl Admin::Group::RoleLink --group-name "intelliEyes::DACH" --role-name "IntelliEyes::3rd-Lvl::DACH" --permission "ro" --permission "move_into" --permission "create"'
sudo docker exec demootrs_otrs su - otrs -c '/opt/otrs/bin/otrs.Console.pl Admin::Group::RoleLink --group-name "intelliEyes::1stlvl" --role-name "IntelliEyes::3rd-Lvl::DACH" --permission "ro" --permission "move_into" --permission "create"'
sudo docker exec demootrs_otrs su - otrs -c '/opt/otrs/bin/otrs.Console.pl Admin::Group::RoleLink --group-name "intelliEyes::2ndlvl" --role-name "IntelliEyes::3rd-Lvl::DACH" --permission "ro" --permission "move_into" --permission "create"'
sudo docker exec demootrs_otrs su - otrs -c '/opt/otrs/bin/otrs.Console.pl Admin::Group::RoleLink --group-name "intelliEyes::3rdlvl" --role-name "IntelliEyes::3rd-Lvl::DACH" --permission "ro" --permission "move_into" --permission "create"'

sudo docker exec demootrs_otrs su - otrs -c '/opt/otrs/bin/otrs.Console.pl Admin::Group::RoleLink --group-name "intelliEyes::DACH" --role-name "IntelliEyes::1st-Lvl::CHINA" --permission "rw"'
sudo docker exec demootrs_otrs su - otrs -c '/opt/otrs/bin/otrs.Console.pl Admin::Group::RoleLink --group-name "intelliEyes::1stlvl" --role-name "IntelliEyes::1st-Lvl::CHINA" --permission "rw"'
sudo docker exec demootrs_otrs su - otrs -c '/opt/otrs/bin/otrs.Console.pl Admin::Group::RoleLink --group-name "intelliEyes::2ndlvl" --role-name "IntelliEyes::1st-Lvl::CHINA" --permission "rw"'
sudo docker exec demootrs_otrs su - otrs -c '/opt/otrs/bin/otrs.Console.pl Admin::Group::RoleLink --group-name "intelliEyes::3rdlvl" --role-name "IntelliEyes::1st-Lvl::CHINA" --permission "rw"'
sudo docker exec demootrs_otrs su - otrs -c '/opt/otrs/bin/otrs.Console.pl Admin::Group::RoleLink --group-name "intelliEyes::DACH" --role-name "IntelliEyes::2nd-Lvl::CHINA" --permission "rw"'
sudo docker exec demootrs_otrs su - otrs -c '/opt/otrs/bin/otrs.Console.pl Admin::Group::RoleLink --group-name "intelliEyes::1stlvl" --role-name "IntelliEyes::2nd-Lvl::CHINA" --permission "rw"'
sudo docker exec demootrs_otrs su - otrs -c '/opt/otrs/bin/otrs.Console.pl Admin::Group::RoleLink --group-name "intelliEyes::2ndlvl" --role-name "IntelliEyes::2nd-Lvl::CHINA" --permission "move_into"'
sudo docker exec demootrs_otrs su - otrs -c '/opt/otrs/bin/otrs.Console.pl Admin::Group::RoleLink --group-name "intelliEyes::3rdlvl" --role-name "IntelliEyes::2nd-Lvl::CHINA" --permission "move_into"'
sudo docker exec demootrs_otrs su - otrs -c '/opt/otrs/bin/otrs.Console.pl Admin::Group::RoleLink --group-name "intelliEyes::DACH" --role-name "IntelliEyes::3rd-Lvl::CHINA" --permission "ro" --permission "move_into" --permission "create"'
sudo docker exec demootrs_otrs su - otrs -c '/opt/otrs/bin/otrs.Console.pl Admin::Group::RoleLink --group-name "intelliEyes::1stlvl" --role-name "IntelliEyes::3rd-Lvl::CHINA" --permission "ro" --permission "move_into" --permission "create"'
sudo docker exec demootrs_otrs su - otrs -c '/opt/otrs/bin/otrs.Console.pl Admin::Group::RoleLink --group-name "intelliEyes::2ndlvl" --role-name "IntelliEyes::3rd-Lvl::CHINA" --permission "ro" --permission "move_into" --permission "create"'
sudo docker exec demootrs_otrs su - otrs -c '/opt/otrs/bin/otrs.Console.pl Admin::Group::RoleLink --group-name "intelliEyes::3rdlvl" --role-name "IntelliEyes::3rd-Lvl::CHINA" --permission "ro" --permission "move_into" --permission "create"'

sudo docker exec demootrs_otrs su - otrs -c '/opt/otrs/bin/otrs.Console.pl Admin::Group::RoleLink --group-name "intelliEyes::DACH" --role-name "IntelliEyes::1st-Lvl::WORLDWIDE" --permission "rw"'
sudo docker exec demootrs_otrs su - otrs -c '/opt/otrs/bin/otrs.Console.pl Admin::Group::RoleLink --group-name "intelliEyes::1stlvl" --role-name "IntelliEyes::1st-Lvl::WORLDWIDE" --permission "rw"'
sudo docker exec demootrs_otrs su - otrs -c '/opt/otrs/bin/otrs.Console.pl Admin::Group::RoleLink --group-name "intelliEyes::2ndlvl" --role-name "IntelliEyes::1st-Lvl::WORLDWIDE" --permission "rw"'
sudo docker exec demootrs_otrs su - otrs -c '/opt/otrs/bin/otrs.Console.pl Admin::Group::RoleLink --group-name "intelliEyes::3rdlvl" --role-name "IntelliEyes::1st-Lvl::WORLDWIDE" --permission "rw"'
sudo docker exec demootrs_otrs su - otrs -c '/opt/otrs/bin/otrs.Console.pl Admin::Group::RoleLink --group-name "intelliEyes::DACH" --role-name "IntelliEyes::2nd-Lvl::WORLDWIDE" --permission "rw"'
sudo docker exec demootrs_otrs su - otrs -c '/opt/otrs/bin/otrs.Console.pl Admin::Group::RoleLink --group-name "intelliEyes::1stlvl" --role-name "IntelliEyes::2nd-Lvl::WORLDWIDE" --permission "rw"'
sudo docker exec demootrs_otrs su - otrs -c '/opt/otrs/bin/otrs.Console.pl Admin::Group::RoleLink --group-name "intelliEyes::2ndlvl" --role-name "IntelliEyes::2nd-Lvl::WORLDWIDE" --permission "move_into"'
sudo docker exec demootrs_otrs su - otrs -c '/opt/otrs/bin/otrs.Console.pl Admin::Group::RoleLink --group-name "intelliEyes::3rdlvl" --role-name "IntelliEyes::2nd-Lvl::WORLDWIDE" --permission "move_into"'
sudo docker exec demootrs_otrs su - otrs -c '/opt/otrs/bin/otrs.Console.pl Admin::Group::RoleLink --group-name "intelliEyes::DACH" --role-name "IntelliEyes::3rd-Lvl::WORLDWIDE" --permission "ro" --permission "move_into" --permission "create"'
sudo docker exec demootrs_otrs su - otrs -c '/opt/otrs/bin/otrs.Console.pl Admin::Group::RoleLink --group-name "intelliEyes::1stlvl" --role-name "IntelliEyes::3rd-Lvl::WORLDWIDE" --permission "ro" --permission "move_into" --permission "create"'
sudo docker exec demootrs_otrs su - otrs -c '/opt/otrs/bin/otrs.Console.pl Admin::Group::RoleLink --group-name "intelliEyes::2ndlvl" --role-name "IntelliEyes::3rd-Lvl::WORLDWIDE" --permission "ro" --permission "move_into" --permission "create"'
sudo docker exec demootrs_otrs su - otrs -c '/opt/otrs/bin/otrs.Console.pl Admin::Group::RoleLink --group-name "intelliEyes::3rdlvl" --role-name "IntelliEyes::3rd-Lvl::WORLDWIDE" --permission "ro" --permission "move_into" --permission "create"'

#add system addresses
sudo docker exec demootrs_mail add-account support-digicam@firma.de otrs 
sudo docker exec demootrs_mail add-account support-medoptics@firma.de otrs 
sudo docker exec demootrs_mail add-account support-intellieyes@firma.de otrs 
sudo docker exec demootrs_otrs  su - otrs -c 'perl /opt/otrs/bin/otrs.Console.pl Admin::SystemAddress::Add --name "Digicam Support" --email-address "support-digicam@firma.de" --queue-name "Postmaster"'
sudo docker exec demootrs_otrs  su - otrs -c 'perl /opt/otrs/bin/otrs.Console.pl Admin::SystemAddress::Add --name "Medoptics Support" --email-address "support-medoptics@firma.de" --queue-name "Postmaster"'
sudo docker exec demootrs_otrs  su - otrs -c 'perl /opt/otrs/bin/otrs.Console.pl Admin::SystemAddress::Add --name "IntelliEyes Support" --email-address "support-intellieyes@firma.de" --queue-name "Postmaster"'

#add queues
sudo docker exec demootrs_otrs su - otrs -c 'perl /opt/otrs/bin/otrs.Console.pl Admin::Queue::Add  --name "Digicam" --group "digicam" --system-address-name "support-digicam@firma.de"'
sudo docker exec demootrs_otrs su - otrs -c 'perl /opt/otrs/bin/otrs.Console.pl Admin::Queue::Add  --name "Digicam 1st Lvl" --group "digicam::1stlvl" --system-address-name "support-digicam@firma.de"'
sudo docker exec demootrs_otrs su - otrs -c 'perl /opt/otrs/bin/otrs.Console.pl Admin::Queue::Add  --name "Digicam 2nd Lvl" --group "digicam::2ndlvl" --system-address-name "support-digicam@firma.de"'
sudo docker exec demootrs_otrs su - otrs -c 'perl /opt/otrs/bin/otrs.Console.pl Admin::Queue::Add  --name "Digicam 3rd Lvl" --group "digicam::3rdlvl" --system-address-name "support-digicam@firma.de"'

sudo docker exec demootrs_otrs su - otrs -c 'perl /opt/otrs/bin/otrs.Console.pl Admin::Queue::Add --name "Medoptics" --group "medoptics" --system-address-name "support-medoptics@firma.de"'
sudo docker exec demootrs_otrs su - otrs -c 'perl /opt/otrs/bin/otrs.Console.pl Admin::Queue::Add --name "Medoptics 1st Lvl" --group "medoptics::1stlvl" --system-address-name "support-medoptics@firma.de"'
sudo docker exec demootrs_otrs su - otrs -c 'perl /opt/otrs/bin/otrs.Console.pl Admin::Queue::Add --name "Medoptics 2nd Lvl" --group "medoptics::2ndlvl" --system-address-name "support-medoptics@firma.de"'
sudo docker exec demootrs_otrs su - otrs -c 'perl /opt/otrs/bin/otrs.Console.pl Admin::Queue::Add --name "Medoptics 3rd Lvl" --group "medoptics::3rdlvl" --system-address-name "support-medoptics@firma.de"'

sudo docker exec demootrs_otrs su - otrs -c 'perl /opt/otrs/bin/otrs.Console.pl Admin::Queue::Add --name "IntelliEyes" --group "intelliEyes" --system-address-name "support-intellieyes@firma.de"'
sudo docker exec demootrs_otrs su - otrs -c 'perl /opt/otrs/bin/otrs.Console.pl Admin::Queue::Add --name "IntelliEyes DACH 1st Lvl" --group "intelliEyes::DACH" --system-address-name "support-intellieyes@firma.de"'
sudo docker exec demootrs_otrs su - otrs -c 'perl /opt/otrs/bin/otrs.Console.pl Admin::Queue::Add --name "IntelliEyes DACH 2nd Lvl" --group "intelliEyes::DACH" --system-address-name "support-intellieyes@firma.de"'
sudo docker exec demootrs_otrs su - otrs -c 'perl /opt/otrs/bin/otrs.Console.pl Admin::Queue::Add --name "IntelliEyes DACH 3rd Lvl" --group "intelliEyes::DACH" --system-address-name "support-intellieyes@firma.de"'
sudo docker exec demootrs_otrs su - otrs -c 'perl /opt/otrs/bin/otrs.Console.pl Admin::Queue::Add --name "IntelliEyes CHINA 1st Lvl" --group "intelliEyes::CHINA" --system-address-name "support-intellieyes@firma.de"'
sudo docker exec demootrs_otrs su - otrs -c 'perl /opt/otrs/bin/otrs.Console.pl Admin::Queue::Add --name "IntelliEyes CHINA 2nd Lvl" --group "intelliEyes::CHINA" --system-address-name "support-intellieyes@firma.de"'
sudo docker exec demootrs_otrs su - otrs -c 'perl /opt/otrs/bin/otrs.Console.pl Admin::Queue::Add --name "IntelliEyes CHINA 3rd Lvl" --group "intelliEyes::CHINA" --system-address-name "support-intellieyes@firma.de"'



#add mail accounts
#add mail accounts
sudo docker exec demootrs_mail add-account agent@digicam.firma.de otrs 
sudo docker exec demootrs_mail add-account agent-1stlvl@digicam.firma.de otrs 
sudo docker exec demootrs_mail add-account agent-2ndlvl@digicam.firma.de otrs 
sudo docker exec demootrs_mail add-account agent-3rdlvl@digicam.firma.de otrs 
sudo docker exec demootrs_mail add-account digi-kunde@privat.de otrs 
sudo docker exec demootrs_mail add-account digi-kunde@unternehmen.de otrs 

sudo docker exec demootrs_mail add-account agent@intellieyes.firma.de otrs 
sudo docker exec demootrs_mail add-account agent-dach-1stlvl@intellieyes.firma.de otrs 
sudo docker exec demootrs_mail add-account agent-dach-2ndlvl@intellieyes.firma.de otrs 
sudo docker exec demootrs_mail add-account agent-dach-3rdlvl@intellieyes.firma.de otrs 
sudo docker exec demootrs_mail add-account agent-china-1stlvl@intellieyes.firma.de otrs 
sudo docker exec demootrs_mail add-account agent-china-2ndlvl@intellieyes.firma.de otrs 
sudo docker exec demootrs_mail add-account agent-china-3rdlvl@intellieyes.firma.de otrs 
sudo docker exec demootrs_mail add-account intelli-customer-dach@firma.de otrs 
sudo docker exec demootrs_mail add-account intelli-customer-china@firma.de otrs 

sudo docker exec demootrs_mail add-account agent@medoptics.firma.de otrs 
sudo docker exec demootrs_mail add-account agent-1stlvl@medoptics.firma.de otrs 
sudo docker exec demootrs_mail add-account agent-2ndlvl@medoptics.firma.de otrs 
sudo docker exec demootrs_mail add-account agent-3rdlvl@medoptics.firma.de otrs 
sudo docker exec demootrs_mail add-account med-kunde@privat.de otrs 
sudo docker exec demootrs_mail add-account med-dritt@unternehmen.de otrs 
sudo docker exec demootrs_mail add-account med-thirdparty@company.com otrs 


sudo docker exec demootrs_otrs sudo docker exec demootrs_mailclient rm -rf /home/developer/.sylpheed-2.0/
sudo docker exec demootrs_otrs sudo docker cp /opt/otrs/Kernel/demo_otrs/s5/mailbox/. demootrs_mailclient:/home/developer/.sylpheed-2.0



#add agents 
sudo docker exec demootrs_otrs  su - otrs -c 'perl /opt/otrs/bin/otrs.Console.pl Admin::User::Add --user-name "agent@medoptics.firma.de" --first-name Medoptics --last-name Agent --email-address "agent@medoptics.firma.de" --password "otrs"'
sudo docker exec demootrs_otrs  su - otrs -c 'perl /opt/otrs/bin/otrs.Console.pl Admin::User::Add --user-name "agent-1stlvl@medoptics.firma.de" --first-name "Medoptics 1st Lvl" --last-name Agent --email-address "agent-1stlvl@medoptics.firma.de" --password "otrs"'
sudo docker exec demootrs_otrs  su - otrs -c 'perl /opt/otrs/bin/otrs.Console.pl Admin::User::Add --user-name "agent-2ndlvl@medoptics.firma.de" --first-name "Medoptics 2nd Lvl" --last-name Agent --email-address "agent-2ndlvl@medoptics.firma.de" --password "otrs"'
sudo docker exec demootrs_otrs  su - otrs -c 'perl /opt/otrs/bin/otrs.Console.pl Admin::User::Add --user-name "agent-3rdlvl@medoptics.firma.de" --first-name "Medoptics 3rd Lvl" --last-name Agent --email-address "agent-3rdlvl@medoptics.firma.de" --password "otrs"'

sudo docker exec demootrs_otrs  su - otrs -c 'perl /opt/otrs/bin/otrs.Console.pl Admin::User::Add --user-name "agent@intellieyes.firma.de" --first-name intelliEyes --last-name Agent --email-address "agent@intellieyes.firma.de" --password "otrs"'
sudo docker exec demootrs_otrs  su - otrs -c 'perl /opt/otrs/bin/otrs.Console.pl Admin::User::Add --user-name "agent-dach-1stlvl@intellieyes.firma.de" --first-name intelliEyesDACH1stlvl --last-name Agent --email-address "agent-dach-1stlvl@intellieyes.firma.de" --password "otrs"'
sudo docker exec demootrs_otrs  su - otrs -c 'perl /opt/otrs/bin/otrs.Console.pl Admin::User::Add --user-name "agent-dach-2ndlvl@intellieyes.firma.de" --first-name intelliEyesDACH2ndlvl --last-name Agent --email-address "agent-dach-2ndlvl@intellieyes.firma.de" --password "otrs"'
sudo docker exec demootrs_otrs  su - otrs -c 'perl /opt/otrs/bin/otrs.Console.pl Admin::User::Add --user-name "agent-dach-3rdlvl@intellieyes.firma.de" --first-name intelliEyesDACH3rdlvl --last-name Agent --email-address "agent-dach-3rdlvl@intellieyes.firma.de" --password "otrs"'
sudo docker exec demootrs_otrs  su - otrs -c 'perl /opt/otrs/bin/otrs.Console.pl Admin::User::Add --user-name "agent-china-1stlvl@intellieyes.firma.de" --first-name intelliEyesCHINA1stlvl --last-name Agent --email-address "agent-china-1stlvl@intellieyes.firma.de" --password "otrs"'
sudo docker exec demootrs_otrs  su - otrs -c 'perl /opt/otrs/bin/otrs.Console.pl Admin::User::Add --user-name "agent-china-2ndlvl@intellieyes.firma.de" --first-name intelliEyesCHINA2ndlvl --last-name Agent --email-address "agent-china-2ndlvl@intellieyes.firma.de" --password "otrs"'
sudo docker exec demootrs_otrs  su - otrs -c 'perl /opt/otrs/bin/otrs.Console.pl Admin::User::Add --user-name "agent-china-3rdlvl@intellieyes.firma.de" --first-name intelliEyesCHINA3rdlvl --last-name Agent --email-address "agent-china-3rdlvl@intellieyes.firma.de" --password "otrs"'

sudo docker exec demootrs_otrs  su - otrs -c 'perl /opt/otrs/bin/otrs.Console.pl Admin::User::Add --user-name "agent@digicam.firma.de" --first-name digicam --last-name Agent --email-address "agent@digicam.firma.de" --password "otrs"'
sudo docker exec demootrs_otrs  su - otrs -c 'perl /opt/otrs/bin/otrs.Console.pl Admin::User::Add --user-name "agent-1stlvl@digicam.firma.de" --first-name digicam1stlvl --last-name Agent --email-address "agent-1stlvl@digicam.firma.de" --password "otrs"'
sudo docker exec demootrs_otrs  su - otrs -c 'perl /opt/otrs/bin/otrs.Console.pl Admin::User::Add --user-name "agent-2ndlvl@digicam.firma.de" --first-name digicam2ndlvl --last-name Agent --email-address "agent-2ndlvl@digicam.firma.de" --password "otrs"'
sudo docker exec demootrs_otrs  su - otrs -c 'perl /opt/otrs/bin/otrs.Console.pl Admin::User::Add --user-name "agent-3rdlvl@digicam.firma.de" --first-name digicam3rdlvl --last-name Agent --email-address "agent-3rdlvl@digicam.firma.de" --password "otrs"'


#Link agents-role
sudo docker exec demootrs_otrs su - otrs -c '/opt/otrs/bin/otrs.Console.pl Admin::Role::UserLink --user-name "agent@digicam.firma.de" --role-name "Digicam::1st-Lvl"'
sudo docker exec demootrs_otrs su - otrs -c '/opt/otrs/bin/otrs.Console.pl Admin::Role::UserLink --user-name "agent@digicam.firma.de" --role-name "Digicam::2nd-Lvl"'
sudo docker exec demootrs_otrs su - otrs -c '/opt/otrs/bin/otrs.Console.pl Admin::Role::UserLink --user-name "agent@digicam.firma.de" --role-name "Digicam::3rd-Lvl"'
sudo docker exec demootrs_otrs su - otrs -c '/opt/otrs/bin/otrs.Console.pl Admin::Role::UserLink --user-name "agent-1stlvl@digicam.firma.de" --role-name "Digicam::1st-Lvl"'
sudo docker exec demootrs_otrs su - otrs -c '/opt/otrs/bin/otrs.Console.pl Admin::Role::UserLink --user-name "agent-2ndlvl@digicam.firma.de" --role-name "Digicam::2nd-Lvl"'
sudo docker exec demootrs_otrs su - otrs -c '/opt/otrs/bin/otrs.Console.pl Admin::Role::UserLink --user-name "agent-3rdlvl@digicam.firma.de" --role-name "Digicam::3rd-Lvl"'

sudo docker exec demootrs_otrs su - otrs -c '/opt/otrs/bin/otrs.Console.pl Admin::Role::UserLink --user-name "agent@medoptics.firma.de" --role-name "Medoptics::1st-Lvl"'
sudo docker exec demootrs_otrs su - otrs -c '/opt/otrs/bin/otrs.Console.pl Admin::Role::UserLink --user-name "agent@medoptics.firma.de" --role-name "Medoptics::2nd-Lvl"'
sudo docker exec demootrs_otrs su - otrs -c '/opt/otrs/bin/otrs.Console.pl Admin::Role::UserLink --user-name "agent@medoptics.firma.de" --role-name "Medoptics::3rd-Lvl"'
sudo docker exec demootrs_otrs su - otrs -c '/opt/otrs/bin/otrs.Console.pl Admin::Role::UserLink --user-name "agent-1stlvl@medoptics.firma.de" --role-name "Medoptics::1st-Lvl"'
sudo docker exec demootrs_otrs su - otrs -c '/opt/otrs/bin/otrs.Console.pl Admin::Role::UserLink --user-name "agent-2ndlvl@medoptics.firma.de" --role-name "Medoptics::2nd-Lvl"'
sudo docker exec demootrs_otrs su - otrs -c '/opt/otrs/bin/otrs.Console.pl Admin::Role::UserLink --user-name "agent-3rdlvl@medoptics.firma.de" --role-name "Medoptics::3rd-Lvl"'

sudo docker exec demootrs_otrs su - otrs -c '/opt/otrs/bin/otrs.Console.pl Admin::Role::UserLink --user-name "agent@intellieyes.firma.de" --role-name "IntelliEyes::3rd-Lvl::DACH"'
sudo docker exec demootrs_otrs su - otrs -c '/opt/otrs/bin/otrs.Console.pl Admin::Role::UserLink --user-name "agent@intellieyes.firma.de" --role-name "IntelliEyes::3rd-Lvl::CHINA"'
sudo docker exec demootrs_otrs su - otrs -c '/opt/otrs/bin/otrs.Console.pl Admin::Role::UserLink --user-name "agent-dach-1stlvl@intellieyes.firma.de" --role-name "IntelliEyes::1st-Lvl::DACH"'
sudo docker exec demootrs_otrs su - otrs -c '/opt/otrs/bin/otrs.Console.pl Admin::Role::UserLink --user-name "agent-dach-2ndlvl@intellieyes.firma.de" --role-name "IntelliEyes::2nd-Lvl::DACH"'
sudo docker exec demootrs_otrs su - otrs -c '/opt/otrs/bin/otrs.Console.pl Admin::Role::UserLink --user-name "agent-dach-3rdlvl@intellieyes.firma.de" --role-name "IntelliEyes::3rd-Lvl::DACH"'
sudo docker exec demootrs_otrs su - otrs -c '/opt/otrs/bin/otrs.Console.pl Admin::Role::UserLink --user-name "agent-china-1stlvl@intellieyes.firma.de" --role-name "IntelliEyes::1st-Lvl::CHINA"'
sudo docker exec demootrs_otrs su - otrs -c '/opt/otrs/bin/otrs.Console.pl Admin::Role::UserLink --user-name "agent-china-2ndlvl@intellieyes.firma.de" --role-name "IntelliEyes::2nd-Lvl::CHINA"'
sudo docker exec demootrs_otrs su - otrs -c '/opt/otrs/bin/otrs.Console.pl Admin::Role::UserLink --user-name "agent-china-3rdlvl@intellieyes.firma.de" --role-name "IntelliEyes::3rd-Lvl::CHINA"'



#add customer
sudo docker exec demootrs_otrs  su - otrs -c 'perl /opt/otrs/bin/otrs.Console.pl Admin::CustomerCompany::Add --name "Digicam Customers" --customer-id "110"'

sudo docker exec demootrs_otrs  su - otrs -c 'perl /opt/otrs/bin/otrs.Console.pl Admin::CustomerCompany::Add --name "Medoptics Private Customer" --customer-id "120"'
sudo docker exec demootrs_otrs  su - otrs -c 'perl /opt/otrs/bin/otrs.Console.pl Admin::CustomerCompany::Add --name "Medoptics <Unternehmen>" --customer-id "121"'
sudo docker exec demootrs_otrs  su - otrs -c 'perl /opt/otrs/bin/otrs.Console.pl Admin::CustomerCompany::Add --name "Medoptics <Enterprise>" --customer-id "122"'
sudo docker exec demootrs_otrs  su - otrs -c 'perl /opt/otrs/bin/otrs.Console.pl Admin::CustomerCompany::Add --name "Medoptics <Company>" --customer-id "123"'
sudo docker exec demootrs_otrs  su - otrs -c 'perl /opt/otrs/bin/otrs.Console.pl Admin::CustomerCompany::Add --name "Medoptics <Companhia>" --customer-id "124"'

sudo docker exec demootrs_otrs  su - otrs -c 'perl /opt/otrs/bin/otrs.Console.pl Admin::CustomerCompany::Add --name "IntelliEyes DACH" --customer-id "130"'
sudo docker exec demootrs_otrs  su - otrs -c 'perl /opt/otrs/bin/otrs.Console.pl Admin::CustomerCompany::Add --name "IntelliEyes CHINA" --customer-id "131"'

#add customerusers
sudo docker exec demootrs_otrs  su - otrs -c 'perl /opt/otrs/bin/otrs.Console.pl Admin::CustomerUser::Add --user-name "digi-kunde@privat.de" --first-name Privat --last-name DigiKunde --email-address "digi-kunde@privat.de" --password "otrs" --customer-id "110"'
sudo docker exec demootrs_otrs  su - otrs -c 'perl /opt/otrs/bin/otrs.Console.pl Admin::CustomerUser::Add --user-name "digi-kunde@unternehmen.de" --first-name Dritt --last-name Unternehmen --email-address "digi-kunde@unternehmen.de" --password "otrs" --customer-id "110"'
sudo docker exec demootrs_otrs  su - otrs -c 'perl /opt/otrs/bin/otrs.Console.pl Admin::CustomerUser::Add --user-name "med-kunde@privat.de" --first-name Privat --last-name MedKunde --email-address "med-kunde@privat.de" --password "otrs" --customer-id "120"'
sudo docker exec demootrs_otrs  su - otrs -c 'perl /opt/otrs/bin/otrs.Console.pl Admin::CustomerUser::Add --user-name "med-dritt@unternehmen.de" --first-name Dritt --last-name MedUnternehmen --email-address "med-dritt@unternehmen.de" --password "otrs" --customer-id "121"'
sudo docker exec demootrs_otrs  su - otrs -c 'perl /opt/otrs/bin/otrs.Console.pl Admin::CustomerUser::Add --user-name "med-troisieme@enterprise.be" --first-name Troisieme --last-name MedEnterprise --email-address "med-troisieme@enterprise.be" --password "otrs" --customer-id "122"'
sudo docker exec demootrs_otrs  su - otrs -c 'perl /opt/otrs/bin/otrs.Console.pl Admin::CustomerUser::Add --user-name "med-thirdparty@company.com" --first-name Thirdparty --last-name MedCompany --email-address "med-thirdparty@company.com" --password "otrs" --customer-id "123"'
sudo docker exec demootrs_otrs  su - otrs -c 'perl /opt/otrs/bin/otrs.Console.pl Admin::CustomerUser::Add --user-name "med-terceiro@companhia.br" --first-name Terceiro --last-name MedCompanhia --email-address "med-terceiro@companhia.br" --password "otrs" --customer-id "124"'
sudo docker exec demootrs_otrs  su - otrs -c 'perl /opt/otrs/bin/otrs.Console.pl Admin::CustomerUser::Add --user-name "intelli-customer-dach@firma.de" --first-name Privat --last-name IntelliKunde --email-address "intelli-customer-dach@firma.de" --password "otrs" --customer-id "130"'
sudo docker exec demootrs_otrs  su - otrs -c 'perl /opt/otrs/bin/otrs.Console.pl Admin::CustomerUser::Add --user-name "intelli-customer-china@firma.de" --first-name Prive --last-name IntelliClient --email-address "intelli-customer-china@firma.de" --password "otrs" --customer-id "130"'
#link customeruser<->group
sudo docker exec demootrs_otrs  su - otrs -c 'perl /opt/otrs/bin/otrs.Console.pl Admin::Group::CustomerLink --customer-user-login "digi-kunde@privat.de" --group-name "digicam::PRIVATE" --permission "ro"'
sudo docker exec demootrs_otrs  su - otrs -c 'perl /opt/otrs/bin/otrs.Console.pl Admin::Group::CustomerLink --customer-user-login "digi-kunde@unternehmen.de" --group-name "digicam::BUSINESS" --permission "ro"'


#add dynamcfields
sudo docker exec demootrs_otrs  su - otrs -c 'perl /opt/otrs/bin/otrs.Console.pl Custom::Admin::DynamicField::Update --name Market --label "Market" --type Dropdown --file Market.yml --path "/opt/otrs/Kernel/demo_otrs/s5/dynamicfield"'
sudo docker exec demootrs_otrs  su - otrs -c 'perl /opt/otrs/bin/otrs.Console.pl Custom::Admin::DynamicField::Add --name Solution --label "Solution" --type Dropdown --file Solution.yml --path "/opt/otrs/Kernel/demo_otrs/s5/dynamicfield"'
sudo docker exec demootrs_otrs  su - otrs -c 'perl /opt/otrs/bin/otrs.Console.pl Custom::Admin::DynamicField::Add --name Description --label "Description" --type "TextArea" --file /DF_Textarea.yml'
sudo docker exec demootrs_otrs  su - otrs -c 'perl /opt/otrs/bin/otrs.Console.pl Custom::Admin::DynamicField::Add --name Quantity --label "Quantity" --type Text --file Quantity.yml --path "/opt/otrs/Kernel/demo_otrs/s5/dynamicfield"'
sudo docker exec demootrs_otrs  su - otrs -c 'perl /opt/otrs/bin/otrs.Console.pl Custom::Admin::DynamicField::Add --name Escalate --label "Escalate" --type Text --file /DF_Text.yml '

sudo docker exec demootrs_otrs  su - otrs -c 'perl /opt/otrs/bin/otrs.Console.pl Custom::Admin::DynamicField::Add --name DIGIproduct --label "Product" --type Dropdown --file DIGIproduct.yml --path "/opt/otrs/Kernel/demo_otrs/s5/dynamicfield"'
sudo docker exec demootrs_otrs  su - otrs -c 'perl /opt/otrs/bin/otrs.Console.pl Custom::Admin::DynamicField::Add --name DIGIrequestApproval --label "Verification" --type Dropdown --file DIGIrequestApproval.yml --path "/opt/otrs/Kernel/demo_otrs/s5/dynamicfield"'
sudo docker exec demootrs_otrs  su - otrs -c 'perl /opt/otrs/bin/otrs.Console.pl Custom::Admin::DynamicField::Add --name DIGIorderNumber --label "Order Nr." --type Text --file /DF_Text.yml '
sudo docker exec demootrs_otrs  su - otrs -c 'perl /opt/otrs/bin/otrs.Console.pl Custom::Admin::DynamicField::Add --name DIGIinvoiceNumber --label "Invoice Nr." --type Text --file /DF_Text.yml '
sudo docker exec demootrs_otrs  su - otrs -c 'perl /opt/otrs/bin/otrs.Console.pl Custom::Admin::DynamicField::Add --name DIGIorderApproval --label "Verification" --type Dropdown --file DIGIorderApproval.yml --path "/opt/otrs/Kernel/demo_otrs/s5/dynamicfield"'
sudo docker exec demootrs_otrs  su - otrs -c 'perl /opt/otrs/bin/otrs.Console.pl Custom::Admin::DynamicField::Add --name DIGIdeliveryApproval --label "Verification" --type Dropdown --file DIGIdeliveryApproval.yml --path "/opt/otrs/Kernel/demo_otrs/s5/dynamicfield"'
sudo docker exec demootrs_otrs  su - otrs -c 'perl /opt/otrs/bin/otrs.Console.pl Custom::Admin::DynamicField::Add --name DIGIdeliveryAddress --label "Shipping Address" --type "TextArea" --file /DF_Textarea.yml'
sudo docker exec demootrs_otrs  su - otrs -c 'perl /opt/otrs/bin/otrs.Console.pl Custom::Admin::DynamicField::Add --name DIGIdeliveryDuration --label "Estimated processing time" --type Date --file /DF_Date.yml'
sudo docker exec demootrs_otrs  su - otrs -c 'perl /opt/otrs/bin/otrs.Console.pl Custom::Admin::DynamicField::Add --name DIGIdeliveryTime --label "Estimated shipping time" --type Date --file /DF_Date.yml'
sudo docker exec demootrs_otrs  su - otrs -c 'perl /opt/otrs/bin/otrs.Console.pl Custom::Admin::DynamicField::Add --name DIGIinprogress --label "In Progress." --type Text --file /DF_Text.yml '
sudo docker exec demootrs_otrs  su - otrs -c 'perl /opt/otrs/bin/otrs.Console.pl Custom::Admin::DynamicField::Add --name DIGIpacked --label "Packed" --type Text --file /DF_Text.yml '
sudo docker exec demootrs_otrs  su - otrs -c 'perl /opt/otrs/bin/otrs.Console.pl Custom::Admin::DynamicField::Add --name DIGIsent --label "Sent" --type Text --file /DF_Text.yml '
sudo docker exec demootrs_otrs  su - otrs -c 'perl /opt/otrs/bin/otrs.Console.pl Custom::Admin::DynamicField::Add --name DIGIdeliveryTracking --label "Tracking Nr." --type Text --file /DF_Text.yml '
sudo docker exec demootrs_otrs  su - otrs -c 'perl /opt/otrs/bin/otrs.Console.pl Custom::Admin::DynamicField::Add --name DIGImodelnr --label "Model Nr." --type Text --file /DF_Text.yml'
sudo docker exec demootrs_otrs  su - otrs -c 'perl /opt/otrs/bin/otrs.Console.pl Custom::Admin::DynamicField::Add --name DIGIserialnr --label "Serial Nr." --type Text --file /DF_Text.yml'
sudo docker exec demootrs_otrs  su - otrs -c 'perl /opt/otrs/bin/otrs.Console.pl Custom::Admin::DynamicField::Add --name DIGIwarranty --label "Still in warranty" --type Checkbox --file /DF_Checkbox.yml'

sudo docker exec demootrs_otrs  su - otrs -c 'perl /opt/otrs/bin/otrs.Console.pl Custom::Admin::DynamicField::Add --name MEDproductid --label "Product ID" --type Text --file /DF_Text.yml'
sudo docker exec demootrs_otrs  su - otrs -c 'perl /opt/otrs/bin/otrs.Console.pl Custom::Admin::DynamicField::Add --name MEDdevicetype --label "Device Type" --type Dropdown --file /MEDdevicetype.yml --path "/opt/otrs/Kernel/demo_otrs/s5/dynamicfield"'
sudo docker exec demootrs_otrs  su - otrs -c 'perl /opt/otrs/bin/otrs.Console.pl Custom::Admin::DynamicField::Add --name MEDconectivity --label "Connectivity" --type Multiselect --file /MEDconnectivity.yml --path "/opt/otrs/Kernel/demo_otrs/s5/dynamicfield"'

sudo docker exec demootrs_otrs  su - otrs -c 'perl /opt/otrs/bin/otrs.Console.pl Custom::Admin::DynamicField::Add --name INTELLIservice --label "Service" --type Dropdown --file /INTELLIservice.yml --path "/opt/otrs/Kernel/demo_otrs/s5/dynamicfield"'
sudo docker exec demootrs_otrs  su - otrs -c 'perl /opt/otrs/bin/otrs.Console.pl Custom::Admin::DynamicField::Add --name INTELLIfeatures --label "Features" --type Multiselect --file /INTELLIfeatures.yml --path "/opt/otrs/Kernel/demo_otrs/s5/dynamicfield"'
sudo docker exec demootrs_otrs  su - otrs -c 'perl /opt/otrs/bin/otrs.Console.pl Custom::Admin::DynamicField::Add --name INTELLIStartdate --label "Service Start Date" --type Date --file /DF_Date.yml'
sudo docker exec demootrs_otrs  su - otrs -c 'perl /opt/otrs/bin/otrs.Console.pl Custom::Admin::DynamicField::Add --name INTELLIDuration --label "Contract Duration" --type DateTime --file /DF_DateTime.yml'

#add acls
sudo docker exec demootrs_otrs su - otrs -c '/opt/otrs/bin/otrs.Console.pl Custom::Admin::ACL::Add --file AAM_Agent_digicam.yml --path "/opt/otrs/Kernel/demo_otrs/s5/acl"'
sudo docker exec demootrs_otrs su - otrs -c '/opt/otrs/bin/otrs.Console.pl Custom::Admin::ACL::Add --file AAM_Agent_medoptics.yml --path "/opt/otrs/Kernel/demo_otrs/s5/acl"'
sudo docker exec demootrs_otrs su - otrs -c '/opt/otrs/bin/otrs.Console.pl Custom::Admin::ACL::Add --file AAM_Agent_intellieyes_DACH.yml --path "/opt/otrs/Kernel/demo_otrs/s5/acl"'
sudo docker exec demootrs_otrs su - otrs -c '/opt/otrs/bin/otrs.Console.pl Custom::Admin::ACL::Add --file AAM_Agent_intellieyes_CHINA.yml --path "/opt/otrs/Kernel/demo_otrs/s5/acl"'

sudo docker exec demootrs_otrs su - otrs -c '/opt/otrs/bin/otrs.Console.pl Custom::Admin::ACL::Add --file AAM_Customer_digicam.yml --path "/opt/otrs/Kernel/demo_otrs/s5/acl"'
sudo docker exec demootrs_otrs su - otrs -c '/opt/otrs/bin/otrs.Console.pl Custom::Admin::ACL::Add --file AAM_Customer_medoptics.yml --path "/opt/otrs/Kernel/demo_otrs/s5/acl"'
sudo docker exec demootrs_otrs su - otrs -c '/opt/otrs/bin/otrs.Console.pl Custom::Admin::ACL::Add --file AAM_Customer_intellieyes_DACH.yml --path "/opt/otrs/Kernel/demo_otrs/s5/acl"'
sudo docker exec demootrs_otrs su - otrs -c '/opt/otrs/bin/otrs.Console.pl Custom::Admin::ACL::Add --file AAM_Customer_intellieyes_CHINA.yml --path "/opt/otrs/Kernel/demo_otrs/s5/acl"'

#sudo docker exec demootrs_otrs su - otrs -c '/opt/otrs/bin/otrs.Console.pl Custom::Admin::ACL::Add --file AAP_Agent_digicam_BUSINESS.yml --path "/opt/otrs/Kernel/demo_otrs/s5/acl"'
#sudo docker exec demootrs_otrs su - otrs -c '/opt/otrs/bin/otrs.Console.pl Custom::Admin::ACL::Add --file AAP_Agent_digicam_PRIVATE.yml --path "/opt/otrs/Kernel/demo_otrs/s5/acl"'
sudo docker exec demootrs_otrs su - otrs -c '/opt/otrs/bin/otrs.Console.pl Custom::Admin::ACL::Add --file AAP_Agent_digicam_.yml --path "/opt/otrs/Kernel/demo_otrs/s5/acl"'
sudo docker exec demootrs_otrs su - otrs -c '/opt/otrs/bin/otrs.Console.pl Custom::Admin::ACL::Add --file AAP_Agent_medoptics.yml --path "/opt/otrs/Kernel/demo_otrs/s5/acl"'
sudo docker exec demootrs_otrs su - otrs -c '/opt/otrs/bin/otrs.Console.pl Custom::Admin::ACL::Add --file AAP_Agent_intellieyes_DACH.yml --path "/opt/otrs/Kernel/demo_otrs/s5/acl"'
sudo docker exec demootrs_otrs su - otrs -c '/opt/otrs/bin/otrs.Console.pl Custom::Admin::ACL::Add --file AAP_Agent_intellieyes_CHINA.yml --path "/opt/otrs/Kernel/demo_otrs/s5/acl"'

#sudo docker exec demootrs_otrs su - otrs -c '/opt/otrs/bin/otrs.Console.pl Custom::Admin::ACL::Add --file AAP_Customer_digicam_BUSINESS.yml --path "/opt/otrs/Kernel/demo_otrs/s5/acl"'
#sudo docker exec demootrs_otrs su - otrs -c '/opt/otrs/bin/otrs.Console.pl Custom::Admin::ACL::Add --file AAP_Customer_digicam_PRIVATE.yml --path "/opt/otrs/Kernel/demo_otrs/s5/acl"'
sudo docker exec demootrs_otrs su - otrs -c '/opt/otrs/bin/otrs.Console.pl Custom::Admin::ACL::Add --file AAP_Customer_digicam_.yml --path "/opt/otrs/Kernel/demo_otrs/s5/acl"'
sudo docker exec demootrs_otrs su - otrs -c '/opt/otrs/bin/otrs.Console.pl Custom::Admin::ACL::Add --file AAP_Customer_medoptics.yml --path "/opt/otrs/Kernel/demo_otrs/s5/acl"'
sudo docker exec demootrs_otrs su - otrs -c '/opt/otrs/bin/otrs.Console.pl Custom::Admin::ACL::Add --file AAP_Customer_intellieyes_DACH.yml --path "/opt/otrs/Kernel/demo_otrs/s5/acl"'
sudo docker exec demootrs_otrs su - otrs -c '/opt/otrs/bin/otrs.Console.pl Custom::Admin::ACL::Add --file AAP_Customer_intellieyes_CHINA.yml --path "/opt/otrs/Kernel/demo_otrs/s5/acl"'

sudo docker exec demootrs_otrs su - otrs -c '/opt/otrs/bin/otrs.Console.pl Custom::Admin::ACL::Add --file AAA_Hide_all_processes.yml --path "/opt/otrs/Kernel/demo_otrs/s5/acl"'
sudo docker exec demootrs_otrs su - otrs -c '/opt/otrs/bin/otrs.Console.pl Custom::Admin::ACL::Add --file AAP_Admin_Processes.yml --path "/opt/otrs/Kernel/demo_otrs/s5/acl"'
#sudo docker exec demootrs_otrs su - otrs -c '/opt/otrs/bin/otrs.Console.pl Custom::Admin::ACL::Add --file AAP_General_Processes.yml --path "/opt/otrs/Kernel/demo_otrs/s5/acl"'


#add autoresponse
docker exec demootrs_otrs su - otrs -c 'perl /opt/otrs/bin/otrs.Console.pl Custom::Admin::AutoResponse::Add --name "Digicam reply" --subject "Re: <OTRS_TICKET_Title> - Ticket received" --response "Dear &lt;OTRS_CUSTOMER_REALNAME&gt;,<br/><br/>thank you very much for your message.&nbsp;<br/>We have received your request. Your case number is <a href=&lt;OTRS_CONFIG_HttpType&gt;://&lt;OTRS_CONFIG_FQDN&gt;/&lt;OTRS_CONFIG_ScriptAlias&gt;customer.pl?Action=CustomerTicketZoom;TicketNumber=&lt;OTRS_TICKET_TicketNumber&gt;>&lt;OTRS_TICKET_TicketNumber&gt;</a>.<br />We will contact you when your request is complete or we need any more information.<br/><br/>Kind regards,<br/>Digicam Support - Mayer GmbH" --system-address-name  "support-digicam@firma.de" --type "1"'
docker exec demootrs_otrs su - otrs -c 'perl /opt/otrs/bin/otrs.Console.pl Custom::Admin::AutoResponse::Add --name "Digicam reject/new ticket created" --subject "Re: <OTRS_TICKET_Title> - Ticket received" --response "Dear &lt;OTRS_CUSTOMER_REALNAME&gt;,<br/><br/>thank you very much for your message.&nbsp;<br/>Your previous ticket is closed.<br /><br/>--  A new ticket has been created for you. --<br/><br/>We have received your request. Your new case number is <a href=&lt;OTRS_CONFIG_HttpType&gt;://&lt;OTRS_CONFIG_FQDN&gt;/&lt;OTRS_CONFIG_ScriptAlias&gt;customer.pl?Action=CustomerTicketZoom;TicketNumber=&lt;OTRS_TICKET_TicketNumber&gt;>&lt;OTRS_TICKET_TicketNumber&gt;</a><br/><br/>Kind regards,<br/>Digicam Support - Mayer GmbH" --system-address-name  "support-digicam@firma.de" --type "4"'
docker exec demootrs_otrs su - otrs -c 'perl /opt/otrs/bin/otrs.Console.pl Custom::Admin::AutoResponse::Add --name "Digicam reject" --subject "Re: <OTRS_TICKET_Title> - Ticket rejected" --response "Dear &lt;OTRS_CUSTOMER_REALNAME&gt;,<br/><br/>thank you very much for your message.&nbsp;<br/>Your previous ticket is closed.<br /><br/>-- Your follow-up has been rejected. --<br/><br/>Please create a new ticket.<br/><br/>Kind regards,<br/>Digicam Support - Mayer GmbH" --system-address-name  "support-digicam@firma.de" --type "2"'
docker exec demootrs_otrs su - otrs -c 'perl /opt/otrs/bin/otrs.Console.pl Custom::Admin::AutoResponse::Add --name "Digicam follow-up" --subject "Re: <OTRS_TICKET_Title> - Ticket follow-up received" --response "Dear &lt;OTRS_CUSTOMER_REALNAME&gt;,<br/><br/>thank you very much for your follow-up message.&nbsp;<br/>We will contact you when your request is complete or we need any more information.<br/><br/>Kind regards,<br/>Digicam Support - Mayer GmbH" --system-address-name  "support-digicam@firma.de" --type "3"'
docker exec demootrs_otrs su - otrs -c 'perl /opt/otrs/bin/otrs.Console.pl Custom::Admin::AutoResponse::Add --name "Medoptics reply" --subject "Re: <OTRS_TICKET_Title> - Ticket received" --response "Dear &lt;OTRS_CUSTOMER_REALNAME&gt;,<br/><br/>thank you very much for your message.&nbsp;<br/>We have received your request. Your case number is <a href=&lt;OTRS_CONFIG_HttpType&gt;://&lt;OTRS_CONFIG_FQDN&gt;/&lt;OTRS_CONFIG_ScriptAlias&gt;customer.pl?Action=CustomerTicketZoom;TicketNumber=&lt;OTRS_TICKET_TicketNumber&gt;>&lt;OTRS_TICKET_TicketNumber&gt;</a>.<br />We will contact you when your request is complete or we need any more information.<br/><br/>Kind regards,<br/>Medoptics Support - Mayer GmbH" --system-address-name  "support-medoptics@firma.de" --type "1"'
docker exec demootrs_otrs su - otrs -c 'perl /opt/otrs/bin/otrs.Console.pl Custom::Admin::AutoResponse::Add --name "Medoptics reject/new ticket created" --subject "Re: <OTRS_TICKET_Title> - Ticket received" --response "Dear &lt;OTRS_CUSTOMER_REALNAME&gt;,<br/><br/>thank you very much for your message.&nbsp;<br/>Your previous ticket is closed.<br /><br/>--  A new ticket has been created for you. --<br/><br/>We have received your request. Your new case number is <a href=&lt;OTRS_CONFIG_HttpType&gt;://&lt;OTRS_CONFIG_FQDN&gt;/&lt;OTRS_CONFIG_ScriptAlias&gt;customer.pl?Action=CustomerTicketZoom;TicketNumber=&lt;OTRS_TICKET_TicketNumber&gt;>&lt;OTRS_TICKET_TicketNumber&gt;</a><br/><br/>Kind regards,<br/>Medoptics Support - Mayer GmbH" --system-address-name  "support-medoptics@firma.de" --type "4"'
docker exec demootrs_otrs su - otrs -c 'perl /opt/otrs/bin/otrs.Console.pl Custom::Admin::AutoResponse::Add --name "Medoptics reject" --subject "Re: <OTRS_TICKET_Title> - Ticket rejected" --response "Dear &lt;OTRS_CUSTOMER_REALNAME&gt;,<br/><br/>thank you very much for your message.&nbsp;<br/>Your previous ticket is closed.<br /><br/>-- Your follow-up has been rejected. --<br/><br/>Please create a new ticket.<br/><br/>Kind regards,<br/>Medoptics Support - Mayer GmbH" --system-address-name  "support-medoptics@firma.de" --type "2"'
docker exec demootrs_otrs su - otrs -c 'perl /opt/otrs/bin/otrs.Console.pl Custom::Admin::AutoResponse::Add --name "Medoptics follow-up" --subject "Re: <OTRS_TICKET_Title> - Ticket follow-up received" --response "Dear &lt;OTRS_CUSTOMER_REALNAME&gt;,<br/><br/>thank you very much for your follow-up message.&nbsp;<br/>We will contact you when your request is complete or we need any more information.<br/><br/>Kind regards,<br/>Medoptics Support - Mayer GmbH" --system-address-name  "support-medoptics@firma.de" --type "3"'
docker exec demootrs_otrs su - otrs -c 'perl /opt/otrs/bin/otrs.Console.pl Custom::Admin::AutoResponse::Add --name "IntelliEyes reply" --subject "Re: <OTRS_TICKET_Title> - Ticket received" --response "Dear &lt;OTRS_CUSTOMER_REALNAME&gt;,<br/><br/>thank you very much for your message.&nbsp;<br/>We have received your request. Your case number is <a href=&lt;OTRS_CONFIG_HttpType&gt;://&lt;OTRS_CONFIG_FQDN&gt;/&lt;OTRS_CONFIG_ScriptAlias&gt;customer.pl?Action=CustomerTicketZoom;TicketNumber=&lt;OTRS_TICKET_TicketNumber&gt;>&lt;OTRS_TICKET_TicketNumber&gt;</a>.<br />We will contact you when your request is complete or we need any more information.<br/><br/>Kind regards,<br/>IntelliEyes Support - Mayer GmbH" --system-address-name  "support-intellieyes@firma.de" --type "1"'
docker exec demootrs_otrs su - otrs -c 'perl /opt/otrs/bin/otrs.Console.pl Custom::Admin::AutoResponse::Add --name "IntelliEyes reject/new ticket created" --subject "Re: <OTRS_TICKET_Title> - Ticket received" --response "Dear &lt;OTRS_CUSTOMER_REALNAME&gt;,<br/><br/>thank you very much for your message.&nbsp;<br/>Your previous ticket is closed.<br /><br/>--  A new ticket has been created for you. --<br/><br/>We have received your request. Your new case number is <a href=&lt;OTRS_CONFIG_HttpType&gt;://&lt;OTRS_CONFIG_FQDN&gt;/&lt;OTRS_CONFIG_ScriptAlias&gt;customer.pl?Action=CustomerTicketZoom;TicketNumber=&lt;OTRS_TICKET_TicketNumber&gt;>&lt;OTRS_TICKET_TicketNumber&gt;</a><br/><br/>Kind regards,<br/>IntelliEyes Support - Mayer GmbH" --system-address-name  "support-intellieyes@firma.de" --type "4"'
docker exec demootrs_otrs su - otrs -c 'perl /opt/otrs/bin/otrs.Console.pl Custom::Admin::AutoResponse::Add --name "IntelliEyes reject" --subject "Re: <OTRS_TICKET_Title> - Ticket rejected" --response "Dear &lt;OTRS_CUSTOMER_REALNAME&gt;,<br/><br/>thank you very much for your message.&nbsp;<br/>Your previous ticket is closed.<br /><br/>-- Your follow-up has been rejected. --<br/><br/>Please create a new ticket.<br/><br/>Kind regards,<br/>IntelliEyes Support - Mayer GmbH" --system-address-name  "support-intellieyes@firma.de" --type "2"'
docker exec demootrs_otrs su - otrs -c 'perl /opt/otrs/bin/otrs.Console.pl Custom::Admin::AutoResponse::Add --name "IntelliEyes follow-up" --subject "Re: <OTRS_TICKET_Title> - Ticket follow-up received" --response "Dear &lt;OTRS_CUSTOMER_REALNAME&gt;,<br/><br/>thank you very much for your follow-up message.&nbsp;<br/>We will contact you when your request is complete or we need any more information.<br/><br/>Kind regards,<br/>IntelliEyes Support - Mayer GmbH" --system-address-name  "support-intellieyes@firma.de" --type "3"'

#link autoresponses
sudo docker exec   demootrs_otrs  su - otrs -c 'perl /opt/otrs/bin/otrs.Console.pl Custom::Admin::AutoResponse::Link --responseID "1 2 3 4" --queue-name "Digicam 1st Lvl"'
sudo docker exec   demootrs_otrs  su - otrs -c 'perl /opt/otrs/bin/otrs.Console.pl Custom::Admin::AutoResponse::Link --responseID "1 2 3 4" --queue-name "Medoptics 1st Lvl"'
sudo docker exec   demootrs_otrs  su - otrs -c 'perl /opt/otrs/bin/otrs.Console.pl Custom::Admin::AutoResponse::Link --responseID "1 2 3 4" --queue-name "IntelliEyes DACH 1st Lvl"'
sudo docker exec   demootrs_otrs  su - otrs -c 'perl /opt/otrs/bin/otrs.Console.pl Custom::Admin::AutoResponse::Link --responseID "1 2 3 4" --queue-name "IntelliEyes CHINA 1st Lvl"'
sudo docker exec   demootrs_otrs  su - otrs -c 'perl /opt/otrs/bin/otrs.Console.pl Custom::Admin::AutoResponse::Link --responseID "2" --queue-name "Digicam 1st Lvl"'
sudo docker exec   demootrs_otrs  su - otrs -c 'perl /opt/otrs/bin/otrs.Console.pl Custom::Admin::AutoResponse::Link --responseID "2" --queue-name "Medoptics 1st Lvl"'
sudo docker exec   demootrs_otrs  su - otrs -c 'perl /opt/otrs/bin/otrs.Console.pl Custom::Admin::AutoResponse::Link --responseID "2" --queue-name "IntelliEyes DACH 1st Lvl"'
sudo docker exec   demootrs_otrs  su - otrs -c 'perl /opt/otrs/bin/otrs.Console.pl Custom::Admin::AutoResponse::Link --responseID "2" --queue-name "IntelliEyes CHINA 1st Lvl"'


#add notifications
sudo docker exec demootrs_otrs su - otrs -c 'perl /opt/otrs/bin/otrs.Console.pl Custom::Admin::Notification::Add --file "Export_Notification_Ticket_closed.yml" --path "/opt/otrs/Kernel/demo_otrs/s5/notification"'
sudo docker exec demootrs_otrs su - otrs -c 'perl /opt/otrs/bin/otrs.Console.pl Custom::Admin::Notification::Add --file "Export_Notification_Ticket_create__Auto_reply_for_process_tickets_.yml" --path "/opt/otrs/Kernel/demo_otrs/s5/notification"'

#add processes
#medoptics
sudo docker exec demootrs_otrs su - otrs -c 'perl /opt/otrs/bin/otrs.Console.pl Custom::Admin::Process::Add --file "Export_ProcessEntityID_Process-0a713cc388c4410806049e4c87975add.yml" --path "/opt/otrs/Kernel/demo_otrs/s5/process"'
sudo docker exec demootrs_otrs su - otrs -c 'perl /opt/otrs/bin/otrs.Console.pl Custom::Admin::Process::Add --file "Export_ProcessEntityID_Process-a00f457ce85c119e75b5edf2b37fdf6b.yml" --path "/opt/otrs/Kernel/demo_otrs/s5/process"'
sudo docker exec demootrs_otrs su - otrs -c 'perl /opt/otrs/bin/otrs.Console.pl Custom::Admin::Process::Add --file "Export_ProcessEntityID_Process-a7217d2c38a7737f65255d0e152e3e2b.yml" --path "/opt/otrs/Kernel/demo_otrs/s5/process"'
#intelli
sudo docker exec demootrs_otrs su - otrs -c 'perl /opt/otrs/bin/otrs.Console.pl Custom::Admin::Process::Add --file "Export_ProcessEntityID_Process-2ac7d5962f79cbc36b1f3777d2d3b80d.yml" --path "/opt/otrs/Kernel/demo_otrs/s5/process"'
sudo docker exec demootrs_otrs su - otrs -c 'perl /opt/otrs/bin/otrs.Console.pl Custom::Admin::Process::Add --file "Export_ProcessEntityID_Process-58ad44a52828e35ef1883e5d553094b7.yml" --path "/opt/otrs/Kernel/demo_otrs/s5/process"'
sudo docker exec demootrs_otrs su - otrs -c 'perl /opt/otrs/bin/otrs.Console.pl Custom::Admin::Process::Add --file "Export_ProcessEntityID_Process-71ae297e4933ab772f5e1eafa421c0f5.yml" --path "/opt/otrs/Kernel/demo_otrs/s5/process"'
sudo docker exec demootrs_otrs su - otrs -c 'perl /opt/otrs/bin/otrs.Console.pl Custom::Admin::Process::Add --file "Export_ProcessEntityID_Process-017c5c15fd14835979e1fb206e840796.yml" --path "/opt/otrs/Kernel/demo_otrs/s5/process"'
sudo docker exec demootrs_otrs su - otrs -c 'perl /opt/otrs/bin/otrs.Console.pl Custom::Admin::Process::Add --file "Export_ProcessEntityID_Process-4fa625b40b7f7c7a52ed4f40b9b56dc8.yml" --path "/opt/otrs/Kernel/demo_otrs/s5/process"'
#digi
sudo docker exec demootrs_otrs su - otrs -c 'perl /opt/otrs/bin/otrs.Console.pl Custom::Admin::Process::Add --file "Export_ProcessEntityID_Process-dd22d29815efb5c33315c7433049ebdc.yml" --path "/opt/otrs/Kernel/demo_otrs/s5/process"'
sudo docker exec demootrs_otrs su - otrs -c 'perl /opt/otrs/bin/otrs.Console.pl Custom::Admin::Process::Add --file "Export_ProcessEntityID_Process-f728bbb6b15ea140b77319ee7962c6db.yml" --path "/opt/otrs/Kernel/demo_otrs/s5/process"'
sudo docker exec demootrs_otrs su - otrs -c 'perl /opt/otrs/bin/otrs.Console.pl Custom::Admin::Process::Add --file "Export_ProcessEntityID_Process-3e624fc75145d4696569f0d54c07cb67.yml" --path "/opt/otrs/Kernel/demo_otrs/s5/process"'




#add generic agent
sudo docker exec demootrs_otrs su - otrs -c '/opt/otrs/bin/otrs.Console.pl Custom::Admin::GenericAgent::Add --name "load step 06" --file /s5.yml --path "/opt/otrs/Kernel/demo_otrs/s5/"'
