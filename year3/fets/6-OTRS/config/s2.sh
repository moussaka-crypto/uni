#!/bin/bash
###add: queue, group, customerinfomationcenter
#copy Config.pm
sudo docker exec demootrs_otrs cp /opt/otrs/Kernel/demo_otrs/s2/s2.pm /opt/otrs/Kernel/Config.pm
#add faq article
sudo docker exec demootrs_otrs su - otrs -c 'perl /opt/otrs/bin/otrs.Console.pl Custom::Admin::FAQ::Import "/opt/otrs/Kernel/demo_otrs/s2/s2.csv"'

#update autoresponses
sudo docker exec demootrs_otrs su - otrs -c 'perl /opt/otrs/bin/otrs.Console.pl Custom::Admin::AutoResponse::Update --name "default reject/new ticket created" --subject "Re: <OTRS_TICKET_Title> - Ticket received" --response "Dear &lt;OTRS_CUSTOMER_REALNAME&gt;,<br/><br/>thank you very much for your message.&nbsp;<br/>Your previous ticket is closed.<br /><br/>--  A new ticket has been created for you. --<br/><br/>We have received your request. Your new case number is <a href=&lt;OTRS_CONFIG_HttpType&gt;://&lt;OTRS_CONFIG_FQDN&gt;/&lt;OTRS_CONFIG_ScriptAlias&gt;customer.pl?Action=CustomerTicketZoom;TicketNumber=&lt;OTRS_TICKET_TicketNumber&gt;>&lt;OTRS_TICKET_TicketNumber&gt;</a><br/><br/>Kind regards,<br/>Support - Mayer GmbH" --system-address-name  "support@firma.de" --ID "4" --type "4"'
sudo docker exec demootrs_otrs su - otrs -c 'perl /opt/otrs/bin/otrs.Console.pl Custom::Admin::AutoResponse::Update --name "default reject" --subject "Re: <OTRS_TICKET_Title> - Ticket rejected" --response "Dear &lt;OTRS_CUSTOMER_REALNAME&gt;,<br/><br/>thank you very much for your message.&nbsp;<br/>Your previous ticket is closed.<br /><br/>-- Your follow-up has been rejected. --<br/><br/>Please create a new ticket.<br/><br/>Kind regards,<br/>Support - Mayer GmbH" --system-address-name  "support@firma.de" --ID "2" --type "2"'
sudo docker exec demootrs_otrs su - otrs -c 'perl /opt/otrs/bin/otrs.Console.pl Custom::Admin::AutoResponse::Update --name "default follow-up" --subject "Re: <OTRS_TICKET_Title> - Ticket follow-up received" --response "Dear &lt;OTRS_CUSTOMER_REALNAME&gt;,<br/><br/>thank you very much for your follow-up message.&nbsp;<br/>We will contact you when your request is complete or we need any more information.<br/><br/>Kind regards,<br/>Support - Mayer GmbH" --system-address-name  "support@firma.de" --ID "3" --type "3"'
sudo docker exec demootrs_otrs su - otrs -c 'perl /opt/otrs/bin/otrs.Console.pl Custom::Admin::AutoResponse::Update --name "default reply (after new ticket has been created)" --subject "Re: <OTRS_TICKET_Title> - Ticket received" --response "Dear &lt;OTRS_CUSTOMER_REALNAME&gt;,<br/><br/>thank you very much for your message.&nbsp;<br/>We have received your request. Your case number is <a href=&lt;OTRS_CONFIG_HttpType&gt;://&lt;OTRS_CONFIG_FQDN&gt;/&lt;OTRS_CONFIG_ScriptAlias&gt;customer.pl?Action=CustomerTicketZoom;TicketNumber=&lt;OTRS_TICKET_TicketNumber&gt;>&lt;OTRS_TICKET_TicketNumber&gt;</a>.<br />We will contact you when your request is complete or we need any more information.<br/><br/>Kind regards,<br/>Support - Mayer GmbH" --system-address-name  "support@firma.de" --ID "1" --type "1"'


#add dynamicFields
sudo docker exec demootrs_otrs  su - otrs -c 'perl /opt/otrs/bin/otrs.Console.pl Custom::Admin::DynamicField::Add --name username --label Username --type Text --file /DF_Text.yml'
sudo docker exec demootrs_otrs  su - otrs -c 'perl /opt/otrs/bin/otrs.Console.pl Custom::Admin::DynamicField::Add --name firstname --label Firstname --type Text --file /DF_Text.yml'
sudo docker exec demootrs_otrs  su - otrs -c 'perl /opt/otrs/bin/otrs.Console.pl Custom::Admin::DynamicField::Add --name lastname --label Lastname --type Text --file /DF_Text.yml'
sudo docker exec demootrs_otrs  su - otrs -c 'perl /opt/otrs/bin/otrs.Console.pl Custom::Admin::DynamicField::Add --name email --label E-Mail --type Text --file /DF_Text.yml'
sudo docker exec demootrs_otrs  su - otrs -c 'perl /opt/otrs/bin/otrs.Console.pl Custom::Admin::DynamicField::Add --name password --label Password --type Text --file /DF_Text.yml'

#Create new group
sudo docker exec demootrs_otrs  su - otrs -c 'perl /opt/otrs/bin/otrs.Console.pl Admin::Group::Add --name "registration"'
#link webservice to new group
sudo docker exec demootrs_otrs  su - otrs -c 'perl /opt/otrs/bin/otrs.Console.pl Admin::Group::UserLink --group-name "registration" --user-name "webservice" --permission "rw"'
#link admin to new group
sudo docker exec demootrs_otrs  su - otrs -c 'perl /opt/otrs/bin/otrs.Console.pl Admin::Group::UserLink --group-name "registration" --user-name "admin" --permission "rw"'
#link agent to new group
sudo docker exec demootrs_otrs  su - otrs -c 'perl /opt/otrs/bin/otrs.Console.pl Admin::Group::UserLink --group-name "registration" --user-name "agent@firma.de" --permission "rw"'

#rename queue
sudo docker exec demootrs_otrs su - otrs -c 'perl /opt/otrs/bin/otrs.Console.pl Custom::Admin::Queue::Update --ID "4" --name "Support" --group "users" --system-address-name "support@firma.de"'
#Add queue
sudo docker exec demootrs_otrs  su - otrs -c 'perl /opt/otrs/bin/otrs.Console.pl Custom::Admin::Queue::Add --name Registration --group "registration" --follow "2" '

#add system address
sudo docker exec demootrs_otrs  su - otrs -c 'perl /opt/otrs/bin/otrs.Console.pl Custom::Admin::SystemAddress::Add --name "firma.de Registration" --email-address registration@firma.de --queue-name Registration'

#add notification
sudo docker exec demootrs_otrs su - otrs -c 'perl /opt/otrs/bin/otrs.Console.pl Custom::Admin::Notification::Add --file "Export_Notification_Registration_Ticket_create.yml" --path "/opt/otrs/Kernel/demo_otrs/s2/notification"'
sudo docker exec demootrs_otrs su - otrs -c 'perl /opt/otrs/bin/otrs.Console.pl Custom::Admin::Notification::Add --file "Export_Notification_Ticket_closed.yml" --path "/opt/otrs/Kernel/demo_otrs/s2/notification"'
sudo docker exec demootrs_otrs su - otrs -c 'perl /opt/otrs/bin/otrs.Console.pl Custom::Admin::Notification::Add --file "Export_Notification_Ticket_closed__Registration_.yml" --path "/opt/otrs/Kernel/demo_otrs/s2/notification"'




#add generic agent
sudo docker exec demootrs_otrs su - otrs -c '/opt/otrs/bin/otrs.Console.pl Custom::Admin::GenericAgent::Add --name "load step 03" --file /s2.yml --path "/opt/otrs/Kernel/demo_otrs/s2/"'
