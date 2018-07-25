<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%  //scriptlet(스크립틀릿) // _jspService() method의 지역변수
String str1="java";
%>
<%! // jsp 선언부(인스턴스변수, method 선언 가능)
String str2="hello";
String getStr2(){
	return str2;
}
%>
<%=str1%><br>  <!-- str1 변수에 저장된 값을 html로 출력 -->
<%=str2%><br>		<!-- expression(표현식) -->
<%=getStr2()%><br>
</body>
</html>







