<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.Context"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.SQLException"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<h2>JDBC - insert - 처리 페이지</h2>
<%
	request.setCharacterEncoding("utf-8");
%>
<%
	String id = request.getParameter("id");
	String passwd = request.getParameter("passwd");
	String name = request.getParameter("name");
	String tel = request.getParameter("tel");
%>
<%
	Connection con = null;
	Statement stmt = null;
	
	try{
		/*
		Class.forName("oracle.jdbc.driver.OracleDriver");
		String url="jdbc:oracle:thin:@localhost:1521:xe";
		String dbId = "bit";
		String dbPasswd = "bit";
		con = DriverManager.getConnection(url, dbId, dbPasswd);
		*/
		String sql = "insert into dbtest values('"+id+"', '"+passwd+"', '"+name+"', '"+tel+"', sysdate)";
		
		Context initCtx = new InitialContext();
		Context envCtx = (Context) initCtx.lookup( "java:comp/env" ); //고정값 - 강제 형변환 필요
		DataSource ds = (DataSource) envCtx.lookup("jdbc/bit");
		con = ds.getConnection();
		
		stmt = con.createStatement();
		int result = stmt.executeUpdate(sql); // 몇줄 작업했는지 알려줌
		if(result == 0){
			%>
			회원가입에 실패했습니다.<br>
			<%
		} else {
			%>
			회원가입에 성공했습니다. <br>
			<meta http-equiv="refresh" content="2; url=selectTest.jsp"> <!-- 2초후에 이동하라 -->
			<%
		}
		
	}/*catch(ClassNotFoundException e){
		e.printStackTrace();
	}*/catch(SQLException e) {
		e.printStackTrace();
	} finally {
		try {
			if(stmt != null) stmt.close();
			if(con != null) con.close();
		}catch(SQLException e){
			e.printStackTrace();
		}
	}
%>