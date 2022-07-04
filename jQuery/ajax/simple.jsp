<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<h2> Simple Ajax </h2>
<script type="text/javascript">
	//<!--
	
	// ajax 코딩 시 show()와 showResult()는 기본적으로 코딩해야 함
	var httpRequest = null;
	function show() {		
		// 자바스크립트 단
		
		if( window.ActiveXObject ) {
			// IE
			try {
				httpRequest = new ActiveXObject( "Msxml.XMLHTTP" );	// 옵션
			} catch( e ) {
				httpRequest = new ActiveXObject( "Microsoft.XMLHTTP" );
			}
		} else {
			// 다른 웹 브라우저
			httpRequest = new XMLHttpRequest(); // 이렇게 하면 Ajax 요청도 가능해짐
		}	
		var params = "name=" + encodeURI( inputform.name.value ) 
					+ "&age=" + inputform.age.value;
		// inputform.name.value는 한글이므로 encoding이 필수
		
		httpRequest.onreadystatechange = showResult; // 요청을 보낸다. 대기상태가 변할때마다 showresult가 실행
		
		// httpRequest.open( "POST", "user.jsp", true );
		// httpRequest.send( params ); // params 넘겨줌
		httpRequest.open( "GET", "user.jsp"+"?"+params, true );
		httpRequest.setRequestHeader( "content-type", "application/x-www-form-urlencoded" ); // 전송 버튼이 submit이 아닌 button이므로 이렇게 잡는다.
		httpRequest.send( null ); // get 방식은 항상 null
		
	} // show
	
	function showResult() {
		// alert( "readyState : " + httpRequest.readyState ); readysyate 4단계
		var result = document.getElementById( "result" );
		var msg = "";
		if( httpRequest.readyState == 4 ) { // else를 여러번 실행 후 여기로 들어와서 msg를 덮어쓴다.
			if( httpRequest.status == 200 ) { // 넘어온 데이터의 에러 여부 확인. 200이면 정상
				msg += httpRequest.responseText; // 처리해서 출력한 데이터가 넘어오는 방식. responseXML도 있음
				// httpRequest.open("POST", "simple.jsp", true);의 url에서 처리한 데이터를 responseText가 받아옴
				// msg += "정상종료<br>";
			} else {
				msg += "에러발생 : " + httpRequest.status + "<br>";
			}
		} else { // httpRequest.readyState가 4가 아니면 1, 2, 3 중 하나에서 멈춘다.
			msg += "통신중 : " + httpRequest.readyState + "<br>";
			msg += "통신중 : " + httpRequest.readyState + "<br>";
		}
		result.innerHTML = msg;
	}	
	//-->
</script>
<form name="inputform">
	<table border='1'>
		<tr>
			<th> 이름 </th>
			<td> <input type="text" name="name"> </td>
		</tr>
		<tr>
			<th> 나이 </th>
			<td> <input type="text" name="age"> </td>
		</tr>
		<tr>
			<th colspan='2'>
				<input type="button" value="전송" onclick="show()">
				<input type="reset" value="취소">
			</th>
		</tr>
	</table>
</form>
<br>
<div id="result"></div>