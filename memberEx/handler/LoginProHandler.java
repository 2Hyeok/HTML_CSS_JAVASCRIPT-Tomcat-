package handler;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.LogonDBBean;

public class LoginProHandler implements CommandHandler{
	
	@Override
	public String process(HttpServletRequest request, HttpServletResponse respones) throws Throwable {

		String id = request.getParameter( "id" );
		String passwd = request.getParameter( "passwd" );

		LogonDBBean dao = LogonDBBean.getInstance();
		int result = dao.check( id, passwd );
		
		request.setAttribute("result", result);
		request.setAttribute("id", id);
		   
		return "/member/loginPro.jsp";
	}

}
