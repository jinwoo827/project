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
			if($("#idResult").text().trim()=="��밡��"){
				$("form").submit();
			} else {
				alert("id �ߺ�üũ ����");
				return false;
			}
		});
	});
</script>
</head>
<body>
<h3>ȸ������</h3>
<form action="${pageContext.request.contextPath }/member/join.do" method="post">
	���̵�:<input type="text" name="id" id="id"><input id="idCheck" type="button" value="�ߺ�üũ">
		<span id="idResult"></span>
	<br>
	���:<input type="password" name="pwd"><br>
	�̸�<input type="text" name="name"><br>
	�̸���:<input type="text" name="email"><br>
		<input type="reset" value="����ϱ�">
		<input type="submit" value="�����ϱ�" id="join">
</form>
</body>
</html>