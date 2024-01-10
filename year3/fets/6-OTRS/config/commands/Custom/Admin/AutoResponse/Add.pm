# --
# Copyright (C) 2018 FH Aachen
# --

package Kernel::System::Console::Command::Custom::Admin::AutoResponse::Add;

use strict;
use warnings;

use base qw(Kernel::System::Console::BaseCommand);

our @ObjectDependencies = (
    'Kernel::System::AutoResponse',
);

sub Configure {
    my ( $Self, %Param ) = @_;

    $Self->Description('Add an auto response');
    # $Self->AddOption(
    #     Name        => 'option',
    #     Description => "Describe this option.",
    #     Required    => 1,
    #     HasValue    => 1,
    #     ValueRegex  => qr/.*/smx,
    # );
    # $Self->AddArgument(
    #     Name        => 'argument',
    #     Description => "Describe this argument.",
    #     Required    => 1,
    #     ValueRegex  => qr/.*/smx,
    # );
    $Self->AddOption(
        Name        => 'name',
        Description => "Response name",
        Required    => 1,
        HasValue    => 1,
        ValueRegex  => qr/.*/smx,
    );
    $Self->AddOption(
        Name        => 'subject',
        Description => "Response subject",
        Required    => 1,
        HasValue    => 1,
        ValueRegex  => qr/.*/smx,
    );
    $Self->AddOption(
        Name        => 'response',
        Description => "Response body",
        Required    => 1,
        HasValue    => 1,
        ValueRegex  => qr/.*/smx,
    );
    $Self->AddOption(
        Name        => 'system-address-id',
        Description => 'ID of the system address which should be assigned to the new queue.',
        Required    => 0,
        HasValue    => 1,
        ValueRegex  => qr/\d/smx,
    );
    $Self->AddOption(
        Name        => 'system-address-name',
        Description => 'Name of the system address which should be assigned to the new queue.',
        Required    => 0,
        HasValue    => 1,
        ValueRegex  => qr/.*/smx,
    );
        $Self->AddOption(
        Name        => 'type',
        Description => 'TypeID of AutoResponse.',
        Required    => 0,
        HasValue    => 1,
        ValueRegex  => qr/.*/smx,
    );

    return;
}

# sub PreRun {
#     my ( $Self, %Param ) = @_;
#
#     # Perform any custom validations here. Command execution can be stopped with die().
#
#     # my $TargetDirectory = $Self->GetOption('target-directory');
#     # if ($TargetDirectory && !-d $TargetDirectory) {
#     #     die "Directory $TargetDirectory does not exist.\n";
#     # }
#
#     return;
# }

sub Run {
    my ( $Self, %Param ) = @_;

    $Self->Print("<yellow>Adding a new AutoResponse ...</yellow>\n");
    
    my $SystemAddressID   = $Self->GetOption('system-address-id');
    my $SystemAddressName = $Self->GetOption('system-address-name');

    # check System Address
    if ($SystemAddressName) {
        my %SystemAddressList = $Kernel::OM->Get('Kernel::System::SystemAddress')->SystemAddressList(
            Valid => 1
        );
        ADDRESS:
        for my $ID ( sort keys %SystemAddressList ) {
            my %SystemAddressInfo = $Kernel::OM->Get('Kernel::System::SystemAddress')->SystemAddressGet(
                ID => $ID
            );
            if ( $SystemAddressInfo{Name} eq $SystemAddressName ) {
                $SystemAddressID = $ID;
                last ADDRESS;
            }
        }
        if ( !$SystemAddressID ) {
            $Self->PrintError("Address $SystemAddressName not found\n");
            return $Self->ExitCodeError();
        }
    }

    if (
        !$Kernel::OM->Get('Kernel::System::AutoResponse')->AutoResponseAdd(
        Name        => $Self->GetOption('name'),
        ValidID     => 1,
        Subject     => $Self->GetOption('subject'),
        Response    => $Self->GetOption('response'),
        ContentType => 'text/html',
        TypeID      => $Self->GetOption('type') || 1,
        UserID      => 1,
        AddressID   => $SystemAddressID,
    )
    )
    {
        $Self->PrintError("Can't add auto response.");
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
