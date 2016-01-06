#!/usr/bin/perl

# Project : TryPerl
# Author : Thibault Duponchelle
# Main script for TryPerl website

use strict;
use warnings;

use lib "lessons";

use Mojolicious::Lite;

@ARGV = qw( daemon ) unless @ARGV;

websocket '/executor/:num' => sub {
    my $self = shift;
    warn "Client connected to executor\n";
    $self->on( finish => sub {
	warn "Client disconnected from executor\n";
    } );
    $self->on(message => sub {
        my ( $self, $message ) = @_;
	($message eq "ping") and return;
	my $num = $self->stash('num');
	require executor;
	eval "require lesson$num";
	if($@) {
        	$self->send( { text => "Not a lesson" });
	} else {
		my $result = execute_this($message);
		print $result;
		my $answer = answer($message);
        	$self->send( { text => "$result"."$answer" });
	}
    });
};


websocket '/lesson' => sub {
    my $self = shift;
    warn "Client connected to lesson\n";
    $self->on( finish => sub {
	warn "Client disconnected from lesson\n";
    } );
    
    $self->on(message => sub {
        my ( $self, $message ) = @_;

	($message eq "ping") and return;
	
	delete $INC{"lesson$message.pm"}; # Force module reload. FIXME: waste IO
	eval "require lesson$message";
	if($@) {
        	$self->send( { text => "Not a lesson" });
	} else {
		my @lines = <DATA>;
		my $str = join "\n", @lines;
        	$self->send( { text => "$str" });
	}
    });
};

get '/:n' => 'index';
get '/' => sub {
  my $self = shift;
  $self->redirect_to('/0');
};

app->start;

1;

__DATA__

@@ index.html.ep
% my $url = $self->req->url->to_abs->scheme( $self->req->is_secure ? 'wss' : 'ws' )->path( '/' );
% use config;


<html>
<head>
	<title>Try Perl: learn the basics of the Perl language in your browser</title>
	<meta name="Content-Type" content="text/html; charset=UTF-8">

	<link href="css/style.css" rel="stylesheet" type="text/css" />
	<link rel="shortcut icon" href="pixs/faviconion.ico" type="image/x-icon">
	<link rel="icon" href="pixs/faviconion.ico" type="image/x-icon">
	<script type="text/javascript" src="js/jquery-1.11.3.min.js"></script>
	<script type="text/javascript" src="js/jquery.console.js"></script>
	<script type="text/javascript" src="js/tryperl.js"></script>
	<script type="text/javascript">
	$(document).ready(function(){
		initTryPerlClient("<%= $url %>", <%= get_max_lessons() %>, <%= $n %>);
	});
	</script>
</head>
<body>
<!-- 
Project :  TryPerl
Author : Thibault Duponchelle 
-->

<div id="left-block">
 <img class="onion" src="pixs/onion-big.svg"/>
 <div id="left-block-content">
  <div id="lesson">
  </div>
 </div>
</div>

<div id="middle-block">
</div>


<div id="right-block">
</div>

<div id="left-footer"><a href="https://github.com/thibaultduponchelle/tryperl">Thibault Duponchelle</a> - <a href="https://github.com/chrisdone/jquery-console">console</a> - <a href="http://www.tryruby.org">tryruby</a></div>
<div id="right-footer"><code>clear</code> clear editor - <code>back</code> previous lesson - <code>next</code> next lesson</div>

<script type="text/javascript" src="js/ga.js"></script>

</body>
</html>

