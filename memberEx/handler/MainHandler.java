package handler;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class MainHandler implements CommandHandler {

   @Override
   public String process(HttpServletRequest request, HttpServletResponse response) throws Throwable {
      
      
      return "/member/main.jsp";
   }

}