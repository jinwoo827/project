<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<h3>�۾���</h3>
<form action="${pageContext.request.contextPath }/board/write.do" method="post">
	<input type="hidden" value="0" name="parent_num">
	<table border="2">
		<tr>
			<td>����</td><td><input type="text" name="title"></td>
		</tr>
		
		<tr>
			<td>�ۼ���</td><td><input type="text" name="writer_id" readonly value=${sessionScope.id }></td>
		</tr>
		
		<tr>
			<td>����</td><td><input type="text" name="content"></td>
		</tr>
		<tr>
			<td colspan="2"><input type="submit" value="���ۼ�"></td>
		</tr>
		
	</table>

</form>
</body>
</html>