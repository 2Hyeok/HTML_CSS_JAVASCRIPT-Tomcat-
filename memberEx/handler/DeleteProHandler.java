package handler;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.LogonDBBean;

public class DeleteProHandler implements CommandHandler{
	
	@Override
	public String process(HttpServletRequest request, HttpServletResponse respones) throws Throwable {

		String id = (String) request.getSession().getAttribute("memId");
		String passwd = request.getParameter("passwd");
		
		LogonDBBean dao = LogonDBBean.getInstance();
		int resultCheck = dao.check(id, passwd);
		
		request.setAttribute("resultCheck", resultCheck);
		
		if(resultCheck != 0) {
			int result = dao.deleteMember(id);
			request.setAttribute("result", result);
		}
		
		return "/member/deletePro.jsp";
	}

}
