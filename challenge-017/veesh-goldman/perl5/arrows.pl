#! /usr/bin/env perl

use v5.22;
use List::Util qw/reduce/;
use bigint;

sub arrow  {
  my ($base, $times, $arrows) = @_;
  return $base ** $times if $arrows == 1;
  reduce {  arrow($b, $a, $arrows - 1) } ($base x $times)
}

sub A  {
  my ($m, $n) = @_;
  return $n + 1     if $m == 0;
  return $n + 2     if $m == 1;
  return 2 * $n + 3 if $m == 2;
  arrow( 2, $n + 3, $m - 2 ) - 3
}

say A(shift, shift)

