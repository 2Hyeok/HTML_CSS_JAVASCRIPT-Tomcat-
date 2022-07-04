<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<h2> 필터 선택자 </h2>
<script src="/jQueryEx/jquery-3.6.0.js"></script>
<script type="text/javascript">
	//<!--
	$(document).ready(
		function() {
			$("th:odd").css("color", "red"); // index가 홀수인 것들만 컬러 입힘
			$("th:even").css("color", "blue"); // index가 짝수인 것들만 
			$("th:even:odd").css("color", "green"); // 뽑아낸 짝수들 중 홀수인것들
			$("th:first, th:last").css("color", "yellow"); // 첫번째와 마지막을 노란색으로
			
			// contains(문자열)
			$("th:contains(50)").css("background", "gray"); // 50번째 위치하는거
			$("th:eq(50)").css("background", "black");
			$("th:gt(90)").css("background", "gray"); // index 90보다 큰것
			$("th:lt(10)").css("background", "gray"); // index 10보다 작은것
			
			// nth-child
			$("th:nth-child(5n+1)").css("color", "black"); // index 5n+1번째에 위치하는 문자
		}
	);
	//-->
</script>

<%
	int cnt = 0;
%>
<table border = "1">
	<%
		for(int i=0; i<10; i++){
			%>
			<tr>
			<%
			for(int j=0; j<10; j++){
				%>
				<th width="25"><%=++cnt%></th>
				<%
			}
			%>
			<tr>
			<%
		}
	%>
</table>