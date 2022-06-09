<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.SQLException"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   
<h2>JDBC - update - 수정페이지</h2>

<%
	String id = request.getParameter("id");
	String passwd = request.getParameter("passwd");
%>
<%
	Connection con = null;
	Statement stmt = null;
	ResultSet rs = null;
	
	try {
		Class.forName("oracle.jdbc.driver.OracleDriver");
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		String dbId = "bit";
		String dbPasswd = "bit";
		con = DriverManager.getConnection(url, dbId, dbPasswd);
		
		stmt = con.createStatement();
		String sql = "select * from dbtest where id = '"+id+"'";
		rs = stmt.executeQuery(sql);
		if(rs.next()){
			// 아이디가 있다.
			if(passwd.equals(rs.getString("passwd"))){
				// 비밀번호가 같다
				%>
				<form method="post" action="updateTest.jsp">
					<input type="hidden" name="id" value="<%=id%>">
					<table border="1">
						<tr>
							<th>아이디</th>
							<td><%=rs.getString("id")%></td>
						</tr>
						<tr>
							<th>비밀번호</th>
							<td><input type="password" name="passwd" value="<%=rs.getString("passwd")%>"></td>
						</tr>
						<tr>
							<th>이름</th>
							<td><%=rs.getString("name")%></td>
						</tr>
						<tr>
							<th>전화번호</th>
							<td><input type="text" name="tel" value="<%=rs.getString("tel")%>"></td>
						</tr>
						<tr>
							<th>가입일자</th>
							<td><%=rs.getTimestamp("logtime")%></td>
						</tr>
						<tr>
							<th colspan = "2">
								<input type = "submit" value="수정">
								<input type = "reset" value="취소">
							</th>
						</tr>
					</table>
				</form>
				<%
			} else {
				//비밀번호가 다르다
				%>
				입력하신 비밀번호가 다릅니다<br>
				다시 확인하세요 <br>
				<meta http-equiv="refresh" content="2; url = updateTestForm.jsp">
				<%
			}
			
		}else {
			// 아이디가 없다.
			%>
			입력하신 아이디가 없습니다.<br>
			다시 확인하세요<br>
			<meta http-equiv="refresh" content="2; url = updateTestForm.jsp">
			<%
		}
	} catch(ClassNotFoundException e) {
		e.printStackTrace();
	} catch(SQLException e){
		e.printStackTrace();
	} finally {
		try {
			if(rs != null)rs.close();
			if(stmt != null)stmt.close();
			if(con != null)con.close();
		}catch(SQLException e){
			e.printStackTrace();
		}
	}
%>