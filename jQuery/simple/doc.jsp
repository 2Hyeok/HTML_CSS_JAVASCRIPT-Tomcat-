<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<h2> 문서 객체 탐색</h2>

<script src="/jQueryEx/jquery-3.6.0.js"></script>
<script type="text/javascript">
//<!--
	$(document).ready(
		function() {
			// filter
			//$(selector).filter(selector)
			$("h4:even").css("color", "red");
			$("h4:last").css("color", "blue");
			
			
			//filter 활용
			$("h4").filter(":odd").css("color", "green"); // h4 4개를 받아와 홀수만 리턴시킴
			$("h4").filter(":even").css("color", "yellow").css("background", "gray"); // 체이닝의 예 (.를 통해 계속 늘려나가는것)
			
			// 따로따로 주지않고 json을 통해 한번에 줌
			$("h4").filter(":even").css(
				{ // 스타일 시트는 ; 이지만, json은 ,를 붙임 또한 ""도 안붙임
					"color":"white",
					"background":"darkgray"
				}
			);
			$("h4").filter(":odd").filter(":even").css("color", "gold");
			
			
			//$(selector).filter(function(index){})
			$("h4").filter(
					function(index){
						if (index % 2 == 1) return this; // 홀수만 뽑아라
						//if (return index % 2 == 1) $(this).css("color", "red");
					}		
			).css(
				{
					// 앞에 생략가능
					color : "silver",
					background : "lightgray"
				}		
			);
			
			
			// eq
			$("h4:eq(2)").css("font-style", "italic");
			$("h4").filter(":eq(2)").css("font-style", "normal");
			$("h4").eq(2).css("font-style", "italic");
			
			//first / last - 글자 크기 조정해보기
			$("h4:first").css("font-size", "1.5em");
			$("h4").first().css("font-size", "2.0em");
			
			$("h4:last").css("font-size", "1.5em");
			$("h4").last().css("font-size", "2.0em");
			
			// end
			// $("h5").filter(":even").filter(":odd").css("color", "red"); // 넘어온 두개중에 홀수
			$("h5").filter(":even").filter(":odd").css("color", "red")
				.end().css("color", "blue"); // .end는? - 필터로 골라낸것을 한단계 전으로 돌려라
			
						
			// add
			$("h5").filter(":odd").css("color", "green")
			.add("h5").filter(":even").css("color", "red"); // add - 처음으로 다시 되돌려라
			
			
			// is - 다른애들과 달라야함
			$("h5").each(
				function(index, item){ // 테그하나를 item이 가짐
					if( $(item).is(".point") ) {
						$(this).css("color", "gold");
						
					}
				}	
			);
			
			$("h5.point").css("color", "gold"); // 이것과 동일함
			
			
			$("h5").each(
				function(index, item){
					if($(item).is("#last")){
						$(this).css("color", "gold");
					}
				}
			);
		}
		
	);
//-->
</script>
<br>
<h5 class="point">짜장면</h5>
<h5>짬뽕</h5>
<h5>볶음밥</h5>
<h5 id="last">탕수육</h5>


<h4>딸기</h4>
<h4>바나나</h4>
<h4>사과</h4>
<h4>키위</h4>