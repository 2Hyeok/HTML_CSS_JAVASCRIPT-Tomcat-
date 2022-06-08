<%@page import="bean.SimpleBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    <h2>액션태그 - useBean - 처리페이지</h2>
    
<%
 	request.setCharacterEncoding("utf-8");
%>
<!-- JavaBean X - useBean X -->

<%
	String name = request.getParameter("name");
	int age = Integer.parseInt(request.getParameter("age"));
	String tel = request.getParameter("tel");
	String address = request.getParameter("address");
%>
이름 : <%=name%> <br>
나이 : <%=age%> <br>
전화번호 : <%=tel%> <br>
주소 : <%=address%> <br>

<br><br>

<!-- JavaBean O - useBean X -->
<!-- 적용을 하기 위해서 바구니(src폴더에 생성)와 form에 있는 이름을 같이 해주어야함 -->
<jsp:useBean id="bean" class="bean.SimpleBean" scope="session"/>
<%
	//SimpleBean bean = new SimpleBean();
	bean.setName(request.getParameter("name"));
	bean.setAge(Integer.parseInt(request.getParameter("age")));
	bean.setTel(request.getParameter("tel"));
	bean.setAddress(request.getParameter("address"));
%>
이름 : <%=bean.getName()%><br>
나이 : <%=bean.getAge()%><br>
전화번호 : <%=bean.getTel()%><br>
주소 : <%=bean.getAddress()%><br>

<br><br>

<!-- JavaBean O - useBean O -->
<%--<jsp:setProperty name="" property="" scope=""/>(scope 다른페이지에서도 사용하겠다라는 문장  <-생략가능) --%>
<%--
<jsp:setProperty name="bean" property="name"/>
<jsp:setProperty name="bean" property="age"/>
<jsp:setProperty name="bean" property="tel"/>
<jsp:setProperty name="bean" property="address"/>
 --%>
<jsp:setProperty name="bean" property="*"/> <%-- 모든파일 --%>
이름 : <jsp:getProperty name="bean" property="name"/><br>
나이 : <jsp:getProperty name="bean" property="age"/><br>
전화번호 : <jsp:getProperty name="bean" property="tel"/><br>
주소 : <jsp:getProperty name="bean" property="address"/><br>


<jsp:forward page="simpleBeanView.jsp"/>