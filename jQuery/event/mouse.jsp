<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<h2> mouse </h2>
<style type="text/css">
	#outer{
		width : 200px;
		height : 200px;
		background : magenta;
		padding : 50px;
	}
	
	#inner{
		width : 100px;
		height : 100px;
		background : pink;
		margin : 50px;
	}
</style>

<script src="/jQueryEx/jquery-3.6.0.js"></script>
<script type="text/javascript">
//<!--
	var msg="";
	$(document).ready(
		function() {
			$("#outer").mouseover( // 영역안에 마우스가 있을시
				function() {
					msg += "마우스가 들어왔다<br>";
					$("#result").html(msg); // 마우스 들어왔다가 여러번 출력되도록
				}
			).mouseout( //체이닝 가능 - 영역밖에 마우스가 있을시
				function(){
					msg += "마우스가 나갔다.<br>";
					$("#result").html(msg);
					// 마우스가 나가면 원래대로 되돌려라 - 현재 inner부분에서 색상변경이들어가있음
					$("#outer").css("background", "magenta");
					$("#inner").css("background", "pink");
				}		
			);
	//-----------------------------------------------
		// inner 영역 잡아보기
		
		$("#inner").click(
			function(){
				$("#result").html(""); // 클릭시 표시된 글자를 지움
				msg=""; // msg의 있는 값도 지움
			}		
		).dblclick( // 더블클릭
			function() {
				// var -> const - 값을 변경하지 않을때 사용 / 매개변수로 넘어온값 변경하지 않을때
				var color = "#" + Math.round(Math.random() * 0xFFFFFF ).toString(16); // 랜덤 색상 16진수로 출력 가장 큰 수를 곱해줌
				$("#outer").css("background", color);
				var color = "#" + Math.round(Math.random() * 0xFFFFFF ).toString(16); // 랜덤 색상 16진수로 출력 가장 큰 수를 곱해줌
				$("#inner").css("background", color);
			}		
		);
			
			
			
		}
	);
//-->
</script>
<br>
<div id = "outer">
	<div id = "inner"> </div>
</div>
<br>
<div id = "result"></div>