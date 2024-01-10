# --
# Copyright (C) 2018 FH Aachen
# --

package Kernel::System::Console::Command::Custom::Admin::GenericAgent::Add;

use strict;
use warnings;
use YAML qw(LoadFile);
use Data::Dumper;

use base qw(Kernel::System::Console::BaseCommand);

our @ObjectDependencies = (
    'Kernel::System::GenericAgent',
);

sub Configure {
    my ( $Self, %Param ) = @_;

    $Self->Description('Add a new GenericAgent Job.');
    $Self->AddOption(
        Name        => 'name',
        Description => "Name of the Job",
        Required    => 1,
        HasValue    => 1,
        ValueRegex  => qr/.*/smx,
    );
    $Self->AddOption(
        Name        => 'file',
        Description => "name of the yaml file",
        Required    => 1,
        HasValue    => 1,
        ValueRegex  => qr/.*/smx,
    );
    $Self->AddOption(
        Name        => 'path',
        Description => "path to yaml file",
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

    $Self->Print("<yellow>Adding new GenericAgent...</yellow>\n");
    my $file;
    if (!$Self->GetOption('path'))
    { 
        $file = join "", "/opt/otrs/Kernel/System/Console/Command/Custom/Admin/GenericAgent/yml", $Self->GetOption('file'); 
    }
    else
    {
        $file = join "/", $Self->GetOption('path'), $Self->GetOption('file');
    }
    my $GAObject = $Kernel::OM->Get('Kernel::System::GenericAgent');
    my $yaml = loadyaml($file);
    my $YAMLObject = $Kernel::OM->Get('Kernel::System::YAML');
    my $ConfigHashRef = $YAMLObject->Load(
        Data => $yaml,
    );
    my $success = $GAObject->JobAdd(        
        Name => $Self->GetOption('name'),
        Data   => $ConfigHashRef,
        UserID     => 1,
        ); 
   if (!$success)
        {
            $Self->PrintError("Can't add GenericAgent.");
            return $Self->ExitCodeError();
        }
    $Self->Print("<green>Done.</green>\n");
    return $Self->ExitCodeOk();
}

sub loadyaml {
    my $file = shift;
    open my $fh, '<', $file or die "Could not open YAML config file $file/!";
    local $/ = undef;
    my $cont = <$fh>;
    close $fh;
    return $cont;
}
# sub PostRun {
#     my ( $Self, %Param ) = @_;
#
#     # This will be called after Run() (even in case of exceptions). Perform any cleanups here.
#
#     return;
# }

1;
