<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<% 
	String[] fruit_array = { "사과", "배", "참외", "오렌지", "복숭아" };
%>    
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Insert title here</title>
	</head>
	
	<body>
	
		<ul>
			<%for( int i = 0; i < fruit_array.length; i++ ){%>
				
				<li><%= fruit_array[i] %></li>
			
			<%}%>
		</ul>
	
	</body>
</html>
















