<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<form action="${pageContext.request.contextPath }/add.do" method="post">
	name:<input type="text" name="name"><br>
	tel:<input type="text" name="tel"><br>
	address<input type="text" name="address"><br>
	<input type="submit" value="저장">
</form>
</body>
</html>