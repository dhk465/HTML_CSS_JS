package action;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/hello.do") // url visible in 3.1 & web.xml is hidden
public class HelloAction extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(
							HttpServletRequest request,		// getting info from a user via request
							HttpServletResponse response	// and sending processed info to another via response
							) throws ServletException, IOException {
		
		/*
		 서블릿(Servlet)
		 - 서버에서 실행되는 서비스(사용자의 요구사항을 제공해주는)객체
		 - 웹 응용프로그램을 만드는 자바 기술이며, 실행 결과값을 HTML로 돌려준다.
		 - HTML의 정적인 문제를 해결할 수 있는 동적인 특징을 갖는다.
		 - 자바언어로 작성되어 자바의 일반적인 특징을 모두 갖는다.
		 - 객체지향적이다.
		 - 스레드로 처리한다.(동시다발적인 사용자의 요청에 대한 응답이 용이)
		 */
		
		// requesting the ip address of the connected user
		String ip = request.getRemoteAddr();
		System.out.println(ip + " has been connected.");
		
		// responding to the connected
		response.setContentType("text/html; charset=utf-8;");
		
		PrintWriter out = response.getWriter();
		
		// HTML
		out.println("<html>");
		out.println("<head>");
		out.println("<title>Title made</title>");
		out.println("<style>");
		
		out.println("h1 {color: #f00;}");
		out.println("</style>");
		out.println("</head>");
		out.println("<body>");
		out.printf("<h1>Welcome, [%s]!</h1>\n", ip);
		out.println("</body>");
		out.println("</html>");
		
		System.out.println("--HelloAction : service()--");
	}

}
