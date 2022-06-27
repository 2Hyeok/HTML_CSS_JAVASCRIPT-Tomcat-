package handler;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class DeleteFormHandler implements CommandHandler{
	
	@Override
	public String process(HttpServletRequest request, HttpServletResponse respones) throws Throwable {
		
		return "/member/deleteForm.jsp";
	}

}
