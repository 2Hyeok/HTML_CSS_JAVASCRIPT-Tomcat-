<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="setting.jsp"%>
<link type="text/css" rel="stylesheet" href="<%=project%>/member/style_member.css">
<script src="<%=project%>/member/script.js"></script>

	<h2><%=page_main%></h2>
<%
	if(session.getAttribute("memId") != null){
		// 로그인이 된 상태
		%>
		<table>
			<tr>
				<th style="width:300px;"> <span><%=session.getAttribute("memId")%></span><%=msg_welcome%>
			</tr>
			<tr>
				<th>
					<input class="inputbutton" type="button" value="<%=btn_modify%>"
						onclick="location='modifyForm.jsp'">
					<input class="inputbutton" type="button" value="<%=btn_delete%>"
						onclick="location='deleteForm.jsp'">
					<input class="inputbutton" type="button" value="<%=btn_logout%>"
						onclick="location='logout.jsp'">
				</th>
		</table>
		<%		
	} else {
		// 로그인이 안된 상태
		%>
		<form name="mainform" method="post" action="loginPro.jsp" onsubmit="return maincheck()">
			<table border = "1">
				<tr>
					<th colspan="2">
						<%=msg_main %>
					</th>
				</tr>
				<tr>
					<th><%=str_id%></th>
					<td><input class="input" type="text" name="id" maxlength="30"></td>
				</tr>
				<tr>
					<th><%=str_passwd%></th>
					<td><input class="input" type="password" name="passwd" maxlength="30"></td>
				</tr>
				<tr>
					<th colspan="2">
						<input class = "inputbutton" type="submit" value="<%=btn_login%>">
						<input class = "inputbutton" type="reset" value="<%=btn_cancel%>">
						<input class = "inputbutton" type="button" value="<%=btn_input%>"
							onclick="location='inputForm.jsp'">
					</th>
				</tr>
			</table>
		</form>
		<%
	}
%>