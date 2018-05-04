package action;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/html/member_reg.do")
public class MemberRegServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// utf-8 characters including korean letters will break unless encoding is set up
		request.setCharacterEncoding("UTF-8"); // matches with the charset element of html meta tag
		
		String name = request.getParameter("name");
		String id = request.getParameter("id");
		String pwd = request.getParameter("pwd");
		String gender = request.getParameter("gender");
		String blood = request.getParameter("blood");
		String desc = request.getParameter("desc");
		
		String[] friends = request.getParameterValues("friends");
		
		String friend_result = "";
		StringBuffer sb = new StringBuffer();
		for (String f : friends) {
			sb.append(f);
			sb.append(" ");
		}
		friend_result = sb.toString().trim();
		
		// if there is no referrer
		if (friend_result.length() == 0) {
			friend_result = "no referrer";
		}
		
		String[] hobby = request.getParameterValues("hobby");
		String hobby_result = "no hobby";
		if (hobby != null) {
			StringBuffer sb2 = new StringBuffer();
			for (String h : hobby) {
				sb2.append(h);
				sb2.append(" ");
			}
			hobby_result = sb2.toString().trim();
		}
		
		// response
		
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		
		out.println("<html>");
		out.println("<head>");
		out.println("<title>Registration Result</title>");
		out.println("</head>");
		out.println("<body>");
		
		out.printf("<table border='1'>");
		
		out.printf("<tr>");
		out.printf("<th>Name</th>");
		out.printf("<td>%s</td>", name);
		out.printf("</tr>");
		
		out.printf("<tr>");
		out.printf("<th>Login ID</th>");
		out.printf("<td>%s</td>", id);
		out.printf("</tr>");
		
		out.printf("<tr>");
		out.printf("<th>Password</th>");
		out.printf("<td>%s</td>", pwd);
		out.printf("</tr>");
		
		out.printf("<tr>");
		out.printf("<th>Gender</th>");
		out.printf("<td>%s</td>", gender);
		out.printf("</tr>");
		
		out.printf("<tr>");
		out.printf("<th>Interests</th>");
		out.printf("<td>%s</td>", hobby_result);
		out.printf("</tr>");
		
		out.printf("<tr>");
		out.printf("<th>Referrers</th>");
		out.printf("<td>%s</td>", friend_result);
		out.printf("</tr>");
		
		out.printf("<tr>");
		out.printf("<th>Blood-type</th>");
		out.printf("<td>Type %s</td>", blood);
		out.printf("</tr>");
		
		out.printf("<tr>");
		out.printf("<th>Description</th>");
		out.printf("<td>%s</td>", desc);
		out.printf("</tr>");
		
		out.printf("</table>");
		
		out.println("</body>");
		out.println("</html>");
		
	}

}
