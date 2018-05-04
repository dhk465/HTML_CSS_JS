package action;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/html/jumin.do")
public class JuminServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// request
		
		request.setCharacterEncoding("UTF-8");
		
		String year = request.getParameter("year");
		String age = request.getParameter("age");
		String season = request.getParameter("season");
		
		// response
		
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		
		out.println("<html>");
		out.println("<head>");
		out.println("<title>주민등록번호 정보</title>");
		out.println("</head>");
		out.println("<body>");
		
		out.printf("<table border='1'>");
		
		out.printf("<tr>");
		out.printf("<th>생년</th>");
		out.printf("<td>%s</td>", year);
		out.printf("</tr>");
		
		out.printf("<tr>");
		out.printf("<th>나이</th>");
		out.printf("<td>%s세</td>", age);
		out.printf("</tr>");
		
		out.printf("<tr>");
		out.printf("<th>계절</th>");
		out.printf("<td>%s</td>", season);
		out.printf("</tr>");
		
		out.printf("</table>");
		
		out.println("</body>");
		out.println("</html>");
	}

}
