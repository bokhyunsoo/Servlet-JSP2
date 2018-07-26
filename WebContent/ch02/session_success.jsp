<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="../include/jquery-3.3.1.min.js"></script>
<% String context=request.getContextPath(); %>
<%@ include file="../include/session_check.jsp" %> 

<script>
$(function(){
	$("#btnLogout").click(function(){
		location.href="<%=context%>/ch02_servlet/logout.do";
	});
});
</script>
<title>Insert title here</title>
</head>
<body>
<!-- 세션에 저장된 값을 조회 session.getAttribute("변수명") -->
<h2><%=session.getAttribute("message")%></h2>
접속중인 아이디는 <%=session.getAttribute("userid") %>입니다.

<button type="button" id="btnLogout">로그아웃</button>

</body>
</html>







