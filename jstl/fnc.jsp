<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
    
    <h2>JSTL - functions </h2>
    
<c:set var="str" value="${'Hello JSTL!!!'}"/>
length : ${fn:length(str)}<br>
startswith : ${fn:startsWith(str, "he")}<br>
toUpperCase : ${fn:toUpperCase(str)}<br>
toLowerCase : ${fn:toLowerCase(str)}<br>
substring : ${fn:substring(str, 6, fn:length(str))}<br>

<c:set var="m" value="<%=new int[]{10, 20, 30, 40, 50}%>"/>
join : ${m}<br>
join : ${fn:join(m, "/")}<br>

<c:set var="a" value="${'10, 20, 30, 40, 50'}"/>
split : 
<c:forEach var="s" items="${fn:split(a, ',')}">
	${s}&nbsp;
</c:forEach>
<br>
<br>

<c:set var="b" value="${'		a		a		a'}"/>
trim : <pre>${b}</pre><br>
trim : <pre>${fn:trim(b)}</pre><br>