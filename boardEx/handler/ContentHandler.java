package handler;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.BoardDBBean;
import board.BoardDataBean;

public class ContentHandler implements CommandHandler{
	
	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Throwable {

		int num = Integer.parseInt(request.getParameter("num"));
		String pageNum = request.getParameter("pageNum");
		int number = Integer.parseInt(request.getParameter("number"));

		BoardDBBean dao = BoardDBBean.getInstance();
		BoardDataBean dto = dao.getArticle(num); //데이터를 가져다 바로 출력
		if( ! dto.getIp().equals(request.getRemoteAddr()) ){
			dao.addCount(num);
		}
		request.setAttribute("number", number);
		request.setAttribute("pageNum", pageNum);
		request.setAttribute("dto", dto);
		
		return "/board/content.jsp";
	}

}
