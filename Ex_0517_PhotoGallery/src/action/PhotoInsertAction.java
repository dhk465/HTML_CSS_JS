package action;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Calendar;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import dao.PhotoDAO;
import vo.PhotoVO;

@WebServlet("/photo/insert.do")
public class PhotoInsertAction extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		String web_path = "/upload/";
		ServletContext application = request.getServletContext();
		String path = application.getRealPath(web_path);
		
		System.out.println(path);
		
		int max_size = 1024 * 1024 * 100;
		
		// 라이브러리: cos.jar
		MultipartRequest mr = new MultipartRequest(request, path, max_size, "utf-8", new DefaultFileRenamePolicy());
		
		String filename = "no_file";
		
		File f = mr.getFile("photo");
		
		if (f != null) {
			filename = f.getName();
		}
		
		String title = mr.getParameter("title");
		String pwd = mr.getParameter("pwd");
		String ip = request.getRemoteAddr();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
		Calendar calendar = Calendar.getInstance();
		String regdate = sdf.format(calendar.getTime());
		
		// 파라미터로 받아온 정보를 vo에 저장
		PhotoVO vo = new PhotoVO();
		vo.setTitle(title);
		vo.setFilename(filename);
		vo.setPwd(pwd);
		vo.setIp(ip);
		vo.setRegdate(regdate);
		
		// 데이터베이스에 insert
		int res = PhotoDAO.getInstance().insert(vo);
		
		response.sendRedirect("list.do");
	}

}
