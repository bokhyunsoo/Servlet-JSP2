<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<%@ include file="../include/header.jsp" %> 
<script src="../include/jquery-3.3.1.min.js"></script>
<!-- <script src="http://code.jquery.com/jquery-3.2.1.min.js"></script> -->
<script>
/* $(function(){
	list();
}); */
$(document).ready(function(){
	//페이지 로딩 완료 후 자동으로 실행되는 코드
	list('1');
});
//list('5')
function list(curPage){
	var param="curPage="+curPage;
	$.ajax({
		type: "post",
		url: "${path}/page_servlet/list.do",
		data : param,
		success: function(result){ //콜백함수(서버의 응답 처리)
			$("#result").html(result);
		}
	});
}
</script>
</head>
<body>
<h2>페이지 나누기</h2>
<div id="result"></div>
</body>
</html>







