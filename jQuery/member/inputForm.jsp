<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%-- 제이쿼리를 먼저 넣는다 --%>
<script src = "/jQueryEx/jquery-3.6.0.js"></script>
<script src = "/jQueryEx/member/script.js"></script>


<h2> 회원 가입 </h2>

<form method="post" action="inputPro.jsp">
	<table border="1">
		<tr>
			<th> 아이디 </th>
			<td><input type="text" name="id"></td>
			<td width="200"><div id="idcheck"> 아이디를 입력하세요 </div></td>
		</tr>
		<tr>
			<th rowspan="2"> 비밀번호 </th>
			<td><input type="password" name="passwd"></td>
			<td rowspan="2"><div id="passwdcheck"> 비밀번호를 입력하세요 </div></td>
		</tr>
		<tr>
			<td><input type="password" name="repasswd"></td>
		</tr>
		<tr>
			<th> 이름 </th>
			<td><input type="text" name="name"></td>
			<td><div> 이름을 입력하세요 </div></td>
		</tr>
		<tr>
			<th> 전화 번호 </th>
			<td><input type="text" name="tel"></td>
			<td><div id="telcheck"> 전화번호를 입력하세요 </div></td>
		</tr>
		<tr>
			<th colspan="3">
				<input type="submit" value="전송">
				<input type="reset" value="취소">
			</th>
		</tr>
	</table>
</form>