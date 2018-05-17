<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>사진등록</title>
<script>
	function send(f) {
		let title = f.title.value.trim();
		let pwd = f.pwd.value.trim();
		let photo = f.photo.value;
		
		if (title == "") {
			alert("제목을 입력하세요.");
			f.title.focus();
			return;
		}
		if (pwd == "") {
			alert("비밀번호를 입력하세요.");
			f.pwd.focus();
			return;
		}		
		if (photo == "") {
			alert("사진을 선택하세요.");
			f.photo.focus();
			return;
		}		
		
		f.submit();
	}
</script>
</head>
<body>
	<form action="insert.do" method="POST" enctype="multipart/form-data">
		<table border="1" align="center">
			<tr>
				<th>제목</th>
				<td>
					<input name="title">
				</td>
			</tr>
			<tr>
				<th>비밀번호</th>
				<td>
					<input type="password" name="pwd">
				</td>
			</tr>
			<tr>
				<th>사진</th>
				<td>
					<input type="file" name="photo">
				</td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<input type="button" value="등록하기" onclick="send(this.form);">
					<input type="button" value="목록으로" onclick="location.href='list.do'">
				</td>
			</tr>
		</table>
	</form>
</body>
</html>