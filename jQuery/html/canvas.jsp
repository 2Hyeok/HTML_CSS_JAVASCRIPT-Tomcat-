<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<h2> Canvas </h2>

<style type="text/css">
	#cvs {
		border : 1px solid red;
		width : 400px;
		height : 300px;
	}
</style>

<canvas id="cvs">

</canvas>

<script type="text/javascript"> // 스크립트 위치는 어디에있든 상관없는데 캔버스보다는 밑에 잡아주어야함 
	//<!--
	var cvs = document.getElementById("cvs");
	var ctx = cvs.getContext("2d") // 펜 생성
	
	ctx.fillStyle = "blue";
	ctx.fillRect(10, 10, 50, 50); // 범위지정 50픽셀로 그려라, 채운 사각형
	ctx.strokeRect(70, 10, 50, 50); // x좌표 y좌표의 50픽셀로 그려라, 테두리 사각형
	ctx.clearRect(40, 40, 50, 50); // 영역을 지워라, 투명한 사각형
	
	ctx.beginPath(); // path시작
	ctx.lineWidth = 10; // 두깨는10
	ctx.lineCap = "round"; // 둥글게 해라
	
	ctx.lineTo(10, 70);
	ctx.lineTo(200, 70);
	ctx.lineTo(85, 120);
	ctx.lineTo(10, 70);
	ctx.stroke(); // 써주어야 선이 그어짐 없으면 안그려진다.
	
	ctx.moveTo(250, 70); // 이동해라
	ctx.lineTo(250, 120);
	ctx.stroke();
	ctx.fill(); // 안을 채워라
	ctx.closePath(); // path를 끝낸다 (선이 안그어짐)
	
	
	// 글자 그리기

	ctx.fillStyle = "red";
	ctx.font = "10px Gothic";
	
	ctx.textAlign= "left"; // 중심선의 왼쪽 오른쪽 맞춰라
	ctx.fillText("left", 200, 20);
	
	ctx.textAlign = "right";
	ctx.fillText("right", 200, 30);
	
	ctx.textAlign = "center";
	ctx.fillText("center", 200, 40);
	
	ctx.textAlign = "start";
	ctx.fillText("start", 200, 50);
	
	ctx.textAlign = "end";
	ctx.fillText("end", 200, 60);
	//-->
</script>