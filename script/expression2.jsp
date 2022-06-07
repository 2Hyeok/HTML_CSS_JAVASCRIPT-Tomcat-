<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    <h2>script - expression2</h2>
    <!-- 
<table border="3">
<tr>
<%
    for(int i=2; i<10; i++) {
    %>
    <td>
    <%=i%>단
    </td>
    <%
    }
    %>
 </tr>
    <%
    for(int i=1; i<10; i++) {
    	%>
    <tr>
    	<%
    	for(int j=2; j<10; j++) {
    	%>
    	<td>
    	<%= j + " * " + i + " = " + i*j%>	
    	</td>
    	<%
    	}
    	%>
    	 <tr>
    	<%
    }
    %>
 </table>
  -->
<table border="3">
<tr>
	<%
	for(int i=2; i<10; i++){
		%>
		<th><%=i%>단</th>
		<%
	}
	%>
</tr>
<%
    for(int i=2; i<10; i++) {
    %>
    <tr>
    <%
    for(int j=2; j<10; j++) {
    %>
    <td><%=j%>*<%=i%>=<%=i*j%></td>
    <%
    }
    %>
    </tr>
    <%
    }
    %>
    </table>