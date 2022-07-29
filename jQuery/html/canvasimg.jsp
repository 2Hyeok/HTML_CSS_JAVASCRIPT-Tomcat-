<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<h2> Canvas Image </h2>

<style type="text/css">
	canvas {
		border : 1px solid red;
		width : 400px;
		height : 300px;
	}
</style>

<canvas id="cvs"></canvas>

<script type="text/javascript"> // 스크립트 위치는 어디에있든 상관없는데 캔버스보다는 밑에 잡아주어야함 
	//<!--
	// 캔버스에 이미지 로딩시간이 있음 로드될동안 기다려야함
	window.onload = function() { // 페이지가 뜨자마자
		var cvs = document.getElementById("cvs");
		var ctx = cvs.getContext("2d"); // 펜을 가져옴
		
		var img = new Image();
		img.src = "/jQueryEx/images/a.jpg";
		img.onload = function(){ // 페이지 로딩중에 그려라
			// ctx.drawImage(img, 0, 0); // 0에 0부터 시작해라
			ctx.drawImage(img, 0, 0, 400, 300); // 0에 0부터 시작해라
		}
	
	}
	
	
	//-->
</script>