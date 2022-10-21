<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Post detail</title>
</head>
<body>
	<table border=1 width=400 align=center>
		<caption>Post detail</caption>
		<tr>
			<td>Writer</td>
			<td>${board.writer }</td>
		</tr>
		<tr>
			<td>Date</td>
			<td><fmt:formatDate value="${board.register }"
					pattern="dd-MM-yyyy HH:mm:ss" /></td>
		</tr>
		<tr>
			<td>View</td>
			<td>${board.readcount }</td>
		</tr>
		<tr>
			<td>Title</td>
			<td>${board.subject }</td>
		</tr>
		<tr>
			<td>Content</td>
			<td><pre>${board.content }</pre> ${content}</td>
		</tr>
		<tr>
			<td colspan=2 align=center>
			<input type="button" value="List"
			onClick ="location.href='boardlist.do?page=${page}' ">
			<input type="button" value="Edit"
			onClick="location.href='boardupdateform.do?no=${board.no}&page=${page}'"> 
			<input type="button" value="Delete"
			onClick="location.href='boarddeleteform.do?no=${board.no }&page=${page}'">
			</td>
		</tr>

	</table>

</body>
</html>