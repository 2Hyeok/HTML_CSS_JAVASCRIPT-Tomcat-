<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<h2> JSTL - core - set / remove</h2>
<%
	int a = 10;
%>

scriptlet : <%out.println(a);%> <br>
expression : <%=a%> <br>
EL : ${a}<br> <%-- el 테그는 자바와 공유 X --%>
<br>

<%-- el 테그는 set으로 만들어주어야함 --%>

<c:set var="a" value="10"/> <%-- <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 써주어야 사용가능 --%>
EL : ${a} <br>
out : <c:out value="a"/> <br> <%-- a를 찍어라 --%>
out : <c:out value="${a}"/> <br> <%-- a의 값을 찍어라 --%>

<c:set var="b" value="abc"/><br>
<c:set var="b" value="${'abc'}"/><br>
<c:set var="b" value='${"abc"}'/><br>
<c:set var="b" value="${abc}"/><br> <%-- null값 표시 --%>

b : ${b}<br>
<br>

c:${c}<br>
<c:set var="d">
   "ABC"
</c:set>
d: ${d} <br>

<c:set var = "e">
   ${10}
</c:set>
e : ${e}<br>

<c:set var = "f">
   ${"ABC"}
</c:set>
f: ${f}<br>

<%
	 int g = 20;
%>
<c:set var="g" value="<%=g%>"/>
g:${g}<br>
<c:remove var="g"/>
g:${g}<br>
<br>

<jsp:useBean id="h" class="java.util.Date"/>
date : ${h}<br>
<c:set var="i" value="<%=new java.util.Date()%>"/>
date : ${i}<br>

<c:set var="r" value="<%=new java.util.Random()%>"/>
r : ${r.nextInt(45) + 1}<br>
