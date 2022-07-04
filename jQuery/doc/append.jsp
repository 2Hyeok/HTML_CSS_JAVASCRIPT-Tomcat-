<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<h2>append / appendTo</h2>
<script src="/jQueryEx/jquery-3.6.0.js"></script>
<script type="text/javascript">
	//<!--
	/*
 		append 진행뱡향 - $(A) append (B) : B -> A
 		appendTo 진행방향 $(A) append (B) : A -> B
 	*/
 	
	$(document).ready(
		function() {
			// DOM
			// var dom = document.getElementById("dom");
			// var textnode = document.createTextNode("After");
			// var textnode = document.createTextNode("<b>After</b>"); <b>태그 같이 출력됨
			// var spannode = document.createElement("span");
			// spannode.appendChild(textnode); // 뒤에 붙일거기때문에 appendChild
			// dom.appendChild(spannode);
			
			//innerHTML
			var afternode = document.createElement("span");
			afternode.innerHTML = "<b> After </b>";
			dom.appendChild(afternode);
			
			
			var beforenode = document.createElement("span");
			beforenode.innerHTML = "<b> Before </b>"; 
		//	dom.insertBefore(beforenode); 일반적으로 출력불가, 작업이 부모노드로 이루어져야한다.
			dom.parentNode.insertBefore(beforenode, dom); // dom의 부모로가기 위해 parentnode, 삽입 insertBefor는 부모로 올라가 (dom) 앞에 붙여라 라는의미
			
			
			
			// JQuery  기준으로 가서 앞뒤로 붙여라
			//$(A).Append(B)  			B -> A
			$("#append").append("<b> Append </b><br>"); // id=append에 붙여라 - append 뒤로 붙음 (볼드)
			$("#append").prepend("<b> Prepend </b><br>"); // id=append에 붙여라 - append 앞으로 붙음 (볼드)
			$("#append").before("<b> Before </b><br>"); // prepend 보다 앞에 before 붙음 (볼드)
			$("#append").after("<b> After </b><br>"); // append 뒤에 after붙음 (볼드)
			
			
			
			//$(A).AppendTo(B)  			A -> B
			/*
				$(A).insertAfter(B) A를 B의 뒤에 추가
				$(A).insertBefore(B) A를 B의 앞에 추가
			*/
			$("<b> AppendTo </b> <br>").appendTo("#appendTo"); // 태그를 만들어 appendTo 뒤에(줄 밑으로) 붙여라
			$("<b> PrependTo </b> <br>").prependTo("#appendTo"); // 태그를 만들어 appendTo 앞에 붙여라
			$("<b> InsertBefore </b> <br>").insertBefore("#appendTo"); // prepend보다 앞에 붙여라
			$("<b> InsertAfter </b> <br>").insertAfter("#appendTo"); // AppendTo 보다 뒤에 붙여라

			
			// 이미지 강제 삽입
			//$("img") // 태그를 찾아와라 라는 의미
			//$("<img>") // 태그를 만들어라 라는 의미 - 없는 태그도 만듬
			$("<img>").attr( //속성 추가
				{
					"src" : "/jQueryEx/images/a.jpg",
					"width" : "200px",
					"height" : "100px"
				
				}
			).appendTo("#img"); // 새로 만든것을 뒤로 붙여라
			
			
			// append 사용
			$("div:eq(1)").append(
				"<br>",
				$("<img>").attr( // 속성추가
					{			 // json영역
						src : "/jQueryEx/images/b.jpg",
						width : "200px",
						height : "100px"
					}		
				
				),
				"<br>"
			);
			
			// 이미지의 경로 추가
			//prependTo
			// 태그를 연속적으로 쓸거면 <br>삽입      .text("출력할 글자").first().attr("src의 속성값").
			// $("<span></span><br>").text($("img").first().attr("src")).prependTo("#img");
			$("<b></b><br>").text($("img").first().attr("src")).prependTo("#img"); // img id를가진것을 사진의 앞에 붙여라- src가 가지고있는 속성값을 가지고와라
			
			//prepend b의 경로값 추가 div태그의 index 1번 영역을 prepend로 한 후 img태그 마지막의 주소값 출력
			$("div").eq(1).prepend(
				"<br>",
				$("<b></b>").text($("img").last().attr("src")), // <b> 태그 생성후 그 문자를 <b>태그 안에 넣어라
				"<br>"
			);
			
			// $(selector).append(finction(index){})
			// index 가 들어가면 반복문 돌려서 넣어라
			var m = [ //json 으로 넣어라	
				{"name":"홍길동", "age":20},
				{"name":"이순신", "age":30},
				{"name":"김유신", "age":40}
			];
			$("h4").append( // h4 3개 가져옴
				function(index) { // index 하나씩 가져옴
					return m[index].name + ":" + m[index].age; // 배열안의 index번째의 이름과 나이 출력값 리턴		
				}	
			);
			
			
		}
	);
	//-->
</script>
<br>


<!-- 영역 추가 (반복문 영역) 데이터가 3개 이기때문에 3개잡음 -->
<h4></h4>
<h4></h4>
<h4></h4>


<br><br>
<!--  새로운 영역 추가  -->
<!--  강제로 이미지 끼워넣기 -->
<div id="img">appendTo<br></div><br>
<div>append</div>


<br><br>
<div id="dom">
	DOM <hr size="3" color="red">
</div>
<br>
<div id="append">
	Append <hr size="3" color="blue">
</div>
<br>
<div id="appendTo">
	AppendTo <hr size="3" color="green">
</div>
<br>
