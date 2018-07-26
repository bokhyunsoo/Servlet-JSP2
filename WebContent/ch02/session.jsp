<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
// pageContext < request < session < application
// 현재페이지    요청+응답  사용자     서버
// session 영역에 변수 저장
session.setAttribute("name", "김철수"); // key,value
session.setAttribute("age", 20);

request.setAttribute("name", "김철수"); // key,value
request.setAttribute("age", 20);
//페이지 이동(주소가 바뀜, 데이터 손실)
//response.sendRedirect("session_result.jsp");
//forward(주소가 바뀌지 않음, 데이터 유지)
RequestDispatcher rd
	=request.getRequestDispatcher("session_result.jsp");
rd.forward(request,response);
%>
</body>
</html>







