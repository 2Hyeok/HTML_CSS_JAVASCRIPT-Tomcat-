<%@page import="java.net.URLEncoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<h2>JSTL - core - redirect 1 </h2>

<%
	request.setCharacterEncoding("utf-8");
%>

현재 페이지는 리다이렉트 되기전 페이지 입니다. redirect1.jsp<br>

<%
	String name = "홍길동";
%>
<%--
<jsp:forward page="redirect2.jsp">
	<jsp:param name="name" value="<%=name%>"/>
</jsp:forward>
--%>

<%--
	response.sendRedirect("redirect2.jsp?name=" + URLEncoder.encode(name, "utf-8"));
--%>

<c:redirect url="redirect2.jsp">
	<c:param name="name" value="<%=name%>"/>
</c:redirect>