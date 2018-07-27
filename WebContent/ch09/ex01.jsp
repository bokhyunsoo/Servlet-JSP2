<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%-- <%@ page import="java.util.Enumeration" %>
<%
//request 객체의 헤더 변수 집합
Enumeration<String> headerNames=request.getHeaderNames();
while(headerNames.hasMoreElements()){ //다음 요소가 있으면
	String key=(String)headerNames.nextElement();//값을 읽음
	String value=request.getHeader(key);//헤더값 조회
	out.println(key+":"+value+"<br>");
}
%> --%>
<!-- taglib prefix="접두사" uri="태그의 식별자" -->
<%@ taglib prefix="c" 
uri="http://java.sun.com/jsp/jstl/core" %>

<%-- forEach var="개별변수" items="집합"
${cookie} => 쿠키정보
${header} => request 헤더 정보 --%>

<c:forEach var="h" items="${header}">
	${h.key} => ${h.value}<br>
</c:forEach>
<hr>
<!-- set var="변수명" value="값" scope="사용영역" 
	page < request < session < application
user-agent 클라이언트의 웹브라우저 정보
-->
<c:set var="browser" value="${header['user-agent']}" 
	scope="page" />  <!--  영역.setAttribute("변수명",값) -->
	<!-- 출력문 -->
<c:out value="${browser}" /> <!--  out.println(값) -->
${browser}  
<hr>
<c:remove var="browser" />  <!-- removeAttribute() 대체 -->
<c:out value="${browser}" />


</body>
</html>










