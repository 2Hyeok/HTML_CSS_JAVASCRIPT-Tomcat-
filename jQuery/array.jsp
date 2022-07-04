<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<h2> 반복문 </h2>
<script src="/jQueryEx/jquery-3.6.0.js"></script>
<script type="text/javascript">
//<!--
	$(document).ready(
		function(){
			var msg = "";
			// 배열
			var m = [10, 20, 30, 40, 50];
			for(var i=0; i<m.length; i++){
				msg += m[i] + "&nbsp;";
			}
			msg += "<br>";
			
			for(var i in m){
				msg += m[i] + "&nbsp;";
			}
			msg += "<br>";
			
			var w = new Array(10, 20, 30, 40, 50);
			for(var i in w){
				msg += w[i] + "&nbsp;";
			}
			msg += "<br>";
			
			
			//JSON
			var z = [
				{"name":"홍길동", "age":20},
				{"name":"김유신", "age":30},
				{"name":"이순신", "age":40}
			];
			for(var i=0; i<z.length; i++){
				msg += "이름 : " + z[i].name + "<br>"
					+ "나이 : " + z[i].age + "<br>"
			}
			
			
			
			
			// 나열된 데이터가 들어가면됨 json 상관 x
			// select로 불러올 필요 X
			// index가 넘어온 애들은 반복문 (each가 아니더라도)
			// $.each(object, function(index, item){})
			$.each(
					m,
					function(index, item) {
						// msg += index + " : " + item + "<br>"; // 인덱스 번호와 함께 출력
						// msg += item + "<br>"; // 번호만 출력
						// msg += m[index] + "<br>";
						msg += this + "<br>"; // this = item
					}
				);
			msg += "<br>";
			
			$.each(
					z,
				function(index, item){
						// msg += z[index].name + ":" + z[index].age + "<br>";
						// msg += item.name + ":" + item.age + "<br>";
						msg += this.name + ":" + this.age + "<br>";
					}		
			);
			msg += "<br>";
			
			
			// $(select).each(function(index, item){})
			var colors = ["red", "blue", "green", "yellow"]; // 쓰려면 4번째꺼 지워야함
			$("h4").each( // h4테그를 가져와라라는뜻
					function(index, item){
						// msg += index + ":" + item + "<br>"; // 테그를 전부 가져오기에 테그객체가 찍힘
						// msg += index + ":" + $(item).text() + "<br>"; // item에$써주어야함
						// msg += index + ":" + $(this).text() + "<br>";
						// if(index % 2 == 0)$(item).css("color", "red"); // index 짝수번째에 색입힘
						$(this).css("color", colors[index]); // 배열의 index별로 색을 입힘
					}
				);
			
			
			$("#result").html( msg );
		}
	);

//-->
</script>
<br>
<h4> 축구 </h4>
<h4> 야구 </h4>
<h4> 농구 </h4>
<h4> 배구 </h4>
<br>
<div id="result"></div>