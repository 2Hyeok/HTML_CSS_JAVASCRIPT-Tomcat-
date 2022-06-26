<%@page import="java.net.URLEncoder"%>
<%@page import="java.io.File"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<h2>파일 업로드 - 처리 페이지</h2>
<%
	String path = application.getRealPath("/save");
	new File(path).mkdir();
%>
저장경로는<%=path%><br>
<%
	MultipartRequest multi
		= new MultipartRequest(request, path, 1024*1024*5, "utf-8", new DefaultFileRenamePolicy());

	String originName1 = multi.getOriginalFileName("upload1");
	String originName2 = multi.getOriginalFileName("upload2");
	String systemName1 = multi.getFilesystemName("upload1");
	String systemName2 = multi.getFilesystemName("upload2");
%>
파일이름1 : <%=originName1%><br>
저장이름1 : <%=systemName1%><br>
파일이름1 : <%=originName2%><br>
저장이름1 : <%=systemName2%><br>

<%
	String name = multi.getParameter("name");
	String title = multi.getParameter("title");
%>
이름 : <%=name%><br>
제목 : <%=title%><br>

<br>
<h2>파일 다운로드</h2>

<%-- 이파일은 다운을하지않고 바로 경로로 이동
파일1 : <a href="/JSP/save/<%=systemName1%>"><%=originName1%></a><br>
파일2 : <a href="/JSP/save/<%=systemName2%>"><%=originName2%></a><br>
 --%>
 
 <%
 	String originName11 = URLEncoder.encode(originName1, "utf-8");
 	String systemName11 = URLEncoder.encode(systemName1, "utf-8");
 	String originName22 = URLEncoder.encode(originName2, "utf-8");
 	String systemName22 = URLEncoder.encode(systemName2, "utf-8");
%>
파일1 : <a href="fileDownload.jsp?originName=<%=originName11%>&systemName=<%=systemName11%>"><%=originName1%></a>
파일2 : <a href="fileDownload.jsp?originName=<%=originName22%>&systemName=<%=systemName22%>"><%=originName2%></a>