<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>

<body>	
	EL 기호연산<br>
	-EL산술연산자<br>
	
	${ 1 + 1 }<br>
	\${ 1 + 1 }<br>
	
	\${ 2 - 1 } = ${ 2 - 1 } <br>
	\${ 3 * 5 } = ${ 3 * 5 } <br>
	\${ 10 / 3 } = ${ 10 / 3 } <br>
	\${ 10 % 3 } = ${ 10 % 3 } <br>
	
	<hr>
	
	-EL비교연산자<br>
	\${ 3 > 2 } = ${ 3 > 2 } 또는 ${ 3 gt 2 }<br>
	\${ 3 ge 2 } = ${ 3 ge 2 } <br>
	
	\${ 3 < 2 } = ${ 3 lt 2 }<br>
	\${ 3 <= 2 } = ${ 3 le 2 }<br>
	
	\${ 3 == 2 } = ${ 3 eq 2 }<br>
	\${ 3 != 2 } = ${ 3 ne 2 }<br>
	
	<hr>
	
	-EL 삼항연산자<br>
	파라미터 값 : ${ empty param.msg ? '값 없음' : param.msg }<br>
	
	파라미터 값2 : ${ param.msg == null or param.msg == '' ? '값 없음' : param.msg }
</body>

</html>

































