<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="color.jspf" %> <!-- 변수 공유 가능 -->
<%@ page import="config.Constants" %>    
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<!-- include한 java 변수를 사용 가능 -->
<style>
body {
	background: <%=bodyback_c%>;
}
</style>
</head>
<body>
<h2>최대값 : <%=Constants.MAX%></h2>
<!-- jsp 액션태그, java 변수는 공유할 수 없음 --> 
<jsp:include page="test.jsp"></jsp:include>
<!-- 에러가 발생함 -->
<%-- <h2><%=str%></h2> --%> 
</body>
</html>







