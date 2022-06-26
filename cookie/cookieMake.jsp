<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    <h2>Cookie - 생성 페이지</h2>
    
<%
	Cookie cookie = new Cookie("id", "aaa");
	
	// 서버에서 클라이언트로가기
	response.addCookie(cookie);
%>
확인<input type="button" value="확인" onclick="window.location.href='cookieUse.jsp'"> 
