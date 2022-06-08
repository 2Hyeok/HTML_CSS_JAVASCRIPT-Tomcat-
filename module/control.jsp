<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<h2>흐름 제어 페이지</h2>

<%
	request.setCharacterEncoding("utf-8");
%>

<%
	String product = request.getParameter("product");
	String company = request.getParameter("company");
%>
<%
	String name = null;
	String control = null;
	if(product.equals("1")){
		name = "텔레비전";
		control = "tv";
	}else if(product.equals("2")){
		name = "핸드폰";
		control = "hp";
	}else if(product.equals("3")){
		name = "컴퓨터";
		control = "pc";
	}else if(product.equals("4")){
		name = "노트북";
		control = "nb";
	}
%>
<%
	String sub = null;
	if(company == null || company.equals("")){
		sub = "";
	}else if(company.equals("1")){
		sub = "lg";
	}else if(company.equals("2")){
		sub = "sony";
	}else if(company.equals("3")){
		sub = "apple";
	}else if(company.equals("4")){
		sub = "hp";
	}else if(company.equals("5")){
		sub = "asus";
	}
%>
<jsp:forward page="template.jsp">
	<jsp:param name="paramName" value="<%=name%>"/>
	<jsp:param name="paramControl" value="<%=control%>"/>
	<jsp:param name="paramSub" value="<%=sub%>"/>
</jsp:forward>