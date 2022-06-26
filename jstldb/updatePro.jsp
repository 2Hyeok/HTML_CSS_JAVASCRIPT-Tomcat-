<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>

<h2>JSTL - sql - update </h2>

<!-- 수정 처리 -->
<!-- 성공 selectTest.jsp 이동 해당 아이디만 출력 -->
<!-- 실패 경고출력 selectTest.jsp 이동	전체 출력 -->

<sql:update var="result" dataSource="jdbc/bit">
	update dbtest set passwd=?, tel=? where id=?
	<sql:param value="${param.passwd}"/>
	<sql:param value="${param.tel}"/>
	<sql:param value="${param.id}"/>
</sql:update>
<c:if test="${result == 0}">
	회원 수정에 실패했습니다.<br>
	잠시후 다시 시도하세요<br>
	<meta http-equiv="refresh" content="2; url=selectTest.jsp">
</c:if>
<c:if test="${result != 0}">
	<c:redirect url="selectTest.jsp?id=${param.id}"/>
</c:if>
