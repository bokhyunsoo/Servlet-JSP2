<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>    
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
Date nowDate=new Date();
out.println(nowDate+"<br>");
// new SimpleDateFormat("날짜 출력 형식")
// HH 24시간제, hh 12시간제
SimpleDateFormat dateFormat=
	new SimpleDateFormat("yyyy년 MM월 dd일 a HH:mm:ss");
// Date => String 변환
String formatDate=dateFormat.format(nowDate);
%>
현재 날짜는 <%=formatDate%>입니다.
</body>
</html>







