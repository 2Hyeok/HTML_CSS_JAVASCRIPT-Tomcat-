<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<h2>directive - include</h2>

<%@ include file="top.jsp" %>

<hr size="3" color="red" noshade>

	현재 페이지는 포함하는 페이지 include.jsp 페이지 입니다.<br>
	<%out.println(name); %>님 안녕하세요<br>
	


<hr size="3" color="red" noshade>

<%@ include file="bottom.jsp" %>
