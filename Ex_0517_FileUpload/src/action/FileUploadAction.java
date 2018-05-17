package action;

import java.io.File;
import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

@WebServlet("/html/upload.do")
public class FileUploadAction extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		String web_path = "/upload/";			// 저장 경로
		ServletContext application = request.getServletContext();
		String path = application.getRealPath(web_path); // 실제 프로젝트상의 경로
		
		int max_size = 1024 * 1024 * 100;	// 최대 업로드 용량 : 100MB
		
		// 파일 업로드르 위한 객체 (request, 저장경로, 업로드 용량, 수신 인코딩, 동일 파일명 정책)
		MultipartRequest mr = new MultipartRequest(request, path, max_size, "utf-8", new DefaultFileRenamePolicy());
		
		// 업로드된 파일 정보 얻어오기
		String filename = "no_file";
		
		//실제 업로드 된 파일의 정보를 획득
		File f = mr.getFile("photo");
		
		if (f != null) {
			filename = f.getName(); // 업로드 된 파일 이름을 가져온다.
		}
		
		// 파일 외의 파라미터를 수신 (request.getParameter()로 받아올 수 없음)
		String title = mr.getParameter("title");
		request.setAttribute("title", title);
		request.setAttribute("filename", filename);
		
		RequestDispatcher disp = request.getRequestDispatcher("result.jsp");
		disp.forward(request, response);
	}

}
