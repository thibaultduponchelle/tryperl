/* 
* WEBSOCKETS
*/

var executorWebSocket; /* The websocket for repl */
var lessonWebSocket; /* The websocket to get lesson */
var baseUrl; /* The base url */
var maxLesson; /* The max lesson */
var numLesson; /* The num lesson */
var interpreter; /* The interpreter js object */

/* Create the executor web socket for repl */
function createExecutorWebSocket() {
	executorWebSocket = new WebSocket( baseUrl + "executor/" + numLesson );
	executorWebSocket.onopen = function() {
		setInterval(function() {
		        if (executorWebSocket.bufferedAmount == 0)
				executorWebSocket.send("ping");
		}, 3000 );
	};
	executorWebSocket.onmessage = function(e) {
		/* Check if user typed the what we want, so he could go to the next lesson */
		interpreter.report("" + e.data, 'jquery-console-message-success');
		
		lines = e.data.match(/[^\r\n]+/g);
		if((lines.length > 1) && (lines[lines.length - 1] == "SUCCESS !")) {
			if(numLesson < maxLesson) {
				numLesson += 1;
				adjustHistory();
				createLessonWebSocket();
			}
		}
	};
}

/* Create the lesson web socket for lesson retrieval */
function createLessonWebSocket() {
	lessonWebSocket = new WebSocket( baseUrl + "lesson" );
	lessonWebSocket.onopen = function(e) {
		lessonWebSocket.send(numLesson); /* On open, get lesson */
		setInterval(function() {
		        if (lessonWebSocket.bufferedAmount == 0)
				lessonWebSocket.send("ping");
		}, 3000 );

	};
	lessonWebSocket.onmessage = function(e) {
		document.getElementById("lesson").innerHTML = e.data ;
		$("#left-block-content").fadeTo(5000 ,1);
		makeCodeTagClickable();
	};
}

/* Make the code tags clickable for lazy people xD */
function makeCodeTagClickable() {
	$('#left-block-content code, #right-footer code').each(function(){
		$(this).css('cursor','pointer');
		$(this).attr('title','Click me to insert "' +
		$(this).text() + '" into the console.');
		$(this).click(function() {
			interpreter.promptText($(this).text());
			interpreter.inner.click();
		});
	});
}

/* Change url */
function adjustHistory() {
	window.history.pushState("object or string", "Try Perl: learn the basics of the Perl language in your browser", "/" + numLesson);
}
	

function initTryPerlClient(u, m, n) {
	baseUrl = u;
	maxLesson = m;
	numLesson = n;
	/* The interpreter */
	var container = $('<div class="console">');
	$('#right-block').append(container);
	interpreter = container.console({
		promptLabel: 'Perl $ ',
		animateScroll:true, 
		autofocus:true,
		promptHistory:true,
		welcomeMessage:'[Interactive Perl interpreter ready]',

		/* Do not accept some patterns */
		commandValidate:function(line){
			if (line == "") return false;
			return true;
		},

		/* Handle user input */
		commandHandle:function(line) {
			
			/* Process some reserved keywords */ 
			/* Current recognized keywords : restart, next, back, clear */
			if(line == "restart") { numLesson = 0; }
			if(line == "next") { if(numLesson >= maxLesson) { return ""; } else { numLesson += 1; } }
			if(line == "back") { if(numLesson <= 0) { return ""; } else { numLesson -= 1; } }	
			if(line == "restart" || line == "next" || line == "back") {  
				adjustHistory();
				createLessonWebSocket();	
				return "";
			}

			if(line == "clear") {
				interpreter.clearScreen(); 
				return ;
			}

			executorWebSocket.send(line);
			return "";
		}
	});

	/* This part is executed only for the first load (NOT when you go from one to another lessons) */
	createExecutorWebSocket();
	createLessonWebSocket();

	interpreter.promptText('');
}

