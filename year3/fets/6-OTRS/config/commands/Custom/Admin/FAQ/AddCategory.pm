# --
# Copyright (C) 2018 FH Aachen
# --

package Kernel::System::Console::Command::Custom::Admin::FAQ::AddCategory;

use strict;
use warnings;
use YAML qw(LoadFile);
use Data::Dumper;

use base qw(Kernel::System::Console::BaseCommand);

our @ObjectDependencies = (
    'Kernel::System::FAQ',
);

sub Configure {
    my ( $Self, %Param ) = @_;

    $Self->Description('Add a new FAQ Category.');
    $Self->AddOption(
        Name        => 'name',
        Description => "Name of the FAQ Category",
        Required    => 1,
        HasValue    => 1,
        ValueRegex  => qr/.*/smx,
    );
    $Self->AddOption(
        Name        => 'parent',
        Description => "parent category",
        Required    => 1,
        HasValue    => 1,
        ValueRegex  => qr/.*/smx,
    );
    $Self->AddOption(
        Name        => 'groups',
        Description => "Object type",
        Required    => 1,
        HasValue    => 1,
        ValueRegex  => qr/.*/smx,
    );
    $Self->AddOption(
        Name        => 'valid',
        Description => "Field type",
        Required    => 0,
        HasValue    => 1,
        ValueRegex  => qr/.*/smx,
    );
    $Self->AddOption(
        Name        => 'comment',
        Description => "Object type",
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

    $Self->Print("<yellow>Adding new FAQ Category...</yellow>\n");
    my $FAQObject = $Kernel::OM->Get('Kernel::System::FAQ');
    my $category = $FAQObject->CategoryAdd(        
        ValidID => $Self->GetOption('valid') || 1,
        ParentID   => $Self->GetOption('parent'),
        Name       => $Self->GetOption('name'),
        Comment    => $Self->GetOption('comment') || '',
        UserID     => 1,
        ); 
    my @groups = split /,/, $Self->GetOption('groups');
    my $success = $FAQObject->SetCategoryGroup(
        CategoryID => $category,
        GroupIDs   => \@groups,
        UserID     => 1, 
        );
   if (!$success)
        {
            $Self->PrintError("Can't add FAQ Category.");
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
