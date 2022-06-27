package handler;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.BoardDBBean;

public class DeleteProHandler implements CommandHandler{
	
	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Throwable {

		int num = Integer.parseInt(request.getParameter("num"));
		String pageNum = request.getParameter("pageNum");
		String passwd = request.getParameter("passwd");

		BoardDBBean dao = BoardDBBean.getInstance();
		int resultCheck = dao.check(num, passwd);
		
		request.setAttribute("resultCheck", resultCheck);
		request.setAttribute("pageNum", pageNum);
		
		if(resultCheck != 0) {
			int result = dao.deleteArticle(num);
			request.setAttribute("result", result);
		}
		
		return "/board/deletePro.jsp";
	}

}
