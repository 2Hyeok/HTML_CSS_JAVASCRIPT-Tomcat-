<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="javax.naming.Context"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<h2>JDBC - select</h2>
<%
	// 사용후 끊어주는 final 사용해야하기 때문에 예외처리문 사용
	// insert는 sql로
	Connection con = null;
	Statement stmt = null; // 담아서 넘겨주는 코드
	ResultSet rs = null;
	
	String id = request.getParameter("id"); // 추가해주기
	
	try{
		// 드라이버 로딩
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
		
		String sql = null;
		if(id == null || id.equals("")){
			sql = "select * from dbtest";
		} else {
			sql = "select * from dbtest where id='"+id+"'";
		}
		// sql = "select * from dbtest"; // 모든 정보를 가져오기 때문에 객체를만들어 리턴
		// String = sql = "select * from dbtest";
		stmt.executeQuery(sql);  //insert delete update - excuteUpdate(); 사용
								 //select    - executeQuery(); 사용
		rs = stmt.executeQuery(sql);
		%>
		<table border="1">
			<%
			while(rs.next() ) { // 몇번 도는지 모르기 때문에 while사용, next를 이용해 반복문 사용
				%>
				<tr>
					<td> <%=rs.getString("id")%></td>
					<td> <%=rs.getString("passwd")%></td>
					<td> <%=rs.getString("name")%></td>
					<td> <%=rs.getString("tel")%></td>
					<td> <%=rs.getTimestamp("logtime")%></td>
				</tr>
				<%
			}
			%>
		</table>
		<%					 
	}/*catch(ClassNotFoundException e) {
		e.printStackTrace(); //주석처리 필요
	}*/catch(SQLException e){
		e.printStackTrace();
	} finally {
		try{
			if(rs != null ) rs.close();
			if(stmt != null) stmt.close();
			if(con != null) con.close();
		}catch(SQLException e){
			e.printStackTrace();
		}
	}
%>