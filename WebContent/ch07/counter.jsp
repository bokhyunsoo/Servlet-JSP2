<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.Date" %>
<%@ page import="common.Util" %>    
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
//쿠키변수 count 값 조회
//request.getCookies() 쿠키 배열
String count=Util.getCookie(request.getCookies(), "count");
int intCount=0;

//방문시간 저장
Date date=new Date();
long now_time=date.getTime(); //현재 시각
String visitTime
	=Util.getCookie(request.getCookies(),"visit_time");
long visit_time=0;
if(visitTime != null && !visitTime.equals("")){
	visit_time=Long.parseLong(visitTime);
}
out.println("현재시각:"+now_time+"<br>");
out.println("방문시각:"+visit_time+"<br>");

if(count==null||count.equals("")){ //첫 방문일 경우
	//쿠키변수 생성
	response.addCookie(new Cookie("count","1"));
	//첫 방문시간 저장
	response.addCookie(
			new Cookie("visit_time",Long.toString(now_time)));
}else{ //재방문일 경우
	//방문시간 변경
	long period=now_time - visit_time; //현재시각-방문시각
	intCount = Integer.parseInt(count)+1;
	if(period > 3*1000){ //일정시간이 경과하면 카운터 수정
		//카운터값 변경
		response.addCookie(
				new Cookie("count",Integer.toString(intCount)));
		response.addCookie(
				new Cookie("visit_time",Long.toString(now_time)));
	}
}
// Integer.toString(숫자) 숫자를 문자열로
String counter=Integer.toString(intCount);
for(int i=0; i<counter.length(); i++){
	// 문자열.charAt(인덱스) 문자열의 n번째 문자 리턴
	String img
		="<img src='../images/"+counter.charAt(i)+".gif'>";
	out.println(img);
}
%>
<%-- 방문횟수 : <%=intCount%> --%>


</body>
</html>







