<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<style type="text/css">
	body{
		text-align : center;
	}
	div {
		border : 1px solid black;
		margin : 10px;
	}
	.header, header {
		height : 50px;
		width : 440px;
	}
	.aside, aside {
		height : 200px;
		width : 100px;
		float : left;
	}
	.section, section {
		width : 320px;
		float : left;
		height : 200px;
	}
	.footer, footer {
		height : 50px;
		width : 440px;
		clear : left;
	}
	
	header, aside, section, footer {
		border : 1px solid black;
		margin : 10px;
	}
</style>

<h2> Semantic Tag </h2>

<header></header>
<aside></aside>
<section></section>
<footer></footer>


<br><br>
<!-- 구분을 위해 따로따로 이름을 주고 구분을함 -->
<div class="header"></div>
<div class="aside"></div>
<div class="section"></div>
<div class="footer"></div>