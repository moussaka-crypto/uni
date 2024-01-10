# --
# Copyright (C) 2018 FH Aachen
# --

package Kernel::System::Console::Command::Custom::Admin::PostMasterFilter::Add;

use strict;
use warnings;
use YAML qw(LoadFile);
use Data::Dumper;

use base qw(Kernel::System::Console::BaseCommand);

our @ObjectDependencies = (
    'Kernel::System::PostMaster::Filter',
);

sub Configure {
    my ( $Self, %Param ) = @_;

    $Self->Description('Add a Postmaster Filter');
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
        Description => "Filter name",
        Required    => 1,
        HasValue    => 1,
        ValueRegex  => qr/.*/smx,
    );
    $Self->AddOption(
        Name        => 'file',
        Description => 'yaml file name',
        Required    => 0,
        HasValue    => 1,
        ValueRegex  => qr/.*/smx,
    );
    $Self->AddOption(
        Name        => 'path',
        Description => 'path to yaml file',
        Required    => 0,
        HasValue    => 1,
        ValueRegex  => qr/.*/smx,
    );
        $Self->AddOption(
        Name        => 'stop',
        Description => 'StopAfterMatch.',
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

    $Self->Print("<yellow>Adding a new PostMaster Filter ...</yellow>\n");
    my $PMFilterObject = $Kernel::OM->Get('Kernel::System::PostMaster::Filter');
    my %List = $PMFilterObject->FilterList();
    for my $filter (values %List) {
          if ($Self->GetOption('name') =~ m/^$filter$/) { 
             $Self->PrintError("A postmaster filter with this name already exists. Can't add PostMaster Filter.\n");
             return $Self->ExitCodeError();}
    }

    return;
    my $file;
    if (!$Self->GetOption('path'))
    { 
        $file = join "", "/opt/otrs/Kernel/System/Console/Command/Custom/Admin/PostMasterFilter/", $Self->GetOption('file'); 
    }
    else
    {
        $file = join "/", $Self->GetOption('path'), $Self->GetOption('file');
    }
    my $yaml = loadyaml($file);
    my $YAMLObject = $Kernel::OM->Get('Kernel::System::YAML');
    my $Content = $YAMLObject->Load(
        Data => $yaml,
    );

    my $Match = $Content->{Match};
    my $No = $Content->{No};
    my $Set = $Content->{Set};

    if (
        !$PMFilterObject->FilterAdd(
        Name           => $Self->GetOption('name'),
        StopAfterMatch => $Self->GetOption('stop') || 0,
        Match => $Match,
        No => $No,
        Set => $Set
    )
    )

    {
        $Self->PrintError("Can't add Postmaster Filter.");
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
