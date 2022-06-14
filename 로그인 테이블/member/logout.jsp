<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="setting.jsp"%>
<h2><%=page_logout%></h2>

<%
	session.removeAttribute("memId");
	response.sendRedirect("main.jsp");
%>