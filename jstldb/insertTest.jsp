<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<h2>JSTL - sql - insert </h2>

<fmt:requestEncoding value="utf-8"/>
<%-- 데이터 가없는경우 --%>
<c:if test="${param.id == null or param.id == ''}">
<form method="post" action="insertTest.jsp">
	<table border="1">
		<tr>
			<th>아이디</th>
			<td><input type="text" name="id"></td>
		</tr>
		<tr>
			<th>비밀번호</th>
			<td><input type="password" name="passwd"></td>
		</tr>
		<tr>
			<th>이름</th>
			<td><input type="text" name="name"></td>
		</tr>
		<tr>
			<th>전화번호</th>
			<td><input type="text" name="tel"></td>
		</tr>
		<tr>
			<th colspan="2">
				<input type="submit" value="가입">
				<input type="button" value="취소" onclick="location='selectTest.jsp'">
			</th>
		</tr>
	</table>
</form>
</c:if>
<%-- 데이터가 있을 경우 --%>
<c:if test="${param.id != null and param.id != ''}">
	<sql:update var="result" dataSource="jdbc/bit">
		insert into dbtest values(?, ?, ?, ?, sysdate)
		<sql:param value="${param.id}"/>
		<sql:param value="${param.passwd}"/>
		<sql:param value="${param.name}"/>
		<sql:param value="${param.tel}"/>
	</sql:update>
	<c:if test="${result == 0}">
		가입실패 <br>
	</c:if>
	<c:if test="${result != 0 }">
		<c:redirect url="selectTest.jsp"/>
	</c:if>
</c:if>