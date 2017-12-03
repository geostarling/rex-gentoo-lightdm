package Rex::Gentoo::LightDM;

use Rex -base;

task 'setup', sub {

  pkg "x11-misc/lightdm", ensure => 'present';

  append_or_amend_line "/etc/conf.d/xdm",
    line   => "DISPLAYMANAGER=\"lightdm\"",
    regexp => qr{^DISPLAYMANAGER=};

  foreach my $svc ("dbus", "xdm") {
    service $svc, ensure => "enabled";
    service $svc, ensure => "started";
  }

};


1;

=pod

=head1 NAME

$::module_name - {{ SHORT DESCRIPTION }}

=head1 DESCRIPTION

{{ LONG DESCRIPTION }}

=head1 USAGE

{{ USAGE DESCRIPTION }}

 include qw/Rex::Gentoo::Install/;

 task yourtask => sub {
    Rex::Gentoo::Install::example();
 };

=head1 TASKS

=over 4

=item example

This is an example Task. This task just output's the uptime of the system.

=back

=cut
