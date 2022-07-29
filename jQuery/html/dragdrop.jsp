<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<h2> Drag & Drop </h2>
<style type="text/css">
	div {
		width : 200px;
		height : 300px;
		margin : 10px;
		float : left;
	}
	#blue {
		border : 2px solid blue;
	}
	#red {
		border : 2px solid red;
	}
</style>

<script type="text/javascript">
	//<--
	function drag(target, event){ // 움직일 겍체
		event.dataTransfer.setData("id", target.id); // 움직일 객체의 아이디가 필요함, 넘어온 애의 아이디, target의 아이디가 저장
	}
	function drop(element, event){ // 여기서 this는 div임
		var targetid = event.dataTransfer.getData("id");
		var target = document.getElementById(targetid);
		element.appendChild(target);
		event.preventDefault(); // 이벤트를처리하지 않을경우 동작을 실행하지 않도록
	}
	//-->
</script>


<!-- 옆으로 출력후 비교 -->												<!-- 진입과, 위를지나가는것을 false로 반환  -->
<div id="blue" ondrop="drop(this, event)" ondragenter="return false" ondragover="return false"></div> <!-- div에 이미지를 드랍해야함 다른 이벤트 발생시 처리하지 말라고 해주어야함 -->
<div id="red" ondrop="drop(this, event)" ondragenter="return false" ondragover="return false"></div> <!-- 원래는 이벤트 함수를 직접 짜주어야함 -->
<div id="white" ondrop="drop(this, event)" ondragenter="return false" ondragover="return false"> <!-- 드레그 가능한 객체로 바꾸어줘야함 --> <!-- 화이트도 원래대로 돌아가도록 설정 -->
	<img id="target" src="/jQueryEx/images/love.png" width="200px" height="300px"
	draggable="true" ondragstart="drag(this, event)"> <!-- target은 움직일것, 드레그의 시작은 마우스를끌어서 시작, 현재객체랑 이벤트를 같이 넘겨라(이벤트는 자동으로 생김) --> 
	<a id="daum" draggable="true" ondragstart="drag(this, event)">다음</a> <!-- 글자도 이동가능 -->
</div>