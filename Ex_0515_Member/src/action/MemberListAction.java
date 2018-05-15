package action;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.MemberDAO;
import vo.MemberVO;

@WebServlet("/member/member_list.do")
public class MemberListAction extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// 회원목록 얻어오기
		List<MemberVO> list = MemberDAO.getInstance().selectList();
		
		// 리퀘스트 스코프 영역에 list를 바인딩
		request.setAttribute("list", list);
		
		// member_list.jsp에서 el표현식 사용하기 위해
		// 현재 서블릿에서 바인딩한 list정보를 넘겨준다.
		RequestDispatcher disp = request.getRequestDispatcher("member_list.jsp");
		disp.forward(request, response);
	}

}
