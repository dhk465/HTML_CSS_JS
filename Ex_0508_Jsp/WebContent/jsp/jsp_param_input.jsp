<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

	<script>
		
		function send1( f ){
			
			var name = f.name.value.trim();
			var age = f.age.value.trim();
			var tel = f.tel.value.trim();
			
			check( name, age, tel );
			
			f.action = "test_param1.jsp";
			f.submit();
			
		}//send1()
		
		function send2( f ){
			
			var name = f.name.value.trim();
			var age = f.age.value.trim();
			var tel = f.tel.value.trim();
			
			check( name, age, tel );
			
			f.action = "test_param2.jsp";
			f.submit();
			
		}//send1()
	
		function check( name, age, tel ){
			
			if( name == '' ){
				alert("이름을 입력하세요");
				return;
			}
			
			var p = /^[0-9]*$/;
			if( !p.test( age ) ){
				alert("나이는 정수로 입력하세요");
				return;
			}
			
			if( tel == '' ){
				alert("전화번호를 입력하세요");
			}
			
		}//check()
	
	</script>

</head>

<body>
	
	<form>
		
		이름:<input name="name"><br>
		나이:<input name="age"><br>
		전화:<input name="tel"><br>
		
		<input type="button" value="낱개로 받기" onclick="send1(this.form);"> 
		<input type="button" value="객체로 받기" onclick="send2(this.form);"> 
		
	</form>
	
</body>

</html>



































