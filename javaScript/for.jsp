<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<h2>반복문</h2>

<script>
	//<!--
	var m = ["사과", "배", "딸기", "바나나"];
	for(var i=0; i<m.length; i++){ //초기값; 조건; 증감값
		document.write(m[i] + " ");
	}
	document.write("<br>");
	
	
	for(var a in m) {
		document.write(m[a] + " ");
	}
	document.write("<br>");
	
	
	//while
	var i = 0;			 //초기값
	while(i<m.length) {  // 조건
		document.write(m[i] + " ");
		i++;  			// 증감값
	}
	document.write("<br>");
	
	var i=0;			//초기값
	do {
		document.write(m[i] + " ");
		i++;  			// 증감값
	}while(i>m.length);  // 조건
	document.write("<br>")
	
	
	// 다중 반복문(다중for문)
	for(var i=2; i<10; i++) { //단
		document.write(i+"단" + "<br>");
		for(var j=1; j<10; j++){
			document.write(i+" * "+j+" = "+i*j+"<br>");
		}
	document.write("<br>");
	}
	
	// 가로 출력
	for(var i=2; i<10; i++){
		document.write(i + "단&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;");
	}
	document.write("<br>");
	
	for(var i=1; i<10; i++) { //단
		for(var j=2; j<10; j++){
			document.write(j+" * "+i+" = "+i*j+"&nbsp;");
		}
	document.write("<br>");
	}
	document.write("<br><br>")
	
	// 표만들기
document.write( "<table border='1'>" );
      document.write( "<tr>" );
   for( var i=2; i<10; i++ ) {
         document.write( "<th>" );
         document.write( i + "단" );
         document.write( "</th>" );      
      }   
      document.write( "</tr>" );
   for( var i=1; i<10; i++ ) {            // 행
      document.write( "<tr>" );
      for( var j=2; j<10; j++ ) {
         document.write( "<td>" );
         document.write( j + " * " + i + " = " + i*j );
         document.write( "</td>" );
      }
      
      document.write( "</tr>" );
   }
   document.write( "</table>" )
	
	//-->

</script>