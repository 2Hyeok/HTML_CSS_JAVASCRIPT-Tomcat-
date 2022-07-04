<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<h2> Ajax - Text </h2>
<script src="/jQueryEx/jquery-3.6.0.js"></script>
<script type="text/javascript">
	//<!--
	$(document).ready(
		function(){
			$("input[value=전송]").on(
				"click",
				function(event){
					var params = "name=" + $("input[name=name]").val()
								+ "&age=" + $("input[name=age]").val();
					
					// $.ajax(setting)
					$.ajax(
						{
							type : "POST",
							url : "user.jsp",
							// data : params,
							/*
							data : {
								name : $("input[name=name]").val(),
								age : $("input[name=age]").val()
							},
							*/
							data : $("form").serialize(),
							// form이 하나이므로 이름으로 구별 불필요, serialize()로 form에 입력한 변수를 하나씩이 아니라 한꺼번에 가져올 수 있음
							dataType : "text", // 돌려받는 데이터 타입
							success : function(data){
								$("#result").html(data);
								// $("#result").html("정상종료<br>")
							},
							error : function(error){
								$("#result").html(error + "<br>");
							}
						}
					)
				}
			)
		}	
	);
	//-->
</script>
<form>
	<table border='1'>
		<tr>
			<th> 이름 </th>
			<td> <input type="text" name="name"> </td>
		</tr>
		<tr>
			<th> 나이 </th>
			<td> <input type="text" name="age"> </td>
		</tr>
		<tr>
			<th colspan='2'>
				<input type="button" value="전송">
				<input type="reset" value="취소">
			</th>
		</tr>
	</table>
</form>
<div id="result"></div>