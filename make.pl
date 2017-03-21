#!/usr/bin/env perl
use v5.10; use strict; use warnings; use autodie qw(:all);
die 'unexpected arguments count' if scalar(@ARGV) != 1;
use Env qw<HOME>;
use Cwd qw(abs_path);
use IPC::System::Simple qw<runx capturex>;

my $config_dir;
my $profiles_dir;
my $__dirname = abs_path './';

if (capturex(qw<uname -o>) =~ /FreeBSD/) {
  $config_dir = "$HOME/.kde4/share/config/";
  $profiles_dir = "$HOME/.kde4/share/apps/konsole/";
} else {
  $config_dir = "$HOME/.config/";
  $profiles_dir = "$HOME/.local/share/konsole/";
}

if ($ARGV[0] eq 'create-symlinks') {

  chdir $config_dir;
  runx 'ln', '-s', '--', "$__dirname/konsolerc";

  runx 'mkdir', '-p', '--', $profiles_dir;
  chdir $profiles_dir;
  my $lnk = sub {runx 'ln', '-s', '--', "$__dirname/konsole/$_[0]"};
  &$lnk('dark.profile');
  &$lnk('light.profile');
  &$lnk('my dark theme.colorscheme');
  &$lnk('my light theme.colorscheme');

} elsif ($ARGV[0] eq 'remove-symlinks') {

  my $rmlnk = sub {unlink $_[0] if -l $_[0]};

  &$rmlnk("$config_dir/konsolerc");
  &$rmlnk("$profiles_dir/dark.profile");
  &$rmlnk("$profiles_dir/light.profile");
  &$rmlnk("$profiles_dir/my dark theme.colorscheme");
  &$rmlnk("$profiles_dir/my light theme.colorscheme");

} else {
  die "unknown argument: '$ARGV[0]'";
}

# vim: et ts=2 sts=2 sw=2 cc=81 tw=80 :
