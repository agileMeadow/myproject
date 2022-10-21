<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>updateresult</title>
</head>
<body>

	<c:if test="${result == 1 }">
		<script>
			alert("Successfully updated.");
			location.href ="boardlist.do?page=${page}"; //List page
			//	location.href="boardcontent.do?no=${board.no}&page=${page}";	//Detail page
		</script>
	</c:if>

	<c:if test="${result != 1 }">
		<script>
			alert("Failed to update.");
			history.go(-1);
		</script>
	</c:if>

</body>
</html>