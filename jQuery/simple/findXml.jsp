<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<h2> find - XML </h2>
<script src="/jQueryEx/jquery-3.6.0.js"></script>
<script type="text/javascript">
	//<!--
	// 그냥쓰면 xml로 인식을 못해서 문서 객체로 변경해야함
	// 피라미드 구조
	// <title>JSP웹프로그래밍</title> 안에있는것을 노드라고함
	var xml = "<books>"
			+	"<book>"
			+		"<title>Java 프로그래밍</title>"
			+		"<author>홍길동</author>"
			+		"<price>20,000</price>"
			+	"</book>"
			+	"<book>"
			+		"<title>JSP 웹프로그래밍</title>"
			+		"<author>이순신</author>"
			+		"<price>30,000</price>"
			+	"</book>"
			+	"<book>"
			+		"<title>Spring 프레임워크</title>"
			+		"<author>김유신</author>"
			+		"<price>40,000</price>"
			+	"</book>"			
			+ "</books>";

	$(document).ready( // .ready == onload
		function() {
			var xmldoc = $.parseXML(xml); // parseXML() - 문자열을 xml객체로 바꿔줌
			var msg = "";
			
			
			// DOM - 문서 객체 모델, xml이나 html문서에 접근하기위한 일종의 인터페이스
			// getElementByTagName 사용하여 가져옴
			var booklist = xmldoc.getElementsByTagName( "book" );
			var titlelist = xmldoc.getElementsByTagName( "title" );
			var authorlist = xmldoc.getElementsByTagName( "author" );
			var pricelist = xmldoc.getElementsByTagName( "price" );
			// 없는요소도 있을 수 있기 때문에 전체 괄호로 반복문돌림
			for( var i=0; i<booklist.length; i++ ) {
				msg += "제목 : " + titlelist.item(i).firstChild.nodeValue + "<br>"  // titlelist[i] - 배열이 아니기때문에 이런식의 방법은 불가
				// firstchild - 첫번째 자식 노드를 가져와라 하지만 쓴다고 값이 출력이 되는것이아님 nodevalue사용해야 출력가능, next는 사용시 다음으로 이동
					+ "저자 : " + authorlist.item(i).firstChild.nodeValue + "<br>"
					+ "가격 : " + pricelist.item(i).firstChild.nodeValue + "<br><br>"
		
			}
			
			// JQuery
			// find - 테그를 찾아줌
			// $(객체이름).find( "태그이름" )
			$(xmldoc).find( "book" ).each( // xmldoc에서 book이라는 테그를 찾아라 (반복문이용)
				function(index, item) {
					msg += "제목 : " + $(item).find("title").text() + "<br>" // title안에 문자를 찾아라
														// .text()로 태그 영역내 텍스트 추출 가능
						+ "저자 : " + $(item).find("author").text() + "<br>"
						+ "가격 : " + $(item).find("price").text() + "<br><br>"
				}
			);
			
			
			
			$("#result").html(msg);
			
		}
	);
	//-->
</script>
<br>
<div id="result"></div>