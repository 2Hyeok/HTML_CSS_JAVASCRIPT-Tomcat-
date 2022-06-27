package handler;

import java.sql.Timestamp;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.LogonDBBean;
import member.LogonDataBean;

public class InputProHandler implements CommandHandler{
	
	@Override
	public String process(HttpServletRequest request, HttpServletResponse respones) throws Throwable {
		

		request.setCharacterEncoding("utf-8");
		
		LogonDataBean dto = new LogonDataBean();
		dto.setId(request.getParameter("id"));
		dto.setPasswd(request.getParameter("passwd"));
		dto.setName(request.getParameter("name"));
		dto.setJumin1(request.getParameter("jumin1"));
		dto.setJumin2(request.getParameter("jumin2"));

/*
	<jsp:useBean id="dto" class="member.LogonDataBean"/>
		<jsp:setProperty name="dto"	property="*"/>
		<!-- id passwd name jumin1 jumin2 -->
*/
		
		String tel = null;
		String tel1 = request.getParameter("tel1");
		String tel2 = request.getParameter("tel2");
		String tel3 = request.getParameter("tel3");
		
		if( ! tel1.equals("") && ! tel2.equals("") && ! tel3.equals("")){
			tel = tel1 + "-" + tel2 + "-" + tel3;
		}
		dto.setTel(tel);
	
		String email = null;
		String email1 = request.getParameter("email1");
		String email2 = request.getParameter("email2");
		if(! email1.equals("") ){
			if(email2.equals("0")){
				//직접입력
				email = email1;
			}else {
				// 선택 입력
				email = email1 + "@" + email2;
			}
			
		}
		dto.setEmail(email);

		dto.setReg_date(new Timestamp(System.currentTimeMillis()));

		LogonDBBean dao = LogonDBBean.getInstance();
		int result = dao.insertMember(dto);
		
		request.setAttribute("result", result);
		
		return "/member/inputPro.jsp";
	}

}
