<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<h2> on / off </h2>

<script src="/jQueryEx/jquery-3.6.0.js"></script>
<script type="text/javascript">
//<!--
		// bind() $(selector).on(eventName, eventHandler)
		// live() $(document).on(eventName, selector, eventHandler)
		// delegate() $(selector).on(eventName, selector, eventHandler)
		// unbind() $(selector).off(eventName[, eventHandler])
		// die() $(document).off(eventName, selector[, eventHandler])
		// undelegate() $(selector).off(eventName, selector[, eventHandler])
		// live() delegate() die() undelegate() 모두 on() off()로 통합
	$(document).ready(
		function() {
			// bind, unbind
			/*
			$("h4").bind(
				"click",
				function(event){
					$("<h4></h4").text($(this).text()).appendTo("#result"); // h4 생성후 해당하는 글자 클릭시 그 글자를 가져옴
				
				}		
			);
			setTimeout(
					function() {
						$("h4").unbind("click");
					},
					3000 // 3초 실행 후 중지
				);
			*/
			
	//-------------------------------------------------------------------------------------------------------------------------------
			
			// $(selector).on(eventName, function(event){})  -- bind
			// 새로생긴것 클릭해도 동작 X
			/*
			$("h4").on(
				"click",
				function(event){
					$("<h4></h4>").text($(this).text()).appendTo("#result");
				}
			);
			setTimeout(
				function() {
					$("h4").off("click"); // 3초후 클릭 이벤트를 꺼라 
				},
				3000
			);
			*/
			
			//$(selector) 는  최상위 태그? 로 설정
			// $(selector).on(eventName, selector, function(event){})  -- delegate, live
			// live - 추가된 항목 클릭시에도 추가 클릭 이벤트가 발생
			$("div").on( // $("body") or $(document) 도 가능 div안에서만 수행 할 것이기에 지금은 필요 없다.
				"click",
				"h4",
				function(event){
					$("<h4></h4>").text($(this).text()).appendTo("#result");
				}
			);
			setTimeout(
				function(){
					$("div").off("click"); // div에 이벤트를 달았기 때문에 div로 off값을 주어야한다.
				},
				3000
			);
			
			
		}
	);
//-->
</script>
<br>

<div id="result">
	<h4> 축구 </h4>
	<h4> 야구 </h4>
	<h4> 농구 </h4>
	<h4> 배구 </h4>
	<hr size="3" color="red">
</div>