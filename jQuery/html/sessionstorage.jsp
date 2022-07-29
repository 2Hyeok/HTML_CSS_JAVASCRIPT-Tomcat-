<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<h2> Session Storage </h2>

<script src="/jQueryEx/jquery-3.6.0.js"></script>
<script type="text/javascript">
	//<!--
	$(document).ready(
		function() {
			if( ! window.sessionStorage) {
				$("#console").html("지원하지 않는 브라우저입니다<br>");
				return;
			} else {
				$("#console").html("지원하는 브라우저입니다<br>");
			}
		// 저장
		$("input[value=저장]").on(
				"click",
				function(event){
					// 빈상태면 저장불가
					var msg = $("input[name=msg]").val();
					if( ! msg ){ // 메시지가 없음
						$("#console").html("메시지를 입력해 주세요 <br>");
					} else {
						sessionStorage.setItem("msg", msg);
						$("#console").html("메시지를 저장했습니다. <br>");
						$("input[name=msg]").val(""); // 메시지 저장후 아무것도 없는 문자열로 덮어씀
					}
				}
			);
		// 로드
		$("input[value=로드]").on(
				"click",
				function(event){
					var msg = sessionStorage.getItem("msg"); // 데이터를 가져와라
					if( ! msg ){// 가져올 데이터가 없으면
						$("#console").html("가져올 값이 없습니다 <br>");
					} else { // 가져올 데이터가 있다면
						$("input[name=msg]").val(msg);
						$("#console").html("메시지를 가져왔습니다<br>");
					}
					
				}
			);
		
		// 삭제
		$("input[value=삭제]").on(
				"click",
				function(event){
					sessionStorage.removeItem("msg"); // 메시지를 삭제해라
					$("input[name=msg]").val("");
					$("#console").html("메시지를 삭제했습니다.<br>");
				}
			);
		
		
		}		
	);
	
	//-->
</script>

<form name="inputform">
	<table border="1">
		<tr>
			<th> 메시지 </th>
			<td><input type="text" name="msg" autofocus></td>
		</tr>
		<tr>
			<th colspan="2">
			<input type="button" value="저장">
			<input type="button" value="로드">
			<input type="button" value="삭제">
			</th>
		</tr>
	</table>
</form>
<br><br>
<div id="console"></div>