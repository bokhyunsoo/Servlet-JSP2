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
// session.setAttribute(key,value) 세션에 저장
// (형변환)session.getAttribute(key) 세션변수값 조회
String name=(String)session.getAttribute("name");
int age=(int)session.getAttribute("age");
%>
이름 : <%=name%>, 나이 : <%=age%><br>
<%
String name2=(String)request.getAttribute("name");
Integer age2=(Integer)request.getAttribute("age");
%>
이름 : <%=name2%>, 나이 : <%=age2%><br>

<a href="session_result2.jsp">세션변수 확인</a>

</body>
</html>







