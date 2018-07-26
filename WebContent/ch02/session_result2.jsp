<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
이름 : <%=session.getAttribute("name") %>,
나이 : <%=session.getAttribute("age") %><br>

이름 : <%=request.getAttribute("name") %>,
나이 : <%=request.getAttribute("age") %><br>

</body>
</html>







