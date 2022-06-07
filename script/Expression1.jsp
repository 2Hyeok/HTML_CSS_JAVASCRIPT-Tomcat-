<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<h2>script - expression1</h2>
<!--  
<%
	// 1 + 2 + 3 + 4 + 5 + 6 + 7 + 8 + 9 + 10 = 55
	int sum = 0;
	for(int i=1; i<=10; i++){
		sum=sum+i;
	}
%>
1+2+3+4+5+6+7+8+9+10=<%=sum %>
<%
%>
-->

<% 
	int sum1 = 0;
	for(int i=1; i<=10; i++){
		sum1 += i;
		if(i<10){
			%>
			<%= i%> +
			<%
		}else { 
			%>
			<%=i%> =
			<%
	}
}
%>
<%=sum1%><br>