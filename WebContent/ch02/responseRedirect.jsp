<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.net.URLEncoder" %>    
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%



//다른 페이지로 이동시킴
request.setAttribute("name", "김철수");
// get 방식, query string     url?변수=값&변수=값
// 주소창에 넘기는 데이터에는 한글,특수문자를 사용할 수 없음
// 한글,특수문자를 넘기고 싶으면 인코딩을 해야 함
String name=URLEncoder.encode("김철수", "utf-8");
response.sendRedirect(
		"responseRedirected.jsp?name="+name+"&age=20");
%>
<!-- <script>
location.href="responseRedirected.jsp";
</script> -->
</body>
</html>







