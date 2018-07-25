<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2>이동된 페이지</h2>
<%-- <%
String name=(String)request.getAttribute("name");
%>
이름 : <%=name%> --%>
이름 : <%=request.getParameter("name") %><br>
나이 : <%=request.getParameter("age") %> 
</body>
</html>







