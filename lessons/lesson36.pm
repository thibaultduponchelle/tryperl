#!/usr/bin/env perl

# Inits here 
$jail::h{'key1'} = "val1"; # Print values
$jail::h{'key2'} = "val2"; # Using keys

sub answer($) {
	my $c = shift;
	if($c =~ m/^\s*print\s+\%h\s*$/) { # print %h
		return "SUCCESS !\n\r\n\r";
	} elsif($c =~ m/^\s*\$h\s*\{\s*"key[1|2]"\s*\}\s*$/) { # $h{"key1"}
		return "Good ! This is easy right ?\n\r\n\r";
	} elsif($c =~ m/^\s*\$h\s*\{\s*'key[1|2]'\s*\}\s*$/) { # $h { "key1" }
		return "Nice shot ! Works with simple quote ! Yeah !\n\r\n\r";
	} elsif($c =~ m/^\s*\$h\s*\{\s*key[1|2]\s*\}\s*$/) { # $h{key1}
		return "Great ! Works even without any quotes ?\n\r\n\r";
	} else {
		return "Try again...\n\r\n\r";
	}
	
		
}

1;

__DATA__
<h1>Still hashes</h1>
<h2>Looking inside hash</h2>

To retrieve the value that you stored in the box named <strong>"key2"</strong> in your hash <strong>%h</strong>... 
You should use one of these methods : 
<ul>
<li>Classic : <code>$h{"key2"}</code><br/></li>
<li>Ventilated with spaces : <code>$h { "key2" }</code><br/></li>
<li>Simple quote : <code>$h{'key2'}</code><br/></li>
<li>Even without quotes : <code>$h{key2}</code><br/></li>
</ul>

Note that we use a <strong>$</strong> as we want to access a scalar value !<br/>

We could also print the whole hash with <code>print %h</code><br/><br/>
This is really basic and ugly way to print the hash, no need to say that there are a lot of other ways to pretty print an hash ! <br/>
Next lesson will describe some other methods, but the goal is not to pretty print the hash but to discover how to play with hashes :)<br/>

