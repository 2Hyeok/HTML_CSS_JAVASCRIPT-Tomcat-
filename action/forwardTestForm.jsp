<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<h2>액션테그 - forward - 입력 페이지</h2>

<form method="post" action="forwordTest.jsp">
	<table border="1">
		<tr>
			<th>이름</th>
			<td><input type="text" name="name"></td>
		</tr>
		<tr>
			<th>색상</th>
			<td>
				<input type="radio" name="color" value="1">빨강<br>
				<input type="radio" name="color" value="2">파랑<br>
				<input type="radio" name="color" value="3">노랑<br>
				<input type="radio" name="color" value="4">초록<br>
			</td>
		</tr>
		<tr>
			<th colspan="2">
				<input type="submit" value="전송">
				<input type="reset" value="취소">
			</th>
		</tr>
	</table>
</form>