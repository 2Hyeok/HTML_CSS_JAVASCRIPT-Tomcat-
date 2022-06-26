<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<h2>Expression Language</h2>
    
<%
    int a=10, b=20;
%>
a + b : a + b<br>
a + b : <%out.println(a+b);%><br>
a + b : <%=a+b%><br>
a + b : ${a+b}<br>
<br>    
"5 + 2" : <%="5+2"%> : <script>document.write("5+2")</script> : ${"5+2"}<br>
"5" + 2 : <%="5"+2%> : <script>document.write("5"+2)</script> : ${"5"+2}<br>
"5" + "2" : <%="5"+"2"%> : <script>document.write("5"+"2")</script> : ${"5"+"2"}<br>
5 + 2 : <%=5+2%> : <script>document.write(5+2)</script> : ${5+2}<br>
<br>

<%-- 자바의 문자열은 뺄셈불가 오류발생 --%>
"5 + 2" : <%="5-2"%> : <script>document.write("5-2")</script> : ${"5-2"}<br> 
"5" + 2 : <%--<%="5"-2%>--%> : <script>document.write("5"-2)</script> : ${"5"-2}<br>
5" + "2" :<%--<%="5"-"2"%>--%> : <script>document.write("5"-"2")</script> : ${"5"-"2"}<br>
5 + 2 : <%=5-2%> : <script>document.write(5-2)</script> : ${5-2}<br>
<br>


5 / 2 : <%=5/2%> : <script>document.write(5/2)</script> : ${5/2}<br>
<br>

${5 > 2} : ${5 gt 2} <br> <%-- 크다 --%>
${5 < 2} : ${5 lt 2}<br> <%-- 작다 --%>
${5 >= 2} : ${5 ge 2}<br> <%-- 크거나 같다 --%>
${5 <= 2} : ${5 le 2}<br> <%-- 작거나 같다 --%>
${5 == 2} : ${5 eq 2}<br> <%-- 같다 --%>
${5 != 2} : ${5 ne 2}<br> <%-- 다르다 --%>
<br>

${5 / 2} : ${5 div 2} <br> <%-- 나누기 --%>
${5 % 2} : ${5 mod 2} <br> <%-- 나머지 --%>
<br>

${true && true} : ${true and true} <br> <%-- 비교연산 --%>
${true || true} : ${true or true} <br> <%-- 비교연산 --%>
<br>

<%-- 삼항 연산 --%>
${5 mod 2 eq 0 ? "짝수" : "홀수"} <br>
${5 mod 2 eq 0 ? '짝수' : '홀수'} <br>
