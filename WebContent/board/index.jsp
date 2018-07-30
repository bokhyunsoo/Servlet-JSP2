<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@ include file="../include/header.jsp" %>
<%-- <c:redirect url="/board_servlet/list.do"></c:redirect> --%>
<% 
response.sendRedirect(
		request.getContextPath()+"/board_servlet/list.do");
%>
</body>
</html>







