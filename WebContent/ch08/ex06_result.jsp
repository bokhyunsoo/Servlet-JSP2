<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@ include file="../include/header.jsp" %>
<!-- 개별값을 출력할 경우 -->
<%-- ${변수.속성} ${변수["속성"]} --%>
${map["포도"]}<br>
${map["오렌지"]}<br>
${map["바나나"]}<br>
${map["사과"]}<br>
<!-- 모두 출력할 경우 -->
<c:forEach var="row" items="${map}">
<%-- 	${row} : ${row.key} => ${row.value}<br>  --%>
	${row} : ${row["key"]} => ${row["value"]}<br> 	
</c:forEach>

<%-- <%@ page import="java.util.HashMap" %>
<%
// map.set("변수명",값)  map.get("변수명")
HashMap<String,String> map=
	(HashMap<String,String>)request.getAttribute("map");
String[] fruits = {"포도","오렌지","바나나","사과"};
for(String f : fruits){
	out.println( f+"==>"+map.get(f)+"<br>");
}
%> --%>
</body>
</html>







