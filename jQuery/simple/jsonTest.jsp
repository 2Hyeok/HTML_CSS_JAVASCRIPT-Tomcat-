<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<h2> JSON 표기법 </h2>

<script type="text/javascript">
	// <!--
	window.onload = function() {
		var result = document.getElementById("result");
		var msg = "";
		
		var a = {"ko":"대한민국", "uk":"영국", "jp":"일본"};
		msg += "a : " + a.ko + "<br>";
		msg += "a : " + a["ko"] + "<br>";
		
		var kim = {"name":"김유신", "age":30, "tel":"1111-2222"};
		msg += "이름 : " + kim.name + "<br>"
			+ "나이 : " + kim.age  + "<br>"
			+ "전화번호 : " + kim.tel + "<br>";
		
		var s = {"salary":[2000, 3000, 4000, 5000]};
		msg += s.salary[1] + "<br>";
		for(var i=0; i<s.salary.length; i++){
			msg += s.salary[i] + "<br>";
		}
		
		<%-- json 안에 json --%>
		var e = {"employee":{"name":"이순신", "age":30, "tel":"1111-2222"}}
		msg += "이름 : " + e.employee.name + "<br>"
			+ "나이 : " + e.employee.age + "<br>"
			+ "전화번호 : " + e.employee.tel + "<br>";
			
			
			var ee = [
				{"name":"홍길동", "age":20},
				{"name":"이순신", "age":30},
				{"name":"김유신", "age":40}
			];
			for( var i=0; i<ee.length; i++ ) {
				msg += "이름 : " + ee[i].name + "<br>"
					+ "나이 : " + ee[i].age + "<br><br>";
			}
							
			var ees = {
				"kim":{"name":"김유신", "age":20},	
				"lee":{"name":"이순신", "age":30},
				"hong":{"name":"홍길동", "age":40}
			};
			msg += "이름 : " + ees.kim.name + "<br>"
				+ "나이 : " + ees.kim.age + "<br>"
				+ "이름 : " + ees.lee.name + "<br>"
				+ "나이 : " + ees.lee.age + "<br>"
				+"이름 : " + ees.hong.name + "<br>"
				+ "나이 : " + ees.hong.age + "<br><br>"
					
			var es = {
				"kim" : ["김유신", 30, "1111-2222"],	
				"lee" : ["이순신", 40, "2222-2222", "서울시"],
				"hong" : ["홍길동", 20, "1111-3333"]
			};
			for( var i=0; i<es.kim.length; i++ ) {
				msg += es.kim[i] + "&nbsp";
			}
			msg += "<br>";
			for( var i=0; i<es.lee.length; i++ ) {
				msg += es.lee[i] + "&nbsp";
			}
			msg += "<br>";
			for( var i=0; i<es.hong.length; i++ ) {
				msg += es.hong[i] + "&nbsp";
			}
			msg += "<br>";
		
		result.innerHTML = msg;
	}
	// -->
</script>
<div id = "result"></div>