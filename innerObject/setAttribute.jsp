<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<h2>내장객체 - 내장객체영역 - setAttribute</h2>

<%
	request.setAttribute("id", "aaa"); // null값 호출 요청을 처리하는 페이지만(데이터를 submit으로 넘길때만 표출)
	session.setAttribute("id", "bbb"); 
	application.setAttribute("id", "ccc");
%>

<input type="button" value="확인" onclick="window.location.href='getAttribute.jsp'">