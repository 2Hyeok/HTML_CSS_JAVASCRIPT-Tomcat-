<%@page import="java.net.URLDecoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%--
<%
	request.setCharacterEncoding("utf-8");

	String name = URLDecoder.decode(request.getParameter("name"), "utf-8");
%>
<c:set var="name" value="<%=name%>"/>
 --%>
현재 페이지는 리다이렉트 된 페이지 입니다. redirect2.jsp<br>
	${param.name}님 안녕하세요.<br>