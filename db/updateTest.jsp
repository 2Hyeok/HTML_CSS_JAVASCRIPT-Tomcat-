<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.Context"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.SQLException"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  
<h2>JDBC - update - 처리페이지</h2>
<%
	String id = request.getParameter("id");
	String tel = request.getParameter("tel");
	String passwd = request.getParameter("passwd");
%>
<%
	Connection con = null;
	Statement stmt = null;
	
	try{
		/*
		Class.forName("oracle.jdbc.driver.OracleDriver");
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		String dbId = "bit";
		String dbPasswd = "bit";
		con = DriverManager.getConnection(url, dbId, dbPasswd);
		*/
		
		Context initCtx = new InitialContext();
		Context envCtx = (Context) initCtx.lookup( "java:comp/env" ); //고정값 - 강제 형변환 필요
		DataSource ds = (DataSource) envCtx.lookup("jdbc/bit");
		con = ds.getConnection();
		
		stmt = con.createStatement();
		String sql = "update dbtest set passwd = '"+passwd+"', tel = '"+tel+"' where id = '"+id+"'";
		int result = stmt.executeUpdate(sql);
		if(result == 0){
			%>
			회원 정보 수정에 실패했습니다.<br>
			잠시후 다시 시도하세요.<br>
			<meta http-equiv="refresh" content="2; url=updateTestForm.jsp">
			<%
		}else {
			%>
			회원정보 수정에 성공했습니다.<br>
			<meta http-equiv="refresh" content="2; url=selectTest.jsp?id=<%=id%>">
			<%
		}
		
	}/*catch(ClassNotFoundException e){
		e.printStackTrace();
	}*/catch(SQLException e){
		e.printStackTrace();
	}finally {
		try{
			if(stmt != null) stmt.close();
			if(con != null)con.close();
		}catch(SQLException e) {
			e.printStackTrace();
		}
	}

%>