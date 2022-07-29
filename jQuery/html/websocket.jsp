<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<script src="/jQueryEx/jquery-3.6.0.js"></script>
<script type="text/javascript">
	//<!--
	var msg = ""; // null 일경우 누적시 null로 출력이됨 
	var ws = null; // ws 변수 생성
	$(document).ready(
		function() {
			if( ! window.WebSocket){
				$("#console").html("지원하지 않는 브라우저입니다.<br>");
				return;
			}
			
			// 서버프로그램 만들기 전까지는 확인불가하기에 자신의 포트로 일단 연결
			ws = new WebSocket("ws://localhost:8080/jQueryEx/websocket/chat"); // 객체생성 ws://localhost:8080/jQueryEx/ 이 뒤의 문자열은 서버쪽에서 확인할 문자열이기에 아무거나 넣어도됨
			if( ! ws ) { // ws가 없으면
				$("#console").html("서버연결 실패<br>");
			} else {
				ws.onopen = function() {// 서버가 열렸을때
					$("#console").html("서버 연결 성공 <br>");
				}
				ws.onclose = function() { // 서버가 종료 됬을때
					$("#console").html("서버 연결 종료 <br>");
				}
				ws.onmessage = function(event) { // 메시지를 전달받을시
					msg += event.data + "<br>"
					$("#msg").html(msg);
					$("#console").html("메시지 수신 성공 <br>");
				}
			}
			

			// 메시지 없을때 메시지 없다고 출력해야하지만 지금은 하지 않음
			// 전송버튼을눌렀을 시
			$("input[value=전송]").on(
				"click",
				function(event){
					var msg = $("input[name=name]").val() + " : " + $("input[name=msg]").val();
					ws.send(msg); // 메시지를 보냄
					$("input[name=msg]").val("");
					$("#console").html("메시지 전송 성공 <br>");
				}		
			);
			
			
		}		
	);
	//-->
</script>

<style type="text/css">
	#msg {
		border : 1px solid red;
		width : 450px;
		height : 150px;
		margin : 10px;
		text-align : left;
	}
</style>


<h2>Web Socket</h2>

<!-- 데이터를 입력 받을 폼 -->

<form name="inputform">
	<table border="1">
		<tr>
			<th> 메시지 </th>
			<td> <input type="text" name="name" placeholder="대화명"> </td>
			<td> <input type="text" name="msg" placeholder="메시지를 입력하세요"> </td>
			<td> <input type="button" value="전송"> </td>
		</tr>
		<tr>
			<th colspan="4">
				<div id="msg">
				<!-- textarea로 만들면 글자 안넘어가짐 -->
				</div>
			</th>
		</tr>
	</table>
</form>
<br><br>
<div id="console"></div>