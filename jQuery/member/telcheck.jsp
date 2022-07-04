<%@page import="member.MemberDBBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%-- memberDBBean 가져와야함 --%>

<c:set var="dao" value="<%=MemberDBBean.getInstance()%>"/>
<c:set var="result" value="${dao.checktel(param.tel)}"/>
<c:if test="${result == 0}"> <%-- 전화번호가 없을경우 --%>
	${param.tel}는 사용할 수 있는 전화번호 입니다.
</c:if>
<c:if test="${result == 1}"> <%-- 전화번호가 있을경우 --%>
	${param.tel}는 사용할 수 없는 전화번호 입니다.
</c:if>