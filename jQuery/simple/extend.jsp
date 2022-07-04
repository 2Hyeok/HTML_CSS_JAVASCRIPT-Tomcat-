<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<h2> extend </h2>
<script src="/jQueryEx/jquery-3.6.0.js"></script>
<script type="text/javascript">
//<!--
	$(document).ready(
		function() {
			var msg = "";
			var hong = new Object();
			hong.name = "홍길동";
			hong.age = 20;
			hong.tel = "1111-2222";
			hong.getName = function() { return this.name };
			hong.getAge = function() { return this.age };
			hong.getTel = function() { return this.tel };
			
			msg += "이름 : " + hong.getName() + "<br>"
				+ "나이 : " + hong.getAge() + "<br>"
				+ "전화번호 : " + hong.getTel() + "<br><br>";
				
			//$.extend(object, addmember, addmember, .... ) addmember에 json들어갈 수 잇음(하나로 묶을 예정)
			var lee = new Object();
			$.extend(
				lee,
				{"name":"이순신"},
				{"age":30},
				{"tel":"1111-3333"},
				{"getName":function() {return this.name; }},
				{"getAge":function() {return this.age; }},
				{"getTel":function() {return this.tel; }}
			);
			msg += "이름 : " + lee.getName() + "<br>"
				+ "나이 : " + lee.getAge() + "<br>"
				+ "전화번호 : " + lee.getTel() + "<br><br>";
			
			
			// Json
			var kim = new Object();
			$.extend(
				kim,
				{
					"name":"김유신",
					"age":30,
					"tel":"2222-1111",
					"getName":function() {return this.name;},
					"getAge":function() {return this.age; },
					"getTel":function() {return this.tel; }
				}
			);
			msg += "이름 : " + kim.getName() + "<br>"
				+ "나이 : " + kim.getAge() + "<br>"
				+ "전화번호 : " + kim.getTel() + "<br><br>";
			
				
			
			$("#result").html(msg);
		}
	);
//-->
</script>
<div id="result"></div>