<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- JSTL 태그라이브러리 선언문 -->
<%@ taglib prefix="c" 
uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
//pageContext.setAttribute("country", "Korea");
%>
<c:set var="country" value="Korea" scope="page" />
<c:if test="${country != null }">
	<%-- 국가명 : <c:out value="${country}" /><br> --%>
	국가명 : ${country}<br> 	 
</c:if>
<%
int[] nums={10,70,80,50,40,30,20};
//pageContext.setAttribute("num", nums);
%>
<c:set var="num" value="<%=nums%>" />
<c:forEach var="n" items="${num}">
	${n}, 
</c:forEach>
<br>
<!-- 다중조건문 -->
<c:set var="season" value="겨울" />
<c:choose>
	<c:when test="${season == '봄' }">
		<img src="/jsp01/images/spring.jpg">
	</c:when>
	<c:when test="${season == '여름' }">
		<img src="/jsp01/images/summer.jpg">
	</c:when>
	<c:when test="${season == '가을' }">
		<img src="/jsp01/images/autumn.jpg">
	</c:when>
	<c:when test="${season == '겨울' }">
		<img src="/jsp01/images/winter3.jpg">
	</c:when>
	<c:otherwise>
		잘못된 입력입니다.
	</c:otherwise>
</c:choose>


</body>
</html>







