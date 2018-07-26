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
String path=request.getContextPath();
%>
<form method="post" 
action="<%=path%>/ch03_servlet/forward.do">
이름 : <input name="name"><br>
색상 : <select name="color">
				<option value="blue">파랑</option>
				<option value="green">초록</option>
				<option value="red">빨강</option>
		   </select>
<br>		   
취미 : <input type="checkbox" name="hobby" value="낚시">낚시
		   <input type="checkbox" name="hobby" value="등산">등산
		   <input type="checkbox" name="hobby" value="운동">운동
		   <input type="checkbox" name="hobby" value="독서">독서
<input type="submit" value="확인">		   
</form>
</body>
</html>







