<%@ page language="java"
		 contentType="text/html; charset=UTF-8"
    	 session = "true"
    	 buffer="10kb"
    	 autoFlush="true"
    	 isThreadSafe="true"
    	 pageEncoding="UTF-8"%>

<h2> directive - page </h2>
<!-- 스크립트릿 - 지역변수 or service처리 - 요청시마다 처리 -->
<%
	int a=5, b=7;
%>
a+b=<%out.println(a+b);%><br>
a-b=<%out.println(a-b);%><br>
a*b=<%out.println(a*b);%><br>
a/b=<%out.println(a/b);%><br>