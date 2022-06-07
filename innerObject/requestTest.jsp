<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<h2>내장객체 - request - 처리 페이지</h2>
<%
	request.setCharacterEncoding("utf-8");
%>

<%
	String name = request.getParameter("name");
	int age = Integer.parseInt(request.getParameter("age"));
	String gender = request.getParameter("gender");
	String hobby[] = request.getParameterValues("hobby");
%>
당신의 이름은<%=name%> 이고<br>
당신의 나이는<%=age%>이고<br>

<%
	if(gender.equals("1")){
		%>
		성별은 남자입니다<br>
		<%
	} else {
		%>
		성별은 여자입니다<br>
		<%
	}
%>

당신의 취미는
<%
	for(int i=0; i<hobby.length; i++){
	switch(hobby[i]){
	case "1":%>독서<%; break;
	case "2":%>등산<%; break;
	case "3":%>운동<%; break;
	case "4":%>게임<%; break;
	}
}
%>
입니다<br>