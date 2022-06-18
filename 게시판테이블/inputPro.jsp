<%@page import="board.BoardDBBean"%>
<%@page import="java.sql.Timestamp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="setting.jsp"%>
<link type="text/css" rel="stylesheet" href="<%=project%>/board/style_board.css">
<script src="<%=project%>/board/script.js"></script>
   
<h2><%=page_write%></h2>

<%
	request.setCharacterEncoding("utf-8");
%>

<jsp:useBean id="dto" class="board.BoardDataBean"/> <!-- DBBean에 모든 값을 보낸후 받아옴 -->
	<jsp:setProperty name="dto" property="*"/>
	<!-- write email subject content passwd -->
	<!-- num ref re_step re_level -->
	
<%
	dto.setReg_date(new Timestamp(System.currentTimeMillis()));
%>
<%
	dto.setIp(request.getRemoteAddr()); //이클립스에서 ipv6로 가져오기 때문에 ipv4로 설정을 바꿔야함
		//run as -> run configulation -> arguments -> VM arguments 칸에 -Djava.net.preferIPv4Stack=true 삽입.
%>
<%
	BoardDBBean dao = BoardDBBean.getInstance();
	int result = dao.insertArticle(dto);
	if(result == 0) {
		%>
		<script type="text/javascript">
		 <!--
         alert( inserterror );
         //-->
		</script>
		<meta http-equiv="refresh" content="0; url=list.jsp">
		<%
	}else {
		response.sendRedirect("list.jsp");
	}
%>