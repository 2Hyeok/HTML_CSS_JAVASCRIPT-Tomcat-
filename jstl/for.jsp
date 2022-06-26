<%@page import="java.util.HashMap"%>
<%@page import="java.util.Vector"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<h2>JSTL - core - forEach / forTokens</h2>

<c:forEach var="i" begin="1" end="10">
	${i}&nbsp;
</c:forEach>
<br>

<c:forEach var="i" begin="1" end="10" step="2">
	${i}&nbsp;
</c:forEach>
<br>

<%-- 거꾸로 돌지 못하고 에러가 남
<c:forEach var="i" begin="10" end="1" step="-1">
	${i}&nbsp;
</c:forEach>
 --%>
 <c:set var="a" value="${10}"/>
 <c:forEach var="i" begin="1" end="10">
 	${a}&nbsp;
 	<c:set var="a" value="${a-1}"/> <%-- 거꾸로 출력하는 --%>
 </c:forEach>
 <br>
 
 <%
 	int m[] = {10, 20, 30, 40, 50};
 	for(int a : m) {
 		%>
 		<%=a%>&nbsp;
 		<%
 	}
 %>
 <br>
 
 <c:set var="m" value="<%=new int[] {10, 20, 30, 40, 50}%>"/> <%-- 자바의 도움을 받아야만 배열 사용가능--%>
 <c:forEach var="a" items="${m}">
 	${a}&nbsp;
 </c:forEach>
 <br>
 
 <%-- 백터 역시 자바코드이기때문에 자바단을 잡아주어야함 --%>
 <%
 	Vector <String> v = new Vector <String>();
 	v.add("홍길동");
 	v.add("이순신");
 	v.add("김유신");
 %>
 <c:set var="v" value="<%=v%>"/>
 <c:forEach var="a" items="${v}">
 	${a}&nbsp;
 </c:forEach>
 <br>
 
 <%-- map은 자동정렬됨 --%>
 <%
 	HashMap<Integer, String> map = new HashMap <Integer, String>();
	map.put(9, "홍길동");
	map.put(7, "이순신");
	map.put(0, "김유신");
	map.put(1, "강감찬");
%>
<c:forEach var="user" items="<%=map%>">
	${user.key} : ${user.value} <br>
</c:forEach>
<br>

<c:forTokens var="token" items="${'1,2,3,4,5'}" delims="${','}"> <%-- delims는 구분자 --%>
	${token}&nbsp;
</c:forTokens>
<br>

<!--  87, 36, 78, 67, 92, 45, 89, 29, 74, 69 -->
<!--  총점 평균 출력 -->

<c:set var="sum" value="${0}"/>
<c:set var="avg" value="${0}"/>
<c:forTokens var="a" items="${'87, 36, 78, 67, 92, 45, 89, 29, 74, 69'}" delims="${', '}">
	<c:set var="sum" value="${sum+a}"/>
</c:forTokens>
합계 : ${sum} <br>
합계 : ${sum/10} <br>
<br>