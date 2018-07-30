<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<%@ include file="../include/header.jsp" %>
<script src="../include/jquery-3.3.1.min.js"></script>
<script>
$(function(){
	$("#btnWrite").click(function(){
		location.href="${path}/board/write.jsp";
	});
});
</script>
</head>
<body>
<h2>게시판</h2>

<button id="btnWrite">글쓰기</button>
<table border="1" width="900px">
	<tr>
		<th>번호</th>
		<th>이름</th>		
		<th>제목</th>		
		<th>날짜</th>		
		<th>조회수</th>		
		<th>첨부파일</th>		
		<th>다운로드</th>		
	</tr>
<c:forEach var="dto" items="${list}">
			<tr>
				<td>${dto.num}</td>
				<td>${dto.writer}</td>
				<td>
				<!-- 답글 들여쓰기 -->
					<c:forEach var="i" begin="1" end="${dto.re_level}">
						&nbsp;&nbsp;
					</c:forEach>
				<a href="${path}/board_servlet/view.do?num=${dto.num}">
				${dto.subject}</a>
				<!-- 댓글갯수 표시 -->
				<c:if test="${dto.comment_count > 0}">
				<span style="color: red;">(${dto.comment_count})</span>
				</c:if>
				</td>
				<td>${dto.reg_date}</td>
				<td>${dto.readcount}</td>
				<td align="center">
					<c:if test="${dto.filesize > 0}">
					<a href="${path}/board_servlet/download.do?num=${dto.num}">
							<img src="../images/file.gif">
					</a>
					</c:if>
				</td>
				<td>${dto.down}</td>
			</tr>
</c:forEach>
</table>
</body>
</html>







