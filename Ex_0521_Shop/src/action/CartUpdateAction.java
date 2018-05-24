package action;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.CartDAO;
import vo.CartVO;

@WebServlet("/shop/cart_update.do")
public class CartUpdateAction extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
		
		int c_idx = Integer.parseInt(request.getParameter("c_idx"));
		int c_cnt = Integer.parseInt(request.getParameter("c_cnt"));
		int m_idx = 1; // TODO make a member db
		
		// 수량 업데이트
		CartDAO.getInstance().update_cnt(c_idx, c_cnt);
		
		List<CartVO> list = CartDAO.getInstance().select(m_idx);
		
		// 총합 업데이트
		int total_amount = CartDAO.getInstance().selectTotalAmount(m_idx);
		
		request.setAttribute("list", list); // cartList에서 "list"로 사용중
		request.setAttribute("total_amount", total_amount);
		
		RequestDispatcher disp = request.getRequestDispatcher("cartList.jsp");
		disp.forward(request, response);
		
	}

}
