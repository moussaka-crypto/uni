# --
# Copyright (C) 2018 FH Aachen
# --

package Kernel::System::Console::Command::Custom::Admin::Webservice::Add;

use strict;
use warnings;

use base qw(Kernel::System::Console::BaseCommand);

our @ObjectDependencies = (
    'Kernel::System::YAML',
    'Kernel::System::GenericInterface::Webservice',
);

sub Configure {
    my ( $Self, %Param ) = @_;

    $Self->Description('Add a new Webservice.');
    $Self->AddOption(
        Name        => 'file',
        Description => "Filename of the Webservice yaml file.",
        Required    => 1,
        HasValue    => 1,
        ValueRegex  => qr/.*/smx,
    );
    $Self->AddOption(
        Name        => 'path',
        Description => "Path to the Webservice yaml file.",
        Required    => 0,
        HasValue    => 1,
        ValueRegex  => qr/.*/smx,
    );
    $Self->AddOption(
        Name        => 'name',
        Description => "Name of the Webservice.",
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

    $Self->Print("<yellow>Adding new Webservice...</yellow>\n");
    my $file;
    if (!$Self->GetOption('path'))
    { 
        $file = join "", "/opt/otrs/Kernel/System/Console/Command/Custom/Admin/Webservice/", $Self->GetOption('file'); 
    }
    else
    {
        $file = join "/", $Self->GetOption('path'), $Self->GetOption('file');
    }
    my $yaml = loadyaml($file);
    my $YAMLObject = $Kernel::OM->Get('Kernel::System::YAML');
    my $ConfigHashRef = $YAMLObject->Load(
        Data => $yaml,
    );
    my $WebserviceObject = $Kernel::OM->Get('Kernel::System::GenericInterface::Webservice');
    if (
       !$WebserviceObject->WebserviceAdd(
         Name    => $Self->GetOption('name'),
         Config  => $ConfigHashRef,
         ValidID => 1,
         UserID  => 1,
        )
      )
        {
            $Self->PrintError("Can't add webservice.");
            return $Self->ExitCodeError();
        }
    $Self->Print("<green>Done.</green>\n");
    return $Self->ExitCodeOk();
}

sub loadyaml {
    my $file = shift;
    open my $fh, '<', $file or die;
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
