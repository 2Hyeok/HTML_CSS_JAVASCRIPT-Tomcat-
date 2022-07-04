<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<h2> addClass / attr </h2>
<style type="text/css">
	.point {
		color : red;
	}
	.strong {
		color : blue;
	}
</style>

<script src="/jQueryEx/jquery-3.6.0.js"></script>
<script type="text/javascript">
	//<!--
	$(document).ready(
		function() {
			// addClass - 클래스가 지정이 안되있을대 강제로 추가할때
			$("h4").filter(":first").addClass("point"); // 첫번째에 포인트라는 클래스를 강제로 먹임
			$("h4").filter(
				function(index){
					if(index%2==1) return this; // 홀수인 애들만 불러옴
					
				}		
			).addClass("strong");
			
			
			//removeClass - 클래스를 지울때
			$("h4").removeClass("point");	// point 클래스 삭제
			$("h4").removeClass("strong");	// strong 클래스 삭제
			
			$("h4:eq(1)").addClass("point"); // index값이 1인것에 point추가
			$("h4").eq(1).addClass("point");
			$("h4").filter(":eq(1)").addClass("point");
			$("h4").filter(
				function(index){
					return index == 1;
				}		
			).removeClass("point");
			
			
			// attr - 문서 객체 속성 검사, setter, getter 역할을 둘다 할 수 잇음
			// DOM
			var msg="";
			var first = document.getElementById("first"); // 테그를 가져옴
			msg += first.getAttribute( "src" ) + "<br>";// 경로값 가져옴
			first.setAttribute( "width", "200px" );  // 크기를 조절하는
			first.setAttribute( "height", "100px" ); 

			
			
			
			//JQuery
			// $(selector).attr(name) getter의 역할
			msg += $("img").last().attr( "src" ) + "<br>" // 마지막 이미지의 경로를 표시
			
			
			// $(selector).attr(name, value) setter의 역할
			$("img").last().attr("width", "200px").attr("heigth", "100px");
			
			
			
			// $(selector).attr(object) Json의 역할
			$("img").last().attr(					
				{  // 쌍따옴표 없어도됨
					"width" : "400px",
					"height" : "200px"
				}
			);
			
			
			// $(selector).attr(name, function(index, attr){} ) 반복문의 역할
			$("img").attr(
					
				"width",
				function(index, attr){
					return (index + 1)*100;
				}
			);
			
			
			
			$("img").attr(
				{
					"width" : function(index, attr) {
						return(index + 1) * 200;
					},
					"height" : function(index, attr){
						return(index + 1) * 100;
					}
				}
			);
		
			// removeAttr
			$("img").removeAttr("width").removeAttr("height");
			
			$("#result").html(msg);
			
		}	
		
	);
	

	//-->
</script>
<h4>짜장면</h4>
<h4 class="point">짬뽕</h4>
<h4>군만두</h4>
<h4>탕수육</h4>
<br>

<div id="result"></div>
<br>


<img id="first" src="/jQueryEx/images/a.jpg"><br>
<img src="/jQueryEx/images/b.jpg">