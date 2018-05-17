package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import service.DBService;
import vo.PhotoVO;

public class PhotoDAO {

	// single-ton pattern: 
	// 객체1개만생성해서 지속적으로 서비스하자
	static PhotoDAO single = null;

	public static PhotoDAO getInstance() {
		//생성되지 않았으면 생성
		if (single == null)
			single = new PhotoDAO();
		//생성된 객체정보를 반환
		return single;
	}

	
	public List<PhotoVO> selectList() {

		List<PhotoVO> list = new ArrayList<PhotoVO>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select * from photo order by idx desc";

		try {
			//1.Connection얻어온다
			conn = DBService.getInstance().getConnection();
			//2.명령처리객체정보를 얻어오기
			pstmt = conn.prepareStatement(sql);

			//3.결과행 처리객체 얻어오기
			rs = pstmt.executeQuery();

			while (rs.next()) {
				PhotoVO vo = new PhotoVO();
				//현재레코드값=>Vo저장
				vo.setIdx(rs.getInt("idx"));
				vo.setTitle(rs.getString("title"));
				vo.setFilename(rs.getString("filename"));
				vo.setPwd(rs.getString("pwd"));
				vo.setIp(rs.getString("ip"));
				vo.setRegdate(rs.getString("regdate"));
				
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
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}

		return list;
	}

	public int insert(PhotoVO vo) {
		 int res = 0;
		 
		 Connection conn = null;
		 PreparedStatement pstmt = null;
		 
		 String sql = "insert into photo values(seq_photo_idx.nextVal, ?, ?, ?, ?, ?)";
		 
		 try {
			 //1.Connection획득
			 conn = DBService.getInstance().getConnection();
			 //2.명령처리객체 획득
			 pstmt = conn.prepareStatement(sql);
			 
			 //3.pstmt parameter 채우기
			 pstmt.setString(1, vo.getTitle());
			 pstmt.setString(2, vo.getFilename());
			 pstmt.setString(3, vo.getPwd());
			 pstmt.setString(4, vo.getIp());
			 pstmt.setString(5, vo.getRegdate());
			 
			 //4.DB로 전송(res:처리된행수)
			 res = pstmt.executeUpdate();
			 
			 
		 } catch (Exception e) {
			 // TODO: handle exception
			 e.printStackTrace();
		 } finally{
			 
			 try {
				 if(pstmt!=null) pstmt.close();
				 if(conn!=null) conn.close();
			 } catch (SQLException e) {
				 // TODO Auto-generated catch block
				 e.printStackTrace();
			 }
		 }
		 return res;
	 }
	 
	
}
