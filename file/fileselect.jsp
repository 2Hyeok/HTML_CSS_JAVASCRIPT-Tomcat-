<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<h2>파일 업로드 - 선택 페이지</h2>

<!-- 파일을 올리기 때문에 get방식은 사용불가 post방식으로 잡아야함 -->
<form method="post" enctype="multipart/form-data" action="fileUpload.jsp">
	<table border="1">
		<tr>
			<th>이름</th>
			<td> <input type="text" name="name"></td>
		</tr>
		<tr>
			<th>제목</th>
			<td><input type="text" name="title"></td>
		</tr>
		<tr>
			<th rowspan="2">파일</th>
			<td><input type="file" name="upload1"></td>
		</tr>
		<tr>
			<td><input type="file" name="upload2"></td>
		</tr>
		<tr>
			<th colspan="2">
				<input type="submit" value="전송">
				<input type="reset" value="취소">
			</th>
		</tr>
	</table>   
</form>