<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<h2> trigger </h2>
<script src="/jQueryEx/jquery-3.6.0.js"></script>
<script type="text/javascript">
//<!--
	$(document).ready(
		function() {
			
			// trigger 이벤트 강제 발생!!  많이쓰니 중요함
			// $(selector).tirgger(eventname)
			$("h4").bind(
				"click",
				function(event) {
					$(this).text($(this).text() + "♡");
				}
			
			);
			
			/*
			전체 한번에
			setInterval(
					function(){
						$("h4").trigger("click"); // h4에 클릭이벤트 강제발생
					},
					1000 // 1초마다 한번씩 클릭이벤트 발생
				);
			*/
			
			// 하나씩 따로 발생시키려면
			var cnt = 0;
			setInterval(
				function(){
					$("h4:eq("+ cnt++ % 4 +")").trigger("click"); // 후증가 나머지구하고 증가
				},
				1000 // 1초마다 한번씩 클릭이벤트 발생
			);
			
			
			// $(selector).tirgger(eventname, [data1, data2, ...]<- 배열로 들어감 ) (handler function)
			$("h3").bind(
				"click",
				function(event, data1, data2){
					$(this).text($(this).text() + data1 + data2); // data1, data2 추가한다 but 넘어온 값이 없기 때문에 undifind 뜸	
				}
			);
			setInterval(
				function() {
					$("h3").trigger("click", ["◁", "▷"]); // data1, data2, 로 받아 넘김
				},
				1000
			);
			
			
			setTimeout(
				function() {
					$("h4, h3").unbind("click");
				},
				10000 // 10초 실행 후 중지
			);
			
		
		// 이벤트 전달
		//event.preventDefault() - 기본이벤트 제거	
		//event.stopPropagation() - 이벤트 전달을 제거
		//이벤트 발생시 계속 올라가는것을 버블링 ex) <a> -> <h5> -> <body> (if문사용)
		// 이벤트리스너 - 이벤트의 발생유무  확인 -> 많이쓰면 성능저하 -> 버블링사용 <body>(부모쪽)에 하나만 붙임
		$("a").bind( // 클릭시 변함
			"click",
			function() {
				$(this).css("color", "red");
				// event.preventDefault(); // 기본이벤트를 전달받지 말아라 라는
				// event.stopPropagation(); // 이벤트 전달을 하지 않지만 클릭 링크이동은 함
				return false; // 두개를 합친 기능이 이것과 동일하다
			}
		);
		
		$("h5").bind(
			"click",	
			function() {
				$(this).css("background", "gray");
			}
		);
		
			
			
		}
	);
//-->
</script>
<br>

<!-- 이벤트 전달 -->
<h5><a href="http://www.naver.com">네이버</a></h5> <br>
<h5><a href="http://www.daum.net">다음</a></h5> <br>


<br><br>
<h3> 축구 </h3>
<h3> 야구 </h3>
<h3> 배구 </h3>
<h3> 농구 </h3>


<br><br>
<h4> 사과 </h4>
<h4> 딸기 </h4>
<h4> 바나나 </h4>
<h4> 수박 </h4>