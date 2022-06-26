<%@page import="java.net.URLEncoder"%>
<%@page import="java.io.FileOutputStream"%>
<%@page import="java.io.BufferedOutputStream"%>
<%@page import="java.io.FileInputStream"%>
<%@page import="java.io.BufferedInputStream"%>
<%@page import="java.net.URLDecoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<h2>파일 업로드 - 다운로드</h2>

<%
	String originName = request.getParameter("originName");
	String systemName = request.getParameter("systemName");
	originName = URLDecoder.decode(originName, "utf-8");
	originName = URLDecoder.decode(systemName, "utf-8");
%>

파일이름 : <%=originName%><br>
저장이름 : <%=systemName%><br>

<%
	out.clear();
	out = pageContext.pushBody();
	String path = application.getRealPath("/save");
	String filename = path + "/" + systemName;
	
	BufferedInputStream bis = new BufferedInputStream(new FileInputStream(filename));
	BufferedOutputStream bos = new BufferedOutputStream(response.getOutputStream());
	
	response.setContentType("text/unknow" );
	response.setHeader("content-disposition", "attachement;filename=" + URLEncoder.encode(originName,"utf-8"));
	
	byte buffer[] = new byte[1024];
	int length = 0;
	while( (length = bis.read(buffer, 0, buffer.length)) != -1){
		bos.write(buffer, 0, length);
	}
	bis.close();
	bos.close();
%>