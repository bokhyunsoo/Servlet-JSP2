<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<!-- 외부 스타일시트 파일을 참조 -->
<link rel="stylesheet" href="template.css" />
</head>

<body>
<header> <!-- 시맨틱 태그 -->
	<jsp:include page="top.jsp"></jsp:include>
</header>
<div id="content">
	<section id="areaSub">
		<jsp:include page="left.jsp"></jsp:include>
	</section>
	<section id="areaMain">
		<jsp:include 
		page='<%=request.getParameter("CONTENTPAGE")%>' />
	</section>
	<footer>
		<jsp:include page="bottom.jsp"></jsp:include>
	</footer>
</div>
</body>

</html>















