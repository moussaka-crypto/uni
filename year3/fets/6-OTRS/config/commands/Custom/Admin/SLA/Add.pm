# --
# Copyright (C) 2001-2018 OTRS AG, http://otrs.com/
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

package Kernel::System::Console::Command::Custom::Admin::SLA::Add;

use strict;
use warnings;

use parent qw(Kernel::System::Console::BaseCommand);

our @ObjectDependencies = (
    'Kernel::System::SLA',
);

sub Configure {
    my ( $Self, %Param ) = @_;

    $Self->Description('Create a SLA.');
    $Self->AddOption(
        Name        => 'name',
        Description => 'SLA name.',
        Required    => 1,
        HasValue    => 1,
        ValueRegex  => qr/.*/smx,
    );
    $Self->AddOption(
        Name        => 'services',
        Description => 'ServiceIDs e.g.: "1 2 3 ..." .',
        Required    => 0,
        HasValue    => 1,
        ValueRegex  => qr/^[\d\s]+$/smx,
    );
    $Self->AddOption(
        Name        => 'comment',
        Description => 'Comment for the new SLA.',
        Required    => 0,
        HasValue    => 1,
        ValueRegex  => qr/.*/smx,
    );
    $Self->AddOption(
        Name        => 'first-response-notify',
        Description => 'Unlock timeout in minutes for the new SLA.',
        Required    => 0,
        HasValue    => 1,
        ValueRegex  => qr/\d/smx,
    );
    $Self->AddOption(
        Name        => 'first-response-time',
        Description => 'Ticket first respone time in minutes for the new SLA.',
        Required    => 0,
        HasValue    => 1,
        ValueRegex  => qr/\d/smx,
    );
    $Self->AddOption(
        Name        => 'update-time',
        Description => 'Ticket update time in minutes for the new SLA.',
        Required    => 0,
        HasValue    => 1,
        ValueRegex  => qr/\d/smx,
    );
    $Self->AddOption(
        Name        => 'solution-time',
        Description => 'Ticket solution time in minutes for the new SLA.',
        Required    => 0,
        HasValue    => 1,
        ValueRegex  => qr/\d/smx,
    );
    $Self->AddOption(
        Name        => 'calendar',
        Description => 'Name of the calendar for the new SLA.',
        Required    => 0,
        HasValue    => 1,
        ValueRegex  => qr/.*/smx,
    );
    $Self->AddOption(
        Name        => 'solution-notify',
        Description => 'notify agent if solution escalation is 80% reached"',
        Required    => 0,
        HasValue    => 1,
        ValueRegex  => qr/.*/smx,
    );

    return;
}

sub Run {
    my ( $Self, %Param ) = @_;

    $Self->Print("<yellow>Adding new SLA..</yellow>\n");

    my @Services = split / / , $Self->GetOption('services');
    # add sla
    my $Success = $Kernel::OM->Get('Kernel::System::SLA')->SLAAdd(
        Name              => $Self->GetOption('name'),
        ServiceIDs        => \@Services,
        Comment           => $Self->GetOption('comment'),
        SolutionNotify           => $Self->GetOption('solution-notify'),
        FirstResponseNotify     => $Self->GetOption('first-response-notify'),
        FirstResponseTime => $Self->GetOption('first-response-time'),
        UpdateTime        => $Self->GetOption('update-time'),
        SolutionTime      => $Self->GetOption('solution-time'),
        Calendar          => $Self->GetOption('calendar'),
        ValidID           => 1,
        UserID            => 1,
    );

    # error handling
    if ( !$Success ) {
        $Self->PrintError("Can't add SLA.\n");
        return $Self->ExitCodeError();
    }

    $Self->Print("<green>Done.</green>\n");

    return $Self->ExitCodeOk();
}

1;
