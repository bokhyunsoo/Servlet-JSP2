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
// request.setAttribute("변수명",값)으로 전달된 값을 읽는 방법
// (자료형)request.getAttribute("변수명")
int result=(int)request.getAttribute("result");
out.println(result);
%>
</body>
</html>







