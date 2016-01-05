#!/usr/bin/env perl

# Inits here 
@jail::arr = ("c", "b", "a"); # Deref an array
$jail::h{'key1'} = "val1";    # Deref an hash
$jail::h{'key2'} = "val2";    # 

sub answer($) {
	my $c = shift;
	if($c =~ m/^\s*print\s+\%\s*\{\s*\\\%h\s*\}\s*$/) { # print %{ \%h }
		return "SUCCESS !\n\r\n\r";
	} elsif($c =~ m/^\s*print\s+\@\s*\{\s*\\\@arr\s*\}\s*$/) { # print @{ \@a }
		return "Great ! You referenced the dereferenced an array !\n\r\n\r";
	} else {
		return "Try again...\n\r\n\r";
	}
}

1;

__DATA__
<h1>Derefs</h1>
<h2>Dereferencing</h2>

To dereference, you have to <strong>cast</strong> (sort of) to the type that you want.<br/>
For our tests we will reuse our <strong>@arr</strong> and <strong>%h</strong><br/><br/>
Take <i>reference</i> of our array then <i>dereference</i> to an array and <i>print</i> it : <br/><code>print @{ \@arr }</code><br/><br/>
Take <i>reference</i> of our hash then <i>dereference</i> to an hash and <i>print</i> it : <br/><code>print %{ \%h }</code><br/><br/>

Note that we use the prefix symbol of the variable type (<strong>@</strong> and <strong>%</strong>).<br/><br/>
And while we are discussing about dereferencing types, trying to dereference an array as a hash and vice versa will just produce an error !

