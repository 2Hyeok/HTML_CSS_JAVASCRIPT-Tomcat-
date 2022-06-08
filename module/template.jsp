<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<h2>템플릿 페이지</h2>

<%
	request.setCharacterEncoding("utf-8");
%>
<%
	String name = request.getParameter("paramName");
	String control = request.getParameter("paramControl");
	String sub = request.getParameter("paramSub");
%>

<table border="1">
	<tr>
		<th colspan="2" height="50">
			<jsp:include page="top.jsp" flush="false"/>
		</th>
	</tr>
	<tr>
		<th height="200" width="100">
			<jsp:include page='<%=control + "left.jsp"%>' flush="false"/>
		</th>
			<td width="300" valign="top">
				<br>
				&nbsp;[[<%=name%>]]
				<br>
				<jsp:include page='<%=control + sub + ".jsp"%>' flush="false"/>
			</td>
		</tr>
		<tr>
			<th colspan="2" height="50">
				<jsp:include page="bottom.jsp" flush="false"/>
			</th>
		</tr>
</table>