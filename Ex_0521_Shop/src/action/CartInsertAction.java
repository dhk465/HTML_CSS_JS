package action;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.CartDAO;
import vo.CartVO;

@WebServlet("/shop/insert.do")
public class CartInsertAction extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.setCharacterEncoding("utf-8");
		
		int p_idx = Integer.parseInt(request.getParameter("p_idx"));
		int m_idx = Integer.parseInt(request.getParameter("m_idx"));
		
		CartVO vo = new CartVO();
		vo.setP_idx(p_idx);
		vo.setM_idx(m_idx);
		
		// 이미 장바구니에 등록된 상품인지를 판단 (아니면 null 반환)
		CartVO res_vo = CartDAO.getInstance().selectOne(vo);
		
		String duplicate = "yes";
		if (res_vo == null) {
			// DB에 등록된 상품이 없는 경우
			duplicate = "no";
			CartDAO.getInstance().insert(vo);
		}
		
		String resultStr = String.format("[{'result':'%s'}]", duplicate);
		response.getWriter().println( resultStr );
		
	}

}
