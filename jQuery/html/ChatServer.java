package websocket;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.websocket.OnClose;
import javax.websocket.OnError;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.ServerEndpoint;

@ServerEndpoint("/websocket/chat") // jsp파일의 websocket의 링크부분연결
public class ChatServer {
	private static int cnt = 0; // 객체를 계속 공유를 위해 static잡아줘야함
	private String name = null;
	private String prefix = "Guest";
	private Session session = null;
	private static List<ChatServer> clients = new ArrayList<ChatServer>(); // 소켓을 관리하기 어렵기에 클래스 자체로 관리 <- arraylist로 소캣반복문을 넣어두는리스트를만듬
	public ChatServer() {
		String threadName = "Thread Name : " + Thread.currentThread().getName();
		name = prefix + " : " + ++cnt; //선증가
		System.out.println(threadName + " : " + name); // 모니터링용
	}
	
	@OnOpen // 클래스, 접속을 했을경우
	public void start(Session session ) { // session 이라는 객체가 넘어옴, session도 계속 사용
		this.session = session; // 넘겨받은 session을 다시 넘겨줘라
		// 소켓을 반복문을 이용해 다 넘겨주어라
		// 이런 것들을 넣어놓는 리스트가 필요함
		// 클라이언트에 현재 객체를 넣어줌 (this)
		clients.add(this);
		String message = name + "님이 접속했습니다."; // name을 받아와 접속한 사람에게 다뿌림
		
		// 메시지작업은 함수를 따로 만듬
		broadcast(message); // 모두에게 뿌리기위함
		// broadcasting 할것이기에 서버에 다뿌림
		System.out.println("클라이언트 접속 : " + session);
		
	}
	@OnClose // 접속이 끝났을때
	public void end() {
		clients.remove(this);
		String message = name + "님이 퇴장했습니다";
		broadcast(message);
	}
	@OnMessage
	public void incoming(String msg) { // 메시지가 넘어옴
		if(msg == null || msg.equals("")) {
			return;
		} else {
			broadcast(msg); // 메시지가 있을때만 모두에게 뿌림
		}	
	}
	@OnError
	public void error(Throwable t) throws Throwable {
		// 서버에만 출력됨 (콘솔창)
		System.out.println("에러발생 : " + t.toString());
	}
	public void broadcast(String message) {
		for(int i=0; i<clients.size(); i++) {
			ChatServer client = clients.get(i); // 여러개의 클라이언트를 하나씩 꺼내서 클라이언트에 넣음 (하나씩 처리)
			
			try {// 예외처리 해주어야함
				synchronized(client) {// 쓰레드 동기화를위해 싱크로나이즈드를 써줌
					// 동기화는 변수를 쓰레드를 처리할때 여러가지 작업을 동시에 하기위해 사용
					// 쓰레드가 공유하는 변수는 무조건 충돌이남
					// 둘이 같이 변수에 작업을하면 충돌이남
					// 동기화는 임계영역이라는 가상의 영역을 잡음
					// 하나의 쓰레드가 들어가있을 시 다른 쓰레드는 못들어감, 순차적으로 진행을 하자 하는것이 동기화이다
					client.session.getBasicRemote().sendText(message); //basic이라는 객체를 돌려줌 basicRemote안의 sendText로 메시지를 던져줌
				} // 보내고 받는것을 동시에 하다보니 예외처리를 하나 더 해야함	
			} catch (IllegalStateException e) {
				// 메시지 송신 중 동시에 수신하는 경우
				// 쓰레드를 처리할라면 쓰레드라는 클래스를 써야함
				// 충돌이나면 그때 사용
				// 충돌 안나기위해 보내는것을 텀울 두도록 쓰레드처리를 해줄거임
				// 쓰레드가 충돌나는 부분만 찝어서 처리할것, 예외메시지가 넘어옴
				if(e.getMessage().indexOf("[TEXT_FULL_WRITING]") != -1) { // 예외문에 이런 문자열이 들어있는가
					// 충돌처리를 해줄것임
					new Thread() {
						// 쓰레드를 쓸때는 항상 run 이라는 메소드를 쓰게 되있음
						// 동시에 하고싶은일을 run이라는것 안에 넣어줌
						public void run() {// 익명내부클레스
							// 반드시 start라는 메소드를 불러주어야함
							// 쓰레드를사용을 하기위해 start를 불러줘라
							// 쓰레드는 동시에 하라 해야하기 때문이 프로그램을 실행하라하면 실행하지않음
							// 운영체제가 스케쥴을 정해주면 그때 실행
							// 실행대기상태까지 올려주는 메소드가 start
							// 실행대기에서 스케쥴이 할당되고 할당시간이 끝나면 대기상태로 돌아감
							// 이 사이를 계속 왔가갔다함.
							// 쓰레드를 만든다음 반드시 run을 구현후 start 구현을 해주어야함
							// 이것이 쓰레드의 생명주기이다.
								while(true) { // 무한루프
									try {
										client.session.getBasicRemote().sendText(message); // 메시지를 보낸다
										break; //보냈으면 멈춰라
									} catch(IOException e) {
										e.printStackTrace();
									} catch(IllegalStateException e) { // 제대로 데이터를 보내야만 break가 걸리거 while문을빠져나감
										try {
											Thread.sleep(1000); // 메시지 전송에 실패했으면 1초후 다시해라
										} catch(InterruptedException ex) {
											ex.printStackTrace();
										}
									}
								}
							
						} 
					}.start(); // 원래는 한줄짜리라 세미콜론을 찍어주어야함 (내부 클래스라 세미콜론 필요)
				}
				
				
			} catch(Exception e) { // 모든 예외를 다 잡겠다 ( IOException -> Exception 으로) // 강제종료의 대한 catch
				System.out.println("강제종료 : " + e.getMessage()); // 예외 메시지 종료
				//e.printStackTrace();
				//강재로 껏다는 예외 발생할 수 있어 그것도 잡아주어야함
				
				clients.remove(this); // 클라이언트 제거
				String msg = name + "님이 강제종료 했습니다.";
				broadcast(msg);
				try {
					client.session.close(); // 얘도 예외발생
				} catch (IOException ex) {
					ex.printStackTrace(); // 위에도 e가 있어 충돌이나기에 ex로 변경
				}
			}
		}
	}
	
}// class
