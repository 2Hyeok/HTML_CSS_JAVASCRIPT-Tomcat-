<%@page import="java.text.SimpleDateFormat"%>
<%@page import="board.BoardDataBean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="board.BoardDBBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="setting.jsp"%>
<link type="text/css" rel="stylesheet" href="<%=project%>/board/style_board.css">
<script src="<%=project%>/board/script.js"></script>

<%
	int pageSize = 10; // 한페이지의 출력할 갯수
	int pageBlock = 3;
	
	int count = 0;
	String pageNum = null;
	int currentPage = 0;
	int start = 0;
	int end = 0;
	int number = 0;
	
	int pageCount = 0;
	int startPage = 0;
	int endPage = 0;
%>
<%
	pageNum = request.getParameter("pageNum");
	if(pageNum == null){
		// 페이지가 안넘어올 시
		pageNum = "1";
	}
	currentPage = Integer.parseInt(pageNum);
	start = (currentPage -1 ) * pageSize + 1;		//(5-1) * 10 + 1 			41
	end = start + pageSize - 1;						//41 + 10 - 1				50
	
	BoardDBBean dao = BoardDBBean.getInstance();
	count = dao.getCount();
	
	if(end > count)end = count;
	
	number = count - (currentPage - 1) * pageSize;			//50 - (5 - 1) * 10			10
	
	pageCount = (count / pageSize) + (count % pageSize > 0 ? 1 : 0);
	startPage = (currentPage/pageBlock) * pageBlock + 1;	//		(5/10) * 10 + 1
	if(currentPage % pageBlock == 0)startPage -= pageBlock; 
	endPage = startPage + pageBlock - 1;
	
	if(endPage > pageCount) endPage = pageCount;
%>

<h2><%=page_list%> ( <%=str_count%> : <%=count%> )</h2>

<table>
	<tr>
		<td colspan="6" style="text-align:right">
			<a href="inputForm.jsp"><%=str_write%></a>&nbsp;&nbsp;&nbsp;
	</tr>
	<tr>
		<th style="width:7%"><%=str_num%></th>
		<th style="width:35%"><%=str_subject%></th>
		<th style="width:10%"><%=str_writer%></th>
		<th style="width:15%"><%=str_reg_date%></th>
		<th style="width:7%"><%=str_readcount%></th>
		<th style="width:10%"><%=str_ip%></th>
	</tr>
	<%
		if(count == 0){
			//글이 없는 경우
			%>
			<tr>
				<td colspan="6" style="text-align:center"><%=msg_list%></td>
			</tr>
			<%
		}else {
			// 글이 있는 경우
			ArrayList <BoardDataBean> dtos = dao.getArticles(start, end);
			for(BoardDataBean dto : dtos){
				%>
				<tr>
					<td style="text-align:center">
						<%=number--%> <!-- getNum으로 출력시 번호가 이상하기에 나중에 잡아줘야함 -->
					</td>
					<td>
						<%
							int level = dto.getRe_level();
							int wid = (level - 1) *10;
							if(level > 1){
								%>
								<img src="../images/level.gif" width="<%=wid%>" height="15">
								<%
							}
							if(level > 0) {
								%>
								<img src="../images/re.gif" width="15" height="15">
								<%
							}
							if(dto.getReadcount() == -1){
								%>
									<%=dto.getSubject()%>
								<%
							}else {
						%>
						<a href="content.jsp?num=<%=dto.getNum()%>&pageNum=<%=pageNum%>&number=<%=number+1%>">
						<%=dto.getSubject()%>
						</a>
						<%
					}
					%>
					</td>
					<td style="text-align:center">
						<%=dto.getWriter()%>
					</td>
					<td style="text-align:center">
						<%
						SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
						%>
						<%=sdf.format(dto.getReg_date() )%>
					</td>
					<td style="text-align:center">
					<%
						if(dto.getReadcount() == -1) {
							// 아무값도 주지않고 빈값으로나오기때문에 띄어쓰기를 써 빈값으로 나오게함
							%>
							&nbsp;
							<%
						}else {
						%>
							<%=dto.getReadcount()%>
						<%
					}
					%>
					</td>
					<td style="text-align:center">
						<%=dto.getIp()%>
					</td>
				</tr>
				<%
			}
		}
	%>
	<tr>
	</tr>
</table>
<br>
<center>
<%
	if(count > 0){
		if(startPage > pageBlock){
			%>
			<a href="list.jsp?pageNum=<%=startPage - pageBlock%>">[◀]</a>
			<%
		}
		for(int i= startPage; i<=endPage; i++){
			if(i == currentPage){
				%>
				<b>[<%=i%>]</b>
				<%
			}else {
				 %>
				 <a href="list.jsp?pageNum=<%=i%>">[<%=i%>]</a>
				 <%
			}
		}
		if(pageCount > endPage){
			%>
			<a href="list.jsp?pageNum=<%=startPage + pageBlock%>">[▶]</a>
			<%
		}
	}
%>
</center>