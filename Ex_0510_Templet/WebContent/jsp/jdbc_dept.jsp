<%@page import="vo.DeptVO"%>
<%@page import="java.util.List"%>
<%@page import="dao.DeptDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	DeptDAO dao = DeptDAO.getInstance();
	List<DeptVO> dept_list = dao.selectList();
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<table border="1">
		<caption>Department List</caption>
		<thead>
			<tr>
				<th>Dept ID</th>
				<th>Department</th>
				<th>Location</th>
			</tr>
		</thead>
		<tbody>
			<% for (int i = 0; i < dept_list.size(); i++) {			%>
			<tr>
				<td><%= dept_list.get(i).getDeptId() %></td>
				<td><%= dept_list.get(i).getDeptName() %></td>
				<td><%= dept_list.get(i).getLocation() %></td>
			</tr>
			<% } %>
		</tbody>
	</table>
</body>
</html>