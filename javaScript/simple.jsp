<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<h2>simple</h2>

<script>
//<!--
	document.write(10 + "<br>");
	document.write(10.5 + "<br>");
	document.write("ABC" + "<br>");
	document.write("ABC" + "<br>");
	
	// alert("경고");
	//prompt();
	//confirm();
	//print();
	//open();
	
	var a = 10;
	var b= "ABC";
	document.write(a + "<br>");
	document.write(b + "<br>");
	document.write(typeof(10) + "<br>");
	document.write(typeof("ABC") + "<br>");
	document.write(typeof(10.5) + "<br>");
	document.write(typeof('A') + "<br>");
	document.write(typeof(String(10)) + "<br>");
	document.write(typeof(Number("ABC")) + "<br>");
	
	//자동 형변환
	document.write("<br>");
	document.write("5 + 2" + "<br>");
	document.write("5" + "2" + "<br>");
	document.write("5" + 2 + "<br>");
	document.write(5 + 2 + "<br>");
	
	document.write("<br>");
	document.write("5 - 2" + "<br>");
	document.write("5" - "2" + "<br>");
	document.write("5" - 2 + "<br>");
	document.write(5 - 2 + "<br>");
	
	document.write("<br>");
	document.write("5 / 2" + "<br>");
	document.write("5" / "2" + "<br>");
	document.write("5" / 2 + "<br>");
	document.write(5 / 2 + "<br>");
	
	// 일치 연산자 - 좀더 정확한 연산
	if(0=="") document.write("같다<br>");
	if(0==false) document.write("같다<br>");
	if(""==false) document.write("같다<br>");
	if("5"==5) document.write("같다<br>");
	
	if(0==="") document.write("같다<br>");
	else document.write("다르다<br>");
	if(0===false) document.write("같다<br>");
	else document.write("다르다<br>");
	if(""===false) document.write("같다<br>");
	else document.write("다르다<br>");
	if("5"===5) document.write("같다<br>");
	else document.write("다르다<br>");
	
	// 배열
	// int m[] = new int[3];
	// int m[] = {10, 20, 30};
	
	var m = [];
	var w = [ 10, 20, 30];
	w[4] = 40; // 이전 방이 없다면 undefined
	for(var i=0; i<w.length; i++){
		document.write(w[i] + "<br>");
	}
	
	// switch - case
	// 정수 문자 정수로 떨어지는식
	// 1.7부터 문자열도 가능
	
	var a = 90;
	switch(true) {
	case a>=90 : document.write("A학점 <br>"); break;
	case a>=80 : document.write("B학점 <br>"); break;
	case a>=70 : document.write("C학점 <br>"); break;
	case a>=60 : document.write("D학점 <br>"); break;
	case a<60 : document.write("F학점 <br>"); break;
	}
	
	var date = new Date();
	var hour = date.getHours();
	switch(true) {
		case hour <= 12 :document.write("오전<br>"); break;
		case hour <= 14 :document.write("점심<br>"); break;
		case hour <= 18 :document.write("오후<br>"); break;
		default : document.write("밤<br>");
	}
	
	// 짧은 조건문
	// && ||
	true && document.write("true && <br>");
	false && document.write("false && <br>");
	true || document.write("true || <br>");
	false || document.write("false || <br>");
	
	//-->
</script>