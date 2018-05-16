package action;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.MemberDAO;
import vo.MemberVO;

@WebServlet("/member/check_id.do")
public class MemberCheckIdAction extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		String id = request.getParameter("id");
		
		MemberVO vo = MemberDAO.getInstance().selectOne(id);
		
		String res = "no";
		
		// null means there was no same id in the db
		if (vo == null) {
			res = "yes";
		}
		
		response.setContentType("text/plain; charset=utf-8");
		String resultStr = String.format("[{'result':'%s'}, {'id':'%s'}]", res, id);
		
		// JSON 타입으로 저장한 값을 콜백 메서드로 보낸다.
		response.getWriter().println(resultStr);
	}

}
