<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- 스타일 추가 -->
<style type="text/css">
	.message {
		border : 1px solid red;
		width : 200px;
		height : 200px;
		margin : 10px;
		float : left;
	}
	#console {
		clear : left /* 밑으로 떨어트려라 */
	}
</style>
<script src="/jQueryEx/jquery-3.6.0.js"></script>
<script type="text/javascript">
	//<!--
	$(document).ready(
		function() {
			var channel = null; //채널 생성
			if( ! window.MessageChannel) {
				$("#console").html("지원하지 않는 브라우저입니다.<br>");
				return;
			}
			
			channel = new MessageChannel();
			channel.port1.start();   // 수신용
			channel.port2.start();   // 송신용
			$("#console").html("채널 시작<br>");
			
			//id 가 ch인것을추가
			// 추가 버튼
			$("input[value=추가]").on(
				"click",
				function(e) { // 이름이 충돌나기때문에 event -> e로변경
					$("<div>").attr("class", "message").appendTo("#ch"); // div를 만들고 class와 message를 추가하여 ch 밑에 추가해라
					$("#console").html("채널을 추가했습니다.");
					
					// 송신받을 채널 
					channel.port2.addEventListener( // port2에서 이벤트 발생유무 감지
						"message", // 메시지 발생 유무확인		
						function(event){
							$(".message").html("받은 메시지 : " + event.data + "<br>");
						}
					); 
				}		
			);
			
			// 전송
			$("input[value=전송]").on(
				"click",
				function(event){
					var msg = $("input[name=msg]").val();
					// 메시지가 없을경우
					if( ! msg ){
						$("#console").html("메시지를 입력하세요<br>");
						return;
					}
					// 메시지가 있음
					$("input[name=msg]").val("");
					$("#console").html("보낸 메시지 : " + msg + "<br>");
					channel.port1.postMessage(msg); // channel의 port1번에 메시지를 보내라
				}
			);
			
			
		}
	);
	//-->
</script>

<h2> Channel Message </h2>

<form name="inputform">
	<table border="1">
		<tr>
			<th> 보낼 메시지 </th>
			<td> <input type="text" name="msg"></td>
		</tr>
		<tr>
			<th colspan="2">
				<input type="button" value="전송">
				<input type="button" value="추가">
			</th>
		</tr>
	</table>
</form>
<br><br>
<div id="ch"></div>
<br><br>
<div id="console"></div>