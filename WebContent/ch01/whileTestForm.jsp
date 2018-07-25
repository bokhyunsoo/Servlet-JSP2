<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- request.getContextPath() 컨텍스트 패스 -->
<form method="post" 
action="<%=request.getContextPath()%>/ch01/while.do">
	곱해질 값 : <input name="number"><br>
	곱해질 횟수 : <input name="num"><br>
	<input type="submit" value="확인">
</form>
</body>
</html>







