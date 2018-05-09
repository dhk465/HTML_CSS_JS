<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

	<script>
		
		function regi( f ){
			
			var id = f.id.value.trim();
			var pwd = f.pwd.value.trim();
			var age = f.age.value.trim();
			
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
			
			var p = /^[0-9]*$/;
			if( !p.test( age ) ){
				alert("나이는 정수로 입력하세요");
				f.age.focus();
				return;
			}
			
			f.submit();
			
		}//regi()
	
	</script>

</head>

<body>
	
	<form action="regi_success.jsp" method="post">
		
		ID : <input type="text" name="id" placeholder="아이디를 입력하세요"><br>
		PWD : <input type="password" name="pwd" placeholder="비밀번호를 입력하세요"><br>
		AGE : <input type="text" name="age" placeholder="나이를 입력하세요"><br>
		<input type="button" value="가입하기" onclick="regi(this.form);"> 
		
	</form>
	
</body>

</html>










