package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import service.DBService;
import vo.TestVO;

public class TestDAO {
	// single-ton pattern: 
	// 객체1개만생성해서 지속적으로 서비스하자
	static TestDAO single = null;

	public static TestDAO getInstance() {
		//생성되지 않았으면 생성
		if (single == null)
			single = new TestDAO();
		//생성된 객체정보를 반환
		return single;
	}

	public List<TestVO> selectList() {

		List<TestVO> list = new ArrayList<TestVO>();
		Connection conn = null;
		PreparedStatement pst = null;
		ResultSet rs = null;
		String sql = "select * from sungtb_view";

		try {
			//1.Connection얻어온다
			conn = DBService.getInstance().getConnection();
			//2.명령처리객체정보를 얻어오기
			pst = conn.prepareStatement(sql);

			//3.결과행 처리객체 얻어오기
			rs = pst.executeQuery();

			while (rs.next()) {
				TestVO vo = new TestVO();
				//현재레코드값=>Vo저장
				
				vo.setId(rs.getInt("id"));
				vo.setName(rs.getString("name"));
				vo.setKor(rs.getInt("kor"));
				vo.setEng(rs.getInt("eng"));
				vo.setMat(rs.getInt("mat"));
				vo.setSum(rs.getInt("sum"));
				vo.setAvg(rs.getDouble("avg"));
				vo.setRank(rs.getInt("rank"));
								
				//ArrayList추가
				list.add(vo);
			}

		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {

			try {
				if (rs != null)
					rs.close();
				if (pst != null)
					pst.close();
				if (conn != null)
					conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}

		return list;
	}
	
	// TODO make a method for insert statements
	public int insert(TestVO vo) {
		 int res = 0;
		 
		 Connection conn = null;
		 PreparedStatement pst = null;
		 
		 String sql ="insert into sungtb values (seq_sungtb_no.nextVal, ?, ?, ?, ?)";
		 
		 try {
			 //1.Connection획득
			 conn = DBService.getInstance().getConnection();
			 //2.명령처리객체 획득
			 pst = conn.prepareStatement(sql);
			 
			 //3.pst parameter 채우기
			 pst.setString(1, vo.getName());
			 pst.setInt(2, vo.getKor());
			 pst.setInt(3, vo.getEng());
			 pst.setInt(4, vo.getMat());
			 
			 //4.DB로 전송(res:처리된행수)
			 res = pst.executeUpdate();
			 
			 
		 } catch (Exception e) {
			 // TODO: handle exception
			 e.printStackTrace();
		 } finally {
			 
			 try {
				 if(pst!=null) pst.close();
				 if(conn!=null) conn.close();
			 } catch (SQLException e) {
				 // TODO Auto-generated catch block
				 e.printStackTrace();
			 }
		 }
		 return res;
	 }
	
	public int update(TestVO vo) {
		 int res = 0;
		 
		 Connection conn = null;
		 PreparedStatement pst = null;
		 
		 String sql ="update sungtb set name=?, kor=?, eng=?, mat=? where id=?";
		 
		 try {
			 //1.Connection획득
			 conn = DBService.getInstance().getConnection();
			 //2.명령처리객체 획득
			 pst = conn.prepareStatement(sql);
			 
			 //3.pst parameter 채우기
			 pst.setString(1, vo.getName());
			 pst.setInt(2, vo.getKor());
			 pst.setInt(3, vo.getEng());
			 pst.setInt(4, vo.getMat());
			 pst.setInt(5, vo.getId());
			 
			 //4.DB로 전송(res:처리된행수)
			 res = pst.executeUpdate();
			 
			 
		 } catch (Exception e) {
			 // TODO: handle exception
			 e.printStackTrace();
		 } finally {
			 
			 try {
				 if(pst!=null) pst.close();
				 if(conn!=null) conn.close();
			 } catch (SQLException e) {
				 // TODO Auto-generated catch block
				 e.printStackTrace();
			 }
		 }
		 return res;
	 }
	 
	 
	public int delete(int id) {
		 int res = 0;
		 
		 Connection conn = null;
		 PreparedStatement pst = null;
		 
		 String sql ="delete from sungtb where id=?";
		 
		 try {
			 //1.Connection획득
			 conn = DBService.getInstance().getConnection();
			 //2.명령처리객체 획득
			 pst = conn.prepareStatement(sql);
			 
			 //3.pst parameter 채우기
			 pst.setInt(1, id); // the first question mark is "id"
			 
			 //4.DB로 전송(res:처리된행수)
			 res = pst.executeUpdate(); // if there is no one to delete, this returns 0; if one, returns 1
			 
		 } catch (Exception e) {
			 // TODO: handle exception
			 e.printStackTrace();
		 } finally{
			 
			 try {
				 if(pst!=null) pst.close();
				 if(conn!=null) conn.close();
			 } catch (SQLException e) {
				 // TODO Auto-generated catch block
				 e.printStackTrace();
			 }
		 }
		 return res;
	 }
	 
	
}
