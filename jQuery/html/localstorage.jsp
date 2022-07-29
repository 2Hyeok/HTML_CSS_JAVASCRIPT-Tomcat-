<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<script src="/jQueryEx/jquery-3.6.0.js"></script>

<h2> Local Storage </h2>

<!-- JQuery이용할것 -->
<script type="text/javascript">
	//<--
	// 웹브라우저 자체에 지원공간이 있어야 사용가능 없으면 사용불가능
	$(document).ready(
		function() {
			if( ! window.localStorage ){ // loaclStorage가 없으면
				$("#console").html("지원하지 않는 브라우저 입니다 <br>");
				return;
			} else { // loaclStorage가 있으면
				$("#console").html("지원하는 브라우저 입니다 <br>");
			}
			
			// 저장하기
			$("input[value=저장하기]").on(
				"click",
				function(event){
					// 빈상태면 저장불가
					var msg = $("textarea").val();
					if( ! msg ){ // 메시지가 없음
						$("#console").html("메시지를 입력해 주세요 <br>");
					} else {
						localStorage.setItem("msg", msg);
						$("#console").html("메시지를 저장했습니다. <br>");
						$("textarea").val(""); // 메시지 저장후 아무것도 없는 문자열로 덮어씀
					}
				}
			);
			
			// 가져오기
			$("input[value=가져오기]").on(
				"click",
				function(event){
					var msg = localStorage.getItem("msg"); // 데이터를 가져와라
					if( ! msg ){// 가져올 데이터가 없으면
						$("#console").html("가져올 값이 없습니다 <br>");
					} else { // 가져올 데이터가 있다면
						$("#result").html( msg + "<br>");
						$("#console").html("메시지를 가져왔습니다<br>");
						$("textarea").val("");
					}
					
				}
			);
			// 삭제하기
			$("input[value=삭제하기]").on(
				"click",
				function(event){
					localStorage.removeItem("msg"); // 메시지를 삭제해라
					$("textarea").html("");
					$("#result").html("");
					$("#console").html("메시지를 삭제했습니다.<br>");
				}
			);
			
			
		}		
	);	
	//-->
</script>
<form name="inputForm">
	<table border="1">
		<tr>
			<th> 내용 </th>
			<td><textarea id="content" rows="10" cols="30"></textarea>
		</tr>
		<tr>
			<th colspan="2">
			<input type="button" value="저장하기">
			<input type="button" value="가져오기">
			<input type="button" value="삭제하기">
			</th>
		</tr>
	</table>
</form>
<br><br>

<!-- 가져온 데이터 출력하기 -->
<div id="result"></div>
<br><br>
<div id="console"></div>