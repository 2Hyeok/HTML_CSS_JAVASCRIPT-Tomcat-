<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<h2>썸네일이미지 - 입력 페이지</h2>

<form method="post" enctype="multipart/form-data" action="thumbnailPro.jsp">
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
			<th>이미지</th>
			<td><input type="file" name="image"></td>
		</tr>
		<tr>
			<th colspan="2">
				<input type="submit" value="전송">
				<input type="reset" value="취소">
			</th>
		</tr>
	</table>  
</form>
