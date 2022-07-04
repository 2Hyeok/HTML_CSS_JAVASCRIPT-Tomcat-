<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<h2> Simple HTML5 </h2>

<ruby>
	大韓民國
	<rt>대한민국</rt> <!-- 위에 위치하는 작은 문자 태그 -->
	<rp>대한민국</rp> <!-- 루비테그를 지원하지 않을때 -->
</ruby>
<br><br>

<!-- 오디오 태그 -->
<!--
<audio src="/jQueryEx/data/Kalimba.mp3" controls="controls" autoplay="autoplay"></audio>
-->

<audio controls="controls" autoplay="autoplay">
	<source src="/jQueryEx/data/Kalimba.mp3">
	<source src="/jQueryEx/data/Kalimba.ogg">
</audio>
<br><br>

<!-- 비디오 태그 -->
<video controls="controls" autoplay="autoplay" width="300px">
	<source src="/jQueryEx/data/Wildlife.mp3">
	<source src="/jQueryEx/data/Wildlife.webm">
</video>
