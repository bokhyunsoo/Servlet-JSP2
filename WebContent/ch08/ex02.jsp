<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%-- request.getParameter("변수") => ${param.변수} --%>
<form method="get">
	이름 : <input name="name" value="${param.name}">
	<input type="submit" value="확인">
</form>
이름 : ${param.name} 
<%-- <%
String name=request.getParameter("name");
if(name==null){ //null일 때 대체할 값으로 변경해야 함
	name="";
}
%>
<form method="get" >
	이름 : <input name="name" 	value="<%=name%>">
	<input type="submit" value="확인">
</form>
이름 : <%=name%>  --%>
</body>
</html>









