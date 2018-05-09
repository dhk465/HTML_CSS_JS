<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	request.setCharacterEncoding("utf-8");

	String name = request.getParameter("name");
	int age = Integer.parseInt( request.getParameter("age") );
	String tel = request.getParameter("tel");
%>    
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	
	<table border="1">
		
		<caption>수신된 데이터</caption>
		
		<tr>
			<td>이름</td>
			<td><%= name %></td>			
		</tr>
		
		<tr>
			<td>나이</td>
			<td><%= age %></td>			
		</tr>
		
		<tr>
			<td>전화번호</td>
			<td><%= tel %></td>			
		</tr>
	
	</table>
	
</body>
</html>

















