<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
${sessionScope.id }님 로그인상태
<a href="${pageContext.request.contextPath }/member/editForm.do">내정보수정</a>
<a href="${pageContext.request.contextPath }/member/logout.do">로그아웃</a>
<a href="${pageContext.request.contextPath }/member/out.do">탈퇴</a><br>

</body>
</html>