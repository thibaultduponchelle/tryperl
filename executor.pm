#!/usr/bin/perl

# Project : TryPerl
# Author : Thibault Duponchelle
# executor.pm is a kind of safe online REPL

use strict; # Not heavily tested with this
use warnings; 
no warnings 'once';

use 5.10.1; # Thank you xeeeeeeeeeeeeeeeeenu (do I missed a "e" ? xD)

use Safe;

sub execute_this($) {
	my $cmd = shift;
	(!$cmd) and print "Nothing to execute\n\r" and exit;

	$| = 1; # Force flush

	# Redirect output
	my $output;
	open(my $outputFH, '>', \$output) or die; # This shouldn't fail
	my $oldFH = select $outputFH;

	my $compartment = new Safe("jail");
	$compartment->deny(qw(:base_io :ownprocess :subprocess :filesys_read :sys_db :filesys_open :filesys_write :dangerous));
	$compartment->permit(qw(:base_math print say pack unpack require caller sort));

	my $ret;

	# This eval is for timeout 
	eval {
		local $SIG{ALRM} = sub { print "Oh fuck ! We reached the timeout ! Fuck fuck fuck !"; die "alarm\n" }; # print captured into $ret as everything else due to select !
		alarm 3; # 3 sec
		$ret = $compartment->reval($cmd); # This reval is for code execution
		alarm 0;
		die $@ if $@;
	};

	# Exception 
	my $e = $@;
	select $oldFH;
	close $outputFH;

	if($e) {
		chomp $e;
		return "=> Exception : $e\n\r";	
	} elsif($output) {
		return "=> $output\n\r";
	} else{ 
		return "=> $ret\n\r";
	}
}

1;
