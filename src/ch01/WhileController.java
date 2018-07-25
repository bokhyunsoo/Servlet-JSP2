package ch01;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
// HttpServlet 서블릿-서버에서 실행되는 자바 프로그램
// 어노테이션 : 코드에 대한 주석
@WebServlet("/ch01/while.do") // url mapping 
public class WhileController extends HttpServlet {
	private static final long serialVersionUID = 1L;
//get 방식 호출
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int number=Integer.parseInt(
				request.getParameter("number"));
		int num=Integer.parseInt(request.getParameter("num"));
		int result=1;
		for(int i=1; i<=num; i++){
			result *= number;
		}
		System.out.println("결과:"+result);
		//결과값을 저장함 setAttribute("변수명", 값)
		request.setAttribute("result", result);
		// while_result.jsp로 화면 이동(forward 방식)
		//url에 대한 정보를 분석
		RequestDispatcher rd=
			request.getRequestDispatcher("/ch01/while_result.jsp");
		rd.forward(request, response); 
	}
//post 방식 호출
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
