package study;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class PersonServlet extends HttpServlet {
	public void doGet(HttpServletRequest request, HttpServletResponse response)
		throws ServletException, IOException{
		
		String name = new String(request.getParameter( "name").getBytes("8859_1"),"utf-8");
		int age = Integer.parseInt(request.getParameter( "age"));
		String gender = request.getParameter("gender");
		String hobby[] = request.getParameterValues("hobby");
		
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		
		out.println("<h2> 폼 데이터 처리</h2>");
		out.println("당신의 이름은 " + name + " 이고<br>");
		out.println("나이는 " + age + " 살 이고<br>");
		
		if( gender.equals("1")) {
			out.println("남자 입니다.<br>");
		}
		else {
			out.println("여자 입니다.<br>");
		}	
		
		out.println("취미는 ");
		for(int i=0; i<hobby.length; i++) {
			switch(hobby[i]) {
			case "1" : out.println("독서"); break;
			case "2" : out.println("등산"); break;
			case "3" : out.println("운동"); break;
			case "4" : out.println("게임"); break;
			}
		}
		out.println("입니다.<br>");
	}
	public void doPost(HttpServletRequest request, HttpServletResponse response)
		throws ServletException, IOException{
		doGet(request, response);
	}
}
