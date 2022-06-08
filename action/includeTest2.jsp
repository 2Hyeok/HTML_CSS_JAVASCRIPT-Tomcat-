<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<h2>액션테그 - include - 처리 페이지2</h2>

<%--
	String name = request.getParameter("name");
	int age = Integer.parseInt(request.getParameter("age"));
--%>

<%
	String name = request.getParameter("paramName");
	int age = Integer.parseInt(request.getParameter("age"));
%>
이름 : <%=name%><br>
나이 : <%=age%><br>