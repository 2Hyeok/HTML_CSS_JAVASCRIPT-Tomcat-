<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<body>
<h2> 선택자 </h2>

<script src="/jQueryEx/jquery-3.6.0.js"></script>
<script type="text/javascript">
	//<!--
	$(document).ready(
		function() {
			// 전체 선택자
			//$("*").css("color", "red"); // "*"는 모든것
			
			// 태그 선택자
			$("body").css("color", "blue");
			$("h2").css("color", "yellow");
			$("h4").css("color", "lime");
			
			// 아이디 선택자 - #idname 사용
			$("#first").css("color", "cyan");
			$("h4#third").css("color", "magenta");
			
			
			// 클래스 선택자 - .classname 으로 사용
			$(".point").css("color", "gold");
			$("h4#third.point").css("color", "silver");
			
			
			// 후손 선택자
			$("h4 a").css("background", "black"); //h4밑에 어딘가의  a태그
			
			// 자식 선택자
			$("h4 > a").css("background", "red"); // h4밑에 바로 밑에있는 a태그
			
			$("h2, h4").css("color", "blue")
		}
	);
	//-->
</script>
<br>
<h4 id="first"> 축구 </h4>
<h4 class="point"><a>야구</a> </h4>
<h4 id="third" class="point"><b><a>농구</a></b> </h4>
<h4 class="strong"> 배구 </h4>
</body>