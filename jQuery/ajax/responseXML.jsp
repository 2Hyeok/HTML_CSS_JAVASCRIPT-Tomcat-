<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<h2> Ajax - xml </h2>
<script src="/jQueryEx/jquery-3.6.0.js"></script>
<script type="text/javascript">
	//<!--
	$(document).ready(
		function(){
			$.ajax(
				{
					url : "member.xml", // data를 한번에 받아옴
					dataType : "xml",
					success : function(data){
						// var msg = "정상종료";
						var msg = "";
						$(data).find("member").each(
							function(index, item){
								msg += "이름 : " + $(item).find("name").text() + "<br>"
									+ "나이 : " + $(item).find("age").text() + "<br>"
									+ "전화번호 : " + $(item).find("tel").text() + "<br><br>";
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