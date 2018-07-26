<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
request.setCharacterEncoding("utf-8");
%>
<jsp:useBean id="registerBean" class="ch05.RegisterBean">
	<jsp:setProperty name="registerBean" property="*" />
</jsp:useBean>
<%@ page import="java.sql.Timestamp" %>
<% 
//System.currentTimeMillis() 시스템의 현재 밀리세컨드
out.println(System.currentTimeMillis());
registerBean.setReg_date(
		new Timestamp(System.currentTimeMillis()));
%>
아이디:<jsp:getProperty property="id" name="registerBean"/>
<br>
비번:<jsp:getProperty property="passwd" name="registerBean"/>
<br>
이름:<jsp:getProperty property="name" name="registerBean"/>
<br>
가입일자:
<jsp:getProperty property="reg_date" name="registerBean"/>
</body>
</html>







