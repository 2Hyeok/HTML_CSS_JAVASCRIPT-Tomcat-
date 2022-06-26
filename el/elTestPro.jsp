<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<h2>EL - 처리페이지</h2>

<%
	request.setCharacterEncoding("utf-8");
%>
<%
	String name = request.getParameter("name");
	int age = Integer.parseInt(request.getParameter("age"));
	String gender = request.getParameter("gender");
	String hobby[] = request.getParameterValues("hobby");
%>
이름 : <%=name%><br>
나이 : <%=age%><br>
성별 : <%=gender.equals("1") ? "남자" : "여자"%><br>
취미 : <%
		for(int i=0; i<hobby.length; i++){
			switch(hobby[i]){
			case"1" : %> 독서 <%; break;
			case"2" : %> 등산 <%; break;
			case"3" : %> 운동 <%; break;
			case"4" : %> 게임 <%; break;
		}
	}
%><br>
<br>

이름 : ${param.name}<br>
나이 : ${param.age}<br>
성별 : ${param.gender == "1" ? "남자" : "여자"}<br>
취미 : ${paramValues.hobby[0]}<br>
<br>

<%
	request.setAttribute("id", "aaa");
	session.setAttribute("id", "bbb");
	application.setAttribute("id", "ccc");
%>
request : <%=request.getAttribute("id")%><br>
session : <%=session.getAttribute("id")%><br>
application : <%=application.getAttribute("id")%><br>
<br>

request : ${requestScope.id}<br>
session : ${sessionScope.id}<br>
application : ${applicationScope.id}<br>
<br>

request : ${requestScope.passwd = "111"}<br>
session : ${sessionScope.passwd = "222"}<br>
application : ${applicationScope.passwd = "333"}<br>
<br>

request : ${passwd}<br>
<br>
<%
	Cookie cookie1 = new Cookie("id", "aaa");
	Cookie cookie2 = new Cookie("passwd", "111");
	response.addCookie(cookie1);
	response.addCookie(cookie2);
%>
<%
	Cookie cookies[] = request.getCookies();
	for(Cookie cookie : cookies) {
		%>
		<%=cookie.getName()%> : <%=cookie.getValue()%><br>
		<%
	}
%>
<br>

<h2>Bean</h2>

<jsp:useBean id="hong" class="el.User"/>
	<jsp:setProperty name="hong" property="*"/>
이름 : <%=hong.getName()%><br>
나이 : <%=hong.getAge()%><br>
성별 : <%=hong.getGender().equals("1") ? "남자" : "여자" %><br>
취미 : <%=hong.getHobby()[0]%>
<br>

이름 : ${hong.getName()}<br>
이름 : ${hong.name}<br> <%-- 바구니로 받았을때 --%>
나이 : ${hong.age}<br>
나이 : ${hong.gender == "1" ? "남자" :"여자"}<br>
나이 : ${hong.hobby[0]}<br>
<br>
<%
	java.util.Date date = new java.util.Date();
%>
date : ${date}<br> <%-- 출력안됨 --%>

<jsp:useBean id="now" class="java.util.Date"/>
date : ${now}<br>