<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- 포워드 방식 : 주소는 그대로, 화면만 이동 -->
<jsp:forward page="template.jsp">
	<jsp:param value="content.jsp" name="CONTENTPAGE"/> 
</jsp:forward>

</body>
</html>







