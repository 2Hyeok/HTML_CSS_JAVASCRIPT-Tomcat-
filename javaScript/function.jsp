<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<h2>함수</h2>
<script>
//<!--
// 선언적 함수
// 반복되는 내용을 묶어서 처리
// 매개변수의 개수는 상관없다
// 반드시 호출한 곳으로 되돌아온다
// return 값은 하나뿐이다.
	sub();
	function sub() {
		document.write("hello JavaScript!!<br>");
	}
	sub();
	sub();
	sub();

	//익명함수
	// disp();
	var disp = function() {
		document.write("Hello JavaScript!!<br>");
	}
	disp();
	
	//매개변수
	function hap(a, b, c) {
		document.write(a + b + c + "<br>");
	}
	hap(2, 5, 7);
	hap(2, 5);
	hap(2, 5, 6, 8);
	
	
	//return
	function cha(a, b) {
		return a-b;
	}
	var a = cha(5, 2);
	document.write(a + "<br>");

	
	//내장함수
	document.write("isNaN : " + isNaN("123") + "<br>");
	document.write("isNaN : " + isNaN("ABC") + "<br>");
	document.write("isNaN : " + isNaN(123) + "<br>");
	
	document.write("parseInt : " + parseInt(10.5) + "<br>");
	document.write("parseFloat : " + parseFloat("10.5") + "<br>");
	
	document.write("eval : " + ("5 + 2") + "<br>");
	document.write("eval : " + eval("5 + 2") + "<br>");
	
	//문자열 함수
	document.write("<br><br><br>")
	var str = "Hello JavaScript!!";
	document.write("bold : " + str.bold() + "<br>");
	document.write("italics : " + str.italics() + "<br>");
	document.write("strike : " + str.strike() + "<br>");
	document.write("sub : " + str + "r".sub() + "<br>");
	document.write("sup : " + str + "r".sup() + "<br>");
	document.write("fontcolor : " + str.fontcolor("red") + "<br>");
	document.write("fontsize : " + str.fontsize("+1") + "<br>");
	document.write("fontsize : " + str.fontsize(5) + "<br>");
	
	//  0   1   2   3   4   5   6   7   8   9  10  11  12  13  14  15  16  17   18
	//| H | e | l | l | o |   | J | a | v | a | S | c | r | i | p | t | ! | ! | \0 |
	document.write("charAt : " + str.charAt(6) + "<br>");
	document.write("indexOf : " + str.indexOf("a") + "<br>");
	document.write("indexOf : " + str.indexOf("!!") + "<br>");
	document.write("indexOf : " + str.indexOf("b") + "<br>");
	document.write("substring : " + str.substring(10) + "<br>");
	document.write("concat : " + str.concat("!!") + "<br>");
	
	// 시간
	var date = new Date();
    var now = date.getFullYear()+"년"
          +(date.getMonth()+1)+"월"
          +date.getDate()+"일"
          +date.getHours()+"시"
          +date.getMinutes()+"분"
          +date.getSeconds()+"초"
          +date.getDay();
    document.write("현재시각"+now+"<br>");
    document.write("<br><br><br>");
	
    
    // 배열
    var m = [10, 20, 30, 40, 50];
    var w = new Array(40, 10, 30, 20, 50);
    for(var i = 0; i<w.length; i++) {
    	document.write(w[i] + "<br>");
    }
    document.write("join : " + w.join() + "<br>");
    document.write("join : " + w.join("/") + "<br>");
    document.write("slice : " + w.slice(1, 3) + "<br>");
    document.write("sort : " + w.sort() + "<br>");
    
    //math
    document.write(parseInt(Math.random()*100) + 1 + "<br>");
    
    
//-->
</script>