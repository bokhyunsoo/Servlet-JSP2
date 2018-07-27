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
<!-- forEach var="변수" begin="시작" end="끝"
forEach var="개별값" items="집합" -->
<c:forEach var="fruit" items="${requestScope.items}">
	${fruit}<br> 
</c:forEach>
<%-- <%@ page import="java.util.ArrayList" %>
<%
ArrayList<String> items=
	(ArrayList<String>)request.getAttribute("items");
for(String str : items){
	out.println(str+"<br>");
}
%> --%>

</body>
</html>







