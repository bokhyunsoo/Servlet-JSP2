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
//session.removeAttribute("id"); //세션변수 삭제
//session.removeAttribute("passwd");
//모든 세션 변수가 삭제되고 다시 세션에 값이 입력되면
//JSESSIONID가 변경됨
session.invalidate(); //세션을 초기화시킴
%>
세션이 삭제되었습니다.<br>
<a href="viewSession.jsp">세션 확인</a>
</body>
</html>










