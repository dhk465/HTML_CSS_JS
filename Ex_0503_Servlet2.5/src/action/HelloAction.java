package action;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class HelloAction extends HttpServlet {
	private static final long serialVersionUID = 1L;

	// no url visible in 2.5 (can be found under /Ex_0503_Servlet2.5/WebContent/WEB-INF/web.xml)
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("--HelloAction : service()--");
	}

}
