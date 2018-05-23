<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="history.jsp" %> 
    
<%
	Cookie cookie = new Cookie("B", "B.jsp");

	//지속성 추가
	//시간설정을 하지 않으면 세션쿠키
	//시간설정을 하면 해당 시간동안 영구적으로 보관되는 쿠키
	cookie.setMaxAge( 2 * 60 );//2분간 유효한 쿠키(초단위)

	response.addCookie( cookie );
%>    
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>

<body>
	B.jsp에 방문해 주셔서 감사합니다.<br>
	<a href="C.jsp">C</a>
</body>

</html>










