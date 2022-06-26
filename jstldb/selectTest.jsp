<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>

<h2>JSTL - sql - select </h2>
    
<c:if test="${param.id == null or param.id ==''}">
	<sql:query var="rs" dataSource="jdbc/bit">
		select * from dbtest
	</sql:query>
</c:if>
<c:if test="${param.id != null and param.id !=''}">
	<sql:query var="rs" dataSource="jdbc/bit">
		select * from dbtest where id=?
		<sql:param value="${param.id}"/>
	</sql:query>
</c:if>

<table border="1">
	<tr>
		<c:forEach var="colum" items="${rs.columnNames}">
			<th>${colum}</th>
		</c:forEach>
		<th>
			<input type="button" value="가입" onclick="location='insertTest.jsp'">
		</th>
	</tr>
	<c:forEach var="row" items="${rs.rowsByIndex}"> <%--${rs.rows} or ${rs.rowsByIndex} <- 인덱스를 받을것이라면 사용--%>
		<tr>
			<c:forEach var="cols" items="${row}">
				<td>${cols}</td>
			</c:forEach>
			<td>
			<input type="button" value="수정" onclick="location='updateTest.jsp?id=${row[0]}'">
			<input type="button" value="삭제" onclick="location='deleteTest.jsp?id=${row[0]}'">
			</td>
		</tr>
	</c:forEach>
</table>