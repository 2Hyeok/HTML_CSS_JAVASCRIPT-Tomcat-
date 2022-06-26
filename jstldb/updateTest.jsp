<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>

<h2>JSTL - sql - update </h2>

<c:if test="${param.passwd == null or param.passwd ==''}">
	<form method="post" action="updateTest.jsp">
		<input type="hidden" name="id" value="${param.id}"/>
		<table border="1">
			<tr>
				<th>비밀번호</th>
				<td><input type="password" name="passwd"></td>
			</tr>
			<tr>
			<th colspan="2">
				<input type="submit" value="수정">
				<input type="button" value="취소" onclick="location='selectTest.jsp'">
			</th>
		</tr>
		</table>
	</form>
</c:if>
<c:if test="${param.passwd != null and param.passwd !=''}">
	<sql:query var="rs" dataSource="jdbc/bit">
		select * from dbtest where id=?
		<sql:param value="${param.id}"/>
	</sql:query>
	<c:forEach var="row" items="${rs.rows}">
		<c:if test="${param.passwd == row.passwd}">
			<form method="post" action="updatePro.jsp">
				<input type="hidden" name="id" value="${row.id}">
				<table border="1">
					<tr>
						<th>아이디</th>
						<td>${row.id}</td>
					</tr>
					<tr>
						<th>비밀번호</th>
						<td><input type="password" name=passwd value="${row.passwd}"></td>
					</tr>
					<tr>
						<th>이름</th>
						<td>${row.name}</td>
					</tr>
					<tr>
						<th>전화번호</th>
						<td><input type="text" name=tel value="${row.tel}"></td>
					</tr>
					<tr>
						<th>가입일자</th>
						<td>${row.logtime}"</td>
					</tr>
					<tr>
						<th colspan="2">
							<input type="submit" value="수정">
							<input type="button" value="취소" onclick="location='selectTest.jsp'">
						</th>
					</tr>
				</table>
			</form>
		</c:if>
		<c:if test="${param.passwd != row.passwd}">
			<%-- 비밀번호 틀린경우 --%>
			입력하신 비밀번호가 다릅니다.<br>
			다시 확인하세요<br>
			<meta http-equiv="refresh" content="2; url=updateTest.jsp?id=${param.id}">
		</c:if>
	</c:forEach>
</c:if>
