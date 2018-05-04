package action;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/html/greet.do")
public class GreetServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// get the parameter from the client
		// request: greet.do?country=kor
		String country = request.getParameter("country"); // almost always String
		String msg = "";
		
		// issues:
		// 1) greet.do?nation=	--> ""(empty string)
		// 2) greet.do			--> null
		
		if (country == null || country.isEmpty()) {
			country = "kor";
		}
		
		if (country.equals("kor")) {
			msg = "안녕하세요.";
		} else if (country.equals("usa")) {
			msg = "Hello.";
		} else if (country.equals("gbr")) {
			msg = "What a wonderful day it is. How have you been?";
		} else if (country.equals("deu")) {
			msg = "Hallo.";
		} else if (country.equals("jpn")) {
			msg = "こんにちは。";
		} else if (country.equals("chn")) {
			msg = "你好.";
			
		}
 
		// response
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		
		out.println( "<html>" );
		out.println("<head>");
		out.println("<title>Greetings in different countries</title>");
		out.println("</head>");
		out.println("<body>");
		out.printf("<h1> [%s] </h1>", msg);
		out.println("</body>");
		out.println( "</html>" );
		
	}

}
