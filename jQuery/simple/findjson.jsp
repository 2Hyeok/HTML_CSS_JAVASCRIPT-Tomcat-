<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<h2>find - JSON </h2>
 <script src="/jQueryEx/jquery-3.6.0.js"></script>
<script type="text/javascript">
//<!--
// xml 안에 json이 들어있는것
// JSON을 사용하는 방법
//	xml에 데이터를 넣을데 <![CDATA[(안에가 데이터)]]> 라는 표현을 사용해야한다.
	var xml = "<books>"
			+	"<![CDATA["
			+		"{" // var books = { 와 같은것
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
			+				"}" // 콤마 있어도 에러는 X, 지워주는것이 좋다
			+			"]"
			+		"}"
			+	"]]>" // <>하나, [] 두개면 CDATA section이라는 의미
			+ "</books>"



	$(document).ready(
		function() {
			var msg = "";
			var xmldoc = $.parseXML(xml);
			
			// DOM
			// 상위부터 하나씩 꺼내서 안으로 들어가는구조 여러개 가져오는식으로 해야함
			// xmldoc.getElementsByTagName("books") //리턴하는게 여러개
			// eval - 문자열로 표현된 JavaScript 코드를 실행하는 함수
			// eval - 문자열로 받아온것을 값으로 바꿔주는것, 많이쓰니 중요
			var books = eval( "(" + xmldoc.getElementsByTagName("books").item(0).firstChild.nodeValue + ")");
								// eval("(" 값 ")") 안에있는 값을 데이터로 생각하여 출력
								// 괄호로 감싸지 않으면 eval을 하여도 json처리를 하지못해 그대로 출력된다
			for(var i=0; i<books.book.length; i++){
				msg += "제목 : " + books.book[i].title + "<br>"
					+ "저자 : " + books.book[i].author + "<br>"
					+ "가격 : " + books.book[i].price + "<br><br>"
			
			}
			
					
			// JQuery
			var data = eval( "(" + $(xmldoc).find("books").text() + ")" );
			for(var i=0; i<books.book.length; i++){
				
				msg += "제목 : " + data.book[i].title + "<br>"
				+ "저자 : " + data.book[i].author + "<br>"
				+ "가격 : " + data.book[i].price + "<br><br>"
				
			}
			
			// jquery 반복문 배열이 되있다는 하에 .each로 출력
			$.each(
				data.book,
				function(index, item){
					msg += "제목 : "	+ item.title + "<br>"
						+ "저자 : "	+ item.author + "<br>"
						+ "가격 : "	+ item.price + "<br><br>"
						// item대신 this도 사용가능
				} 
				
			);
			
			
			
			$("#result").html(msg);
		}
	);
//-->
</script>
<br>
<div id="result"></div>