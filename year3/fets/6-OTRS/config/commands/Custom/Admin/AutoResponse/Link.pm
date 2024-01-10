# --
# Copyright (C) 2018 FH Aachen
# --

package Kernel::System::Console::Command::Custom::Admin::AutoResponse::Link;

use strict;
use warnings;

use base qw(Kernel::System::Console::BaseCommand);

our @ObjectDependencies = (
    'Kernel::System::AutoResponse',
);

sub Configure {
    my ( $Self, %Param ) = @_;

    $Self->Description('Link AutoResponses to a Queue.');
    $Self->AddOption(
        Name        => 'responseID',
        Description => "AutoResponse IDs.",
        Required    => 1,
        HasValue    => 1,
        ValueRegex  => qr/.*/smx,
    );
    $Self->AddOption(
        Name        => 'queue-name',
        Description => "Queue name the autoresponses should be linked to.",
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

    $Self->Print("<yellow>Linking autoresponses to queue...</yellow>\n");
    
    my $AutoResponseObject = $Kernel::OM->Get('Kernel::System::AutoResponse');
    my @AutoResponseIDs = split / / , $Self->GetOption('responseID');
    # add system address
    if ( !$AutoResponseObject->AutoResponseQueue (
        QueueID         => $Self->{QueueID},
        AutoResponseIDs => \@AutoResponseIDs,
        UserID          => 1,
        )
    )
    {
        $Self->PrintError("Can't link AutoResponses.");
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
