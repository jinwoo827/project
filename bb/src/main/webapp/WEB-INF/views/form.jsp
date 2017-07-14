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
			$.post("idCheck.do", {id:$("#id").val()}).done(function(data){
				$("#idResult").text(data);
			});
		});
		
		$("#join").click(function(){
			
			if($("#idResult").text().trim() == "true"){
				
				$("form").submit();
			} else {
				alert("id 중복체크 먼저");
			}
		});
	});
</script>

</head>
<body>
<h3>회원가입</h3>
	<form action="${pageContext.request.contextPath }/join.do" method="post">
		id:<input type="text" name="id" id="id">
			<input type="button" id="idCheck" value="id 중복체크"><span id="idResult"></span><br>
		pwd:<input type="password" name="pwd"><br>
		name:<input type="text" name="name"><br>
		email:<input type="text" name="email"><br>
			<input type="reset" value="취소">
			<input type="button" value="가입" id="join"><br>	
	</form>
</body>
</html>