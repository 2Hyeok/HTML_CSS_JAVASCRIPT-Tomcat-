<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>

<h2>JSTL - sql - delete </h2>

<c:if test="${param.passwd == null or param.passwd == ''}">
	<form method="post" action="deleteTest.jsp">
		<input type="hidden" name="id" value="${param.id}"/>
		<table border="1">
			<tr>
				<th>비밀번호</th>
				<td><input type="password" name="passwd"></td>
			</tr>
			<tr>
			<th colspan="2">
				<input type="submit" value="탈퇴">
				<input type="button" value="취소" onclick="location='selectTest.jsp'">
			</th>
		</tr>
		</table>
	</form>	
</c:if>
<c:if test="${param.passwd != null and param.passwd != ''}"> <%-- 데이터를 꺼내려면 무조건 반복문으로 돌려야함 --%>
	<sql:query var="rs" dataSource="jdbc/bit">
		select * from dbtest where id=?
		<sql:param value="${param.id}"/>
	</sql:query>
	<c:forEach var="row" items="${rs.rows}">
		<c:if test="${param.passwd == row.passwd}">
			<sql:update var="result" dataSource="jdbc/bit">
				delete from dbtest where id=?
				<sql:param value="${param.id}"/>
			</sql:update>
			<c:if test="${result == 0}">
				회원탈퇴에 실패했습니다.<br>
				잠시후 다시 시도하세요.<br>
				<meta http-equiv="refresh" content="2; url=selectTest.jsp">
			</c:if>
			<c:if test="${result != 0}">
				<c:redirect url="selectTest.jsp"/>
			</c:if>
		</c:if>
		<c:if test="${param.passwd != row.passwd}">
			입력하신 비밀번호가 다릅니다<br>
			다시확인하세요<br>
			<meta http-equiv="refresh" content="2; url=deleteTest.jsp?id=${param.id}">
			<%-- url=selectTest.jsp
			delete로 다시 넘길려면 id값을 받아와 주어야함 --%>
		</c:if>
	</c:forEach>
</c:if>
