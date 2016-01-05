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
	
	delete $INC{"lesson$message.pm"};
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

get '/:numlesson' => 'index';
get '/' => sub {
  my $self = shift;
  $self->redirect_to('/0');
};

app->start;

1;

__DATA__

@@ index.html.ep
% my $url = $self->req->url->to_abs->scheme( $self->req->is_secure ? 'wss' : 'ws' )->path( '/' );
% my $url_executor = "$url" . "executor/$numlesson";
% my $url_lesson = "$url" . "lesson";
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
	<script type="text/javascript">
/* Make the code tags clickable for lazy people xD */
function MakeCodeTagClickable(controller) {
	$('#left-block-content code, #right-footer code').each(function(){
		$(this).css('cursor','pointer');
		$(this).attr('title','Click me to insert "' +
		$(this).text() + '" into the console.');
		$(this).click(function() {
			controller.promptText($(this).text());
			controller.inner.click();
		});
	});
}

var ews, lws;
function einit(controller, numlesson) {
	//controller.report('Connecting...', 'jquery-console-message-success');
	// Connect to Web Socket.
	ews = new WebSocket( '<%= $url_executor %>' );
	// Set event handlers.
	ews.onopen = function() {
		//controller.report( 'On Open', 'jquery-console-message-success');
		//ews.send( 'Test' );
		setInterval(function() {
		        if (ews.bufferedAmount == 0)
				ews.send("ping"  );
		}, 3000 );
	};
	ews.onclose = function() {
		setTimeout(function() { window.alert("reconnect"); einit(controller, numlesson)} , 1000);
	}
	ews.onmessage = function(e) {
		// e.data contains received string.
		/* Check if user typed the what we want, so he could go to the next lesson */
		controller.report( "" + e.data, 'jquery-console-message-success');
		
		lines = e.data.match(/[^\r\n]+/g);
		if(lines.length > 1) {
			if(lines[lines.length - 1] == "SUCCESS !") {
				if(numlesson < 45) {
					numlesson += 1;
					window.history.pushState("object or string", "Try Perl: learn the basics of the Perl language in your browser", "/" + numlesson);
					linit(controller, numlesson);
				}
			}
		}
	};
}

function linit(controller, numlesson) {
	// Connect to Web Socket.
	lws = new WebSocket( '<%= $url_lesson %>' );
	// Set event handlers.
	lws.onopen = function(e) {
		lws.send( numlesson );
		setInterval(function() {
		        if (lws.bufferedAmount == 0)
				lws.send("ping"  );
		}, 3000 );

	};
	ews.onclose = function() {
		setTimeout(function() { linit(controller, numlesson)} , 1000);
	}
	lws.onmessage = function(e) {
		// e.data contains received string.
		document.getElementById("lesson").innerHTML = e.data ;
		$( "#left-block-content" ).fadeTo( 5000 ,1);
		MakeCodeTagClickable(controller);
	};
}

$(document).ready(function(){
	var numlesson = <%= $numlesson %>; 

	var result = ''; 

	/* Console */
	var console = $('<div class="console">');
	$('#right-block').append(console);
	var controller = console.console({
		promptLabel: 'Perl $ ',
		animateScroll:true, 
		autofocus:true,
		promptHistory:true,
		welcomeMessage:'[Interactive Perl interpreter ready]',

		commandValidate:function(line){
			if (line == "") return false;
			return true;
		},

		commandHandle:function(line) {
			/* Special commands processed here : restart, next, back, clear */
			/* Restart to first lesson */		
			if(line == "restart") {
				numlesson = 0; 
				window.history.pushState("object or string", "Try Perl: learn the basics of the Perl language in your browser", "/" + numlesson);
				linit(controller, numlesson);	
				return "";
			}
			/* Go to next lesson */
			if(line == "next") {
				if(numlesson >= <%= get_max_lessons() %>) return "";
				numlesson += 1;
				window.history.pushState("object or string", "Try Perl: learn the basics of the Perl language in your browser", "/" + numlesson);
				linit(controller, numlesson);	
				return "";
			}
			/* Back to previous lesson */
			if(line == "back") {
				if(numlesson <= 0) return "";
				numlesson -= 1;
				window.history.pushState("object or string", "Try Perl: learn the basics of the Perl language in your browser", "/" + numlesson);
				linit(controller, numlesson);	
				return "";
			}	

			/* Clear console */
			if(line == "clear") {
				controller.clearScreen(); 
				return "";
			}

			ews.send(line);
			return "";
		}
	});

	einit(controller, numlesson);
	linit(controller, numlesson);

	/* This part is executed only for the first load (NOT when you go to another lessons) */
	controller.promptText('');

	

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



