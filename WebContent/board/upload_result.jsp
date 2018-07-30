<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="java.io.*" %>
<%@ page import="com.oreilly.servlet.*" %>
<%@ page import="com.oreilly.servlet.multipart.*" %>    
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
//파일 업로드를 위한 디렉토리 설정
String upload_path="d:\\upload";
//파일 업로드 최대 사이즈 설정
int size=10*1024*1024; //byte 단위
String name="";
String subject="";
String filename="", filename2="";
int filesize=0, filesize2=0;
try{
	//MultipartRequest : request를 확장한 객체
	//new MultipartRequest(request,"업로드 디렉토리",제한용량,
	//				인코딩방식,파일명중복방지처리옵션)
	MultipartRequest multi=new MultipartRequest(
		request,upload_path,size,"utf-8"
		,new DefaultFileRenamePolicy());
	name=multi.getParameter("name");
	subject=multi.getParameter("subject");
	Enumeration files=multi.getFileNames();
	String file1=(String)files.nextElement();
	String file2=(String)files.nextElement();
	//서버에 업로드된 파일 이름
	filename=multi.getFilesystemName(file1);
	//File : 파일의 정보를 참조
	File f1=multi.getFile(file1);
	filesize=(int)f1.length(); //파일의 사이즈
	filename2=multi.getFilesystemName(file2);
	File f2=multi.getFile(file2);
	filesize2=(int)f2.length();
}catch(Exception e){
	e.printStackTrace();
}
%>
이름 : <%=name%><br>
제목 : <%=subject%><br>
파일1 이름 : <%=filename%><br>
파일1 크기 : <%=filesize%><br>
파일2 이름 : <%=filename2%><br>
파일2 크기 : <%=filesize2%><br>
</body>
</html>















