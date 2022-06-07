<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script>
	//<!--
	document.write("<h2> 클래스</h2>");
	/*
	class Member {
		public Member(String name, int age) {
			this.name = name;
			this.age = age;
		}
		public void setName(String name) {
			this.name = name;
		}
		public void setName(int age) {
			this.age = age;
		}
		public String getName() {
			return name;
		}
		public int getAge() {
			 return age;
		}
	}
	class MemberEx {
		public static void main(String[] args){
			Member member = new Member("홍길동",30); //default생성자
			member.setName("이순신");
			member.setAge(40);
			System.out.println("이름 : " + member.getName() );
			System.out.println("나이 : " + member.getAge() );
		}
	}
	*/
//자바스크립트로 구현 - 오버로드 X
	function Member(name, age){
		this.name = name;
		this.age = age;
		this.setName = setName;
		this.setAge = setAge;
		this.getName = getName;
		this.getAge = getAge;
	}
	function setName(name) {
		this.name = name;
	}
	function setAge(age) {
		this.age = age;
	}
	function getName() {
		return this.name;
	}
	function getAge() {
		return this.age;
	}
	var kim = new Member("홍길동",30);
	kim.setName("이순신");
	kim.setAge(30);
	document.write("이름 : " + kim.getName() + "<br>");
	document.write("나이 : " + kim.getAge() + "<br>");
	
	function User(name, age) {
		this.name = name;
		this.age = age;
		this.setName = function(name){
			this.name = name;
		}
		this.setAge = function(age){
			this.age = age;
		}
		this.getName = function(){
			return this.name;
		}
		this.getAge = function(){
			return this.age;
		}
	}
	var lee = new User("이순신", 20);
	document.write("이름 : " + lee.getName()+"<br>");
	document.write("나이 : " + lee.getAge()+"<br>");
	
	
	function Customer(name, age){
		this.name = name;
		this.age = age;
	}
	Customer.prototype.setName = function(name){
		this.name = name;
	}
	Customer.prototype.setAge = function(age){
		this.age = age;
	}
	Customer.prototype.getName = function(){
		return this.name;
	}
	Customer.prototype.getAge = function(){
		return this.age;
	}
	var hong = new Customer("홍길동", 40);
	document.write("이름 : " + hong.getName()+"<br>");
	document.write("나이 : " + hong.getAge()+"<br>");
	
	var kang = new Object();
	kang.name = "강감찬";
	kang.age = 20;
	kang.setName = function(name){
		this.name = name;
	}
	kang.setAge = function(age){
		this.age = age;
	}
	kang.getName = function(){
		return this.name;
	}
	kang.getAge = function(){
		return this.age;
	}
	document.write("이름 : " + kang.getName()+"<br>");
	document.write("나이 : " + kang.getAge()+"<br>");
	
	//-->

</script>