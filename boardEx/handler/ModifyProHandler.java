package handler;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.BoardDBBean;
import board.BoardDataBean;

public class ModifyProHandler implements CommandHandler{
	
	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		
		request.setCharacterEncoding("utf-8");
		BoardDataBean dto = new BoardDataBean();
		dto.setEmail(request.getParameter("email"));
		dto.setSubject(request.getParameter("subject"));
		dto.setContent(request.getParameter("content"));
		dto.setPasswd(request.getParameter("passwd"));
		dto.setNum(Integer.parseInt(request.getParameter("num")));
		
		String pageNum = request.getParameter("pageNum");

		BoardDBBean dao = BoardDBBean.getInstance();
		int result = dao.modifyArticle(dto);
		
		request.setAttribute("pageNum", pageNum);
		request.setAttribute("result", result);
		
		return "/board/modifyPro.jsp";
	}

}
