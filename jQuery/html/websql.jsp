<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<script src="/jQueryEx/jquery-3.6.0.js"></script>
<script type="text/javascript">
	//<!--
	// opendb 지원여부 확인
	$(document).ready(
		function() {
			//DB생성
			var db = null;
			if( ! window.openDatabase){
				$("#console").html("지원하지 않는 브라우저 입니다.<br>");
				return;
			} else {
				$("#console").html("지원하는 브라우저 입니다.<br>");
				db = window.openDatabase("memberdb", "1.0", "회원관리", 1024*1024*5); // db이름, 버전, 내용, 저장공간(5mb) <- 없으면 만들어줌
				// 그냥두어도 상관 없지만
				// db가 없으면
				if( ! db ){
					// db = window.openDatabase("memberdb", "1.0", "회원관리", 1024*1024*5); // db이름, 버전, 내용, 저장공간(5mb) <- 없으면 만들어줌
					db.transaction( //db를 날려줌
						//함수를 3개만들어줌
						// 날려줄 함수
						function(tx) {
							tx.executeSql( // sql을 문자열로 줌
								"create table member("
								+ "name varchar2(30) not null,"
								+ "age number(3) not null,"
								+ "tel varchar2(30),"
								+ "address varchar2(100)"
								+ ")"
							);
						},
						// 실패했을시
						function(error) {
							$("#console").html("DB생성 실패" + error.message + "<br>");
						},
						// 성공 했을시
						function() {
							$("#console").html("DB생성 성공<br>");
						}
					);
				} else {
					$("#console").html("DB확인 <br>")
				}
			}
			
			// 가입
			$("input[value=가입]").on(
				"click",
				function(event) {
					var name = $("input[name=name]").val();
					var age = $("input[name=age]").val();
					var tel = $("input[name=tel]").val();
					var address = $("input[name=address]").val();
					// 이름과 나이를 입력했을경우
					if(name && age) {
						db.transaction(
							// db처리 (sql 날리기)
							function(tx) {
								tx.executeSql(
									"insert into member values(?, ?, ?, ?)", // 들어갈 값 입력하기
									[name, age, tel, address] // 배열로 생성
								);
							},
							// 가입 실패
							function(error) {
								$("#console").html("가입실패" + error.message + "<br>");
							},
							// 가입 성공
							function() {
								$("#console").html("가입 성공<br>");
								var name = $("input[name=name]").val("");
								var age = $("input[name=age]").val("");
								var tel = $("input[name=tel]").val("");
								var address = $("input[name=address]").val("");
							}
						);
					} else { // 이름과 나이를 입력하지 않았을경우
						$("#console").html("이름과 나이를 입력하세요<br>");
					}
				}		
			);
			
			// 탈퇴
			$("input[value=탈퇴]").on(
				"click",
				function(event){
					// 이름이 있으면 탈퇴를 시키고 없으면 탈퇴 실패, 이부분은 나중에 수정을 할때 추가할 예정
					
					
					// 일단은 이름이 입력이 되어야함
					// 이름을 가져옴
					var name = $("input[name=name]").val();
					if( ! name ){
						$("#console").html("탈퇴할 이름을 입력하세요<br>");
					} else {
						db.transaction(
							// db처리
							function(tx){
								tx.executeSql(
									"delete from member where name=?",
									[name] // 배열로 생성
								);
							},
							// 탈퇴 실패
							function(error){
								$("#console").html("탈퇴 실패" + error.message + "<br>");
							},
							// 탈퇴 성공
							function(){
								$("#console").html("탈퇴 성공<br>");
								$("input[name=name]").val("");
							}
						);
					}
				}
			);
			
			// 보기 (검색?)
			$("input[value=보기]").on(
				"click",
				function(event){
					var name = $("input[name=name]").val();
					if(name){
						// 해당 이름만 출력
						db.transaction(
							function(tx){
								tx.executeSql( // 3번째 매개변수가 있음
									"select * from member where name=?",
									[name], // 배열로
									// 이 부분은 직접 만들거기 때문에 주석
									//function(tx, rs){}// 작업하면서 나온 function, 다시한번 받을수있거나(tx), 처리할 수 있거나(rs)
									// 작업은 여기서 돌리나 전체출력하나 똑같음
									//  3번째는 처리할함수
									show	
									
								);
							},
							// 조회 실패
							function(error){
								$("#console").html("조회실패" + error.message + "<br>");
							},
							// 조회 성공
							function(){
								$("#console").html("조회 성공<br>");
							}
						);
						
						
					} else {
						// 전체 출력
						db.transaction(
							function(tx){
								tx.executeSql(
									"select * from member", // 전체 출력은 체울게 없지만 순서가 있음
									[], // 2번째는 줘야하기때문에 빈배열로줌
									show//  3번째는 처리할함수, show라는 함수에서 반복문을 주어 실행
								);
							},
							function(error){ // 조회 실패
								$("#console").html("조회실패" + error.message + "<br>");
							},
							function(){ // 조회 성공
								$("#console").html("조회 성공<br>");
							}
						);

					}
					
				}
			);
			
			// 수정
			// 이름하고 나이 입력시 해당데이터만 있는것을 수정되도록
			$("input[value=수정]").on(
				"click",
				function(event) {
					var name = $("input[name=name]").val();
					var age = $("input[name=age]").val();
					var tel = $("input[name=tel]").val();
					var address = $("input[name=address]").val();
					if(name && age) { // 이름과 나이가 둘다 있을경우
						// select를 해서 나온것을 update
						db.transaction(
							function(tx){
								tx.executeSql(
									"select * from member where name=?",
									[name],
									function(tx, rs){ // sql에서 나온 결과를 잡는 function
										if(rs.rows.length == 0) { // 입력한 이름이 없는경우 (rows의 길이가 0인경우), 이름과 나이를 둘다 입력해야함
											$("#console").html("입력한 이름이 없습니다. <br>");
										} else { // 이름이 있는경우
											// sql을 새로 던져줌
											db.transaction(
												function(tx) { // 실제 db가 바뀌는 부분
													tx.executeSql(
														"update member set age=?, tel=?, address=? where name=?",
														[age, tel, address, name]
														// 결과를 처리하기에 function 쓸필요 없음
													);
												},
												function(error) { // 수정 실패
													$("#console").html("수정실패" + error.message + "<br>");
												},
												function() { // 수정 성공
													$("input[name=age]").val("");
													$("input[name=tel]").val("");
													$("input[name=address]").val("");
													$("#console").html("수정성공<br>");
												}
											);
										}
									}
								);
							},
							function(error){ // 수정 실패했을 경우
								// select가 실패인경우 이기에 출력이 딱히 필요 X
							},
							function(){ // 수정 성공
								// select가 성공인경우 이기에 출력이 딱히 필요 X
							},
						);
					} else { // 이름과 나이를입력하지 않았을경우
						$("#console").html("이름과 나이를 입력하세요. <br>");
					}
				}		
			);
			
			
			
			
		}
	);
	
	// show 구현(직접 구현)
	function show(tx, rs){ // rs는 데이터를 가지고 있음
		if(rs.rows && rs.rows.length) {// 행을 뽑아옴, 뽑아온 결과가 있어야함, 또한 행의 길이도 있어야함
			// jquery 사용해서 넣어도됨
			// 더쉽게? 넣는방법이있음
			var t = document.getElementById("t"); // 아이디가 t를 가지고옴
			t.innerHTML = "";
			
			// 가져온행의 갯수만큼 반복문을 돌림
			for(var i=0; i<rs.rows.length; i++){
				var row = t.insertRow(); // tbody에 행을 넣음
				var col1 = row.insertCell(); // 데이터가 4개이기 때문에 4개의 셀을 만들어줌
				var col2 = row.insertCell();
				var col3 = row.insertCell();
				var col4 = row.insertCell();
				col1.innerHTML = rs.rows.item(i).name; // col1에 이름을 넣어라
				col2.innerHTML = rs.rows.item(i).age; // col2에 나이를 넣어라
				col3.innerHTML = rs.rows.item(i).tel; // col3에 전화번호를 넣어라
				col4.innerHTML = rs.rows.item(i).address; // col4에 주소를 넣어라
				
			}
		}	
	}
	
	//-->
</script>
<h2> WebSQL </h2>
<!-- 웹브라우저의 저장공간을 데이터베이스로 사용 -->
<form name="inputform">
	<table border="1">
		<tr>
			<th> 이름 </th>
			<td><input type="text" name="name"></td>
		</tr>
		<tr>
			<th> 나이 </th>
			<td><input type="number" name="age"></td>
		</tr>
		<tr>
			<th> 전화번호 </th>
			<td><input type="tel" name="tel"></td>
		</tr>
		<tr>
			<th> 주소 </th>
			<td><input type="text" name="address"></td>
		</tr>
		<tr>
			<th colspan="2">
			<input type="button" value="가입">
			<input type="button" value="수정">
			<input type="button" value="탈퇴">
			<input type="button" value="보기">
			</th>
		</tr>
	</table>
</form>
<br><br>
<table border="1">
	<tr>
		<th>이름</th>
		<th>나이</th>
		<th>전화번호</th>
		<th>주소</th>
	</tr>
	<tr>
		<tbody id="t"></tbody>
	</tr>
</table>
<br><br>
<div id="console"></div>