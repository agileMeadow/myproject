<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Edit Post</title>
</head>
<body>

<form method=post action="boardupdate.do">
<input type="hidden" name="no" value="${board.no }">
<input type="hidden" name="page" value="${page }">
<table border=1 width=400 align=center>
	<caption>Edit Post</caption>
	<tr><th>Writer</th>
		<td><input type=text name="writer" required="required"
		value="${board.writer }" autofocus="autofocus"></td>
	</tr>
	<tr><th>Password</th>
		<td><input type=password name="passwd" required="required"></td>
	</tr>
	<tr><th>Title</th>
		<td><input type=text name="subject" required="required" value="${board.subject }"></td>
	</tr>
	<tr><th>Content</th>
		<td><textarea cols=40 rows=5 name="content" required="required">${board.content }</textarea></td>
	</tr>
	<tr><td colspan=2 align=center>
			<input type=submit value="Edit">
			<input type=reset value="Cancel">
		</td>
	</tr>
</table>
</form>

</body>
</html>