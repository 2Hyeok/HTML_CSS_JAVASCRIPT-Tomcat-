<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<h2> text/ html </h2>
<script src="/jQueryEx/jquery-3.6.0.js"></script>
<script type="text/javascript">
//<!--
	$(document).ready(
		function() {
			var msg = "";
		
		//$(selector).text() - getter
		//$(selector).html()
		$("h4").each( 
				function( index, item ) {
					msg += index + " text : " + $(item).text() + "<br>"
						+ index + " html : " + $(item).html() + "<br>";
				}		
			);
		
		
		
		
		//$(selector).text(value) - setter
		//$(selector).html(value)
		var first = document.getElementById("first");
		first.innerHTML = "<b> DOM </b>";
		$("span").eq(1).text( "<b> TEXT </b>" ); // <b> TEXT </b> 그대로 출력
		$("span").eq(2).html( "<b> HTML </b>" ); // 볼드채로 HTML 출력
		
		
		
		
		//$(selector).text( function( index, text) {} ) - 반복문설정
		//$(selector).html( function( index, text) {} )
		// json 설정 방법은 없다.
		
		msg += "<br><br>";
		
		$("h4").text(
			function(index, text){
				msg += index + " : " + text + "<br>"; // 텍스트만 가져옴
			}		
		);
		
		msg += "<br><br>";
		$("h4").html(
			function(index, html) {
				msg += index + " : " + html + "<br>"; // 태그까지 가져옴
			}		
		);
			
		
		// remove, empty
		// remove - 해당하는 객체만 지움
		// empty - 모든것을 지워버려 반복문이 돌지 못함
		$("a").first().remove(); // 해당하는것만 지움 반복은 돌아감 (자기만지움)
		$("a").last().empty();	 // 모든것을 다 지워버리기에 반복문이 안돌아감(자손까지 다 지움)
		// 사라짐
		
		
		$("a").text(
			function(index, text){
				msg += index + " : " + text + "<br>";
			}		
		);
		
		
			$("#result").html( msg ); //html은 테그로출력, text는 문자열로 출력
		}
	);
//-->
</script>


<a><b>네이버</b></a> <br>
<a><b>다음</b></a> <br>

<br>
<span id="first"></span><br>
<span></span><br>
<span></span><br>

<br>

<h4><b>축구</b></h4>
<h4><b>야구</b></h4>
<h4>배구</h4>
<h4>농구</h4>
<div id="result"></div>