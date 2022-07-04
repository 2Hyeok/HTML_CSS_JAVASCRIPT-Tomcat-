<%@page import="javax.imageio.ImageIO"%>
<%@page import="java.awt.Graphics"%>
<%@page import="java.awt.image.BufferedImage"%>
<%@page import="javax.media.jai.JAI"%>
<%@page import="javax.media.jai.RenderedOp"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="java.io.File"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<h2>썸네일 이미지 - 처리 페이지</h2>

<%
	String path = application.getRealPath("/save");
	new File(path).mkdir();
	
	 MultipartRequest multi = new  MultipartRequest(request, path, 1024*1024*5, "utf-8", new DefaultFileRenamePolicy());
	 
	 String name = multi.getParameter("name");
	 String title = multi.getParameter("title");
	 String originName = multi.getOriginalFileName("image");
	 String systemName = multi.getOriginalFileName("image");
%>
저장경로 : <%=path%><br>
이름 : <%=name%><br>
제목 : <%=title%><br>
파일이름 : <%=originName%><br>
저장이름 : <%=systemName%><br>
<br>

<img src="/JSP/save/<%=systemName%>">
<br>

<% // \\두개 쓰는이유는 제어문자 이기에 하나만쓰면 인식을 못함 or "/" 하나만 사용
	String oname = path + "\\" + systemName;
	String tname = path + "\\t" + systemName;
	int size = 2;
%>
<%
	RenderedOp op = JAI.create("fileload", oname); //읽어오는
	BufferedImage obuffer = op.getAsBufferedImage(); // 버퍼로 옮기는
	int width = obuffer.getWidth()/size;
	int height = obuffer.getHeight()/size;
	
	BufferedImage tbuffer = new BufferedImage(width, height, BufferedImage.TYPE_INT_RGB);
	Graphics g = tbuffer.getGraphics();
	g.drawImage(obuffer, 0, 0, width, height, null);
	
	//원본이미지에 맞춰 하나만 만들어짐
	ImageIO.write(tbuffer, "jpg", new File(tname)); //jpg파일만 처리
	ImageIO.write(tbuffer, "png", new File(tname)); //png파일만 처리
	ImageIO.write(tbuffer, "gif", new File(tname)); //gif파일만 처리
%>
<img src="/JSP/save/t<%=systemName%>">
<br>

<h2> 이미지 다운로드</h2>

<%-- 
<a href="/JSP/save/<%=systemName%>"><%=originName%></a>
 --%>
 
 <%-- 이미 만들어둔 파일 fileDownload.jsp 에서 get방식 가져오기 --%>
 <a href="/JSP/file/fileDownload.jsp?originName=<%=originName%>&systemName=<%=systemName%>"><%=originName%></a>