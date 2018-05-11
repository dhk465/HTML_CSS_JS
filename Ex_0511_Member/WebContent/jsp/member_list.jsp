<%@page import="java.util.List"%>
<%@page import="vo.MemberVO"%>
<%@page import="dao.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	MemberDAO dao = MemberDAO.getInstance();
	List<MemberVO> member_list = dao.selectList();
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Member List</title>
<script>
	// add a member entry
	function send(form) {
		let email = form.email.value.trim();
		let reg_email = /^([a-zA-Z0-9_\-\.]+)@([a-zA-Z0-9_\-\.]+)\.([a-zA-Z]{2,5})$/;
	
		if( !reg_email.test( email ) ){
			alert("Email has an invalid format.");
			form.email.value = "";
			form.email.focus();
			return;
		}
		
		form.action = "member_register.jsp";
		form.method = "POST";
		form.submit();
	}
	
	// modify a member entry
	function update(idx) {
		location.href = "member_del.jsp?idx=" + idx;
	}
	
	// delete a member entry
	function del(idx) {
		if (confirm("Delete this entry?") == false) {
			return;
		}
		location.href = "member_del.jsp?idx=" + idx;
	}
</script>
</head>
<body>
	<form>
		<table border="1">
			<caption>Member List</caption>
			<thead>
				<tr>
					<th>ID</th>
					<th>Full Name</th>
					<th>Login Name</th>
					<th>Password</th>
					<th>Email</th>
					<th>Address</th>
					<th colspan="2">Modify/Delete</th>
				</tr>
			</thead>
			<tbody>
				<%	for (int i = 0; i < member_list.size(); i++) {
						MemberVO vo = member_list.get(i); %>
					<tr>
						<td><%= vo.getIdx() %></td>
						<td><%= vo.getName() %></td>
						<td><%= vo.getId() %></td>
						<td><%= vo.getPwd() %></td>
						<td><%= vo.getEmail() %></td>
						<td><%= vo.getAddr() %></td>
						<td><input type="button" value="Modify" onclick="update('<%=vo.getIdx()%>>');"></td>
						<td><input type="button" value="Delete" onclick="del('<%=vo.getIdx()%>');"></td>
					</tr>
				<% } %>
			<tr>
				<td>NEW</td>
				<td><input name="name"></td>
				<td><input name="id"></td>
				<td><input type="password" name="pwd"></td>
				<td><input name="email"></td>
				<td><input name="addr"></td>
				<td colspan="2"><input type="button" value="Register" onclick="send(this.form);"></td>
			</tr>
			</tbody>
		</table>
		<div style="display: none"><!-- TODO update function and the table --></div>
	</form>
</body>
</html>