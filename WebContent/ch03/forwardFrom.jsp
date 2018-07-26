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
request.setAttribute("id", "kim");
request.setAttribute("name", "김철수");
/* RequestDispatcher rd=
	request.getRequestDispatcher("forwardTo.jsp");
rd.forward(request, response); */
%>
<jsp:forward page="forwardTo.jsp"></jsp:forward> 
</body>
</html>







