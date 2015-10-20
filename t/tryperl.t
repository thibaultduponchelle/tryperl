#!/usr/bin/env perl

# Project : TryPerl
# Author : Thibault Duponchelle

use strict;
use warnings;

my $CGIBIN="../cgi-bin";
my $EXECUTOR="$CGIBIN/executor.cgi";

my $arg = shift;
$arg |= "";

if($arg eq "-v") {
	foreach my $v ($CGIBIN, $EXECUTOR) { 
		print "[$v]\n";
	}
}

my $TRASH;
open($TRASH, '>', '/dev/null');

sub shutup() {
	($arg ne "-b") and select $TRASH;
}

shutup();

sub claim($) {
	my $text = shift;
	if($arg ne "-v") { return }; 
	select STDOUT;
	print "$text";
	shutup();
}

my $fails = 0;

claim "# Check syntax of our babies\n";
my @files = <$CGIBIN/*.pl>; 
push @files, <$CGIBIN/*.pm>;

for my $f (@files) { 
	system("perl -c $f 2>/dev/null");	
	my $real_ret_value = $? >> 8;
	if($real_ret_value !=  0) { 
		claim "$f : Syntax error !\n";
	} else { 
		claim "$f : OK\n";
	}
	ok($real_ret_value == 0) or $fails += 1;
}

use Test;
BEGIN { plan tests => 1 };

my $contenttype = "Content-Type: text/plain\n\r\n\r";
my $arrow = "=> ";
my $success = "\n\rSUCCESS !\n\r\n\r";
my $tryagain = "\n\rTry again...\n\r\n\r";

sub bad($) {
	my $output = shift;
	return $contenttype.$arrow.$output.$tryagain;
}

sub good($$) {
	my $output = shift;
	my $answer = shift;
	return $contenttype.$arrow.$output."\n\r".$answer."\n\r\n\r";
}

sub great($) {
	my $output = shift;
	return $contenttype.$arrow.$output.$success;
}

my $PLUS = "%2B%0A";
my $output = undef;

claim "# I'm testing Lesson 0\n";
$output = `$EXECUTOR lesson=0 cmd='3 $PLUS 6'`;
claim $output;
ok($output,good("9", "Well done !")) or $fails += 1;

$output = `$EXECUTOR lesson=0 cmd=' 3   $PLUS 6  '`;
claim $output;
ok($output,good("9", "Well done !")) or $fails += 1;

$output = `$EXECUTOR lesson=0 cmd='"click me"'`;
claim $output;
ok($output,good("click me", "LAZY ! LAZY ! LAZY ! xD")) or $fails += 1;

claim "# I'm testing Lesson 1\n";
$output = `$EXECUTOR lesson=1 cmd='reverse "onion"'`;
claim $output;
ok($output,great("noino")) or $fails += 1;

# ...
# ...
# TODO: Test other lessons !
# ...
# ...

select STDOUT;

exit $fails;
