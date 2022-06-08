<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<h2>액션테그 - include - 처리 페이지1</h2>

<%
	request.setCharacterEncoding("utf-8");
%>
<%
	String name = request.getParameter("name");
	int age = Integer.parseInt(request.getParameter("age"));
%>
이름 : <%=name%><br>
나이 : <%=age%><br>


<hr size="3" color="red" noshade>
<%--
<jsp:include page="includeTest2.jsp" flush="false"/> <!-- 이렇게 닫아줘야함 -->
 jsp주석 --%>
 
 <jsp:include page="includeTest2.jsp" flush="false">
 	<jsp:param name="paramName" value="<%=name%>"/>
 	<jsp:param name="paramAge" value="<%=age%>"/>
 </jsp:include>