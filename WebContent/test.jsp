<!-- 페이지 지시어(page directive) -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%!
int a=100;
String putStr(String str){
	return "a="+a+",str="+str;
}
%>    
    
    
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<% // jsp code 영역(scriptlet, 스크립틀릿)
String str="hello jsp";
out.println(str+"<br>"); //웹브라우저에 문자열이 html로 출력됨
// application 내장객체(서버의 정보를 처리)
// jsp의 실제 서비스 경로
out.println(application.getRealPath("/")+"<br>");
%>
<%=putStr("hello jsp") %>
</body>
</html>







