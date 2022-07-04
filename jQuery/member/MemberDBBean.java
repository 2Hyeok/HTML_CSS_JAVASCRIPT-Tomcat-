package member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class MemberDBBean {
	private static MemberDBBean instance = new MemberDBBean();
	public static MemberDBBean getInstance() {
		return instance;
	}
	public Connection getConnection() throws NamingException, SQLException{
		Context initCtx = new InitialContext();
		Context envCtx = (Context) initCtx.lookup("java:comp/env");
		DataSource ds = (DataSource) envCtx.lookup("jdbc/bit");
		return ds.getConnection();
	}
	
	public int checkid(String id) {
		int result = 0;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			con=getConnection();
			String sql = "select * from dbtest where id=?"; //sql 불러오기
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				result = 1;
			} else {
				result = 0;
			}
			
		} catch (NamingException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if( rs != null)rs.close();
				if( pstmt != null)pstmt.close();
				if( con != null)con.close();
			}catch(SQLException e) {
				e.printStackTrace();
			}
		}
		
		return result;
	}
	
	public int checktel(String tel) {
		int result = 0;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			con=getConnection();
			String sql = "select * from dbtest where tel=?"; //sql 불러오기
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, tel);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				result = 1;
			} else {
				result = 0;
			}
			
		} catch (NamingException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if( rs != null)rs.close();
				if( pstmt != null)pstmt.close();
				if( con != null)con.close();
			}catch(SQLException e) {
				e.printStackTrace();
			}
		}
		
		return result;
	}
}
