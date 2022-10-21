<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Post List</title>
</head>
<body>
	<a href="boardform.do">New post</a>
	<br> Total posts: ${listcount }
	<table border=1 align=center width=700>
		<caption>Post list</caption>
		<tr>
			<th>No.</th>
			<th>Title</th>
			<th>Writer</th>
			<th>Date</th>
			<th>View Count</th>
		</tr>

		<!-- Post List -->
		<c:set var="num" value="${listcount - (page-1) * 10 }" />
		<c:forEach var="b" items="${boardlist}">
			<tr>
				<td>${num }<c:set var="num" value="${num-1 }" />
				</td>
				<td>
				<a href="boardcontent.do?no=${b.no }&page=${page}"/>
				${b.subject }
				</td>
				<td>${b.writer }</td>
				<td>
				<fmt:formatDate value="${b.register }"
					 pattern="dd-MM-yyyy HH:mm:ss"/>
				</td>
				<td>${b.readcount }</td>
			</tr>
		</c:forEach>
	</table>
	
	<!-- Pagination -->
	<center>
	<c:if test="${listcount > 0 }">
	
	<!-- Move to page no.1 -->
	<a href="boardList.do?page=1" style="text-decoration:none"> << </a>
	
	<!-- Move to the previous block -->
	<c:if test="${startPage > 10 }">
	<a href="boardlist.do?page=${startPage-1 }" style="text-decoration:none">[Prev]</a>
	</c:if>
	
	<!-- Print 10 posts in each block -->
	<c:forEach var="i" begin="${startPage }" end="${endPage }">
	<c:if test="${i == page }"> <!-- Current Page -->
	 [${i }]
	</c:if>
	
	<c:if test="${i != page }"> <!-- Not a current Page -->
	 <a href="boardlist.do?page=${i}">[${i }]</a>
	</c:if>
	
	</c:forEach>
	
	<!-- Move to the next block -->
	<c:if test="${endPage < pageCount }">
	<a href="boardlist.do?page=${startPage+10 }" style="text-decoration:none">[Next]</a>
	</c:if>
	
	<!--  Move to the last page -->
	<a href="boardlist.do?page=${pageCount }" style="text-decoration:none"> >> </a>
	
	</c:if>
	</center>
	
</body>
</html>