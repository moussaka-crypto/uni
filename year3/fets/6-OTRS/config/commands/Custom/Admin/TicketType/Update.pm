# --
# Copyright (C) 2018 FH Aachen
# --

package Kernel::System::Console::Command::Custom::Admin::TicketType::Update;

use strict;
use warnings;

use base qw(Kernel::System::Console::BaseCommand);

our @ObjectDependencies = (
    'Kernel::System::Type',
);

sub Configure {
    my ( $Self, %Param ) = @_;

    $Self->Description('Update a ticket type.');
    $Self->AddOption(
        Name        => 'name',
        Description => "Name of the ticket type.",
        Required    => 1,
        HasValue    => 1,
        ValueRegex  => qr/.*/smx,
    );
    $Self->AddOption(
        Name        => 'ID',
        Description => "Name of the ticket type.",
        Required    => 1,
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

    return;
}

sub Run {
    my ( $Self, %Param ) = @_;

    $Self->Print("<yellow>Updating ticket type...</yellow>\n");

    # add ticket type
    if (
        !$Kernel::OM->Get('Kernel::System::Type')->TypeUpdate(
            UserID  => 1,
            ValidID => $Self->GetOption('valid'),
            ID      => $Self->GetOption('ID'),
            Name    => $Self->GetOption('name'),
        )
        )
    {
        $Self->PrintError("Can't update ticket type.");
        return $Self->ExitCodeError();
    }

    $Self->Print("<green>Done.</green>\n");
    return $Self->ExitCodeOk();
}

1;
