<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <!-- prefix="태그의 접두어" uri="태그 식별자" -->
<%@ taglib prefix="c" 
uri="http://java.sun.com/jsp/jstl/core" %>
<!-- if test="조건식" -->
<c:if test="${sessionScope.userid == null }">
	<script>
		alert("로그인하신 후 사용하세요.");
		location.href="${path}/ch07/session_login.jsp";
	</script>
</c:if>







