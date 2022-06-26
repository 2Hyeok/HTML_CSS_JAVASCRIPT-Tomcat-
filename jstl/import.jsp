<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<h2>JSTL - core - import</h2>

<%
	request.setCharacterEncoding("utf-8");
%>
<%
	String name = "홍길동";
%>
<%--
<jsp:include page="top.jsp" flush="false";>
	<jsp:param name="paramName" value="<%=name%>"/>
</jsp:include>
 --%>	
 
 <c:import url="top.jsp">
 	<c:param name="paramName" value="<%=name%>"/>
 </c:import>

<hr size="3" color="red" noshape>

현재 페이지는 포함하는 페이지 import.jsp 입니다.

<hr size="3" color="red" noshape>

<c:import url="bottom.jsp"/>