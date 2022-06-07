<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    <h2>script - declaration</h2> <!-- 선언문 -->
<%
	String name="지역변수"; 
%>
<%!
	String name="전역변수"; // 이름이 같아도 영역이 달라 중복이 가능
	public int hap(int a, int b){
	return a+b;
	}
	public int gop(int a, int b){
	return a*b;
	}
%>
합:<%=hap(5,2)%><br>
곱:<%=gop(5,2)%><br>
