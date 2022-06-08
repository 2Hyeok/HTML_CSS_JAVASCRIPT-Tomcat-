<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<h2>내장객체 - response1</h2>

현재 페이지는 리다이렉트 되기 전 페이지 responseTest1.jsp입니다<br>

<%
	response.sendRedirect("responseTest2.jsp"); // 응답을 다른페이지로 하기위한 코드 (흐름제어)
%>