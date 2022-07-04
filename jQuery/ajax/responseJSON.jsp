<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<h2> Ajax - JSON </h2>
<script src="/jQueryEx/jquery-3.6.0.js"></script>
<script type="text/javascript">
	//<!--
	$(document).ready(
		function(){
			$.ajax(
				{
					url : "member.jsp", // 데이터를 처리해서 돌려주는 페이지
					dataType : "text",
					success : function(data){
						var msg = "";
						var members = eval("("+data+")")
						$.each(
							members.member,
							function(index, item){
								msg += "이름 : " + item.name + "<br>"
									+ "나이 : " + item.age + "<br>"
									+ "전화번호 : " + item.tel + "<br><br>";
							}
						);
						
						$("#result").html(msg);
					},
					error : function(error){
						$("#result").html(error + "<br>");
					}
				}
			);
		}
	);
	//-->
</script>
<br>
<div id="result"></div>