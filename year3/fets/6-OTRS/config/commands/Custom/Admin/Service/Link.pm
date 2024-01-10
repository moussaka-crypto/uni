# --
# Copyright (C) 2001-2018 OTRS AG, http://otrs.com/
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

package Kernel::System::Console::Command::Custom::Admin::Service::Link;

use strict;
use warnings;
use Data::Dumper;
use parent qw(Kernel::System::Console::BaseCommand);

our @ObjectDependencies = (
    'Kernel::System::Service',
    'Kernel::System::CustomerUser',
);

sub Configure {
    my ( $Self, %Param ) = @_;

    $Self->Description('Link a Service to a CustomerUser.');
    $Self->AddOption(
        Name        => 'service',
        Description => 'ServiceID.',
        Required    => 1,
        HasValue    => 1,
        ValueRegex  => qr/.*/smx,
    );
    $Self->AddOption(
        Name        => 'customeruser',
        Description => 'Customer User the service will be assigned to.',
        Required    => 1,
        HasValue    => 1,
        ValueRegex  => qr/.*/smx,
    );
    return;
}

sub Run {
    my ( $Self, %Param ) = @_;

    $Self->Print("<yellow>Linking Service to CustomerUser..</yellow>\n");
    my $ServiceObject = $Kernel::OM->Get('Kernel::System::Service');
    my $CustomerObject = $Kernel::OM->Get('Kernel::System::CustomerUser');

    #customeruser lookup
    my %List = $CustomerObject->CustomerSearch(UserLogin => $Self->GetOption('customeruser'),  Valid => 1,);
    for my $user (keys %List) {
        if (!$Self->GetOption('customeruser') =~ m/^$user$/) { 
             $Self->PrintError("A CustomerUser with this login name does not exist. Can't link Service.\n");
             return $Self->ExitCodeError();}
    }

    # add Service
    my $Success = $ServiceObject->CustomerUserServiceMemberAdd(
        CustomerUserLogin => $Self->GetOption('customeruser'),
        ServiceID         => $Self->GetOption('service'),
        Active            => 1,
        UserID            => 1,
    );

    # error handling
    if ( !$Success ) {
        $Self->PrintError("Can't link service.\n");
        return $Self->ExitCodeError();
    }

    $Self->Print("<green>Done.</green>\n");

    return $Self->ExitCodeOk();
}

1;
