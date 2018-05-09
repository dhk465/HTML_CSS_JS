<%@page import="vo.UserVO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	request.setCharacterEncoding("utf-8");
%>

<jsp:useBean id="uv" class="vo.UserVO"></jsp:useBean>
<%-- <jsp:setProperty property="*" name="uv"/> --%>
<jsp:setProperty property="id" name="uv"/>
<jsp:setProperty property="pwd" name="uv"/>
<jsp:setProperty property="age" name="uv"/>

<%!
	ArrayList<UserVO> arr = new ArrayList<>();
%>

<%	
	arr.add(uv);
%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	
	<form action="test_join.jsp">
		
		<table border="1">
			
			<tr>
				<th>ID</th>
				<th>PWD</th>
				<th>AGE</th>
			</tr>
			
			<% for( UserVO vo : arr ){ %>
			
				<tr>
					<td> <%= vo.getId() %> </td>
					<td> <%= vo.getPwd() %> </td>
					<td> <%= vo.getAge() %> </td>
				</tr>
			
			<% } %>
			
			<input type="submit" value="확인">
			<!-- 
			<input type="button" value="확인" onclick="location.href='test_join.jsp'"> 
			-->
			
		</table>
			
	</form>
	
</body>
</html>





























