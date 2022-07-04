<%@page import="member.MemberDBBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%-- memberDBBean 가져와야함 --%>

<c:set var="dao" value="<%=MemberDBBean.getInstance()%>"/>
<c:set var="result" value="${dao.checkid(param.id)}"/>
<c:if test="${result == 0}"> <%-- 아이디가 없을경우 --%>
	${param.id}는 사용할 수 있습니다.
</c:if>
<c:if test="${result == 1}"> <%-- 아이디가 있을경우 --%>
	${param.id}는 사용할 수 없습니다.
</c:if>