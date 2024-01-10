# --
# Copyright (C) 2018 FH Aachen
# --

package Kernel::System::Console::Command::Custom::Admin::ACL::Update;

use strict;
use warnings;
use YAML qw(LoadFile);

use base qw(Kernel::System::Console::BaseCommand);

our @ObjectDependencies = (
    'Kernel::System::ACL::DB::ACL',
);

sub Configure {
    my ( $Self, %Param ) = @_;

    $Self->Description('Update an ACL.');
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

    $Self->Print("<yellow>Updating ACL...</yellow>\n");
    
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
    my $yaml;
    {
      local $/; #Enable 'slurp' mode
      open my $fh, "<", $file;
      $yaml = <$fh>;
      close $fh;
    }
#   my $ACL = LoadFile($yaml);
#   my $ConfigChange = $ACL->[0]->{'ConfigChange'};
#   my $ConfigMatch = $ACL->[0]->{'ConfigMatch'};
    if (
#        !$ACLObject->ACLUpdate(
#        ID             => $Self->GetOption('ID'),
#        Name           => $Self->GetOption('name'),           # mandatory
#        Comment        => $Self->GetOption('comment'),            # optional
#        Description    => $Self->GetOption('description'),        # optional
#        StopAfterMatch => $Self->GetOption('stop-after-match'),   # optional
#        ConfigMatch    => $ConfigMatch,  # optional
#        ConfigChange   => $ConfigChange, # optional
#        ValidID        => $Self->GetOption('valid'),                    # mandatory
#        UserID         => 1,                  # mandatory
#        )
#        my $ret =
         !$ACLObject->ACLImport(
         Content                   => $yaml, # mandatory, YAML format
         OverwriteExistingEntities => $Self->GetOption('overwrite') // 1,
         UserID                    => 1,            # mandatory
         )
       )
    {
        $Self->PrintError("Can't update ACL.");
        return $Self->ExitCodeError();
    }
#   print Dumper($ret);
#   print $yaml;
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
