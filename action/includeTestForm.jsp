<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<h2> 액션태그 - include - 입력페이지 </h2>

<form method="post" action="includeTest1.jsp">
   <table border="1">
      <tr>
         <th> 이름 </th>
         <td> <input type="text" name="name"> </td>
      </tr>
      <tr>
         <th> 나이 </th>
         <td> <input type="text" name="age"> </td>
      </tr>
      <tr>
         <th colspan="2">
            <input type="submit" value="전송">
            <input type="reset" value="취소">
         </th>
      </tr>
   </table>
</form>    