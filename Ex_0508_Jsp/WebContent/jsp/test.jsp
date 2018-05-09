<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<% 
	//스크립트 릿(Scriptlet) : jsp에서 자바코드를 사용하고자 할 때 지정하는 영역
	//request는 서블릿의 객체지만, 구조상 jsp가 서블릿으로 변환되어 실행되기 때문에 사용 가능
	String ip = request.getRemoteAddr();
%>    
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
	<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Insert title here</title>
	</head>
	
	<body>
		
		<p> &lt;%@ 내용 %&gt; : jsp헤더 - 전송시 인코딩, 페이지 인코딩, import문장등을 설정할 때 필요</p> 
		<p> &lt;% 자바코드 %&gt; : 스크립트릿 - jsp에서 자바코드를 사용하고자 할 때 지정하는 영역</p>
		<p> &lt;%=변수명%&gt; : 스크립트 릿의 변수를 출력하는 코드</p>
		<p> &lt;%=변수명;%&gt; : 다음과 같이 변수명에 ;을 사용할 수 없다.</p>
		
		<%= ip %> 님 환영합니다.
		
	</body>
</html>
































