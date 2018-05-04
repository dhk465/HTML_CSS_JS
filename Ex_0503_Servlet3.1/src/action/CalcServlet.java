package action;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/html/calc.do")
public class CalcServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// request parameter
		int num01 = Integer.parseInt(request.getParameter("num01"));
		int num02 = Integer.parseInt(request.getParameter("num02"));
		
		// response
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		
		out.println("<html>");
		out.println("<head>");
		out.println("<title>Calculated results</title>");
		out.println("</head>");
		out.println("<body>");
		out.printf("<p> Number 1: %d | Number 2: %d </p>", num01, num02);
		out.printf("<p> Addition: %d </p>", num01 + num02);
		out.printf("<p> Subtraction: %d </p>", num01 - num02);
		out.printf("<p> Multiplication: %d </p>", num01 * num02);
		out.printf("<p> Division: %f </p>", (float)num01 / num02);
		out.println("<a href='calc.html'>return to the calculator</a>");
		out.println("</body>");
		out.println("</html>");
		
	}

}
