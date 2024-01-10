# --
# Copyright (C) 2018 FH Aachen
# --

package Kernel::System::Console::Command::Custom::Admin::DynamicField::Add;

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

    $Self->Description('Add a new DynamicField.');
    $Self->AddOption(
        Name        => 'name',
        Description => "Name of the DynamicField",
        Required    => 0,
        HasValue    => 1,
        ValueRegex  => qr/.*/smx,
    );
    $Self->AddOption(
        Name        => 'label',
        Description => "Label",
        Required    => 1,
        HasValue    => 1,
        ValueRegex  => qr/.*/smx,
    );
    $Self->AddOption(
        Name        => 'type',
        Description => "Field type",
        Required    => 0,
        HasValue    => 1,
        ValueRegex  => qr/.*/smx,
    );
    $Self->AddOption(
        Name        => 'object-type',
        Description => "Object type",
        Required    => 0,
        HasValue    => 1,
        ValueRegex  => qr/.*/smx,
    );
    $Self->AddOption(
        Name        => 'file',
        Description => "Name of the DynamicField config yaml file",
        Required    => 1,
        HasValue    => 1,
        ValueRegex  => qr/.*/smx,
    );
    $Self->AddOption(
        Name        => 'path',
        Description => "Path to the DynamicField config yaml file",
        Required    => 0,
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

    $Self->Print("<yellow>Adding new DynamicField...</yellow>\n");
    my $file = $Self->GetOption('file');
    my $type = $file =~ s/(DF_)(.+)(_.+)(\.yml)/$2/r;
    my $name = $file =~ s/(DF_)(.+_)(.+)(\.yml)/$3/r;

    if (!$Self->GetOption('path'))
    { 
        $file = join "", "/opt/otrs/Kernel/System/Console/Command/Custom/Admin/DynamicField/yml", $Self->GetOption('file'); 
    }
    else
    {
        $file = join "/", $Self->GetOption('path'), $Self->GetOption('file');
    }
    my $DynamicFieldObject = $Kernel::OM->Get('Kernel::System::DynamicField');
    my $yaml = loadyaml($file);
    my $YAMLObject = $Kernel::OM->Get('Kernel::System::YAML');
    my $ConfigHashRef = $YAMLObject->Load(
        Data => $yaml,
    );
    my $List = $DynamicFieldObject->DynamicFieldList();
    my $FieldOrder = $#$List+2;

    if (
       !$DynamicFieldObject->DynamicFieldAdd(
        InternalField => 0,             # optional, 0 or 1, internal fields are protected
        Name        => $Self->GetOption('name') || $name,  # mandatory
        Label       => $Self->GetOption('label'), # mandatory, label to show
        FieldOrder  => $FieldOrder,             # mandatory, display order
        FieldType   => $Self->GetOption('type') || $type,          # mandatory, selects the DF backend to use for this field
        ObjectType  => $Self->GetOption('object-type') || 'Ticket',       # this controls which object the dynamic field links to
                                        # allow only lowercase letters
        Config      => $ConfigHashRef,  # it is stored on YAML format
                                        # to individual articles, otherwise to tickets
        Reorder     => 1,               # or 0, to trigger reorder function, default 1
        ValidID     => 1,
        UserID      => 1,
        )
      )
        {
            $Self->PrintError("Can't add DynamicField.");
            return $Self->ExitCodeError();
        }
    #print Dumper($ret);
    #print $yaml;
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
