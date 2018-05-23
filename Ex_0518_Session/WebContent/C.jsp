<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="history.jsp" %> 
    
<%
	Cookie cookie = new Cookie("C", "C.jsp");
	response.addCookie( cookie );
%>    
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>

<body>
	C.jsp에 방문해 주셔서 감사합니다.<br>
	<a href="A.jsp">A</a>
</body>

</html>









