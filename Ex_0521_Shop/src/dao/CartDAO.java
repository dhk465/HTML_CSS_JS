package dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import service.MyBatisConnector;
import vo.CartVO;

public class CartDAO {
	
	// single-ton pattern: 
	// 객체1개만생성해서 지속적으로 서비스하자
	static CartDAO single = null;

	public static CartDAO getInstance() {
		//생성되지 않았으면 생성
		if (single == null)
			single = new CartDAO();
		//생성된 객체정보를 반환
		return single;
	}

	SqlSessionFactory factory;
	
	public CartDAO() {
		factory = MyBatisConnector.getInstance().getSqlSessionFactory();
	}
	
	
	// 회원별 장바구니 목록
	public List<CartVO> select(int m_idx) {
		
		List<CartVO> list = null;
		
		SqlSession sqlSession = factory.openSession();
		
		list = sqlSession.selectList("cart_list", m_idx);
		
		sqlSession.close();
		
		return list;
		
	}
	
	public CartVO selectOne(CartVO vo) {
		
		CartVO res_vo = null;
		
		SqlSession sqlSession = factory.openSession();
		
		res_vo = sqlSession.selectOne("cart_one", vo);
		
		sqlSession.close();
		
		return res_vo;
		
	}
	
	// 회원별 장바구니 상품의 총합
	public int selectTotalAmount(int m_idx) {
		
		SqlSession sqlSession = factory.openSession();
		
		int total = sqlSession.selectOne("cart_total_amount", m_idx);
		
		sqlSession.close();
		
		return total;
	}
	
	// 장바구니에 중복된 항목이 없다면 새 항목 추가
	public int insert(CartVO vo) {
		SqlSession sqlSession = factory.openSession(true);
		
		int res = sqlSession.insert("cart_insert", vo);
		
		sqlSession.close();
		
		return res;
		
	}
	
	// 상품 갯수, 번호, 고객 번호를 파라미터로 받아서 수정
	public int update_cnt(int c_idx, int c_cnt) {
		SqlSession sqlSession = factory.openSession(true); // 커밋을 하지 않아도 되게 true로 설정
		
		HashMap<String, Integer> map = new HashMap<>();
		
		map.put("c_idx", c_idx);
		map.put("c_cnt", c_cnt);
		
		int res = sqlSession.update("cart_cnt_update", map);
		
		sqlSession.close();
		
		return res;
	}
	
	public int delete(int m_idx, int c_idx) {
		SqlSession sqlSession = factory.openSession(true);
		
		HashMap<String, Integer> map = new HashMap<>();
		
		map.put("m_idx", m_idx);
		map.put("c_idx", c_idx);
		
		int res = sqlSession.delete("cart_delete", map);
		
		sqlSession.close();
		
		return res;
	}
	
	
	
}
