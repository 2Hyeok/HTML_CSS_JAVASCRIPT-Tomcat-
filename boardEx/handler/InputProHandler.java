package handler;

import java.sql.Timestamp;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.BoardDBBean;
import board.BoardDataBean;

public class InputProHandler implements CommandHandler{
	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Throwable {
	
		request.setCharacterEncoding("utf-8");
		
		BoardDataBean dto = new BoardDataBean();
		
		dto.setWriter(request.getParameter("writer"));
		dto.setEmail(request.getParameter("email"));
		dto.setSubject(request.getParameter("subject"));
		dto.setContent(request.getParameter("content"));
		dto.setPasswd(request.getParameter("passwd"));
		dto.setNum(Integer.parseInt(request.getParameter("num")));
		dto.setRef(Integer.parseInt(request.getParameter("ref")));
		dto.setRe_step(Integer.parseInt(request.getParameter("re_step")));
		dto.setRe_level(Integer.parseInt(request.getParameter("re_level")));
		
		dto.setReg_date(new Timestamp(System.currentTimeMillis()));
		dto.setIp(request.getRemoteAddr());
	
		BoardDBBean dao = BoardDBBean.getInstance();
		int result = dao.insertArticle(dto);
		
		request.setAttribute("result", result);
		
		return "/board/inputPro.jsp";
	}

}
