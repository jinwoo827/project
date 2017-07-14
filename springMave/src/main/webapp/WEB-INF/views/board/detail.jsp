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
		var flag = confirm("삭제?");
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
						str += "제목:"+list[i].title+"작성자:"+list[i].writer_id +"작성일:"+list[i].w_date +"내용:"+list[i].content+"<hr>";
					}
					$("#reply").html(str);
				}
			});
		});
	});
</script>
</head>
<body>
<h3>글 세부사항</h3>
<form action="${pageContext.request.contextPath }/board/edit.do" method="post">
	<table border="2">
	<tr>
		<td>글번호</td><td><input type="text" name="num" value="${a.num }" readonly</td>
	</tr>
	<tr>
		<td>글제목</td><td><input type="text" name="title" value="${a.title }"</td>
	</tr>
	<tr>
		<td>작성자</td>
		<td><input type="text" name="writer_id" value="${a.writer_id }" readonly</td>
	</tr>
	<tr>
		<td>내용</td>
		<td><input type="text" name="content" value="${a.content }" </td>
	</tr>
	
	<tr>
		<td>작성일</td>
		<td><input type="text" name="w_date" value="${a.w_date }" readonly</td>
	</tr>
	<tr>
		
		<c:if test="${sessionScope.id == a.writer_id }">
			<td colspan="2"> <input type="button" value="글삭제" onclick="del(${a.num})">
							<input type="submit" value="수정">
			</td>
				
		</c:if>		
		
		<c:if test="${sessionScope.id != a.writer_id }">
			<td colspan="2"> 글권한없음
			</td>
				
		</c:if>		
	</tr>
	</table>

</form>
<hr>
<h3>뎃글</h3>
<%-- <c:if test="${a.reps empty}">댓글없음</c:if> --%>
<form name="f" action="${pageContext.request.contextPath }">
	<input type="text" value="${a.num }" name="parent_num">
	작성자<input type="text" name="writer_id" value="${sessionScope.id }"<br>
	제목<input type="text" name="title"<br>
	내용<input type="text" name="content"<br>
	<input type="button" value="댓글작성" id="submit">
</form>
<h3>

<div id="reply">
	<c:forEach var="list" items="${a.reps }">
	제목:${list.title }작성자:${list.writer_id }작성일:${list.w_date }내용:${list.content }<hr>
	</c:forEach>

</div>

</body>
</html>