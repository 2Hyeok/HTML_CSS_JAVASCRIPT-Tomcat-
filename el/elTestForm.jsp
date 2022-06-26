<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<h2> EL - 입력페이지 </h2>

<form method="post" action="elTestPro.jsp">
   <table border="1">
      <tr>
         <th> 이름  </th>
         <td> <input type="text" name="name"> </td>
      </tr>
      <tr>
         <th> 나이 </th>
         <td> <input type="text" name="age"> </td>
      </tr>
      <tr>
         <th> 성별 </th>
            <td> <input type="radio" name="gender" value="1"> 남자
                <input type="radio" name="gender" value="2"> 여자
         </td>
      </tr>
      <tr>
         <th> 취미 </th>
         <td>
            <input type="checkbox" name="hobby" value="1"> 독서
            <input type="checkbox" name="hobby" value="2"> 등산
            <input type="checkbox" name="hobby" value="3"> 운동
            <input type="checkbox" name="hobby" value="4"> 게임
         </td>
      </tr>
      <tr>
         <th colspan="2">
            <input type="submit" value="전송">
            <input type="reset" value="취소">
         </th>
      </tr>
   </table>
</form>    