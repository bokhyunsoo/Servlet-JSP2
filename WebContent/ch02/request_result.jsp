<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.Map" %>
<%@ page import="java.util.HashMap" %>    
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
Map<String,Object> map
	=(Map<String,Object>)request.getAttribute("map");
%>
이름 : <%=map.get("name") %><br>
나이 : <%=map.get("age") %><br>
성별 : <%=map.get("gender") %><br>
취미 : <%=map.get("hobby") %>
</body>
</html>







