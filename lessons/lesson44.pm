#!/usr/bin/env perl

# Inits here 

sub answer($) {
	my $c = shift;
	if($c =~ m/^\s*\$\_\s*=\s*"Jvtu bopuifs Pfsm ibdlfs"; y\/a-z\/za-y\/\;\s*print\s*$/){ # $_ = "Jvtu bopuifs Pfsm ibdlfs"; y/a-z/za-y/; print
		return "SUCCESS !\n\r\n\r";
	} else {
		return "Try again...\n\r\n\r";
	}
}

1;

__DATA__
<h1>Perl culture</h1>
<h2>Yet Another Perl Hacker</h2>

If you are here, that's because you're interested in Perl and ready to learn more about it...
So before concluding I need to talk about Perl culture...<br/><br/>

Perl community is <u>huge</u> and <u>valuable</u> :
<ul>
<li>Perl has a fantastic <a href="http://www.cpan.org/">code database (CPAN)</a>.</li>
<li>Perl has an amazing <a href="http://www.perlmonks.org/">questions and answers website (PerlMonks)</a>...</li>
</ul>

Perl programmers are funny (look at <i>Acme</i> modules in <a href="http://www.cpan.org/">CPAN</a>).<br/>
Perl programmers often play with obfuscated code.<br/><br/>

To conclude please type (or click lazy people) on this snippet :<br/><br/>
<code>$_ = "Jvtu bopuifs Pfsm ibdlfs"; y/a-z/za-y/; print</code>

<h2>Extra bonus tips</h2>
Think about using <strong>use strict</strong> and <strong>use warnings</strong> !!!

