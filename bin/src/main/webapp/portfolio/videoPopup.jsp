<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<% request.setCharacterEncoding("utf-8"); %>
<% response.setContentType("text/html; charset=utf-8"); %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="hContext" value="${pageContext.request.contextPath }"></c:set>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<c:choose>
		<c:when test="${EmptyData==null}">
			<video src="${hContext}/resources/video/${pjtFileVO.savePNm}.${pjtFileVO.ext}" width="500" height="400" align="center" controls autoplay/>
		</c:when>
		<c:otherwise>
			<img src="${hContext}/resources/images/noVideo.png" width="500" height="400" align="center"/>
		</c:otherwise>
	</c:choose>
	
</body>
</html>