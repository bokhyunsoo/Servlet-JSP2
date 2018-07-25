package ch02;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/ch02_servlet/request.do")
public class RequestController extends HttpServlet {
	private static final long serialVersionUID = 1L;
//get 방식으로 호출할 때
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//한글 인코딩 설정
		request.setCharacterEncoding("utf-8");
		String name=request.getParameter("name");
		int age=Integer.parseInt(request.getParameter("age"));
		String gender=request.getParameter("gender");
		String hobby=request.getParameter("hobby");
		Map<String,Object> map=new HashMap<>();
		map.put("name", name); // map.put(key,value)
		map.put("age", age);
		gender = gender.equals("m") ? "남" : "여";
		map.put("gender", gender);
		map.put("hobby", hobby);
		System.out.println(map);
// request_result.jsp로 포워딩(주소는 그대로, 화면만 바뀜)
		request.setAttribute("map", map); //전달할 데이터 저장
		String page="/ch02/request_result.jsp";
		RequestDispatcher rd=request.getRequestDispatcher(page);
		rd.forward(request, response); 
//		response.setContentType("text/html;charset=utf-8");
//		PrintWriter out=response.getWriter();
//		out.println("<html>");
//		out.println("<body>");
//		out.println("이름:"+map.get("name"));
//		out.println("나이:"+map.get("age"));
//		out.println("성별:"+map.get("gender"));
//		out.println("취미:"+map.get("hobby"));
//		out.println("</body>");
//		out.println("</html>");
	}
// post 방식으로 호출할 때
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}









