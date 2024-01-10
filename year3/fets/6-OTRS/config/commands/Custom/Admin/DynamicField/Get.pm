# --
# Copyright (C) 2018 FH Aachen
# --

package Kernel::System::Console::Command::Custom::Admin::DynamicField::Get;

use strict;
use warnings;
use YAML qw(LoadFile);
use Data::Dumper;

use base qw(Kernel::System::Console::BaseCommand);

our @ObjectDependencies = (
    'Kernel::System::DynamicField',
);

sub Configure {
    my ( $Self, %Param ) = @_;

    $Self->Description('Get a new DynamicField.');
    $Self->AddOption(
        Name        => 'name',
        Description => "Name of the DynamicField",
        Required    => 0,
        HasValue    => 1,
        ValueRegex  => qr/.*/smx,
    );
    $Self->AddOption(
        Name        => 'ID',
        Description => "id",
        Required    => 1,
        HasValue    => 1,
        ValueRegex  => qr/.*/smx,
    );

    # $Self->AddArgument(
    #     Name        => 'argument',
    #     Description => "Describe this argument.",
    #     Required    => 1,
    #     ValueRegex  => qr/.*/smx,
    # );

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

    $Self->Print("<yellow>Get DynamicField...</yellow>\n");
    my $DynamicFieldObject = $Kernel::OM->Get('Kernel::System::DynamicField');
    my $ret = $DynamicFieldObject->DynamicFieldGet(
        ID  => $Self->GetOption('ID'),       # this controls which object the dynamic field links to
        Name      => $Self->GetOption('name')
        );
    if (!$ret)
        {
            $Self->PrintError("Can't get DynamicField.");
            return $Self->ExitCodeError();
        }
    print Dumper($ret);
    print Dumper($ret->{Config});
    #print $yaml;
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

