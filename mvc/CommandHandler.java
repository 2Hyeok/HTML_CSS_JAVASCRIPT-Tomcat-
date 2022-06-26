package mvc;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public interface CommandHandler {
	public String process(HttpServletRequest request, HttpServletResponse response)
		throws Throwable; //상속받아서 재정의
	
}
