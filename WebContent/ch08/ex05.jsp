<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>    
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
ArrayList<String> items=new ArrayList<>();
items.add("오렌지");
items.add("사과");
items.add("포도");
items.add("복숭아");
request.setAttribute("items", items);
%>
<jsp:forward page="ex05_result.jsp"></jsp:forward>
</body>
</html>



 



