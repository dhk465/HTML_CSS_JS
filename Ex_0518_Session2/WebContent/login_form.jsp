<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>   
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

	<script src="js/httpRequest.js"></script>
	<script>
		function send(f){
			
			var id = f.id.value.trim();
			var pwd = f.pwd.value.trim();
			
			if( id == '' ){
				alert("아이디를 입력하세요");
				f.id.focus();
				return;
			}
			
			if( pwd == '' ){
				alert("비밀번호를 입력하세요");
				f.pwd.focus();
				return;
			}

			var url = "login.do";
			var param = "id=" + encodeURIComponent(id) + 
						"&pwd=" + encodeURIComponent(pwd);
			
			sendRequest(url, param, resultFn, "POST");
			
		}//send()
		
		function resultFn(){
			
			if( xhr.readyState == 4 && xhr.status == 200 ){
				
				var data = xhr.responseText;
				var json = eval( data );
				
				if( json[0].param == 'no_id' ){
					alert("아이디가 존재하지 않습니다.");
					
				}else if( json[0].param == 'no_pwd' ){
					alert("비밀번호가 존재하지 않습니다.");
					
				}else if( json[0].param == 'clear' ){
					
					location.href = "clear.do";
					
				}
				
			}
			
		}
		
	</script>

</head>

<body>

	<form>
			
		<table border="1" align="center">
			
			<caption>:::로그인 페이지:::</caption>
			
			<tr>
				<th>아이디</th>
				<td><input name="id"></td>
			</tr>
			
			<tr>
				<th>비밀번호</th>
				<td><input type="password" name="pwd"></td>
			</tr>
			
			<tr>
				<td colspan="2">
					<input type="button" value="로그인" onclick="send(this.form);">
					<input type="reset" value="취소">
				</td>
			</tr>
			
		</table>
		
	</form>

</body>

</html>














