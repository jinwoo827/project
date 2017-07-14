<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		$("#idCheck").click(function(){
			
			$.post("/my/member/idCheck.do", {id:$("#id").val()}).done(function(data){
				$("#idResult").text(data);
			});
		});
		
		$("#join").click(function(){
			if($("#idResult").text().trim()=="사용가능"){
				$("form").submit();
			} else {
				alert("id 중복체크 먼저");
				return false;
			}
		});
	});
</script>
</head>
<body>
<h3>회원가입</h3>
<form action="${pageContext.request.contextPath }/member/join.do" method="post">
	아이디:<input type="text" name="id" id="id"><input id="idCheck" type="button" value="중복체크">
		<span id="idResult"></span>
	<br>
	비번:<input type="password" name="pwd"><br>
	이름<input type="text" name="name"><br>
	이메일:<input type="text" name="email"><br>
		<input type="reset" value="취소하기">
		<input type="submit" value="가입하기" id="join">
</form>
</body>
</html>