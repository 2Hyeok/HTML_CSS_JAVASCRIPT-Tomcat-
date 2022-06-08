<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    <h2>액션태그 - useBean - 출력태그</h2>

<jsp:useBean id="bean" class="bean.SimpleBean" scope="session"/>
이름 : <%=bean.getName()%><br>
나이 : <%=bean.getAge()%><br>
전화번호 : <%=bean.getTel()%><br>
주소 : <%=bean.getAddress()%><br>