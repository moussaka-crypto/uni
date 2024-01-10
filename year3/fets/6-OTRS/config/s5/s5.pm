# --
# Kernel/Config.pm - Config file for OTRS kernel
# Copyright (C) 2001-2015 OTRS AG, http://otrs.com/
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --
#  Note:
#
#  -->> Most OTRS configuration should be done via the OTRS web interface
#       and the SysConfig. Only for some configuration, such as database
#       credentials and customer data source changes, you should edit this
#       file. For changes do customer data sources you can copy the definitions
#       from Kernel/Config/Defaults.pm and paste them in this file.
#       Config.pm will not be overwritten when updating OTRS.
# --
## Demo OTRS
#s5.pm - Step 5
#--

package Kernel::Config;

use strict;
use warnings;
use utf8;

sub Load {
    my $Self = shift;

    # ---------------------------------------------------- #
    # database settings                                    #
    # ---------------------------------------------------- #

    # The database host
    $Self->{'DatabaseHost'} = 'mariadb';

    # The database name
    $Self->{'Database'} = "otrs";

    # The database user
    $Self->{'DatabaseUser'} = "otrs";

    # The password of database user. You also can use bin/otrs.CryptPassword.pl
    # for crypted passwords
    $Self->{'DatabasePw'} = 'changeme';

    # The database DSN for MySQL ==> more: "perldoc DBD::mysql"
    $Self->{'DatabaseDSN'} = "DBI:mysql:database=$Self->{Database};host=$Self->{DatabaseHost}";

    # The database DSN for PostgreSQL ==> more: "perldoc DBD::Pg"
    # if you want to use a local socket connection
#    $Self->{DatabaseDSN} = "DBI:Pg:dbname=$Self->{Database};";
    # if you want to use a TCP/IP connection
#    $Self->{DatabaseDSN} = "DBI:Pg:dbname=$Self->{Database};host=$Self->{DatabaseHost};";

    # The database DSN for Microsoft SQL Server - only supported if OTRS is
    # installed on Windows as well
#    $Self->{DatabaseDSN} = "DBI:ODBC:driver={SQL Server};Database=$Self->{Database};Server=$Self->{DatabaseHost},1433";

    # The database DSN for Oracle ==> more: "perldoc DBD::oracle"
#    $Self->{DatabaseDSN} = "DBI:Oracle://$Self->{DatabaseHost}:1521/$Self->{Database}";
#
#    $ENV{ORACLE_HOME}     = '/path/to/your/oracle';
#    $ENV{NLS_DATE_FORMAT} = 'YYYY-MM-DD HH24:MI:SS';
#    $ENV{NLS_LANG}        = 'AMERICAN_AMERICA.AL32UTF8';

    # ---------------------------------------------------- #
    # fs root directory
    # ---------------------------------------------------- #
    $Self->{Home} = '/opt/otrs';

    # ---------------------------------------------------- #
    # insert your own config settings "here"               #
$Self->{'CustomerFrontend::Navigation'}->{'CustomerTicketMessage'}->{'002-Ticket'} =  [
  {
    'AccessKey' => 'n',
    'Block' => '',
    'Description' => 'Create new Ticket.',
    'Group' => [],
    'GroupRo' => [],
    'Link' => 'Action=CustomerTicketMessage',
    'LinkOption' => '',
    'Name' => 'New Ticket',
    'NavBar' => 'Ticket',
    'Prio' => '100',
    'Type' => 'Submenu'
  }
];
$Self->{'CustomerFrontend::Navigation'}->{'CustomerTicketProcess'}->{'002-ProcessManagement'} =  [
  {
    'AccessKey' => 'o',
    'Block' => '',
    'Description' => 'Create new process ticket.',
    'Group' => [],
    'GroupRo' => [],
    'Link' => 'Action=CustomerTicketProcess',
    'LinkOption' => '',
    'Name' => 'New process ticket',
    'NavBar' => 'Ticket',
    'Prio' => '220',
    'Type' => 'Submenu'
  }
];
    $Self->{'Secure::DisableBanner'} =  1;  
    $Self->{'ShowUserTimeZoneSelectionNotification'} =  '0';
    delete $Self->{'Frontend::NotifyModule'}->{'7000-AgentTimeZone-Check'}; 
    $Self->{'AgentSelfNotifyOnAction'} =  1;
    $Self->{'FQDN'} =  'otrs.firma.de';
    $Self->{'Organization'} =  'Mayer GmbH';
    $Self->{'CheckMXRecord'} =  '0';
    $Self->{'Frontend::Customer::CustomerPanelLogoutURL'} =  'http://localhost/login.html';
    $Self->{'CustomerGroupSupport'} =  1;
    
    $Self->{'Daemon::SchedulerCronTaskManager::Task'}->{'MailAccountFetch'} =  {
      'Function' => 'Execute',
      'MaximumParallelInstances' => '1',
      'Module' => 'Kernel::System::Console::Command::Maint::PostMaster::MailAccountFetch',
      'Params' => [],
      'Schedule' => '*/1 * * * *',
      'TaskName' => 'MailAccountFetch'
    };
    $Self->{'Daemon::SchedulerCronTaskManager::Task'}->{'OTRSBusinessAvailabilityCheck'} =  {
      'Function' => 'Execute',
      'MaximumParallelInstances' => '1',
      'Module' => 'Kernel::System::Console::Command::Maint::OTRSBusiness::AvailabilityCheck',
      'Params' => [],
      'Schedule' => '0 0 1 1 *',
      'TaskName' => 'OTRSBusinessAvailabilityCheck'
    };
    $Self->{'Frontend::Module'}->{'AdminGenericAgent'} =  {
      'Description' => 'This module is part of the admin area of OTRS.',
      'Group' => [
        'admin',
        'users'
      ],
      'GroupRo' => [],
      'NavBarName' => 'Admin',
      'Title' => 'GenericAgent'
    };
    $Self->{'Ticket::Frontend::AccountTime'} = '0';
    delete $Self->{'Ticket::Frontend::TimeUnits'};
    $Self->{'OTRSEscalationEvents::DecayTime'} =  '1';
    delete $Self->{'Frontend::NavigationModule'}->{'AdminOTRSBusiness'};
    delete $Self->{'Frontend::Module'}->{'AgentOTRSBusiness'};
    delete $Self->{'Loader::Module::AgentOTRSBusiness'}->{'001-Framework'};
    delete $Self->{'Frontend::NotifyModule'}->{'1100-OTRSBusiness'};
    delete $Self->{'CustomerFrontend::NotifyModule'}->{'1-OTRSBusiness'};
delete $Self->{'Ticket::Frontend::MenuModule'}->{'999-TeaserAttachmentView'};
$Self->{'PreferencesGroups'}->{'CreateNextMask'} =  {
  'Active' => '1',
  'Data' => {
    '0' => 'Create Ticket',
    'AgentTicketZoom' => 'Ticket Zoom'
  },
  'DataSelected' => 'AgentTicketZoom',
  'Desc' => 'Configure which screen should be shown after a new ticket has been created.',
  'Key' => '',
  'Label' => 'Screen after new ticket',
  'Module' => 'Kernel::Output::HTML::Preferences::Generic',
  'PrefKey' => 'UserCreateNextMask',
  'PreferenceGroup' => 'Miscellaneous',
  'Prio' => '3000'
};
$Self->{'PreferencesGroups'}->{'RefreshTime'} =  {
  'Active' => '0',
  'Data' => {
    '0' => 'off',
    '10' => '10 minutes',
    '15' => '15 minutes',
    '2' => ' 2 minutes',
    '5' => ' 5 minutes',
    '7' => ' 7 minutes'
  },
  'DataSelected' => '0',
  'Desc' => 'If enabled, the different overviews (Dashboard, LockedView, QueueView) will automatically refresh after the specified time.',
  'Key' => '',
  'Label' => 'Overview Refresh Time',
  'Module' => 'Kernel::Output::HTML::Preferences::Generic',
  'PrefKey' => 'UserRefreshTime',
  'PreferenceGroup' => 'Miscellaneous',
  'Prio' => '2000'
};
$Self->{'CustomerPreferencesGroups'}->{'RefreshTime'} =  {
  'Active' => '0',
  'Data' => {
    '0' => 'off',
    '10' => '10 minutes',
    '15' => '15 minutes',
    '2' => ' 2 minutes',
    '5' => ' 5 minutes',
    '7' => ' 7 minutes'
  },
  'DataSelected' => 'off',
  'Desc' => 'Select after which period ticket overviews should refresh automatically.',
  'Key' => 'Refresh interval',
  'Label' => 'Ticket overview',
  'Module' => 'Kernel::Output::HTML::Preferences::Generic',
  'PrefKey' => 'UserRefreshTime',
  'PreferenceGroup' => 'UserProfile',
  'Prio' => '4000'
};

$Self->{'Ticket::Responsible'} =  1;
$Self->{'Ticket::ResponsibleAutoSet'} =  '0';

$Self->{'Ticket::Frontend::AgentTicketEmail'}->{'DynamicField'} =  {
    'Market' => '2',
};
$Self->{'Ticket::Frontend::AgentTicketPhone'}->{'DynamicField'} =  {
    'Market' => '2',
};
$Self->{'Ticket::Frontend::CustomerTicketMessage'}->{'DynamicField'} =  {
    'Market' => '2',
};

$Self->{'Frontend::ToolBarModule'}->{'130-Ticket::AgentTicketEscalation'} =  {
  'AccessKey' => 'w',
  'Action' => 'AgentTicketEscalationView',
  'CssClass' => 'EscalationView',
  'Icon' => 'fa fa-exclamation',
  'Link' => 'Action=AgentTicketEscalationView',
  'Module' => 'Kernel::Output::HTML::ToolBar::Link',
  'Name' => 'Escalation view',
  'Priority' => '1010030'
};
$Self->{'Frontend::ToolBarModule'}->{'110-Ticket::AgentTicketQueue'} =  {
  'AccessKey' => 'q',
  'Action' => 'AgentTicketQueue',
  'CssClass' => 'QueueView',
  'Icon' => 'fa fa-folder',
  'Link' => 'Action=AgentTicketQueue',
  'Module' => 'Kernel::Output::HTML::ToolBar::Link',
  'Name' => 'Queue view',
  'Priority' => '1010010'
};
$Self->{'Frontend::ToolBarModule'}->{'120-Ticket::AgentTicketStatus'} =  {
  'AccessKey' => '',
  'Action' => 'AgentTicketStatusView',
  'CssClass' => 'StatusView',
  'Icon' => 'fa fa-list-ol',
  'Link' => 'Action=AgentTicketStatusView',
  'Module' => 'Kernel::Output::HTML::ToolBar::Link',
  'Name' => 'Status view',
  'Priority' => '1010020'
};

$Self->{'Frontend::Navigation'}->{'AgentFAQAdd'}->{'002-FAQ'} =  [
  {
    'AccessKey' => 'b',
    'Block' => '',
    'Description' => 'New FAQ Article.',
    'Group' => ['admin'],
    'GroupRo' => [],
    'Link' => 'Action=AgentFAQAdd',
    'LinkOption' => '',
    'Name' => 'New',
    'NavBar' => 'FAQ',
    'Prio' => '920',
    'Type' => ''
  }
];
$Self->{'Frontend::Navigation'}->{'AgentStatistics'}->{'001-Framework'} =  [
  {
    'AccessKey' => '',
    'Block' => 'ItemArea',
    'Description' => '',
    'Group' => [
      'stats'
    ],
    'GroupRo' => [
      'stats'
    ],
    'Link' => 'Action=AgentStatistics;Subaction=Overview',
    'LinkOption' => '',
    'Name' => 'Reports',
    'NavBar' => 'Reports',
    'Prio' => '8500',
    'Type' => 'Menu'
  },
  {
    'AccessKey' => '',
    'Block' => '',
    'Description' => '',
    'Group' => [
      'stats'
    ],
    'GroupRo' => [
      'stats'
    ],
    'Link' => 'Action=AgentStatisticsReports;Subaction=Overview',
    'LinkOption' => 'class="OTRSBusinessRequired"',
    'Name' => 'Reports (OTRS Business Solution™)',
    'NavBar' => '',
    'Prio' => '100',
    'Type' => ''
  },
  {
    'AccessKey' => '',
    'Block' => '',
    'Description' => '',
    'Group' => [
      'stats'
    ],
    'GroupRo' => [
      'stats'
    ],
    'Link' => 'Action=AgentStatistics;Subaction=Overview',
    'LinkOption' => '',
    'Name' => 'Statistics',
    'NavBar' => 'Reports',
    'Prio' => '200',
    'Type' => ''
  }
];
$Self->{'Frontend::Navigation'}->{'AgentAppointmentCalendarOverview'}->{'002-Calendar'} =  [
  {
    'AccessKey' => '',
    'Block' => 'ItemArea',
    'Description' => '',
    'Group' => [],
    'GroupRo' => [],
    'Link' => 'Action=AgentAppointmentCalendarOverview',
    'LinkOption' => '',
    'Name' => 'Calendar',
    'NavBar' => 'Calendar',
    'Prio' => '75',
    'Type' => 'Menu'
  },
  {
    'AccessKey' => '',
    'Block' => 'ItemArea',
    'Description' => 'Appointment Calendar overview page.',
    'Group' => [],
    'GroupRo' => [],
    'Link' => 'Action=AgentAppointmentCalendarOverview',
    'LinkOption' => '',
    'Name' => 'Calendar Overview',
    'NavBar' => 'Calendar',
    'Prio' => '6000',
    'Type' => ''
  },
  {
    'AccessKey' => '',
    'Block' => 'ItemArea',
    'Description' => 'Resource Overview (OTRS Business Solution™)',
    'Group' => [],
    'GroupRo' => [],
    'Link' => 'Action=AgentAppointmentCalendarOverview',
    'LinkOption' => 'class="OTRSBusinessRequired"',
    'Name' => 'Resource Overview (OTRS Business Solution™)',
    'NavBar' => '',
    'Prio' => '7000',
    'Type' => ''
  },
  {
    'AccessKey' => '',
    'Block' => 'ItemArea',
    'Description' => 'Create new appointment.',
    'Group' => ['admin'],
    'GroupRo' => [],
    'Link' => 'Action=AgentAppointmentCalendarOverview;Subaction=AppointmentCreate',
    'LinkOption' => '',
    'Name' => 'New Appointment',
    'NavBar' => 'Calendar',
    'Prio' => '8000',
    'Type' => ''
  }
];

$Self->{'Ticket::TicketDynamicFieldDefault'}->{'Element2'} =  {
  'Event' => 'TicketCustomerUpdate',
  'Name' => 'CreateByType',
  'Value' => 'Customer'
};
$Self->{'Ticket::TicketDynamicFieldDefault'}->{'Element1'} =  {
  'Event' => 'TicketCreate',
  'Name' => 'CreateByType',
  'Value' => 'Agent'
};
$Self->{'Ticket::EventModulePost'}->{'TicketDynamicFieldDefault'} =  {
  'Module' => 'Kernel::System::Ticket::Event::TicketDynamicFieldDefault',
  'Transaction' => '1'
};
$Self->{'Ticket::Frontend::AgentTicketZoom'}->{'DynamicField'} =  {
  'Type' => '1',
  'username' => '1',
  'firstname' => '1',
  'lastname' => '1',
  'email' => '1'
};


$Self->{'Frontend::Module'}->{'AgentTicketWatchView'} =  {
  'Description' => 'Watched Tickets.',
  'Loader' => {
    'CSS' => [
      'Core.AgentTicketQueue.css',
      'Core.AllocationList.css'
    ],
    'JavaScript' => [
      'Core.UI.AllocationList.js',
      'Core.Agent.TableFilters.js'
    ]
  },
  'NavBar' => [
    {
      'AccessKey' => '',
      'Block' => '',
      'Description' => 'Overview of all your watched Tickets.',
      'Link' => 'Action=AgentTicketWatchView',
      'LinkOption' => '',
      'Name' => 'Watch view',
      'NavBar' => 'Ticket',
      'Prio' => '150',
      'Type' => ''
    }
  ],
  'NavBarName' => 'Ticket',
  'Title' => 'Watched Tickets'
};
$Self->{'Frontend::Module'}->{'AgentTicketResponsibleView'} =  {
  'Description' => 'Responsible Tickets.',
  'Loader' => {
    'CSS' => [
      'Core.AllocationList.css'
    ],
    'JavaScript' => [
      'Core.UI.AllocationList.js',
      'Core.Agent.TableFilters.js'
    ]
  },
  'NavBar' => [
    {
      'AccessKey' => '',
      'Block' => '',
      'Description' => 'Overview of all your responsible Tickets.',
      'Link' => 'Action=AgentTicketResponsibleView',
      'LinkOption' => '',
      'Name' => 'Responsible view',
      'NavBar' => 'Ticket',
      'Prio' => '130',
      'Type' => ''
    }
  ],
  'NavBarName' => 'Ticket',
  'Title' => 'Responsible Tickets'
};
$Self->{'Frontend::Module'}->{'AgentTicketLockedView'} =  {
  'Description' => 'Locked Tickets.',
  'Loader' => {
    'CSS' => [
      'Core.AgentTicketQueue.css',
      'Core.AllocationList.css'
    ],
    'JavaScript' => [
      'Core.UI.AllocationList.js',
      'Core.Agent.TableFilters.js'
    ]
  },
  'NavBar' => [
    {
      'AccessKey' => '',
      'Block' => '',
      'Description' => 'Overview of all your locked Tickets.',
      'Link' => 'Action=AgentTicketLockedView',
      'LinkOption' => '',
      'Name' => 'Locked view',
      'NavBar' => 'Ticket',
      'Prio' => '140',
      'Type' => ''
    }
  ],
  'NavBarName' => 'Ticket',
  'Title' => 'Locked Tickets'
};

delete $Self->{'Frontend::Module'}->{'AgentTicketService'};

$Self->{'DashboardBackend'}->{'0260-TicketCalendar'} =  {
  'Block' => 'ContentSmall',
  'CacheTTL' => '2',
  'Default' => '0',
  'Group' => '',
  'Limit' => '6',
  'Module' => 'Kernel::Output::HTML::Dashboard::Calendar',
  'OwnerOnly' => '',
  'Permission' => 'rw',
  'Title' => 'Upcoming Events'
};
$Self->{'DashboardBackend'}->{'0110-TicketEscalation'} =  {
  'Attributes' => 'TicketEscalationTimeOlderMinutes=1;SortBy=EscalationTime;OrderBy=Down;',
  'Block' => 'ContentLarge',
  'CacheTTLLocal' => '0.5',
  'Default' => '1',
  'DefaultColumns' => {
    'Age' => '2',
    'Changed' => '1',
    'Created' => '1',
    'CustomerCompanyName' => '1',
    'CustomerID' => '1',
    'CustomerName' => '1',
    'CustomerUserID' => '1',
    'EscalationResponseTime' => '1',
    'EscalationSolutionTime' => '1',
    'EscalationTime' => '1',
    'EscalationUpdateTime' => '1',
    'Lock' => '1',
    'Owner' => '1',
    'PendingTime' => '1',
    'Priority' => '1',
    'Queue' => '1',
    'Responsible' => '1',
    'SLA' => '1',
    'Service' => '1',
    'State' => '1',
    'TicketNumber' => '2',
    'Title' => '2',
    'Type' => '1'
  },
  'Description' => 'All escalated tickets',
  'Filter' => 'All',
  'Group' => '',
  'Limit' => '10',
  'Module' => 'Kernel::Output::HTML::Dashboard::TicketGeneric',
  'Permission' => 'rw',
  'Time' => 'EscalationTime',
  'Title' => 'Escalated Tickets'
};
$Self->{'DashboardBackend'}->{'0100-TicketPendingReminder'} =  {
  'Attributes' => 'TicketPendingTimeOlderMinutes=1;StateType=pending reminder;SortBy=PendingTime;OrderBy=Down;',
  'Block' => 'ContentLarge',
  'CacheTTLLocal' => '0.5',
  'Default' => '0',
  'DefaultColumns' => {
    'Age' => '2',
    'Changed' => '1',
    'Created' => '1',
    'CustomerCompanyName' => '1',
    'CustomerID' => '1',
    'CustomerName' => '1',
    'CustomerUserID' => '1',
    'EscalationResponseTime' => '1',
    'EscalationSolutionTime' => '1',
    'EscalationTime' => '1',
    'EscalationUpdateTime' => '1',
    'Lock' => '1',
    'Owner' => '1',
    'PendingTime' => '1',
    'Priority' => '1',
    'Queue' => '1',
    'Responsible' => '1',
    'SLA' => '1',
    'Service' => '1',
    'State' => '1',
    'TicketNumber' => '2',
    'Title' => '2',
    'Type' => '1'
  },
  'Description' => 'All tickets with a reminder set where the reminder date has been reached',
  'Filter' => 'Locked',
  'Group' => '',
  'Limit' => '10',
  'Module' => 'Kernel::Output::HTML::Dashboard::TicketGeneric',
  'Permission' => 'rw',
  'Time' => 'UntilTime',
  'Title' => 'Reminder Tickets'
};
$Self->{'Ticket::Watcher'} =  '1';
$Self->{'Ticket::Type'} =  '1';
$Self->{'Fetchmail::Bin'} =  '/usr/bin/fetchmail';
$Self->{'DashboardBackend'}->{'0405-News'} =  {
  'Block' => 'ContentSmall',
  'CacheTTL' => '360',
  'Default' => '0',
  'Description' => '',
  'Group' => '',
  'Limit' => '6',
  'Module' => 'Kernel::Output::HTML::Dashboard::News',
  'Title' => 'OTRS News'
};
$Self->{'DashboardBackend'}->{'0390-UserOutOfOffice'} =  {
  'Block' => 'ContentSmall',
  'CacheTTLLocal' => '5',
  'Default' => '0',
  'Description' => '',
  'Group' => '',
  'Limit' => '10',
  'Module' => 'Kernel::Output::HTML::Dashboard::UserOutOfOffice',
  'SortBy' => 'UserFullname',
  'Title' => 'Out Of Office'
};
$Self->{'DashboardBackend'}->{'0000-ProductNotify'} =  {
  'Block' => 'ContentLarge',
  'CacheTTLLocal' => '1440',
  'Default' => '0',
  'Description' => 'News about OTRS releases!',
  'Group' => 'admin',
  'Module' => 'Kernel::Output::HTML::Dashboard::ProductNotify',
  'Title' => 'Product News'
};
$Self->{'Frontend::Module'}->{'AgentStatistics'} =  {
  'Description' => '',
  'Group' => [
    'admin'
  ],
  'GroupRo' => [
    'stats'
  ],
  'NavBarName' => 'Reports',
  'Title' => 'Statistics'
};
$Self->{'Frontend::Navigation'}->{'AgentDemoOTRS'}->{'002-DemoOTRS'} =  [
  {
    'AccessKey' => 'Currently at Step 5',
    'Block' => 'ItemArea',
    'Description' => 'Currently at Step 5',
    'Group' => [
      'users'
    ],
    'GroupRo' => [],
    'Link' => '',
    'LinkOption' => '',
    'Name' => 'Demo OTRS',
    'NavBar' => 'DemoOTRS',
    'Prio' => '8700',
    'Type' => 'Menu'
  },
  {
    'AccessKey' => '',
    'Block' => '',
    'Description' => 'Run an automated job to load the next configuration',
    'Group' => [],
    'GroupRo' => [],
    'Link' => 'Action=AdminGenericAgent;Subaction=Run;Profile=load%20step%2006;ChallengeToken=dYCUb0fj2OlNskvdnZM30B7uD2TIYLXa;',
    'LinkOption' => '',
    'Name' => 'Load Step 6',
    'NavBar' => 'DemoOTRS',
    'Prio' => '900',
    'Type' => ''
  }
];delete $Self->{'PreferencesGroups'}->{'SpellDict'};



$Self->{'Ticket::Frontend::CustomerTicketZoom'}->{'AttributesView'} =  {
  'Owner' => '0',
  'Priority' => '1',
  'Queue' => '1',
  'Responsible' => '0',
  'SLA' => '0',
  'Service' => '0',
  'State' => '1',
  'Type' => '1'
};
$Self->{'Ticket::Frontend::CustomerTicketMessage'}->{'QueueDefault'} =  'Support';
$Self->{'Ticket::Frontend::CustomerTicketMessage'}->{'Queue'} =  '0';
$Self->{'CustomerLogo'} =  {
  'StyleHeight' => '50px',
  'StyleTop' => '7px',
  'URL' => 'skins/Customer/itslab/logo.png'
};
$Self->{'CustomerHeadline'} =  'Mayer GmbH';
$Self->{'CustomerFrontend::Navigation'}->{'CustomerTicketOverview'}->{'002-Ticket'} =  [
  {
    'AccessKey' => 'm',
    'Block' => '',
    'Description' => 'Tickets.',
    'Group' => [],
    'GroupRo' => [],
    'Link' => 'Action=CustomerTicketOverview;Subaction=MyTickets',
    'LinkOption' => '',
    'Name' => 'Tickets',
    'NavBar' => 'Ticket',
    'Prio' => '100',
    'Type' => 'Menu'
  },
  {
    'AccessKey' => '',
    'Block' => '',
    'Description' => 'My Tickets.',
    'Group' => [],
    'GroupRo' => [],
    'Link' => 'Action=CustomerTicketOverview;Subaction=MyTickets',
    'LinkOption' => '',
    'Name' => 'My Tickets',
    'NavBar' => 'Ticket',
    'Prio' => '110',
    'Type' => 'Submenu'
  },
  {
    'AccessKey' => 't',
    'Block' => '',
    'Description' => 'Company Tickets.',
    'Group' => ['company'],
    'GroupRo' => [],
    'Link' => 'Action=CustomerTicketOverview;Subaction=CompanyTickets',
    'LinkOption' => '',
    'Name' => 'Company Tickets',
    'NavBar' => 'Ticket',
    'Prio' => '120',
    'Type' => 'Submenu'
  }
];
$Self->{'Ticket::Frontend::CustomerTicketMessage'}->{'Service'} =  '0';
$Self->{'Ticket::Frontend::CustomerTicketMessage'}->{'SLA'} =  '0';
delete $Self->{'NodeID'};


    # ---------------------------------------------------- #
    # ---------------------------------------------------- #

    $Self->{'LogModule'} = 'Kernel::System::Log::SysLog';
    $Self->{'LogModule::LogFile'} = '/tmp/otrs.log';
    $Self->{'DefaultLanguage'} = 'en';
    $Self->{'SendmailModule'} = 'Kernel::System::Email::SMTP';
    $Self->{'SendmailModule::Host'} = 'postfix';
    $Self->{'SendmailModule::Port'} = '25';
    $Self->{'SecureMode'} = 1;
    $Self->{'SendmailModule::AuthPassword'} =  'otrs';
    $Self->{'SendmailModule::AuthUser'} =  'support@firma.de';
    return 1;
}#END-of-own-config

# ---------------------------------------------------- #
# needed system stuff (don't edit this)                #
# ---------------------------------------------------- #

use base qw(Kernel::Config::Defaults);

# -----------------------------------------------------#

1;

