<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    [
    	<c:forEach var="list" items="${list }" varStatus="status">
    	<c:if test="${!status.first }">,</c:if>
    	
    	{"num":${list.num }, "title":"${list.title }", "writer_id":"${list.writer_id }", "w_date": "${list.w_date }",
    		"content":"${list.content }", "parent_num":"${list.parent_num }"
    	}
    </c:forEach>
    ]