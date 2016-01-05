#!/usr/bin/env perl

# Inits here 

sub answer($) {
	my $c = shift;
	if($c =~ m/^\s*\%empty\s*=\s*\(\s*\)\s*$/) { # @empty = ()
		return "Cool ! An empty hash ! Note that we actually initialized it with an empty array !\n\r\n\r";
	} elsif($c =~ m/\s*\%h\s*=\s*\(\s*key1\s*=>\s*"val1"\s*,\s*key2\s*=>\s*"val2"\s*\)$/) { # %h = ( key1 => "val1", key2 => "val2" ) 
		return "SUCCESS !\n\r\n\r";
	} elsif($c =~ m/^\s*\%h\s*=/) { # %h =
		return "Take care to correctly fill the \%h variable with ( key1 => \"val1\" , key2 => \"val2\" )\n\r\n\r";
	} elsif($c =~ m/^\s*\%h\s*/) { # %h
		return "Good start, but please assign ( key1 => \"val1\" , key2 => \"val2\" ) to %h\n\r\n\r"; 
	} elsif($c =~ m/\s*=\s*\(\s*key1\s*=>\s*"val1"\s*,\s*key2\s*=>\s*"val2"\s*\)$/) { # = ( key1 => "val1", key2 => "val2" ) 
		return "Please name the variable as \%h\n\r\n\r";
	} else {
		return "Try again...\n\r\n\r";
	}
}

1;

__DATA__
<h1>Hash</h1>
<h2>Powerful tr(h)ash</h2>

There's a variable type that we do not mentionned yet... The famous <strong>hash</strong> !<br/><br/>
As other Perl variables, an <strong>hash</strong> is prefixed by a special symbol...<br/>I could let you guess what is the prefix but this time, it's not something really close to a <strong>H</strong>... as it's <strong>%</strong> ! <br/><br/>
So first define an empty hash <code>%empty = ()</code><br/><br/>

Then we will do something more useul <code>%h = ( key1 => "val1", key2 => "val2" )</code>
