<%@page import="member.LogonDBBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	
<%@ include file="setting.jsp"%>
<script src="<%=project%>/member/script.js"></script>
	<h2><%=page_modify%></h2>
	
<jsp:useBean id="dto" class="member.LogonDataBean"/>
	<jsp:setProperty name="dto" property="*"/>
	<!-- passwd -->
<%
	dto.setId ((String) session.getAttribute("memId"));
%>	
<%
	String tel = null;
	String tel1 = request.getParameter("tel1");
	String tel2 = request.getParameter("tel2");
	String tel3 = request.getParameter("tel3");
	
	if( ! tel1.equals("")&& ! tel2.equals("") && ! tel3.equals("")){
		tel = tel1 + "-" + tel2 + "-" + tel3;
	}
	dto.setTel(tel);
%>
<%
	String email = null;
	String email1 = request.getParameter("email1");
	String email2 = request.getParameter("email2");
	
	if(! email1.equals("") && ! email2.equals("")){
		email = email1 + "@" + email2;
	}
	dto.setEmail(email);
%>
<%
	LogonDBBean dao = LogonDBBean.getInstance();
	int result = dao.modifyMember(dto);
	if(result == 0){
		// 수정실패
		%>
		<script type="text/javascript">
		<!--
		alert(modifyerror);
		//-->
		</script>
		<meta http-equiv="refresh" content="0; url=main.jsp">
		<%
	} else {
		// 수정성공
		response.sendRedirect("main.jsp");
	}
%>