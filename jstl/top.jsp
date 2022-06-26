<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

현재 페이지는 포함되는 페이지 top.jsp 입니다 <br>

<%--
<%
	String name = request.getParameter("paramName");
%>
	<%=name%>님 안녕하세요
 --%>
 
 ${param.paramName}님 안녕하세요<br>