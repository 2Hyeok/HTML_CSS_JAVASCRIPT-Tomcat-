package handler;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.LogonDBBean;
import member.LogonDataBean;

public class ModifyProHandler implements CommandHandler{
	
	@Override
	public String process(HttpServletRequest request, HttpServletResponse respones) throws Throwable {
		
		LogonDataBean dto = new LogonDataBean();
		dto.setPasswd(request.getParameter("passwd"));
		
		/* 자바 형식으로 바꿔주어야함
		<jsp:useBean id="dto" class="member.LogonDataBean"/>
		<jsp:setProperty name="dto" property="*"/>
		<!-- passwd -->
		 */
				
		dto.setId ((String) request.getSession().getAttribute("memId"));

		String tel = null;
		String tel1 = request.getParameter("tel1");
		String tel2 = request.getParameter("tel2");
		String tel3 = request.getParameter("tel3");
		
		if( ! tel1.equals("")&& ! tel2.equals("") && ! tel3.equals("")){
			tel = tel1 + "-" + tel2 + "-" + tel3;
		}
		dto.setTel(tel);

		String email = null;
		String email1 = request.getParameter("email1");
		String email2 = request.getParameter("email2");
		
		if(! email1.equals("") && ! email2.equals("")){
			email = email1 + "@" + email2;
		}
		dto.setEmail(email);

		LogonDBBean dao = LogonDBBean.getInstance();
		int result = dao.modifyMember(dto);
		
		request.setAttribute("result", result);
		
		return "/member/modifyPro.jsp";
	}

}
