$(document).ready(
	function() {
		// 전송
		// 아이디 넘기지 말것
		$("input[value=전송]").on(
			"click",
			function(event){
				if( ! $("input[name=id]").val() ) { // 입력 받은값 가져올때는 val 문자열은 text, ! 를 붙여서 부정문으로 만듬
					alert("아이디를 입력하세요");
					$("input[name=id]").focus();
					return false;
				}
			}
		);
		// 아이디 자리의 이벤트가 키업일경우
		// 아이디 중복확인
		$("input[name=id]").on(
			"keyup",
			function(event){
				$.ajax(
					{	// json 영역
						type : "POST",
						url : "idcheck.jsp",
						data : 	{//시리얼라이즈
							id : $("input[name=id]").val() // 아이디 값만
						},
						dataType : "text",
						success : function(data) {
							// 성공
							$("#idcheck").html(data); // 데이터출력
						},
						error : function(error) {
							// 실패
							$("#idcheck").html(error); // error 출력
						}
						
					}
				);
				
			}
		);
		// 비밀번호가 서로 같은지 체크
		// DB를 불러올 필요가 없기때문에 서로 같은지만 확인
		// 비밀번호 체크
		$("input[name=repasswd]").on(
			"keyup",
			function(event){
				var passwd = $("input[name=passwd").val(); // passwd의 값
				var repasswd = $("input[name=repasswd").val(); // repasswd의 값
				if(passwd == repasswd){
					$("#passwdcheck").html("비밀번호가 같습니다");
				}else {
					$("#passwdcheck").html("비밀번호가 다릅니다");
				}
			}
		);
		// 전화번호 중복 확인
		// 같은 전화번호가 들어갈 수 없기때문에 확인해야함
		$("input[name=tel]").on(
				"keyup",
				function(event){
					$.ajax(
						{	// json 영역
							type : "POST",
							url : "telcheck.jsp",
							data : 	{//시리얼라이즈
								tel : $("input[name=tel]").val() // 아이디 값만
							},
							dataType : "text",
							success : function(data) {
								// 성공
								$("#telcheck").html(data); // 데이터출력
							},
							error : function(error) {
								// 실패
								$("#telcheck").html(error); // error 출력
							}
							
						}
					);
					
				}
			);
		
	}
);