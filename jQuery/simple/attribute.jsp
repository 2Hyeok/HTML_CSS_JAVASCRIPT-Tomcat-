<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<h2> 속성선택자 </h2>
<script src="/jQueryEx/jquery-3.6.0.js"></script>
<script type="text/javascript">
//<!--
$(document).ready(
		function() {
			$("input[name=id]").val("아이디를 입력하세요");
			$("input[type=text]").css("background", "gray");
			
			$("input[value=전송]").css("background", "red");
			$("input[type=reset]").css("background", "blue");
			
			$("input:button, input:reset").css("color", "white");
			$("input:button[value=전송]").css("background", "gray");
		}
	);
	
	function show(){
		var msg = "";
		//window.document 생략가능
		msg += "아이디 : " + inputform.id.value + "<br>" // 아이디칸의 값 출력
			+ "비밀번호 : " + inputform.passwd.value + "<br>" // 비밀번호의 값 출력
			+ "성별 : " + ( inputform.gender[0].checked ? "남자" : "여자") + "<br>" // 삼항연산 사용하여 남자 or 여자 출력
			+ "취미 : " + inputform.hobby.options[ inputform.hobby.selectedIndex ].value + "<br><br>"; // 선택된 값을 출력 (자동적으로 배열을 생성해줌)
															  								// value 값에 넣은 값이 출력되기 때문에 폼에 value 값은 출력할 문자로 입력
															  								
		msg += "아이디 : " + $("input[type=text]").val() + "<br>" // 폼에 있는 데이터를 넣고 뺄때 .val함수 사용
			+ "아이디 : " + $("input[name=id]").val() + "<br>"
			+ "비밀번호 : " + $("input[name=passwd]").val() + "<br>"
			+ "비밀번호 : " + $("input:password").val() + "<br>" // passwd가 여러개면 꺼내기 어려움
			+ "성별 : " + ( $("input[name=gender]:checked").val() == "1" ? "남자" : "여자" ) + "<br>"
			+ "성별 : " + ( $("input:radio:checked").val() == "1" ? "남자" : "여자" ) + "<br>"
			+ "취미 : " + $("option:selected").val() + "<br>";

			
			
		$("#result").html( msg ); // id값 result.html로 출력하라
		
	}
	
	function deleteid() {
		// inputform.id.value = "";
		// $("input[name=id]").val( "" );
		$("input:text:focus").val( "" );
	}
	//-->
</script>
<form name="inputform">
	<table border="1">
		<tr>
			<th>아이디</th>
			<td><input type="text" name="id" onfocus="deleteid()"></td>
		</tr>
		<tr>
			<th>비밀번호</th>
			<td><input type="password" name="passwd"></td>
		</tr>
		<tr>
			<th>성별</th>
			<td>
				<input type="radio" name="gender" value="1">남자
				<input type="radio" name="gender" value="2">여자
			</td>
		</tr>
		<tr>
			<th>취미</th>
			<td>
				<select name="hobby">
					<option value="독서"> 독서 </option>
					<option value="등산"> 등산 </option>
					<option value="운동"> 운동 </option>
					<option value="게임"> 게임 </option>
				</select>
			</td>
		</tr>
		<tr>
			<th colspan="2">
				<input type="button" value="전송" onclick="show()">
				<input type="reset" value="취소">
			</th>
		</tr>
	</table>
</form>
<br>

<div id="result"></div> 