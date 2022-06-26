<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    <h2>Session - 확인 페이지</h2>

아이디 : <%=session.getAttribute("id") %><br>
비밀번호 : <%=session.getAttribute("passwd") %><br>