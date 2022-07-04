<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<h2> bind </h2>
<style type="text/css">
	.reverse{ 
		color : white;
		background : black;
	}

</style>
<script src="/jQueryEx/jquery-3.6.0.js"></script>
<script type="text/javascript">
//<!--
	$(document).ready(
		function() {
			// 독서는 클릭하지말도록 하자, 독서 클릭시 이벤트가 다먹음
			//jquery 방식
			// $(selector).bind(eventName, function(event){})
			// 해당하는것만 들어감
			$("h4").bind(
				"click",
				function(event) {
					$(this).text($(this).text() + "♥");
				}
			);

			
			// json 방식
			// $(selector).bind(object) // 이벤트이름 function, 이벤트이름 function, 이벤트이름 function
			// 스타일시트 생성
			// 마우스 올라갔을때, 나갔을때, 더블클릭할때
			//var size = $("h4").css("font-size"); 실행 X
			var size = 16;
			$("h4").bind(
				{
					"mouseover" : function(event) { // 마우스 가져다 댈시
						$(this).addClass("reverse");
						
					},
					"mouseout" : function(event) { // 마우스를땔 시
						$(this).removeClass("reverse");
						
					},
					"dblclick" : function(event) { // 마우스 더블클릭 시
						$(this).css("font-size", ++size);
					}
				}		
			);
			
			// unbind
			setTimeout( // 동작 중지 명령
				function() {
					$("h4").unbind("mouseover").unbind("mouseout").unbind("click"); // 동작을 중지 한다.
																					// 더블클릭은 중지를 안했기에 동작함
				},
				3000 // 3초후에 
			);
			
			// toggle
			$("button").bind(
				"click",
				function(event) {
					$("h3").toggle(); // 버튼 클릭시 나왔다가 사라졌다 반복함
				}
			);
			
			// one() 이벤트를 딱 한번만 실행함
			$("h5").one(
				"click",
				function(event){
					alert("event"); // event라는 메시지 출력  딱 한번만
				}
			);
			
			
		}
	);
	// 일반 이벤트처리 방식
	function additem() { // 이벤트추가
		$("h4").text( // 모든 h4 영역에 글자를 넣어라
			function(index, text) {
				if(index % 2 == 0){
					return text + "★"; // 짝수에는 별이 추가
				} else {
					return text + "☆";
				}
			} 	
		);
	}
//-->
</script>
<br>

<!-- one -->
<h5> one </h5>
<br><br>


<!-- toggle -->
<button> 토글 </button> <br>
<h3> 토글 </h3>


<br><br>

<h4 onclick="additem()"> 독서 </h4> <!-- 이벤트 직접 준 영역 (자바스크립트 함수 추가) -->
<h4> 등산 </h4>
<h4> 운동 </h4>
<h4> 게임 </h4>
