<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.Context"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.SQLException"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<h2>JDBC - delete - 처리페이지</h2>
<%
	String id = request.getParameter("id");
	String passwd = request.getParameter("passwd");
%>
<%
	Connection con = null;
	Statement stmt = null;
	ResultSet rs = null;
	try{
		/*
		Class.forName("oracle.jdbc.driver.OracleDriver");
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		String dbId = "bit";
		String dbPasswd = "bit";
		con = DriverManager.getConnection(url, dbId, dbPasswd);
		*/
		String sql = "select * from dbtest where id='"+id+"'";
		
		Context initCtx = new InitialContext();
		Context envCtx = (Context) initCtx.lookup( "java:comp/env" ); //고정값 - 강제 형변환 필요
		DataSource ds = (DataSource) envCtx.lookup("jdbc/bit");
		con = ds.getConnection();
		
		stmt = con.createStatement();
		rs = stmt.executeQuery(sql);
		
		if(rs.next()){
			// 아이디가 있다.
			if(passwd.equals(rs.getString("passwd"))){
				// 비밀번호가 같다.
				sql = "delete from dbtest where id = '"+id+"'";
				int result = stmt.executeUpdate(sql);
				if(result == 0){
					%>
					회원탈퇴에 실패했습니다.<br>
					잠시 후 다시 시도하세요.<br>
					<meta http-equiv="refresh" content="2; url=deleteTestForm.jsp">
				<%
				}else {
					%>
					회원 탈퇴 성공<br>
					<meta http-equiv="refresh" content="2; url=selectTest.jsp">
					<%
				}
			}else {
				%>
				입력하신 비밀번호가 다릅니다.<br>
				다시확인하세요.<br>
				<meta http-equiv="refresh" content="2; url=deleteTestForm.jsp">
				<%
			}
			
		} else {
			// 아이디가 없다
			%>
			입력하신 아이디가 없습니다.<br>
			다시 확인하세요.<br>
			<meta http-equiv="refresh" content="2; url = deleteTestForm.jsp">
			<%
		}
		
	}/*catch(ClassNotFoundException e){
		e.printStackTrace();
	}*/catch(SQLException e){
		e.printStackTrace();
	}finally{
         try{
            if(rs !=null) rs.close();
            if(stmt != null) stmt.close();
            if(con !=null) con.close();
         }catch(SQLException e){
            e.printStackTrace();
         }
      }
%>
