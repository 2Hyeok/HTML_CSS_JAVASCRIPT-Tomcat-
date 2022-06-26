package mvc;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Properties;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class SimpleController extends HttpServlet{
	
	private Map<String, CommandHandler> handlerMap = new HashMap <String, CommandHandler>();
	
	@Override
	public void init(ServletConfig config) throws ServletException {
		String configFile = config.getInitParameter("configFile"); //web.xml의 configFile을 가져옴
		String path = config.getServletContext().getRealPath("/");
		String filename = path + "/" + configFile;
		FileInputStream fis = null;
		Properties prop = new Properties(); //전체 데이터를 가지고있음
		
		try {
			fis = new FileInputStream(filename);
			prop.load(fis);
			Iterator<Object> keys = prop.keySet().iterator(); //키만뽑아서 가지고있음
			while(keys.hasNext()) {
				String command = (String) keys.next();
				String handlerName = prop.getProperty(command);
				Class<?> handlerClass = Class.forName(handlerName); // 객체를 만들 수 있음, 제네릭을 써야함
				CommandHandler handler = (CommandHandler) handlerClass.newInstance();
				handlerMap.put(command, handler);
			}
			
		}catch(FileNotFoundException e) {
			e.printStackTrace();
		}catch(IOException e) {
			e.printStackTrace();
		}catch(ClassNotFoundException e) {
			e.printStackTrace();
		}catch(IllegalAccessException e) {
			e.printStackTrace();
		}catch(InstantiationException e) {
			e.printStackTrace();
		}
	}
	
	public void doProcess(HttpServletRequest request, HttpServletResponse response)
		throws ServletException, IOException{
		//http://localhost:8080/JSP/simple?command=hello - 요청하는값
		
		// 1.요청 받는다
		// String command = request.getParameter("command");
		String command = request.getRequestURI(); // 주소를 가져옴
		if(command.indexOf(request.getContextPath()) == 0) {
			command = command.substring(request.getContextPath().length());
		}
		
		//2. 요청을 분석한다.
		Object result = null;  //String -> Object로 변경해서 모든 객체를 받음
		String viewPage = null;
		
		
		/*
		// handler 클래스로 뺀다. 다형성 사용 인터페이스로 부모클레스만듬
		// 추가할때마다 파일을 계속 만들어주어야함
		CommandHandler handler = null;
		if(command == null) {
			handler = new NullHandler();
		} else if(command.equals("hello")) {
			handler = new HelloHandler();
		} else if(command.equals("bye")) {
			handler = new ByeHandler();
		} else if(command.equals("date")) {
			handler = new DateHandler();
		} else {
			handler = new DefaultHandler();
		}
		*/
		CommandHandler handler = handlerMap.get(command);
		if(handler == null) {
			handler = new DefaultHandler();
		}
		
		try {
			viewPage = handler.process(request, response);
		}catch(Throwable e) {
			e.printStackTrace();
		}
		

		/*
		if(command == null) {
			result = "처리할 요청이 없습니다";
			request.setAttribute("result", result);
			viewPage = "/mvc/null.jsp";
			
		}else if( command.equals("hello")) {
			// 3.요청을 처리한다
			result = "안녕하세요";
			
			// 4. 결과를 저장한다.
			// controller
			request.setAttribute("result", result);
			viewPage = "/mvc/hello.jsp";
		} else if(command.equals("bye")) {
			result = "안녕히 계세요";
			request.setAttribute("result", result);
			viewPage = "/mvc/bye.jsp";
		} else if(command.equals("date")) {
			result = new Date();
			request.setAttribute("result", result);
			viewPage = "/mvc/date.jsp";
		}else if(command.equals("hi")) {
			result = "안녕";
			request.setAttribute("result", result);
			viewPage = "/mvc/hi.jsp";
		} else {
			result = "처리할 수 없는 요청입니다.";
			request.setAttribute("result", result);
			viewPage = "/mvc/default.jsp";
		}
		*/
		// 5.출력할 뷰로 포워딩
		RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
		dispatcher.forward(request, response);
	}
	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response)
		throws ServletException, IOException {
		doProcess(request, response);
	}
	@Override
	public void doPost(HttpServletRequest request, HttpServletResponse response)
		throws ServletException, IOException {
		doProcess(request, response);
	}
}//class
