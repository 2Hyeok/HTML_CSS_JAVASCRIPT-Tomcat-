<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<h2> Ajax - XML / JSON </h2>
<script src="/jQueryEx/jquery-3.6.0.js"></script>
<script type="text/javascript">
	//<!--
	$(document).ready(
		function(){
			$.ajax(
				{
					url : "books.jsp",
					dataType : "xml",
					success : function(data){
						var msg = "";
						var books = eval("(" + $(data).find("books").text() + ")");
						$.each(
							books.book,
							function(index, item){
								msg += "제목 : " + item.title + "<br>"
									+ "저자 : " + item.author + "<br>"
									+ "가격 : " + item.price + "<br><br>";
							}
						);
						$("#result").html(msg);
						$("<tr></tr>").html(
								"<th> 제목 </th><th> 저자 </th><th> 가격 </th>"
						).appendTo("#t");
						$.each(
							books.book,
							function(index, item){
								$("<tr></tr>").html(
									"<td>" + item.title + "</td>" +
									"<td>" + item.author + "</td>" +
									"<td>" + item.price + "</td>"
								).appendTo("#t");
							}
						);
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

<table border="1">
	<tbody id="t"></tbody> <%-- 테이블 추가를 위해 임시로 만든 태그 --%>
</table>




<br>
<div id="result"></div>