<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<h2>JSTL - core - if / choose</h2>

<!-- else if, else가 없다 -->
<c:set var="a" value="${5}"/>
<c:if test="${a gt 5}">
	${"크다"}<br>
</c:if>
<c:if test="${a le 5}">
	${"작다"}<br>
</c:if>

<!-- a가 홀수이면 "홀수" 짝수이면 "짝수"-->

<c:if test="${a mod 2 eq 0}">
	${"짝수"}<br>
</c:if>
<c:if test="${a mod 2 eq 1}">
	${"홀수"}<br>
</c:if>

<c:set var="b" value="${10}"/>
<c:choose>
	<c:when test="${b eq 1}">
		하나<br>
	</c:when>
	<c:when test="${b eq 2}">
		둘<br>
	</c:when>
	<c:when test="${b eq 3}">
		셋<br>
	</c:when>
	<c:otherwise>
		숫자<br>
	</c:otherwise>
</c:choose>
<br>

<form method="post" action="if.jsp">
	<table border="1">
		<tr>
			<th> 점수 </th>
			<td><input type="text" name="score"></td>
			<th><input type="submit" value="확인"></th>
		</tr>
	</table>
</form>

<!--  70점 이상이면 합격 아니면 불합격 -->
<c:if test="${param.score ge 70}">
	합격 <br>
</c:if>
<c:if test="${param.score lt 70 }">
	불합격<br>
</c:if>


<!-- 
90점이상 A, 
80점이상 B, 
70점이상 C, 
60이상 D, 
60점미만 F  
0부터 100사이 아니면 잘못입력
-->
<c:if test="${param.score lt 0 or param.score ge 100}">
    잘못입력<br>
</c:if>
<c:if test="${param.score ge 0 and param.score le 100}">
   <c:choose>
      <c:when test="${param.score ge 90}">
         A학점
      </c:when>
      <c:when test="${param.score ge 80}">
         B학점
      </c:when>
      <c:when test="${param.score ge 70}">
         C학점
      </c:when>
      <c:when test="${param.score ge 60}">
         D학점
      </c:when>
      <c:otherwise>
         F학점
      </c:otherwise>
   </c:choose>
</c:if>  
<br>

<!-- 이렇게하면 다같이 출력되기에 사용불가
<c:if test="${param.score ge 90}">
	A <br>
</c:if>
<c:if test="${param.score ge 80}">
	B <br>
</c:if>
<c:if test="${param.score ge 70}">
	C <br>
</c:if>
<c:if test="${param.score ge 60}">
	D <br>
</c:if>
<c:if test="${param.score lt 60}">
	F <br>
</c:if>
<c:if test="${param.score}">
	잘못입력 <br>
</c:if>
 -->