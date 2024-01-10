# --
# Copyright (C) 2018 FH Aachen
# --

package Kernel::System::Console::Command::Custom::Admin::SystemAddress::Update;

use strict;
use warnings;

use base qw(Kernel::System::Console::BaseCommand);

our @ObjectDependencies = (
    'Kernel::System::Queue',
    'Kernel::System::SystemAddress',
);

sub Configure {
    my ( $Self, %Param ) = @_;

    $Self->Description('Update a system address.');
    $Self->AddOption(
        Name        => 'ID',
        Description => "system address ID.",
        Required    => 1,
        HasValue    => 1,
        ValueRegex  => qr/.*/smx,
    );
    $Self->AddOption(
        Name        => 'name',
        Description => "Display name of the new system address.",
        Required    => 1,
        HasValue    => 1,
        ValueRegex  => qr/.*/smx,
    );
    $Self->AddOption(
        Name        => 'email-address',
        Description => "Email address which should be used for the new system address.",
        Required    => 0,
        HasValue    => 1,
        ValueRegex  => qr/.*/smx,
    );
    $Self->AddOption(
        Name        => 'queue-name',
        Description => "Queue name the address should be linked to.",
        Required    => 0,
        HasValue    => 1,
        ValueRegex  => qr/.*/smx,
    );
    $Self->AddOption(
        Name        => 'valid',
        Description => "ValidID.",
        Required    => 1,
        HasValue    => 1,
        ValueRegex  => qr/.*/smx,
    );
    $Self->AddOption(
        Name        => 'comment',
        Description => "Comment for the new system address.",
        Required    => 0,
        HasValue    => 1,
        ValueRegex  => qr/.*/smx,
    );

    return;
}

sub PreRun {
     my ( $Self, %Param ) = @_;

    # check if queue already exists
    if ( $Self->{QueueName} = $Self->GetOption('queue-name') ){
        $Self->{QueueID}   = $Kernel::OM->Get('Kernel::System::Queue')->QueueLookup(
            Queue => $Self->{QueueName},
        );
        if ( !$Self->{QueueID} ) {
            die "Queue $Self->{QueueName} does not exist.\n";
        }
    }


     return;
}

sub Run {
    my ( $Self, %Param ) = @_;

    $Self->Print("<yellow>Updating system address...</yellow>\n");

    # add system address
    if (
        !$Kernel::OM->Get('Kernel::System::SystemAddress')->SystemAddressUpdate(
            ID       => $Self->GetOption('ID'),
            UserID   => 1,
            ValidID  => $Self->GetOption('valid'),
            Comment  => $Self->GetOption('comment'),
            Realname => $Self->GetOption('name'),
            QueueID  => $Self->{QueueID},
            Name     => $Self->GetOption('email-address'),
        )
        )
    {
        $Self->PrintError("Can't update system address.");
        return $Self->ExitCodeError();
    }

    $Self->Print("<green>Done.</green>\n");
    return $Self->ExitCodeOk();
}

# sub PostRun {
#     my ( $Self, %Param ) = @_;
#
#     # This will be called after Run() (even in case of exceptions). Perform any cleanups here.
#
#     return;
# }

1;
