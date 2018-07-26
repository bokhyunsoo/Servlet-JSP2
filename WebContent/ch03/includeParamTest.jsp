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
request.setCharacterEncoding("utf-8");
String name="김철수";
String pageName="includedParamTest.jsp";
%>
포함하는 페이지입니다.
<jsp:include page="<%=pageName%>">
	<jsp:param value="<%=name%>" name="name" />
	<jsp:param value="<%=pageName%>" name="pageName" />
</jsp:include>
</body>
</html>











