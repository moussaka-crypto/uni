# --
# Copyright (C) 2001-2018 OTRS AG, http://otrs.com/
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

package Kernel::System::Console::Command::Custom::Admin::Group::Update;

use strict;
use warnings;

use parent qw(Kernel::System::Console::BaseCommand);

our @ObjectDependencies = (
    'Kernel::System::Group'
);

sub Configure {
    my ( $Self, %Param ) = @_;

    $Self->Description('Update a group.');
    $Self->AddOption(
        Name        => 'ID',
        Description => 'ID of the role.',
        Required    => 1,
        HasValue    => 1,
        ValueRegex  => qr/.*/smx,
    );
    $Self->AddOption(
        Name        => 'name',
        Description => "Name of the group.",
        Required    => 1,
        HasValue    => 1,
        ValueRegex  => qr/.*/smx,
    );
    $Self->AddOption(
        Name        => 'valid',
        Description => 'ValidID of the role.',
        Required    => 0,
        HasValue    => 1,
        ValueRegex  => qr/.*/smx,
    );
    $Self->AddOption(
        Name        => 'comment',
        Description => "Comment for the group.",
        Required    => 0,
        HasValue    => 1,
        ValueRegex  => qr/.*/smx,
    );

    return;
}

sub Run {
    my ( $Self, %Param ) = @_;

    $Self->Print("<yellow>Updating group...</yellow>\n");

    my $Success = $Kernel::OM->Get('Kernel::System::Group')->GroupUpdate(
        ID    => $Self->GetOption('ID'),
        Name    => $Self->GetOption('name'),
        Comment => $Self->GetOption('comment') || '',
        ValidID => $Self->GetOption('valid') || 1,
        UserID  => 1,
    );

    # error handling
    if ( !$Success ) {
        $Self->PrintError("Can't update group.\n");
        return $Self->ExitCodeError();
    }

    $Self->Print("<green>Done.</green>\n");

    return $Self->ExitCodeOk();
}

1;
