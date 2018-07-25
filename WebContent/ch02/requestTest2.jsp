<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.Enumeration" %>    
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2>request 객체의 method</h2>
<%
String[] names={"프로토콜","서버이름","method","컨텍스트",
		"uri","url","ip"};
// uri : /jsp01/ch02/requestTest2.jsp
// url : http://192.168.0.101/jsp01/ch02/requestTest2.jsp
String[] values={ 
		request.getProtocol(), request.getServerName(),
		request.getMethod(), request.getContextPath(),
		request.getRequestURI(), 
		request.getRequestURL().toString(),
		request.getRemoteAddr()
};
for(int i=0; i<names.length; i++){
	out.println(names[i]+":"+values[i]+"<br>");
}
// request 헤더 변수들을 Enumeration에 저장(집합처리객체)
//out.println(request.getHeaderNames());
Enumeration<String> en=request.getHeaderNames(); 
String headerName="";
String headerValue="";
out.println("<h2>헤더 정보</h2>");
//out.println(request.getHeader("user-agent"));
while( en.hasMoreElements() ) { //다음 요소가 있으면
	headerName = en.nextElement(); //다음 요소 조회
	// request 헤더값 저장
	headerValue = request.getHeader(headerName);
	out.println(headerName+":"+headerValue+"<br>");
}
%>
</body>
</html>







