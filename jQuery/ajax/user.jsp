<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<h2> Simple Ajax </h2>
<%
	request.setCharacterEncoding("utf-8");
%>

이름 : ${param.name} <br>
나이 : ${param.age} <br>

<%-- 여기서 출력한 내용이 전부 simple.jsp로 자동으로 넘어감 --%>