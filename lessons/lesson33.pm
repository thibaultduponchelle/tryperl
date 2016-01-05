#!/usr/bin/env perl

# Inits here 

sub answer($) {
	my $c = shift;
	if($c =~ m/^\s*1\s+and\s+print\s+"onion"\s*$/) { # 1 and print "onion"
		return "Yeah ! onion onion onion !\n\r\n\r";
	} elsif($c =~ m/^\s*1\s+&&\s+print\s+"onion"\s*$/) { # 1 && print "onion"
		return "Yeah ! onion and chunky bacon (c) !\n\r\n\r";
	} elsif($c =~ m/^\s*0\s+or\s+print\s+"onion"\s*$/) { # 0 or print "onion"
		return "Yeah ! onioooon !\n\r\n\r";
	} elsif($c =~ m/^\s*0\s+\|\|\s+print\s+"onion"\s*$/) { # 0 || print "onion"
		return "Yeah ! I like onions and you ?!\n\r\n\r";
	} elsif($c =~ m/^\s*0\s+and\s+print\s+"\s*banana\s*"\s+or\s+print\s+"\s*onion\s*"\s*$/) { # 0 and print "bananas" or print "onion"
		return "SUCCESS !\n\r\n\r";
	} else {
		return "Try again...\n\r\n\r";
	}
}

1;

__DATA__
<h1>It's logic !</h1>
<h2>Logical expressions</h2>
In Perl, we like to do <i>one liner logical execution</i>.<br/>
If you don't understand what I'm talking about it's like when you do with bash <strong>./configure && make && sudo make install</strong>.<br/>
It means that you will execute <strong>make</strong> <i>depending</i> the result of <strong>./configure</strong> script.<br/><br/>

With perl we use and abuse of these logical expressions and we even have more operators for it than any other language ! <br/><br/>

Please make me happy and test some of these statements : 
<ul>
<li><code>1 and print "onion"</code></li>
<li><code>1 && print "onion"</code></li>
<li><code>0 or print "onion"</code></li>
<li><code>0 || print "onion"</code></li>
</ul>

Cool right ?<br/><br/>
<li><code>0 and print "banana" or print "onion"</code></li>

