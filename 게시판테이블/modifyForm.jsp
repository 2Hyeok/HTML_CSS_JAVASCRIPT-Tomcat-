<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="setting.jsp"%>
<link type="text/css" rel="stylesheet" href="<%=project%>/board/style_board.css">
<script src="<%=project%>/board/script.js"></script>

<h2><%=page_modify%></h2>


<%
	int num = Integer.parseInt(request.getParameter("num"));
	String pageNum = request.getParameter("pageNum");
%>

<form name="passwdform" method="post" action="modifyView.jsp" onsubmit="return passwdcheck()">
	<input type="hidden" name="num" value="<%=num%>">
	<input type="hidden" name="pageNum" value="<%=pageNum%>">
	<table>
		<tr>
			<th colspan="2"><%=msg_passwd%></th>
		</tr>
		<tr>
			<th><%=str_passwd%></th>
			<td> <input class="input" type="password" name="passwd" maxlength="20" autofocus></td>
		</tr>
		<tr>
			<th colspan="2">
				<input class="inputbutton" type="submit" value="<%=btn_mod%>">
				<input class="inputbutton" type="button" value="<%=btn_mod_cancel%>"
					onclick="location='list.jsp?pageNum=<%=pageNum%>'">
			</th>
		</tr>
	</table>
</form>