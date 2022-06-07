<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    buffer="10kb"%>

    <h2>내장객체 - out</h2>

<%
	int size = out.getBufferSize(); // 버퍼의 크기
	int remainSize = out.getRemaining();
	int useSize = size - remainSize;
%>
버퍼크기 : <%out.println(size);%><br>
버퍼크기:<%=size%><br>
남은크기 : <%=remainSize%><br>
사용한 크기 : <%=useSize%><br>