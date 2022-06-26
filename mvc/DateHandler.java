package mvc;

import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class DateHandler implements CommandHandler {
	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		Object result = new Date();
		request.setAttribute("result", result);
		return "/mvc/date.jsp";
	}

}
