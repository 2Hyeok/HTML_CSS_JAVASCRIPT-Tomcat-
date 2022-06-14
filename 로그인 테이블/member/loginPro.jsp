<%@page import="member.LogonDBBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="setting.jsp"%>
<script src="<%=project%>/member/script.js"></script>

<h2><%=page_login%></h2>

<%
   String id = request.getParameter( "id" );
   String passwd = request.getParameter( "passwd" );
%>
<%
   LogonDBBean dao = LogonDBBean.getInstance();
   int result = dao.check( id, passwd );
   if ( result == -1 ) {
      //아이디가 없다
      %>
      <script type="text/javascript">
         <!--
         erroralert( iderror )
         //-->
      </script>
      <%
   } else if ( result == 0 ) {
      //비밀번호가 다르다
      %>
      <script type="text/javascript">
         <!--
         erroralert( passwderror )
         //-->
      </script>
      <%
   } else {
      //비밀번호가 같다
      session.setAttribute( "memId", id );
      response.sendRedirect("main.jsp");
   }
%>