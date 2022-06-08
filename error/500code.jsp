<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 실제로 에러시 이페이지가 출력이 되지 않기때문에
	 웹 브라우저에서 나오도록 해주어야함 -->
<%
	response.setStatus(HttpServletResponse.SC_OK);
%>
<h2>404에러 페이지</h2>
서버 오류 입니다.<br>
소스 코드의 오타를 확인하세요.<br>