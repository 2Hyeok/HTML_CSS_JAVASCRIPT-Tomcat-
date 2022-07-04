<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<h2> 이미지 이동 </h2>
<script src="/jQueryEx/jquery-3.6.0.js"></script>
<script type="text/javascript">
//<!--
	$(document).ready(
		function() {
			$("#img").append( //append를 통해 이미지를 한번에 넣음
				"<br>", // 이미지를 3개 불러올거기 때문에 3개를 만들어줌
				$("<img>").attr( // img 태그 생성후 json으로 만듬
					{
						"src" : "/jQueryEx/images/a.jpg",
						"width" : "200px",
						"height" : "150px"
					}		
				
				),
				$("<img>").attr( // img 태그 생성후 json으로 만듬
					{
						"src" : "/jQueryEx/images/b.jpg",
						"width" : "200px",
						"height" : "150px"
					}		
					
				),
				$("<img>").attr( // img 태그 생성후 json으로 만듬
					{
						"src" : "/jQueryEx/images/c.jpg",
						"width" : "200px",
						"height" : "150px"		
					}		
				)
			);
			
			setInterval( // 지정한 시간만큼 돌아감 반복적으로
				function() {
					$("#img").append($("img").first() ); // img태그의 첫번째부터
					// $("#img").append($("img").first().clone() ); // 이미지 복사하여 추가
				},
				1000 //1초
			);
			
		}
	);
//-->
</script>
<br>
<div id="img"></div>