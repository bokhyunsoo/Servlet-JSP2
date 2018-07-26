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
String info=application.getServerInfo();
// WAS : Web Application Server
application.log("WAS 정보:"+ info);
System.out.println("WAS 정보:"+ info);
//개발 디렉토리가 아닌 서비스 디렉토리(배포 경로)
String path=application.getRealPath("/");
application.log("서비스 경로:"+path);
System.out.println("서비스 경로:"+path);
// application 영역에 변수 저장(모든 사용자가 공유하는 변수)
application.setAttribute("message", "hello");
%>
<a href="application_result.jsp">서버 변수 확인</a>
</body>
</html>










