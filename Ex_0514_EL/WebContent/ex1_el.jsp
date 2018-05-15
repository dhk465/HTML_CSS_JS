<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	/*
	EL( Expression Language ) : JSP에서 사용하는 표현식을 간결하게 사용할수 있도록 해주는 표현 언어
	-EL로 값을 표현하려면 JSP의 내장객체를 통해 누구와 값을 공유할 것인지를 선택
	1) page영역
    2) request영역 : 지역개념으로 페이지가 닫히면 종료.
				       같은 request영역이면 두 개의 페이지가 하나의 요청을 공유할 수 있다.
				     request영역은 하나 또는 두 개의 페이지 내에서 값을 공유할 수 있다.
	3) session영역 : 전역개념으로 페이지가 닫혀도 남아있다.
				     session영역은 하나의 웹 브라우저당 1개씩 생성된다.
				     같은 웹 브라우저 내에서는 모든 페이지들이 값을 공유할 수 있다.
	4) application영역

	- EL 접근형식
	  ${ 영역.변수 }
	*/
	
	String msg = "안녕하세요";
	
	//page영역에 값을 저장
	pageContext.setAttribute("msg", msg);
	
	//request영역에 값을 저장
	request.setAttribute("msg", "requestScope 영역 호출");
	
	//session영역에 값을 저장
	session.setAttribute("msg2", "세션에 담긴 내용");
	
%>    
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>

<body>
	JSP기본 표현식 : <%= msg %> <br>
	
	EL표현식( 파라미터 ) : ${ param.str } <br>
	
	EL표현식(생략) : ${ msg } <br>
	<!-- EL표현식 영역 생략시 접근순서
	     1.pageScope
	     2.requestScope
	     3.sessionScope
	     4.applicationScope-->
	     
	EL표현식( requestScope ) : ${ requestScope.msg }	 <br>    
	     
	EL표현식( sessionScope ) : ${ sessionScope.msg2 }     
</body>

</html>


















































