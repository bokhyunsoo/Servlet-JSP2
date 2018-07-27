<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" 
uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%-- request.getParameter("변수") => ${param.변수} --%>
<c:forEach var="i" begin="${param.start}" end="${param.end}">
	<h2>${i}단</h2>
	<c:forEach var="j" begin="1" end="9">	
		${i} x ${j} = ${i * j}<br>
	</c:forEach>
</c:forEach>
</body>
</html>







