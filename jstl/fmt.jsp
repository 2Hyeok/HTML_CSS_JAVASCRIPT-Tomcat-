<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<h2> JSTL - fmt</h2>

<fmt:requestEncoding value="utf-8"/> <%-- 한글인코딩 --%>

<form method="post" action="fmt.jsp">
	<table border="1">
		<tr>
			<th>이름</th>
			<td><input type="text" name="name"><td>
			<th><input type="submit" value="전송"></th>
		</tr>
	</table>
</form>
<br>
이름 : ${param.name}<br>
<br><br>

<c:set var="num" value = "${1234.5678}"/>
<fmt:formatNumber value="${num}"/><br>
<fmt:formatNumber value="${num}" type="number"/><br>
<fmt:formatNumber value="${num}" type="percent"/><br> 
<fmt:formatNumber value="${num}" type="currency"/><br>
<fmt:formatNumber value="${num}" type="number" pattern="00,000.0000"/><br>
<fmt:formatNumber value="${num}" type="currency" currencySymbol="$"/><br>
<br>

<c:set var="now" value="<%=new java.util.Date()%>"/>
<fmt:formatDate value="${now}"/> <br>
<fmt:formatDate value="${now}" type="time"/> <br>
<fmt:formatDate value="${now}" type="date"/> <br>
<fmt:formatDate value="${now}" type="both"/> <br>
<fmt:formatDate value="${now}" type="time" pattern="HH:mm:ss"/><br>
<fmt:formatDate value="${now}" type="date" pattern="yyyy-MM-dd"/><br>
<br>