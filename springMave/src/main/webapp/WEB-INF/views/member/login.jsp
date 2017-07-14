<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<h3>로그인</h3>
<form action="${pageContext.request.contextPath }/member/login.do" method="post">
	아이디:<input type="text" name="id"><br>
	비번:<input type="password" name="pwd"><br>
	<input type="submit" value="로그인">
	<a href="${pageContext.request.contextPath }/member/form.do">회원가입페이지로</a>
</form>
</body>
</html>