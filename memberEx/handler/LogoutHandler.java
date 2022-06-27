package handler;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class LogoutHandler implements CommandHandler{
	
	@Override
	public String process(HttpServletRequest request, HttpServletResponse respones) throws Throwable {
		request.getSession().removeAttribute("memId");
		return "/member/main.jsp";
	}

}
