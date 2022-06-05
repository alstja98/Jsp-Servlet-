<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@page import = "com.el.score.Score" %>
<% request.setCharacterEncoding("UTF-8"); %>
<% response.setContentType("text/html; charset=UTF-8"); %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- 
	JSTL(JSP Standard Tag Library)
	Core(c): 변수, 반복문, 조건, 페이지이동
	Formatting(fmt): 숫자, 날짜, 시간을 포매팅
	DataBase(sql) 
	Xml(x)
	Function(fn)
 -->
	<h1>JSTL</h1>
	<table border = "1">
		<tr>
			<th>NAME</th>
			<th>KOR</th>
			<th>ENG</th>
			<th>MATH</th>
			<th>SUM</th>
			<th>AVG</th>
			<th>GRADE</th>
		</tr>
		<c:forEach items="${list}" var="score">
			<tr>	
				<td>
					<c:if test="${score.name eq '이름1' }">
						<c:out value="홍길동"></c:out>
					</c:if>
					<c:choose>
						<c:when test="${score.name eq '이름2'}">
							<c:out value="${score.name }님!"></c:out>
						</c:when>
						<c:when test="${score.name eq '이름3'}" >
							<c:out value="${score.name}님@@"></c:out>
						</c:when>
						<c:otherwise>
							<c:out value="누구임?"></c:out>
						</c:otherwise>
					</c:choose>
				</td>
				<td>${score.name }</td>
				<td>${score.kor }</td>
				<td>${score.eng }</td>
				<td>${score.math }</td>
				<td>${score.sum }</td>
				<td>${score.avg }</td>
				<td>${score.grade }</td>
			</tr>
		</c:forEach>
		
		<c:set var="test" value="jstl test" scope="session" />
		${test }
		<c:out value="${test }"></c:out>
	</table>
	
	<c:forEach var="i" begin="1" end="10">
		${i}<br>
	</c:forEach>
</body>
</html>