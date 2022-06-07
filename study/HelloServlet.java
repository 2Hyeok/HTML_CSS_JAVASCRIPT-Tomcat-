package study;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
public class HelloServlet extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// 요청을 받는다.
		
		// 요청을 처리한다.
		
		// 응답할 스트림(통로) 생성 HttpServletRequest(요청에 대한 처리),HttpServletResponse(서버에서 클라이언트로 넘어가는 처리) 사용가능
		resp.setContentType("text/html; charset=utf-8");// 서버의 대한 한글처리
		PrintWriter out = resp.getWriter(); // 서버에서 클라이언트 통로 생성
		
		out.println("<html>");
		out.println(	"<head>");
		out.println(		"<meta charset='utf-8'>");
		out.println(	"</head>");
		out.println(	"<body>");
		out.println(		"Hello Servlet!!!<br>");
		out.println(		"안녕하세요<br>");
		out.println(	"</body>");
		out.println("</html>");
		
	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// doPost로 들어올시 doGet 같이 실행하라
		doGet(req, resp);
	}
}
