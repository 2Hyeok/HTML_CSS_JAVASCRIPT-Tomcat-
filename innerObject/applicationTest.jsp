<%@page import="java.util.Enumeration"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<h2>내장객체 - application</h2>
<%
	String info = application.getServerInfo();
	int major = application.getMajorVersion();
	int minor = application.getMinorVersion();
	String path = application.getRealPath("/");
%>
서버정보 : <%=info%><br>
서버버전 : <%=major%>.<%=minor%><br>
실제 경로 : <%=path%><br>

<br><br>
<%
	Enumeration <String> e = application.getInitParameterNames(); //컬랙선
	while(e.hasMoreElements()) {
		String name = e.nextElement();
		String value = application.getInitParameter(name);
		%>
		<%=name%> - <%=value%><br>
		<%
	}
%>
