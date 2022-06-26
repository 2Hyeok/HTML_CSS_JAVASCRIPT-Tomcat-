<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    <h2>Cookie - 확인 페이지</h2>
<%
	//클라이언트에서 서버로 처리
	Cookie[] cookies = request.getCookies(); // 배열을 통해서
	for(Cookie cookie : cookies) {
		String name = cookie.getName();
		String value = cookie.getValue();
		%>
		<%=name%> : <%=value%><br>
		<%
	}
%>