<%@page import="java.util.ArrayList"%>
<%@page import="vo.PersonVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	PersonVO vo = new PersonVO();
	vo.setName("홍길동");
	vo.setAge(20);
	
	//requestScope에 vo를 저장
	request.setAttribute("vo", vo);
	
	ArrayList<PersonVO> arr = new ArrayList<>();
	arr.add(vo);
	
	vo = new PersonVO();
	vo.setName("김길동");
	vo.setAge(30);
	
	arr.add(vo);
	
	request.setAttribute("arr", arr);
	
%>  
  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>

<body>
	
	이름 : ${ requestScope.vo.name }<br>
	나이 : ${ vo.age } 또는 ${ vo['age'] }
	
	<hr>
	
	이름 : ${ arr[0].name }<br>
	나이 : ${ arr[0].age }<br>
	
	이름 : ${ arr[1].name }<br>
	나이 : ${ arr[1].age } 
	
</body>

</html>
























