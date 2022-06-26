<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    <h2>Session - 생성 페이지</h2>
    
<%
	session.setAttribute("id", "aaa");
	session.setAttribute("passwd", "111");
%>
확인<input type="button" value="확인" onclick="window.location.href='sessionView.jsp'">

<%
	//session.removeAttribute("id"); // 지정한 값을 지움
	session.invalidate(); // 모든 세션을 지움
%>
