<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

 <h2> append </h2>
 <script src="/jQueryEx/jquery-3.6.0.js"></script>
<script type="text/javascript">
//<!--
	var cnt = 0;
	function additem() {
		var msg = "새로운 노드" + ++cnt + "번 노드" // cnt가 증가하는값
				// 버튼 추가 (.html로 잡음)
				+ "&nbsp;&nbsp;<input type='button' value='수정' onclick='moditem("+cnt+")'>" // metond() 사이를째서 변수추가
				+ "&nbsp;&nbsp;<input type='button' value='삭제' onclick='delitem("+cnt+")'>"; //.html이기에 태그로 출력
		//result 안에 넣음
		$("<div></div>").attr("id", "node_"+cnt).html(msg).appendTo("#result") //div 태그를 만들고 id추가후 result에 추가해라 버튼 클릭시 마다 계속 추가
	}
	function moditem(cnt) { // 수정노드 실행단
		var msg = "수정된 노드" + cnt + "번 노드"
				+ "&nbsp;&nbsp;<input type='button' value='삭제' onclick='delitem("+cnt+")'>";
		$("#node_"+cnt).html(msg); //ex) node_10번단
	}
	function delitem(cnt) {
		// $("#node_"+cnt).empty();
		$("#node_"+cnt).remove();
	}
//-->
</script>
<br>
추가 : <input type="button" value="추가" onclick="additem()">
<br><br>
<div id="result"></div>