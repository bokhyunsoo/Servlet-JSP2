package board;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.dao.BoardDAO;
import board.dto.BoardDTO;
// @WebServlet 어노테이션은 꼭 지워야 함
public class BoardController extends HttpServlet {
	//get 방식 호출
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//클라이언트에서 요청한 주소
		String url=request.getRequestURL().toString();
		//컨텍스트 패스(웹프로젝트의 식별자)
		String contextPath=request.getContextPath();
		//dao 인스턴스 생성
		BoardDAO dao=new BoardDAO();
		if(url.indexOf("list.do") != -1){
					
			//System.out.println("list.do 호출");
			List<BoardDTO> list=dao.list();
			request.setAttribute("list", list);
			//페이지 네비게이션 출력을 위한 정보 전달
			String page="/board/list.jsp";
			RequestDispatcher rd=request.getRequestDispatcher(page);
			rd.forward(request, response); 
		}else if(url.indexOf("insert.do") != -1){

			//파일업로드 처리
			//디렉토리가 없으면 생성
			//request를 확장시킨 MultipartRequest 생성
//new MultipartRequest(request,파일업로드 디렉토리,업로드용량
//			,파일인코딩,중복파일정책)
			
			String writer=request.getParameter("writer");
			String subject=request.getParameter("subject");
			String content=request.getParameter("content");
			String passwd=request.getParameter("passwd");
			String ip=request.getRemoteAddr(); //클라이언트의 ip주소
			String filename=" "; //공백 1개
			int filesize=0;
			
			BoardDTO dto=new BoardDTO();
			dto.setWriter(writer);
			dto.setSubject(subject);
			dto.setContent(content);
			dto.setPasswd(passwd);
			dto.setIp(ip);
			dto.setFilename(filename);
			dto.setFilesize(filesize);
			//파일 첨부를 하지 않을 경우
			// trim() 문자열의 좌우 공백 제거
			
			dao.insert(dto);
			String page="/board_servlet/list.do";
			RequestDispatcher rd=request.getRequestDispatcher(page);
			rd.forward(request, response); 
		}
	}

	//post 방식 호출
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}






