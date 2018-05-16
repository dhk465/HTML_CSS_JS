<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="../js/httpRequest.js"></script>
<script>
	let b_idCheck = false;

	function send(f) {
		
		let id = f.id.value.trim();
		let pwd = f.pwd.value.trim();
		let name = f.name.value.trim();
		let email = f.email.value.trim();
		let addr = f.addr.value.trim();
		
		// TODO 유효성 체크
		
		if( !b_idCheck ){
			alert("아이디 중복체크를 먼저 하세요");
			return;
		}
		
		f.action = "insert.do";
		f.method = "POST";
		f.submit();
		
	}
	
	function check_id() {
		let id = document.getElementById("id").value.trim();
		if (id == '') {
			alert("아이디를 입력하세요.");
			return;
		}
		
		// id를 ajax를 통해 서버로 전송
		let url = "check_id.do";
		
		// id에 @#같은 특수문자가 포함되어 있는 경우를 대비하여 인코딩
		let param = "id=" + encodeURIComponent(id);
		
		sendRequest(url, param, result, "GET");
	}
	
	function result() {
		
		if (xhr.readyState == 4 && xhr.status == 200) {
			// 도착한 데이터를 읽는다
			let data = xhr.responseText;
			//alert(data);
			
			// 도착한 데이터를 JSON표기법으로 파싱
			let json = eval(data);
			
			if (json[0].result == 'no') {
				alert(json[1].id + '은(는) 이미 사용중인 아이디 입니다.');
				return;
			}
			
			alert(json[1].id + '은(는) 사용 가능한 아이디입니다.');
			
			b_idCheck = true;
			
			// 사용 가능 할시 더이상 변경이 불가능하도록 비활성화
			document.getElementById("id").readOnly = true;
		}
		
	}
</script>
<style>
	.centered {
		text-align: center;
	}
	table {
		border-collapse: collapse;
	}
	caption {
		font: bold 1.2em sans-serif;
	}
</style>
</head>
<body>
	<form>
		<table border="1">
			<caption>:::회원가입:::</caption>
			<tr>
				<th>아이디</th>
				<td>
					<input name="id" id="id">
					<input type="button" value="중복체크" onclick="check_id();">
				</td>
			</tr>
			<tr>
				<th>비밀번호</th>
				<td>
					<input name="pwd" id="pwd">
				</td>
			</tr>
			<tr>
				<th>이름</th>
				<td>
					<input name="name">
				</td>
			</tr>
			<tr>
				<th>이메일</th>
				<td>
					<input name="email">
				</td>
			</tr>
			<tr>
				<th>주소</th>
				<td>
					<input name="addr">
				</td>
			</tr>
			<tr>
				<td colspan="2" class="centered">
					<input type="button" value="가입" onclick="send(this.form);">
					<input type="button" value="취소" onclick="location.href='member_list.do'">
				</td>
			</tr>
		</table>
	</form>
</body>
</html>