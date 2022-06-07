<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<script>
	//<!--
	document.write("<h2> 이벤트</h2>");
	function clock() {
		var date = new Date();
		var now = date.getHours()+" : "
         		+date.getMinutes()+" : "
         		+date.getSeconds();
         	document.title = now;
         	//setTimeout("clock()",1000);
	
	}
	setInterval("clock()", 1000);
	
	function setcolor() {
		var color = document.inputform.color.value;
		document.bgColor = color;
	}
	
	function hop(){
		document.inputform.result.value
			= eval(document.inputform.num1.value) + eval(document.inputform.num2.value);
	}
	function cha(){
		document.inputform.result.value
			= eval(document.inputform.num1.value) - eval(document.inputform.num2.value);
	}
	function gop(){
		document.inputform.result.value
			= eval(document.inputform.num1.value) * eval(document.inputform.num2.value);
	}
	function mok(){
		document.inputform.result.value
			= eval(document.inputform.num1.value) / eval(document.inputform.num2.value);
	}
	
	function gosite() {
		window.location.href
			=document.inputform.site.options[ document.inputform.site.selectedIndex].value
	}
	
	function myhobby(){
	      var result = document.getElementById("result");
	      var msg = "취미는 ";
	      for(var i=0; i<document.inputform.hobby.length; i++) {
	    	 if(document.inputform.hobby[i].checked ) {
	    		msg += document.inputform.hobby[i].value + " ";  
	    	  }
	      }
	      msg += "입니다<br>";
	      result.innerHTML = msg ;
	   }
	//-->
</script>

<body onload="clock()">
	<form name="inputform">
	취미 : <input type = "checkbox" name = "hobby" value="독서">독서
		 <input type = "checkbox" name = "hobby" value="등산">등산
		 <input type = "checkbox" name = "hobby" value="운동">운동
		 <input type = "checkbox" name = "hobby" value="게임">게임
		 <input type="button" value="선택" onclick="myhobby()">
		 <br>
		 <div id="result"></div>
	
		<br><br>
		<select name = "site">
		<option value="http://www.daum.net">다음</option>
		<option value="http://www.naver.com">네이버</option>
		<option value="http://www.google.co.kr">구글</option>
		<option value="http://www.nate.com">네이트</option>
		</select>
		<input type="button" value="이동" onclick = "gosite()">
	
	<br><br>
	사칙연산 : <input type = "text" name = "num1">
			<input type = "text" name = "num2">
			= <input type = "text" name = "result" readonly>
			<input type = "button" value = "+" onclick ="hop()">
			<input type = "button" value = "-" onclick ="cha()">
			<input type = "button" value = "*" onclick ="gop()">
			<input type = "button" value = "/" onclick ="mok()">
	

	<br><br>
	배경색 : <input type = "text" name = "color">
		  <input type="button" value = "선택" onclick="setcolor()">	
		  <br>
		  <a onmouseover="document.bgColor='red'" onmouseout="document.bgColor='white'">빨간색</a><br>
		  <a onmouseover="document.bgColor='yellow'" onmouseout="document.bgColor='white'">노란색</a><br>
		  <a onmouseover="document.bgColor='blue'" onmouseout="document.bgColor='white'">파란색</a><br>
		  <a onmouseover="document.bgColor='green'" onmouseout="document.bgColor='white'">초록색</a><br>
		  
		  
	
	</form>

</body>