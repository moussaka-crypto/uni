# --
# Copyright (C) 2018 FH Aachen
# --


package Kernel::System::Console::Command::Custom::Admin::MailAccount::Add;

use strict;
use warnings;
use Data::Dumper;

use base qw(Kernel::System::Console::BaseCommand);

our @ObjectDependencies = (
    'Kernel::System::MailAccount',
);

sub Configure {
    my ( $Self, %Param ) = @_;

    $Self->Description('Add a new PostMaster Mail Account');
    $Self->AddOption(
        Name        => 'login',
        Description => "login name of mail user",
        Required    => 1,
        HasValue    => 1,
        ValueRegex  => qr/.*/smx,
    );
    $Self->AddOption(
        Name        => 'password',
        Description => "password for mail user",
        Required    => 1,
        HasValue    => 1,
        ValueRegex  => qr/.*/smx,
    );
    $Self->AddOption(
        Name        => 'host',
        Description => "e.g.: mail.example.com",
        Required    => 1,
        HasValue    => 1,
        ValueRegex  => qr/.*/smx,
    );
    $Self->AddOption(
        Name        => 'type',
        Description => "IMAP,IMAPS,IMAPTLS,POP3,POP3S",
        Required    => 1,
        HasValue    => 1,
        ValueRegex  => qr/.*/smx,
    );
    $Self->AddOption(
        Name        => 'IMAPFolder',
        Description => "Only if you want to use any other folder than INBOX",
        Required    => 0,
        HasValue    => 1,
        ValueRegex  => qr/.*/smx,
    );
    $Self->AddOption(
        Name        => 'valid',
        Description => "Email address which should be used for the new system address.",
        Required    => 0,
        HasValue    => 1,
        ValueRegex  => qr/.*/smx,
    );
    $Self->AddOption(
        Name        => 'trusted',
        Description => "Email address which should be used for the new system address.",
        Required    => 1,
        HasValue    => 1,
        ValueRegex  => qr/.*/smx,
    );
    $Self->AddOption(
        Name        => 'dispatchingby',
        Description => "Email address which should be used for the new system address.",
        Required    => 1,
        HasValue    => 1,
        ValueRegex  => qr/.*/smx,
    );
    $Self->AddOption(
        Name        => 'queueID',
        Description => "Email address which should be used for the new system address.",
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

    $Self->Print("<yellow>Adding new postmaster mail account...</yellow>\n");
    my $MailAccount  = $Kernel::OM->Get('Kernel::System::MailAccount');
    my %List = $MailAccount->MailAccountList(
        Valid => 0, # just valid/all accounts
    );
    my $login = $Self->GetOption('login');
    my $host = $Self->GetOption('host');
    for my $user (values %List) { 
        if ($user =~ m/${host}\s\(${login}\)/) { 
             $Self->PrintError("A postmaster mail account with this host and login already exists. Can't add MailAccount Service.\n");
             return $Self->ExitCodeError();}
    }
    # add mailaccount
    if (
        !$MailAccount->MailAccountAdd(
            Login   => $Self->GetOption('login'),
            Password  => $Self->GetOption('password'),
            Host  => $Self->GetOption('host'),
            Type => $Self->GetOption('type'),
            ValidID     => $Self->GetOption('valid') || 1,
            QueueID     => $Self->GetOption('queueID'),
            IMAPFolder     => $Self->GetOption('IMAPFolder') || 'INBOX',
            Trusted     => $Self->GetOption('trusted'),
            DispatchingBy     => $Self->GetOption('dispatchingby'),
            UserID            => 1,
        )
        )
    {
        $Self->PrintError("Can't add postmaster mail account.");
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
