<%@page import="java.text.SimpleDateFormat"%>
<%@page import="member.LogonDataBean"%>
<%@page import="member.LogonDBBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="setting.jsp"%>
<link type="text/css" rel="stylesheet" href="<%=project%>/member/style_member.css">
<script src="<%=project%>/member/script.js"></script>

<h2><%=page_modify%></h2>

<%
	String id = (String) session.getAttribute("memId");
	String passwd = request.getParameter("passwd");
%>
<%
	LogonDBBean dao = LogonDBBean.getInstance();
	int result = dao.check(id, passwd);
	if( result == 0){
		// 비밀번호가 다르다
		%>
		<script type="text/javascript">
			<!--
			erroralert(passwderror);
			//-->>
		</script>
		<%
	}else {
		// 비밀번호가 같다.
		   LogonDataBean dto = dao.getMember( id );
		%>
		<form name="modifyform" method="post" action="modifyPro.jsp" onsubmit="return modifycheck()">
			<table>
				<tr>
					<th colspan="2"> <%=msg_modify%> </th>
				</tr>
				<tr>
					<th> <%=str_id%> </th>
					<td> &nbsp; <%=dto.getId()%> </td>
				</tr>
				<tr>
					<th rowspan="2"><%=str_passwd%></th>
					<td>
						<input class="input" type="password" name="passwd" maxlength="30" value="<%=dto.getPasswd()%>">
					</td>		
				</tr>
				<tr>
					<td>
						<input class="input" type="password" name="repasswd" maxlength="30" value="<%=dto.getPasswd()%>">
					</td>
				</tr>
				<tr>
					<th><%=str_name%></th>
					<td>&nbsp;<%=dto.getName()%></td>
				</tr>
				<tr>
					<th><%=str_jumin%></th>
					<td>&nbsp;<%=dto.getJumin1()%> - <%=dto.getJumin2()%></td>
				</tr>
				<tr>
					<th><%=str_tel%>
					<td>
						<%
						String tel = dto.getTel();
						if(tel == null || tel.equals("")) {
							%>
							<input class="input" type="text" name="tel1" maxlength="3" style="width:30px">
							- <input class="input" type="text" name="tel2" maxlength="4" style="width:40px">
							- <input class="input" type="text" name="tel3" maxlength="4" style="width:40px">
							<%
						}else {
							String t[] = tel.split("-");
							%>
							<input class="input" type="text" name="tel1" maxlength="3" style="width:30px" value="<%=t[0]%>">
							- <input class="input" type="text" name="tel2" maxlength="4" style="width:40px" value="<%=t[1]%>">
							- <input class="input" type="text" name="tel3" maxlength="4" style="width:40px" value="<%=t[2]%>">
							<%						
							}
						%>
					</td>
				</tr>
				<tr>
					<th><%=str_email%></th>
					<td>
						<%
						String email = dto.getEmail();
						if(email == null || email.equals("")){
							%>
							<input class="input" type="text" name="email1" maxlength="15" style="width:100px">
							@
							<input class="input" type="text" name="email2" maxlength="15" style="width:100px">
							<%
						}else {
							String e[] = email.split("@");
							%>
							<input class="input" type="text" name="email1" maxlength="15" style="width:100px" value="<%=e[0]%>">
							@
							<input class="input" type="text" name="email2" maxlength="15" style="width:100px" value="<%=e[1]%>">
							<%
						}
						%>
					</td>
				</tr>
				<tr>
					<th><%=str_reg_date%></th>
					<td>
						<%
						SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
						%>
						<%=sdf.format(dto.getReg_date())%>
					</td>
				</tr>
				<tr>
					<th colspan="2">
						<input class="inputbutton" type="submit" value="<%=btn_mod%>">
						<input class="inputbutton" type="reset" value="<%=btn_cancel%>">
						<input class="inputbutton" type="button" value="<%=btn_mod_cancel%>"
							onclick="location='main.jsp'">
					</th>
				</tr>
			</table>
		</form>
		
		<%
	}
%>