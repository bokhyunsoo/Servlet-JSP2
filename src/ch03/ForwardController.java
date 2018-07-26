package ch03;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

//@WebServlet("/ch03_servlet/forward.do") //url mapping
public class ForwardController extends HttpServlet {
	private static final long serialVersionUID = 1L;
//get 방식 호출
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//한글 인코딩 설정
		request.setCharacterEncoding("utf-8");
		String name=request.getParameter("name");
		String color=request.getParameter("color");
		//태그의 name이 중복될 경우 스트링 배열로 전달됨 
		String[] hobby=request.getParameterValues("hobby");
		String message="";
		switch(color){
		case "blue": message="자기탐구와 내적성장을 상징"; break;
		case "green": message="기분의 안정과 온화함을 상징";break;
		case "red": message="생명을 상징"; break;
		}
		message += "하는 색입니다.";
		
//		request.setAttribute("name", name);
//		request.setAttribute("color", color);
//		request.setAttribute("hobby", hobby);
		
		
		Map<String,Object> map=new HashMap<>();
		//맵에 자료 저장   map.put(변수명, 값)
		map.put("name", name);
		map.put("color", color);
		map.put("message", message);
		map.put("hobby", hobby);
		//color.jsp로 전달할 데이터를 request 영역에 저장
		request.setAttribute("map", map);
		//포워드(주소는 고정, 화면은 바뀜)
		RequestDispatcher rd
			=request.getRequestDispatcher("/ch03/color.jsp");
		rd.forward(request, response); 
	}
//post 방식 호출
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}




