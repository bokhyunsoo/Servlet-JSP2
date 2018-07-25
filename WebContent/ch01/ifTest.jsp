<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<% //request.getParameter("변수명") 태그의 name 속성
// request : 내장객체(서버에 요청)
// HttpServletRequest
String name=request.getParameter("name");
String color=request.getParameter("color");
String selectColor="";
switch(color){
case "blue": selectColor="파랑"; break;
case "green": selectColor="초록"; break;
case "red": selectColor="빨강"; break;
}
/* if(color.equals("blue")){ // 문자열의 내용을 비교
	selectColor="파랑"; 
}else if(color.equals("green")){
	selectColor="초록"; 
}else if(color.equals("red")){
	selectColor="빨강"; 
}  */
/* if(color=="blue"){ // 문자열의 주소값을 비교
	selectColor="파랑"; 
}else if(color=="green"){
	selectColor="초록"; 
}else if(color=="red"){
	selectColor="빨강"; 
} */
%>
<%=name%>님이 선택한 색상은 <%=selectColor%>입니다.<br>
range : <%=request.getParameter("range") %>
<div style="background: <%=color%>;width:300px;height:300px">
</div>
</body>
</html>







