<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<h3>글 보기</h3>
<a href="<%=request.getContextPath() %>/board/writeForm.do">글쓰기</a>
<table border="2">
	<tr>
		<td>제목</td><td>작성자</td><td>작성일</td>
	</tr>
	<c:forEach var="list" items="${list }">
		<tr>
			<td><a href="<%=request.getContextPath() %>/board/detail.do?num=${list.num}">${list.title }</a></td>
			<td>${list.writer_id }</td>
			<td>${list.w_date }</td>
		</tr>
	</c:forEach>
	
</table>
</body>
</html>