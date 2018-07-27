<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@ page import="java.net.URLEncoder" %>
<% 
//new Cookie("쿠키변수명","값")  스트링만 가능
//특수문자,한글 등은 인코딩을 해야 함(톰캣 하위버전)
Cookie cookie=
new Cookie("id",URLEncoder.encode("김철수","utf-8"));
Cookie cookie2=new Cookie("pwd","1234");
Cookie cookie3=new Cookie("age","20");
cookie.setMaxAge(10); //쿠키의 유효시간(초)
response.addCookie(cookie); //쿠키 생성
response.addCookie(cookie2);
response.addCookie(cookie3);
%>
쿠키가 생성되었습니다.<br>
<%
String name=URLEncoder.encode("박상민", "utf-8");
%>
<a href="useCookie.jsp?name=<%=name%>">쿠키 확인</a>
</body>
</html>







