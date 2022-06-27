package handler;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.LogonDBBean;

public class ComfirmHandler implements CommandHandler{
	
	@Override
	public String process(HttpServletRequest request, HttpServletResponse respones) throws Throwable {

		String id = request.getParameter("id");
	
		LogonDBBean dao = LogonDBBean.getInstance();
		int result = dao.check(id);
		
		request.setAttribute("result", result);
		request.setAttribute("id", id);
		
		return "/member/confirm.jsp";
	}

}
