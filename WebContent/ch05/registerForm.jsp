<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<form method="post" action="registerPro.jsp">
<table>
	<tr>
		<td>아이디</td>
		<td><input name="id"></td>
	</tr>
	<tr>
		<td>비번</td>
		<td><input name="passwd"></td>
	</tr>
	<tr>
		<td>이름</td>
		<td><input name="name"></td>
	</tr>
	<tr>
<!-- colspan 셀합치기, rowspan 행합치기 -->	
		<td align="center" colspan="2">
			<input type="submit" value="확인">
		</td>
	</tr>
</table>
</form>
</body>
</html>







