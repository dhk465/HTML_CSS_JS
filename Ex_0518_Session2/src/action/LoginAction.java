package action;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.MemberDAO;
import vo.MemberVO;

/**
 * Servlet implementation class LoginAction
 */
@WebServlet("/login.do")
public class LoginAction extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
		
		String id = request.getParameter("id");
		String pwd = request.getParameter("pwd");
		
		MemberVO vo = MemberDAO.getInstance().selectOne(id);
		
		String param = "";
		String resultStr = "";
		
		if( vo == null ) {//id가 일치하지 않는경우
			param = "no_id";
			resultStr = String.format("[{'param':'%s'}]", param);
			response.getWriter().println( resultStr );
			return;
		}
		
		//비밀번호가 일치하지 않는경우
		if( !vo.getPwd().equals(pwd) ) {
			param = "no_pwd";
			resultStr = String.format("[{'param':'%s'}]", param);
			response.getWriter().println( resultStr );
			return;
		}
		
		//아이디와 비밀번호 체크에 문제가 없다면 세션에 vo를 저장
		HttpSession session = request.getSession();
		session.setAttribute("user", vo);
		
		param = "clear";
		resultStr = String.format("[{'param':'%s'}]", param);
		response.getWriter().println( resultStr );
		
	}

}
































