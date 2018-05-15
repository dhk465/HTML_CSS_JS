<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	//EL표현식에서 Map의 내용을 출력
	Map<String, String> map = new HashMap<>();
	map.put( "key1", "안녕하세요" );
	map.put( "user", "test_oracle" );
	map.put( "pwd", "1111");
	
	//map이 Scope영역중 한군데에는 들어가 있어야 EL표현식 가능
	request.setAttribute("map1", map);
%>    
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>

<body>
	${ requestScope.map1.get("key1") }<br>
	${ map1.get("user") }<br>
	${ map1['pwd'] }<br>
	${ map1.user }<br>
</body>

</html>










