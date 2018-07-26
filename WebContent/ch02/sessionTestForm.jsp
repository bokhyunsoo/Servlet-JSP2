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
String context=request.getContextPath();
%>

<form method="post" 
action="<%=context%>/ch02_servlet/login.do">
아이디 <input name="userid"><br>
비밀번호 <input type="password" name="passwd"><br>
<input type="submit" value="로그인">
</form>
<!-- 로그인 실패, 로그아웃 메시지를 출력할 태그 -->
<%
String message=request.getParameter("message");
if(message != null){
%>
	<span style="color: red;"><%=message%></span>
<%
}
%>
</body>
</html>







