<%@page import="java.text.SimpleDateFormat"%>
<%@page import="board.BoardDataBean"%>
<%@page import="board.BoardDBBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="setting.jsp"%>
<link type="text/css" rel="stylesheet" href="<%=project%>/board/style_board.css">
<script src="<%=project%>/board/script.js"></script>

<h2><%=page_content%></h2>

<%
	int num = Integer.parseInt(request.getParameter("num"));
	String pageNum = request.getParameter("pageNum");
	int number = Integer.parseInt(request.getParameter("number"));
%>
<%
	BoardDBBean dao = BoardDBBean.getInstance();
	BoardDataBean dto = dao.getArticle(num); //데이터를 가져다 바로 출력
	if( ! dto.getIp().equals(request.getRemoteAddr()) ){
		dao.addCount(num);
	}
%>
<table>
	<tr>
		<th><%=str_num%></th>
		<td style="text-align:center"><%=number%></td>
		<th><%=str_readcount%></th>
		<td style="text-align:center"><%=dto.getReadcount()%></td>
	</tr>
	<tr>
		<th><%=str_writer%></th>
		<td style="text-align:center"><%=dto.getWriter()%></td>
		<th><%=str_reg_date%></th>
		<td style="text-align:center">
		<%
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
		%>
		<%=sdf.format(dto.getReadcount())%>
		</td>
	</tr>
	<tr>
		<th><%=str_subject%></th>
		<td colspan="3"><%=dto.getSubject()%></td>
	</tr>
	<tr>
		<th><%=str_content%></th>
		<td colspan="3"> <pre><%=dto.getContent()%></pre> </td>
	</tr>
	<tr>
		<th colspan="4">
			<input class="inputbutton" type="button" value="<%=btn_mod%>"
				onclick="location='modifyForm.jsp?num=<%=dto.getNum()%>&pageNum=<%=pageNum%>'">
			<input class="inputbutton" type="button" value="<%=btn_del%>"
				onclick="location='deleteForm.jsp?num=<%=dto.getNum()%>&pageNum=<%=pageNum%>'">
			<input class="inputbutton" type="button" value="<%=btn_reply%>"
				onclick="location='inputForm.jsp?num=<%=dto.getNum()%>&ref=<%=dto.getRef()%>&re_step=<%=dto.getRe_step()%>&re_level=<%=dto.getRe_level()%>'">
			<input class="inputbutton" type="button" value="<%=btn_list%>"
				onclick="location='list.jsp?pageNum=<%=pageNum%>'">
	</tr>
</table>