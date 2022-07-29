<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<script src="/jQueryEx/jquery-3.6.0.js"></script>
<script type="text/javascript">
	//<!--
	// 전송 버튼 눌렀을때 메시지를 보내도록
	$(document).ready(
		function() {
			$("input[value=전송]").on(
				"click",
				function(event){
					var msg = $("input[name=msg]").val(); // msg의 val을 가져와라
					if( ! msg ) { // 메시지 입력안하고 전송버튼 눌렀을 시
						$("#console").html("메시지를 입력하세요<br>");
					} else {
						$("input[name=msg]").val(""); // 메시지 보냈으면 지우기
						ifm.contentWindow.postMessage( // ifm의 포함된 윈도우의 메시지, 포트에 메시지를 보낸다
							msg,
							"http://localhost:8080" // 보통은 주소를 넘김, 수신측에서 받아주어야함 이게 origin
						);
						$("#console").html("메시지 전송성공<br>");
					}
				}
			);
		}	
	);
	
	//-->
</script>
<h2> Cross Document Message </h2>
<h3> 송신측 </h3>
<form name="inputform">
	<table border="1">
		<tr>
			<th> 보낼 메시지 </th>
			<td> <input type="text" name="msg"></td>
			<th> <input type="button" value="전송"></th>
		</tr>
	</table>
</form>
<br><br>
<iframe id="ifm" src="frame.jsp" width="300" height="200"></iframe>
<br><br>
<div id="console"></div>