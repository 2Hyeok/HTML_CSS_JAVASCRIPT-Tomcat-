<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<h2>액션테그 - forward - 출력 페이지</h2>

<%
	request.setCharacterEncoding("utf-8");
%>
<%
	String name = request.getParameter("paramName");
%>
<body bgcolor="blue">
	<%=name%>님 안녕하세요<br>
	당신이 선택한 색상은 파란색 입니다
</body>
