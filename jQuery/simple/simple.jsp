<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<h2> JQuery </h2>

<script src="/jQueryEx/jquery-3.6.0.js"></script>
<script type="text/javascript">
	// <!--
	function show() {
		var result = document.getElementById( "result" );
		result.innerHTML = "onload<br>";		
	}

	/*
	window.onload = function() {
		var result = document.getElementById( "result" );
		result.innerHTML = "onload<br>";
	}
	*/
	
	/*
	jQuery(document).ready(
		function() {
			var result = document.getElementById( "result" );
			result.innerHTML = "onload<br>";
		}		
	);
	*/
	
	$(document).ready(
		function() {
			alert( "onload" );
		}		
	);
	$(document).ready(
		function() {
			alert( "onload" );
		}		
	);
	$(
		function() {
			alert( "onload" );
		}
	);

	//-->
</script>

<!-- 
<body onload="show()">
-->
<body>
	<div id="result"></div>
</body>