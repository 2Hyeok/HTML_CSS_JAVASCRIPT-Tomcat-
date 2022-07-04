<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<h2> CSS </h2>
<script src="/jQueryEx/jquery-3.6.0.js"></script>
<script type="text/javascript">
//<!--
// 문자 객체의 스타일 검사
	$(document).ready(
		function() {
			var msg = "";
			
			
			//$(selecter).css(name, value) - setter
			$("h4").first().css("color", "white").css("background", "black"); // rgb값 변경 확인 가능
						
			
			//$(selecter).css(object) - json
			$("h4").last().css(
				{
					"color" : "white",
					"background" : "gray"
				}
			);
			
			
			
			//$(selecter).css(name, function(index, style){}) - 반복문
			var colors = ["gray", "silver", "lightgray", "darkgray"];
			$("h4").css(
				"color",
				function(index, style){
					return colors[index]; //colors의 index번째
					
				}
			);
			
			// size 추가
			var size = [20, 21, 22, 23]; // 폰트 사이즈의 반복문
			var background = ["red", "blue", "green", "yellow"]; // background색상의 반복문
			$("h4").css(
				{
					"font-size" : function(index, style){
						return size[index];		// 크기의 index 번째 리턴
					},
					"background" : function(index, style){
						return background[index];		// background의 index 번째 리턴
					
					}
				}
			);
			
			
			
			
			//$(selecter).css(name) - getter
			$("h4").each(
				function(index, item){ // function(a, b){ 이런식도 가능
					msg += index + " : " + $(item).css("color") + "<br>" // 색상정보 rgb 출력
						+ index + " : " + $(item).css("font-size") + "<br>" // 폰트크기 출력
				}		
			);
			
			
			$("#result").html(msg);
		}
	);
//-->
</script>
<br>
<h4> 사과 </h4>
<h4> 딸기 </h4>
<h4> 바나나 </h4>
<h4> 배 </h4>
<div id="result"></div>