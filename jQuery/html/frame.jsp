<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- 데이터를 받을 파일 -->
<script src="/jQueryEx/jquery-3.6.0.js"></script>
<script type="text/javascript">
	//<!--
	var origin = "http://localhost:8080";
	var msg = ""; // 메시지 누적받을 변수
	// 데이터가 넘어오면 메시지받는 이벤트 추가
	window.onmessage = function(event){
		if(event.origin == origin) {
			msg += "받은 메시지 : " + event.data + "<br>"; // 메시지를 누적받아줌
			// $("#result").html("받은 메시지 : " + event.data + "<br>");
			$("#result").html(msg); // msg 로 변경
		}
	}
	
	//-->
</script>

<h3> 수신측 </h3>
<div id="result"></div>