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
Cookie cookie=new Cookie("id",""); //쿠키값에 빈문자열
cookie.setMaxAge(0); //즉시 삭제됨
response.addCookie(cookie); 
%>
쿠키가 삭제되었습니다.
<a href="useCookie.jsp?name=kim">쿠키 확인</a>
</body>
</html>







