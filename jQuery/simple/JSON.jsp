<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<h2> JSON - data</h2>
<script src="/jQueryEx/jquery-3.6.0.js"></script>
<script type="text/javascript">
	//<!--
	var json = "{" //var data = { 와 같음
		+			"book : ["
		+				"{"
		+					"title : 'Java 프로그래밍',"
		+					"author : '홍길동',"
		+					"price : '25,000'"
		+				"},"
		+				"{"
		+					"title : 'JSP 웹프로그래밍',"
		+					"author : '이순신',"
		+					"price : '35,000'"
		+				"},"
		+				"{"
		+					"title : 'Spring 프레임워크',"
		+					"author : '김유신',"
		+					"price : '45,000'"
		+				"}," 
		+			"]"
		+		"}";


	//JSON데이터만 가져오기
	$(document).ready(
		function() {
			var msg ="";
			
			var data = eval("(" + json + ")");
			for(i=0; i<data.book.length; i++){
						msg += "제목 : " + data.book[i].title + "<br>"
							+ "저자 : " + data.book[i].author + "<br>"
							+ "가격 : " + data.book[i].price + "<br><br>"
					}
			
//-----------------------------------------------------------------------------------

	$.each(
			data.book,
			function(index, item){
				msg += "제목 : "	+ item.title + "<br>"
					+ "저자 : "	+ item.author + "<br>"
					+ "가격 : "	+ item.price + "<br><br>"
			} 
			
		);

			$("#result").html(msg);
		}
	);

	
	//-->
</script>
<div id="result"></div>