package action;

import java.io.IOException;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/html/life.do")
public class LifeCycleServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	public LifeCycleServlet() {
    	System.out.println("--1. LifeCycleServlet()--");

	}

	public void init(ServletConfig config) throws ServletException {
		// browser info initialization
		System.out.println("--2. init()--");
	}

	public void destroy() {
		// called when the servlet is altered
		System.out.println("--4. destroy()--");
	}

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// branches out to either doGet() or doPost() depending on the request method
		System.out.println("--3. service()--");
		super.service(request, response);
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		System.out.println("--3.1. doGet()--");
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		System.out.println("--3.2. doPost()--");
		
	}

}
