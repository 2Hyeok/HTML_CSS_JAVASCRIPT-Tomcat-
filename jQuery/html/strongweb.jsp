<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<h2> Strong Web Form </h2>

이름 : ${param.name}<br>
나이 : ${param.age}<br>
가입일자 : ${param.logtime}<br>
일자 : ${param.today}<br>
시간 : ${param.now}<br> <!--  request.getParameter 이기 때문에 짤라써야함  -->
월 : ${param.month}<br>
주 : ${param.week}<br>
이메일 : ${param.email}<br>
홈페이지 : ${param.url}<br>
색상 : ${param.color}<br>
검색 : ${param.keyword}<br>
전화번호 : ${param.tel}<br>

<br><br>
<body bgcolor="${param.color}">
<form method="post" action="#"> <!--  action = "#" -> 자기한테 넘어가라는 뜻 -->
	<table border="1">
		<tr>
			<th> 전화번호 </th>
			<td> <input type="tel" name="tel"></td> <!-- 택스트랑 다를게 없음, 핸드폰용 태그 -->
		</tr>
		<tr>
			<th> 검색 </th>
			<td> <input type="search" name="keyword"></td> <!-- 택스트랑 다를게 없음, 핸드폰용 태그 -->
		</tr>
		<tr>
			<th> 색상 </th> <!-- 기본 색상이 검정이기 때문에 색상 선택후 넘겨야함 -->
			<td> <input type="color" name="color" value="#FFFFFF"></td> <!-- 기본값을 흰색으로 바꿈, 전송눌러도 흰색이기 때문에 안바뀜 -->
		</tr>
		<tr>
			<th> 이름 </th>
			<td> <input type="text" name="name" autofocus></td>
		</tr>
		<tr>
			<th> 나이 </th>
			<td> <input type="text" name="age" placeholder="숫자만 입력하세요"></td>
		</tr>
		<tr>
			<th> 가입일자 </th>
			<td> <input type="datetime-local" name="logtime"></td>
		</tr>
		<tr>
			<th> 일자 </th>
			<td> <input type="date" name="today"></td>
		</tr>
		<tr>
			<th> 시간 </th>
			<td> <input type="time" name="now"></td>
		</tr>
		<tr>
			<th> 월 </th>
			<td> <input type="month" name="month"></td>
		</tr>
		<tr>
			<th> 주 </th>
			<td> <input type="week" name="week"></td> <!-- 몇번째 주인지 -->
		</tr>
		<tr>
			<th> 이메일 </th>
			<td> <input type="email" name="email"></td> <!-- 몇번째 주인지 -->
		</tr>
		<tr>
			<th> 홈페이지 </th>
			<td> <input type="url" name="url"></td> <!-- 몇번째 주인지 -->
		</tr>
		<tr>
			<th colspan="2">
				<input type="submit" value="전송">
				<input type="reset" value="취소">
			</th>
		</tr>
	</table>
</form>
</body>