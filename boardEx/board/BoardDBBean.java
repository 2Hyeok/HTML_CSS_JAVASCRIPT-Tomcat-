package board;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class BoardDBBean {
   private static BoardDBBean instance = new BoardDBBean();

   public static BoardDBBean getInstance() {
      return instance;
   }

   public Connection getConnection() throws NamingException, SQLException {
      Context initCtx = new InitialContext();
      Context envCtx = (Context) initCtx.lookup("java:comp/env");
      DataSource ds = (DataSource) envCtx.lookup("jdbc/bit");
      return ds.getConnection();
   }

   // 글 전체글갯수
   public int getCount() {
      int count = 0;
      Connection con = null;
      PreparedStatement pstmt = null;
      ResultSet rs = null;

      try {
         con = getConnection();
         String sql = "select count(*) from board";
         pstmt = con.prepareStatement(sql);
         rs = pstmt.executeQuery();
         if (rs.next()) {
            count=rs.getInt(1);
         }

      } catch (NamingException e) {
         e.printStackTrace();
      } catch (SQLException e) {
         e.printStackTrace();
      } finally {
         try {
            if (rs != null)
               rs.close();
            if (pstmt != null)
               pstmt.close();
            if (con != null)
               con.close();
         } catch (SQLException e) {
            e.printStackTrace();
         }
      }
      return count;
   }
   //----------------------------------------------
   public int insertArticle(BoardDataBean dto) {
      int result=0;
      Connection con = null;
      PreparedStatement pstmt = null;
      ResultSet rs = null;
      try {
         con = getConnection();
         int num=dto.getNum();
         int ref=dto.getRef();
         int re_step=dto.getRe_step();
         int re_level=dto.getRe_level();
         
         //                 ref re_step re_level
         // 10제목글         8     0        0
         // 09 ㄴ 답글         8     2         1
         // 09   ㄴ 재답글      8     3         2
         // 07 ㄴ답글           8     1       1
         
           //               ref re_step re_level
         // 10제목글         8     0        0
         // 09 ㄴ 답글         8     1         1
         // 09   ㄴ 재답글      8     2         1
         // 07 ㄴ답글           8     3       2
         String  sql=null;
         if(num==0) {
            //제목글
            sql="select max(num) from board";
            pstmt=con.prepareStatement(sql);
            rs= pstmt.executeQuery();
            if(rs.next()) {
               ref=rs.getInt(1)+1; //그룹화 아이디=글번호 최대값+1
            }else {
               ref=1;
            }
            
            re_step=0;
            re_level=0;
         }else {
            //답변글
            sql="update board set re_step=re_step+1 where ref=? and re_step>?";
            pstmt=con.prepareStatement(sql);
            pstmt.setInt(1,ref);
            pstmt.setInt(2,re_step);
            pstmt.executeUpdate();
            re_step ++;
            re_level ++;
         }
         sql="insert into board( num,writer,email,subject,passwd,"
               + "reg_date,ref,re_step,re_level,content,ip)"
               + " values(board_seq.NEXTVAL, ?,?,?,?,?,?,?,?,?,? )";
         if( pstmt != null) pstmt.close();
         pstmt=con.prepareStatement(sql);
         pstmt.setString(1, dto.getWriter());
         pstmt.setString(2, dto.getEmail());
         pstmt.setString(3, dto.getSubject());
         pstmt.setString(4, dto.getPasswd());
         pstmt.setTimestamp(5, dto.getReg_date());
         pstmt.setInt(6, ref);
         pstmt.setInt(7, re_step);
         pstmt.setInt(8, re_level);
         pstmt.setString(9, dto.getContent());
         pstmt.setString(10, dto.getIp());
         
         result=pstmt.executeUpdate();
         
      } catch (NamingException e) {
         e.printStackTrace();
      } catch (SQLException e) {
         e.printStackTrace();
      } finally {
         try {
            if (rs != null)
               rs.close();
            if (pstmt != null)
               pstmt.close();
            if (con != null)
               con.close();
         } catch (SQLException e) {
            e.printStackTrace();
         }
      }
      return result;
   }
   
//list.jsp의 getArticles
   public ArrayList<BoardDataBean> getArticles(int start,int end){
      ArrayList<BoardDataBean> dtos=null;
      Connection con=null;
      PreparedStatement pstmt=null;
      ResultSet rs=null;
      try {
         con=getConnection();
         String sql = "select num,writer,email,subject,passwd,";
         sql+= "reg_date,ref,re_step,re_level,content,ip,readcount,r ";
         sql+= "from (select num,writer,email,subject,passwd,reg_date,ref,re_step";
         sql+= ",re_level,content,ip,readcount,rownum r from ";
         sql+= "(select num,writer,email,subject,passwd,reg_date,ref,re_step,re_level ";
         sql+= ",content,ip,readcount from board order by ref desc, re_step asc) ";
         sql+= "order by ref desc, re_step asc ) where r >= ? and r <= ?";
         pstmt=con.prepareStatement(sql);
         pstmt.setInt(1, start);
         pstmt.setInt(2, end);
         
         rs=pstmt.executeQuery();
         
         if(rs.next()) {
            dtos=new ArrayList<BoardDataBean>();
            do {
               BoardDataBean dto=new BoardDataBean();
               dto.setNum(rs.getInt("num"));
               dto.setWriter(rs.getString("writer"));
               dto.setEmail(rs.getString("email"));
               dto.setSubject(rs.getString("subject"));
               dto.setPasswd(rs.getString("passwd"));
               dto.setReg_date(rs.getTimestamp("reg_date"));
               dto.setReadcount(rs.getInt("readcount"));
               dto.setRef(rs.getInt("ref"));
               dto.setRe_step(rs.getInt("re_step"));
               dto.setRe_level(rs.getInt("re_level"));
               dto.setContent(rs.getString("content"));
               dto.setIp(rs.getString("ip"));
               
               dtos.add(dto);
               
               
            } while (rs.next());
            
            
         }
         
      } catch (NamingException e) {         
         e.printStackTrace();
      } catch (SQLException e) {
         e.printStackTrace();
      }finally {
         try {
            if(rs !=null) rs.close();
            if(pstmt !=null) pstmt.close();
            if(con !=null) con.close();
         } catch (SQLException e) {
            e.printStackTrace();
         }
      }
      
      
      return dtos;
   }
   
   
   public BoardDataBean getArticle(int num) {
      BoardDataBean dto= null;
      Connection con=null;
      PreparedStatement pstmt=null;
      ResultSet rs=null;
      try {
         con=getConnection();
         String sql ="select * from board where num=?";
         pstmt=con.prepareStatement(sql);
         pstmt.setInt(1,num);
         rs=pstmt.executeQuery();
         if(rs.next() ) {
            dto =new BoardDataBean();
            dto.setNum(rs.getInt("num"));
            dto.setWriter(rs.getString("writer"));
            dto.setEmail(rs.getString("email"));
            dto.setSubject(rs.getString("subject"));
            dto.setPasswd(rs.getString("passwd"));
            dto.setReg_date(rs.getTimestamp("reg_date"));
            dto.setReadcount(rs.getInt("readcount"));
            dto.setRef(rs.getInt("ref"));
            dto.setRe_step(rs.getInt("re_step"));
            dto.setRe_level(rs.getInt("re_level"));
            dto.setContent(rs.getString("content"));
            dto.setIp(rs.getString("ip"));
         }
         
      } catch (NamingException e) {
         e.printStackTrace();
      } catch (SQLException e) {
         e.printStackTrace();
      } finally {
         try {
            if (rs != null)
               rs.close();
            if (pstmt != null)
               pstmt.close();
            if (con != null)
               con.close();
         } catch (SQLException e) {
            e.printStackTrace();
         }
      }
      return dto;
   }
   
   public void addCount(int num) {
	   Connection con = null;
	   PreparedStatement pstmt=null;
	   try {
		con = getConnection();
		String sql = "update board set readcount = readcount+1 where num=?";
		pstmt = con.prepareStatement(sql);
		pstmt.setInt(1, num);
		pstmt.executeUpdate();
	} catch (NamingException e) {
		e.printStackTrace();
	} catch (SQLException e) {
		e.printStackTrace();
	} finally {
		try {
			if(pstmt != null)pstmt.close();
			if(con != null)con.close();
		}catch(SQLException e) {
			e.printStackTrace();
		}
	}
   }
   public int check(int num, String passwd) {
	   int result = 0;
	   Connection con=null;
	   PreparedStatement pstmt=null;
	   ResultSet rs=null;
	   try {
		con = getConnection();
		String sql = "select * from board where num=?";
		pstmt = con.prepareStatement(sql);
		pstmt.setInt(1, num);
		rs = pstmt.executeQuery();
		if(rs.next()) { // 글이 없는것은 말이 안되기때문에 else가 나올일은 없음
			if(passwd.equals(rs.getString("passwd"))) {
				result = 1; //비밀번호가 다르면
			}else {
				result = 0; // 비밀번호가 같으면
			}
		}
	} catch (NamingException e) {
		e.printStackTrace();
	} catch (SQLException e) {
		e.printStackTrace();
	}finally {
		try{
			if(rs != null)rs.close();
			if(pstmt != null)pstmt.close();
			if(con != null)con.close();
		}catch(SQLException e) {
			e.printStackTrace();
		}
	}
	   
	   return result;
   }
   
   public int deleteArticle(int num) {
	   int result = 0;
	   Connection con=null;
	   PreparedStatement pstmt=null;
	   ResultSet rs=null;
	   try {
		con = getConnection();
		
		//					ref		re_step		re_level
		//제목글				10		0			0
		//ㄴ나중에 쓴 답글			10		1			1
		//ㄴ답글				10		2			1
		// ㄴ재답글			10		3			2
		
		// ref 같다		re_step + 1 같다		re_level 크다.
		
		// 답글이 있는경우	삭제된 글 입니다.
		// 답글이 없는경우	삭제
		
		BoardDataBean dto = getArticle(num); // ref, re_step, re_level 값을 가져오지 못하고 num값을 가져오기 때문에 getArticle을 가져옴
		String sql = "select * from board where ref=? and re_step=?+1 and re_level>?";
		pstmt = con.prepareStatement(sql);
		pstmt.setInt(1,dto.getRef());
		pstmt.setInt(2, dto.getRe_step());
		pstmt.setInt(3, dto.getRe_level());
		rs = pstmt.executeQuery();
		if(rs.next()) {
			// 답글이 있는경우
			sql = "update board set subject='삭제된 글 입니다.', readcount=-1 where num=?";
			if(pstmt != null)pstmt.close(); // 이미 이 문장을 썻기때문에 닫아준후 다시 열어주어야함
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			result = pstmt.executeUpdate(); //실패할 수 있기때문에 result값으로 반환
			
		}else {
			// 답글이 없는경우
			sql = "update board set re_step=re_step-1 where ref=? and re_step>?";
			if(pstmt != null)pstmt.close();
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, dto.getRef());
			pstmt.setInt(2, dto.getRe_step());
			pstmt.executeUpdate();
			
			
			sql = "delete from board where num=?";
			if(pstmt != null)pstmt.close();
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			result = pstmt.executeUpdate();
			
		}
		
	} catch (NamingException e) {
		e.printStackTrace();
	} catch (SQLException e) {
		e.printStackTrace();
	} finally {
		try {
			if(rs != null)rs.close();
			if(pstmt != null)pstmt.close();
			if(con != null)con.close();
		}catch(SQLException e) {
			e.printStackTrace();
		}
	}
	   return result;
   }
   
   public int modifyArticle(BoardDataBean dto) {
	   int result = 0;
	   Connection con = null;
	   PreparedStatement pstmt=null;
	   try {
		con = getConnection();
		String sql = "update board set email=?, subject=?, content=?, passwd=? where num=?";
		pstmt = con.prepareStatement(sql);
		pstmt.setString(1, dto.getEmail());
		pstmt.setString(2, dto.getSubject());
		pstmt.setString(3, dto.getContent());
		pstmt.setString(4, dto.getPasswd());
		pstmt.setInt(5, dto.getNum());
		result = pstmt.executeUpdate();
		
	} catch (NamingException e) {
		e.printStackTrace();
	} catch (SQLException e) {
		e.printStackTrace();
	}finally {
		try {
			if(pstmt != null)pstmt.close();
			if(con != null)con.close();
		}catch(SQLException e) {
			e.printStackTrace();
		}
	}
	   return result;
   }
   
}// class

