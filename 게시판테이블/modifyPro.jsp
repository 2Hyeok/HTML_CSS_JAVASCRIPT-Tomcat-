<%@page import="board.BoardDBBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="setting.jsp"%>
<link type="text/css" rel="stylesheet" href="<%=project%>/board/style_board.css">
<script src="<%=project%>/board/script.js"></script>

<h2><%=page_delete%></h2>

<%
	request.setCharacterEncoding("utf-8");
%>
<jsp:useBean id="dto" class="board.BoardDataBean"/>
	<jsp:setProperty name="dto" property="*"/>
	<!-- num email subject content passwd -->
<%
	String pageNum = request.getParameter("pageNum");
%>
<%
	BoardDBBean dao = BoardDBBean.getInstance();
	int result = dao.modifyArticle(dto);
	if(result == 0){
		%>
		<script type="text/javascript">
			<!--
			alert(modifyerror);
			//-->
		</script>
		<meta http-equiv="refresh" content="0; url=list.jsp?pageNum=<%=pageNum%>">
		<%
	}else {
		response.sendRedirect("list.jsp?pageNum=" + pageNum);
	}
%>