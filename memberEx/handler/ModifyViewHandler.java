package handler;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.LogonDBBean;
import member.LogonDataBean;

public class ModifyViewHandler implements CommandHandler{
	
	@Override
	public String process(HttpServletRequest request, HttpServletResponse respones) throws Throwable {
		
		String id = (String) request.getSession().getAttribute("memId");
		String passwd = request.getParameter("passwd");
		LogonDBBean dao = LogonDBBean.getInstance();
		int result = dao.check(id, passwd);
		
		request.setAttribute("result", result);
		
		if(result != 0) {
			LogonDataBean dto = dao.getMember(id);
			request.setAttribute("dto", dto);
		}
		
		return "/member/modifyView.jsp";
	}

}
