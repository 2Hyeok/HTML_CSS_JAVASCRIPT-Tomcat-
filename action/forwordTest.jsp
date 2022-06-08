<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<h2>액션테그 - forward - 흐름 제어 페이지</h2>

<%
	request.setCharacterEncoding("utf-8");
%>

<%
	String name = request.getParameter("name");
	String color = request.getParameter("color");
%>
<%
	String nextpage = null;
	if(color.equals("1")){
		nextpage = "red.jsp";
	}else if(color.equals("2")){
		nextpage = "blue.jsp";
	}else if(color.equals("3")){
		nextpage = "yellow.jsp";
	}else if(color.equals("4")){
		nextpage = "green.jsp";
	}
%>

<jsp:forward page="<%=nextpage%>">
	<jsp:param name="paramName" value="<%=name%>"/>
</jsp:forward>