#!/usr/bin/env perl
use v5.10; use strict; use warnings; use autodie qw(:all);
die 'unexpected arguments count' if scalar(@ARGV) != 1;
use Env qw<PWD HOME>;
use IPC::System::Simple qw<runx>;

if ($ARGV[0] eq 'create-symlinks') {

  chdir "$HOME/.config/";
  runx 'ln', '-s', '--', "$PWD/konsolerc";

  runx 'mkdir', '-p', '--', "$HOME/.local/share/konsole/";
  chdir "$HOME/.local/share/konsole/";
  my $lnk = sub {runx 'ln', '-s', '--', "$PWD/konsole/$_[0]"};
  &$lnk('dark.profile');
  &$lnk('light.profile');
  &$lnk('my dark theme.colorscheme');
  &$lnk('my light theme.colorscheme');

} elsif ($ARGV[0] eq 'remove-symlinks') {

  my $rmlnk = sub {unlink $_[0] if -l $_[0]};

  chdir "$HOME/.config/";
  &$rmlnk('konsolerc');

  chdir "$HOME/.local/share/";
  &$rmlnk('konsole/dark.profile');
  &$rmlnk('konsole/light.profile');
  &$rmlnk('konsole/my dark theme.colorscheme');
  &$rmlnk('konsole/my light theme.colorscheme');

} else {
  die "unknown argument: '$ARGV[0]'";
}

# vim: et ts=2 sts=2 sw=2 cc=81 tw=80 :
