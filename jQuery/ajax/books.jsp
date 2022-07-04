<?xml version="1.0" encoding="UTF-8"?> <%-- xml로 응답하겠다는 의미. 반드시 첫 줄에 있어야 한다. --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<books>
	<![CDATA[
	{
		book : [
			{
				title : "Java 프로그래밍",
				author : "홍길동",
				price : "25,000"
			},
			{
				title : "JSP 웹프로그래밍",
				author : "이순신",
				price : "35,000"
			},
			{
				title : "Spring 프레임워크",
				author : "김유신",
				price : "45,000"
			}
		]
	}
	]]>
	
</books>
