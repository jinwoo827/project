<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>


<script type="text/javascript">
	function del(num){
		var flag = confirm("����?");
		if(flag){
			location.href="<%=request.getContextPath()%>/board/del.do?num="+num;
		}
	}
	$(document).ready(function(){
		$("#submit").click(function(){
			var writer_id = f.writer_id.value;
			var title = f.title.value;
			var content = f.content.value;
			var parent_num = f.parent_num.value;
			var data = "writer_id="+writer_id+"&title="+title+"&content="+content+"&parent_num="+parent_num;
			var url = "/my/board/reply.do";
			
			
			
			$.ajax({
				type:"POST",
				data:data,
				url:url,
				success:function(data){
					console.log(data);
					var list = JSON.parse(data);
					$("#reply").text("");
					var str = "";
					for(i=0;i<list.length;i++){
						str += "����:"+list[i].title+"�ۼ���:"+list[i].writer_id +"�ۼ���:"+list[i].w_date +"����:"+list[i].content+"<hr>";
					}
					$("#reply").html(str);
				}
			});
		});
	});
</script>
</head>
<body>
<h3>�� ���λ���</h3>
<form action="${pageContext.request.contextPath }/board/edit.do" method="post">
	<table border="2">
	<tr>
		<td>�۹�ȣ</td><td><input type="text" name="num" value="${a.num }" readonly</td>
	</tr>
	<tr>
		<td>������</td><td><input type="text" name="title" value="${a.title }"</td>
	</tr>
	<tr>
		<td>�ۼ���</td>
		<td><input type="text" name="writer_id" value="${a.writer_id }" readonly</td>
	</tr>
	<tr>
		<td>����</td>
		<td><input type="text" name="content" value="${a.content }" </td>
	</tr>
	
	<tr>
		<td>�ۼ���</td>
		<td><input type="text" name="w_date" value="${a.w_date }" readonly</td>
	</tr>
	<tr>
		
		<c:if test="${sessionScope.id == a.writer_id }">
			<td colspan="2"> <input type="button" value="�ۻ���" onclick="del(${a.num})">
							<input type="submit" value="����">
			</td>
				
		</c:if>		
		
		<c:if test="${sessionScope.id != a.writer_id }">
			<td colspan="2"> �۱��Ѿ���
			</td>
				
		</c:if>		
	</tr>
	</table>

</form>
<hr>
<h3>����</h3>
<%-- <c:if test="${a.reps empty}">��۾���</c:if> --%>
<form name="f" action="${pageContext.request.contextPath }">
	<input type="text" value="${a.num }" name="parent_num">
	�ۼ���<input type="text" name="writer_id" value="${sessionScope.id }"<br>
	����<input type="text" name="title"<br>
	����<input type="text" name="content"<br>
	<input type="button" value="����ۼ�" id="submit">
</form>
<h3>

<div id="reply">
	<c:forEach var="list" items="${a.reps }">
	����:${list.title }�ۼ���:${list.writer_id }�ۼ���:${list.w_date }����:${list.content }<hr>
	</c:forEach>

</div>

</body>
</html>