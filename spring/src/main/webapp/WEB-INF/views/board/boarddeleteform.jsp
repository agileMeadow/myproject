<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Delete Post</title>
</head>
<body>

no: ${param.no }<br>
page: ${param.page }<br>

<form method=post action="boarddelete.do">
<input type="hidden" name="no" value="${param.no }">
<input type="hidden" name="page" value="${param.page }">
<table border=1 width=400 align=center>
	<caption>Delete Post</caption>
	
	<tr><th>Password</th>
		<td><input type=password name="passwd" required="required"></td>
	</tr>
	<tr><td colspan=2 align=center>
			<input type=submit value="Delete">
			<input type=reset value="Cancel">
		</td>
	</tr>
</table>
</form>

</body>
</html>