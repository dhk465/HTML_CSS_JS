<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	request.setCharacterEncoding("utf-8");
%>

<!-- 자바빈 : 자바빈은 jsp페이지의 디자인과 로직부분을 나눔으로써, 복잡한 자바코드를 줄이고
             재사용성을 증가시킬수 있도록 하는 기능 -->
<!-- PersonVO p = new PersonVO(); 
     p.setName("홍길동");-->
     
<jsp:useBean id="p" class="vo.PersonVO"></jsp:useBean> 
 
<jsp:setProperty property="name" name="p" param="name"/>         
<jsp:setProperty property="age" name="p"/> 
<jsp:setProperty property="tel" name="p"/>

<%-- 
	<jsp:setProperty name="p" property="*"/>
 --%> 
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	
	<table border="1">
		
		<tr>
			<td>이름</td>
			<td><%= p.getName() %></td>
		</tr>
		
		<tr>
			<td>나이</td>
			<td><%= p.getAge() %></td>
		</tr>
		
		<tr>
			<td>전화번호</td>
			<td><%= p.getTel() %></td>
		</tr>
		
	</table>
	
</body>
</html>


























