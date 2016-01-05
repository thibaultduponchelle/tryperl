#!/usr/bin/env perl

# Inits here 

sub answer($) {
	my $c = shift;
	if($c =~ m/^\s*sub\s+f1\s*\(\s*\)\s*\{\s*print\s+"\s*\w+\s*"\s*\}\s*f1\s*\(\s*\)\s*$/) { # sub f1() { print "f1" } f1()
		return "Good ! Your first Perl sub declaration/definition !\n\r\n\r";
	} elsif($c =~ m/^\s*sub\s+f2\s*\{\s*print\s+"\s*\w+\s*"\s*\}\s*f2\s*\(\s*"\s*\w+\s*"\s*\)\s*$/) { # sub f2 { print "f2" } f2("a")
		return "Good ! Perl sub declaration is flexible !\n\r\n\r";
	} elsif($c =~ m/^\s*\\\&\w+\s*$/) { # \&c
		return "Nice ! Perl tells you it's a piece of code !\n\r\n\r";
	} elsif($c =~ m/^\s*sub\s+f3\s*\(\s*\$;\$+\s*\)\s*\{\s*print\s+"\s*\w+\s*"\s*\}\s*f3\s*\(\s*"\s*\w+\s*"\s*,\s*"\s*\w+\s*"\s*\)\s*$/) { # sub f3($;$$) { print "f3" } f3("a","b")
		return "Yeah ! Perl is super flexible ! I love it !\n\r\n\r";
	} elsif($c =~ m/^\s*\&\s*\{\s*sub\s*\{\s*print\s+"\s*\w+\s*"\s*\}\s*\}\s*\(\s*\)\s*$/) { # & { sub { print "f4" }}() 
		return "SUCCESS !\n\r\n\r";
	} else {
		return "Try again...\n\r\n\r";
	}
}

1;

__DATA__
<h1>Subs</h1>
<h2>Functions</h2>
In Perl, functions are called <strong>sub</strong> as <i>sub procedure</i> !<br/><br/>

Perl sub declaration are extremly flexible :<br/><br/>
No need to explicitely give return type : <code>sub f1() { print "f1" } f1()</code><br/><br/>
No need to exploicitely give parameters : <code>sub f2 { print "f2" } f2("a")</code><br/><br/>
If parameters are given, possible optional parameters after a semi colon : <code>sub f3($;$$) { print "f3" } f3("a","b")</code><br/><br/>
So Perl functions declaration are exremly flexible !<br/>

<h2>Function type</h2>

I won't discuss too much about it but a <strong>sub</strong> is also a variable type and could be threated as is and dereferenced for instance ...<br/> 
Please try <code>\&s</code> and finally <code>&{ sub { print "f4" }}()</code> 

