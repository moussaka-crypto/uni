# --
# Copyright (C) 2018 FH Aachen
# --

package Kernel::System::Console::Command::Custom::Admin::ACL::Add;

use strict;
use warnings;
use YAML qw(LoadFile);
use Data::Dumper;

use base qw(Kernel::System::Console::BaseCommand);

our @ObjectDependencies = (
    'Kernel::System::ACL::DB::ACL',
);

sub Configure {
    my ( $Self, %Param ) = @_;

    $Self->Description('Add a new ACL.');
    $Self->AddOption(
        Name        => 'file',
        Description => "Filename of the ACL yaml file.",
        Required    => 1,
        HasValue    => 1,
        ValueRegex  => qr/.*/smx,
    );
    $Self->AddOption(
        Name        => 'path',
        Description => "Path to the ACL yaml file.",
        Required    => 0,
        HasValue    => 1,
        ValueRegex  => qr/.*/smx,
    );
    $Self->AddOption(
        Name        => 'overwrite',
        Description => "OverwriteExistingEntities (0 | 1)",
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

    $Self->Print("<yellow>Adding new ACL...</yellow>\n");

    my $ACLObject = $Kernel::OM->Get('Kernel::System::ACL::DB::ACL');
    my $file;
    if (!$Self->GetOption('path'))
    { 
        $file = join "", "/opt/otrs/Kernel/System/Console/Command/Custom/Admin/ACL/", $Self->GetOption('file'); 
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

    if (
       !$ACLObject->ACLImport(
        Content                   => $yaml, # mandatory, YAML format
        OverwriteExistingEntities => $Self->GetOption('overwrite') // 0,            # 0 || 1
        UserID                    => 1,            # mandatory
        )
      )
        {
            $Self->PrintError("Can't add ACL.");
            return $Self->ExitCodeError();
        }

         my $Location = $Kernel::OM->Get('Kernel::Config')->Get('Home') . '/Kernel/Config/Files/ZZZACL.pm';
         my $ACLDump = $ACLObject->ACLDump(
            ResultType => 'FILE',
            Location   => $Location,
            UserID     => 1,
        );
        if ($ACLDump) {
            my $Success = $ACLObject->ACLsNeedSyncReset();
            if ($Success) {
                    $Self->Print("<green>Done.</green>\n"); 
                    return $Self->ExitCodeOk();
            }
            else {
               $Self->PrintError("Can't sync entity ACL.");
                return $Self->ExitCodeError();
            }
        }
        else {
            $Self->PrintError("Can't add ACL.");
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
