package kr.or.mc.user.service.board;

import java.io.IOException;
import java.util.Enumeration;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import kr.or.mc.common.action.Action;
import kr.or.mc.common.action.ActionForward;
import kr.or.mc.common.dto.BoardFreeDTO;
import kr.or.mc.user.dao.UserDAO;

public class FreeRegisterService implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {

		String uploadpath = request.getSession().getServletContext().getRealPath("freeboard");
		

		int size = 1024 * 1024 * 10; // 10M 네이버 계산기
		ActionForward forward = new ActionForward();
		String context = request.getContextPath();
		// output, input을 만들지 않아도됨, 좋음!!

		try {

			MultipartRequest multi = new MultipartRequest(request, // 기존에 있는 request 객체의 주소값
					uploadpath, // 실 저장 경로 (배포경로)
					size, // 10M
					"UTF-8", new DefaultFileRenamePolicy() // 파일 중복(upload 폴더 안에:a.jpg -> a_1.jpg(업로드 파일 변경) )
			);

			HttpSession session = request.getSession();
			String f_writer = (String) session.getAttribute("id");
			if (f_writer == null) {
				f_writer = "admin";
			}
			String title = multi.getParameter("title"); // 제목
			String content = multi.getParameter("summernote"); // 내용

			Enumeration filenames = multi.getFileNames(); // 파일 업로드

			String file = (String) filenames.nextElement();
			String filename = multi.getFilesystemName(file);

			System.out.println("f_writer : " + f_writer);
			System.out.println("title : " + title);
			System.out.println("content : " + content);
			System.out.println("filename : " + filename);

			
			  BoardFreeDTO boardFreeDto = new BoardFreeDTO(); UserDAO dao = new UserDAO();
			  // POINT
			  
			  boardFreeDto.setF_code(3); //정적 추가 boardFreeDto.setF_title(title);
			  boardFreeDto.setF_title(title); 
			  boardFreeDto.setF_content(content); 
			  boardFreeDto.setF_writer(f_writer); //정적
			  boardFreeDto.setF_file_upload(filename);
			  
			  int result = dao.FreeRegister(boardFreeDto);
			  
			  System.out.println("자유게시판 등록 : " + result);
			  
			  forward.setPath("BoardFree.b");

		} catch (Exception e) {
			System.out.println(e.getMessage());
			e.printStackTrace();
		}

		return forward;

	}
}
