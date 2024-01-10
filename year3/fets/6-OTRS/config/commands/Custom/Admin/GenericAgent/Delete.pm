# --
# Copyright (C) 2018 FH Aachen
# --

package Kernel::System::Console::Command::Custom::Admin::GenericAgent::Delete;

use strict;
use warnings;

use base qw(Kernel::System::Console::BaseCommand);

our @ObjectDependencies = (
    'Kernel::System::GenericAgent',
);

sub Configure {
    my ( $Self, %Param ) = @_;

    $Self->Description('Delete a GenericAgent Job.');
    $Self->AddOption(
        Name        => 'name',
        Description => "Name of the Job",
        Required    => 1,
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

    $Self->Print("<yellow>Removing GenericAgent...</yellow>\n");
    my $GAObject = $Kernel::OM->Get('Kernel::System::GenericAgent');
    my $success = $GAObject->JobDelete(        
        Name => $Self->GetOption('name'),
        UserID     => 1,
        ); 
   if (!$success)
        {
            $Self->PrintError("Can't delete GenericAgent.");
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
