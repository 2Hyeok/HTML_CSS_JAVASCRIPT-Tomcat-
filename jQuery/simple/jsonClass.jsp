<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<h2> JSON 표기법 </h2>

<script type="text/javascript">
   // <!--
   function Member ( name, age, tel ) {
      this.name = name;
      this.age  = age;
      this.tel  = tel;
      this.getName = getName;
      this.getAge  = getAge;
      this.getTel  = getTel;
      
   }
   function getName() {
      return this.name;
   }
   function getAge() {
      return this.age;
   }
   function getTel() {
      return this.tel;
   }
   
   //---------------------------------------
   function User( name, age, tel ) {
	   this.name = name;
	   this.age  = age;
	   this.tel  = tel;
   }
   User.prototype.getName = function() {
	   return this.name
   }
   User.prototype.getAge = function() {
	   return this.age
   }
   User.prototype.getTel = function() {
	   return this.tel
   }
   
   //---------------------------------------------------
   function Customer( name, age, tel ){
	   this.name = name;
	   this.age  = age;
	   this.tel  = tel;
   }
   Customer.prototype = {
		   "getName" : function() {return this.name},
		   "getAge" : function() {return this.age},
		   "getTel" : function() {return this.tel}
   };
   
   //--------------------------------------------------------
   window.onload = function() {
      var result = document.getElementById ("result");
      var msg = "";
   //--------------------------------------------------------
      var kim = new Member("김유신" , 30  , "1111-2222");
      
      msg += "이름" + kim.getName() +"<br>"
         +  "나이" + kim.getAge()  + "<br>"
         +  "전화번호" + kim.getTel()  + "<br><br>";
         
   //-----------------------------------------------------------      
     var lee = new User("이순신" , 20  , "2222-1111");
     
     msg += "이름" + lee.getName() + "<br>"
    	+  "나이" + lee.getAge()  + "<br>"
     	+  "전화번호" + lee.getTel()  + "<br><br>";
     	
   //-----------------------------------------------------------  	
     var hong = new Customer("홍길동", 40, "1111-3333");
     
     msg += "이름" + hong.getName() +"<br>"
    	 +  "나이" + hong.getAge()  + "<br>"
     	+  "전화번호" + hong.getTel()  + "<br><br>";
     	
      result.innerHTML = msg;
      
   }
   
   
   //-->
</script>
<div id="result"></div>