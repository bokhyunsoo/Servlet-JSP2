package board;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.util.Enumeration;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import board.dao.BoardDAO;
import board.dto.BoardDTO;
import common.Constants;
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
			File uploadDir=new File(Constants.UPLOAD_PATH);
			if(!uploadDir.exists()){
				uploadDir.mkdir();
			}
			//request를 확장시킨 MultipartRequest 생성
//new MultipartRequest(request,파일업로드 디렉토리,업로드용량
//			,파일인코딩,중복파일정책)
			MultipartRequest multi=new MultipartRequest(
				request, Constants.UPLOAD_PATH, Constants.MAX_UPLOAD
				, "utf-8", new DefaultFileRenamePolicy() );
			
			String writer=multi.getParameter("writer");
			String subject=multi.getParameter("subject");
			String content=multi.getParameter("content");
			String passwd=multi.getParameter("passwd");
			String ip=request.getRemoteAddr(); //클라이언트의 ip주소
			String filename=" "; //공백 1개
			int filesize=0;
			
			try {
				//첨부파일의 집합
				Enumeration files=multi.getFileNames();
				//다음 요소가 있으면
				while(files.hasMoreElements()){
					//첨부파일의 이름
					String file1=(String)files.nextElement();
					filename=multi.getFilesystemName(file1);
					File f1=multi.getFile(file1);
					if(f1 != null){
						filesize=(int)f1.length(); //파일 사이즈 저장
					}
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
			
			BoardDTO dto=new BoardDTO();
			dto.setWriter(writer);
			dto.setSubject(subject);
			dto.setContent(content);
			dto.setPasswd(passwd);
			dto.setIp(ip);
			//파일 첨부를 하지 않을 경우
			// trim() 문자열의 좌우 공백 제거
			
			if(filename == null || filename.trim().equals("")){
				filename="-";
			}
			dto.setFilename(filename);
			dto.setFilesize(filesize);
			
			dao.insert(dto);
			String page="/board_servlet/list.do";
			response.sendRedirect(contextPath+page);
		}else if(url.indexOf("download.do") != -1){
			int num=Integer.parseInt(request.getParameter("num"));
			String filename=dao.getFileName(num);
			System.out.println("첨부파일 이름:"+filename);
			//다운로드할 파일 경로
			String path=Constants.UPLOAD_PATH+filename;
			byte b[]=new byte[4096]; //바이트배열 생성
			//서버에 저장된 파일을 읽기 위한 스트림 생성
			FileInputStream fis=new FileInputStream(path);
			//mimeType(파일의 종류)
			String mimeType=getServletContext().getMimeType(path);
			if(mimeType==null){
				mimeType="application/octet-stream;charset=utf-8";
			}
			//파일 이름에 한글이 포함된 경우
//new String(바이트배열, 변환할인코딩) 8859_1 서유럽언어			
			filename = 
					new String(filename.getBytes("utf-8"),"8859_1");
			//http header
			response.setHeader("Content-Disposition", 
					"attachment;filename="+filename);
			//http body
			//OutputStream 생성(서버에서 클라이언트에 쓰기)
			ServletOutputStream out=response.getOutputStream();
			int numRead;
			while(true){
				numRead = fis.read(b,0,b.length);//데이터 읽음
				if(numRead == -1) break;//더 이상 내용이 없으면
				out.write(b, 0, numRead);//데이터 쓰기
			}
			//파일 처리 관련 리소스 정리
			out.flush();
			out.close();
			fis.close();
			//다운로드 횟수 증가 처리
			dao.plusDown(num);
		}else if(url.indexOf("view.do") != -1){
			int num=Integer.parseInt(request.getParameter("num"));
			//조회수 증가 처리
			HttpSession session=request.getSession();
			dao.plusReadCount(num,session); 
			//번호에 해당하는 게시물 리턴
//			BoardDTO dto=dao.viewReplace(num);
			BoardDTO dto = dao.view(num);
			//request 영역에 저장
			request.setAttribute("dto", dto);
			//화면 전환
			String page="/board/view.jsp";
			RequestDispatcher rd
				=request.getRequestDispatcher(page);
			rd.forward(request, response);
		}else if(url.indexOf("commentList.do") != -1) {
			int num=Integer.parseInt(request.getParameter("num"));
			System.out.println("댓글을 위한 게시물번호:"+num); 
		}
	}
	//post 방식 호출
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}






