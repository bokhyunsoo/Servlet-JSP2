<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- 서블릿의 정보 출력 
servlet : 서버에서 실행되는 자바 프로그램 
jsp 페이지는 내부적으로 servlet으로 변환되어 실행됨
-->
<%=getServletInfo() %><br> 
<!-- 개발경로가 아닌 서비스경로(배포 경로) --> 
<%=application.getRealPath("/") %>
</body>
</html>







