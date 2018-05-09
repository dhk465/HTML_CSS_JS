<%@page import="vo.DeptVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.Context"%>
<%@page import="javax.naming.InitialContext"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	// a resource (context.xml) for tomcat to refer to
	InitialContext ic = new InitialContext();
	Context ctx = (Context) ic.lookup("java:comp/env");
	DataSource dataSource = (DataSource) ctx.lookup("jdbc/oracle_test");

	// DB connection object
	Connection conn = dataSource.getConnection();
	System.out.println("--- getConnection() ---");

	// sql
	String sql = "select * from dept";
	PreparedStatement pst = conn.prepareStatement(sql);

	// query via pst and then send the result via an ResultSet obj
	ResultSet rs = pst.executeQuery();

	// ArrayList to save the departments
	ArrayList<DeptVO> dept_list = new ArrayList<>();

	while (rs.next()) {
		DeptVO vo = new DeptVO();

		// save the current column value into vo
		vo.setDeptNO(rs.getInt("deptno"));
		vo.setdName(rs.getString("dname"));
		vo.setLoc(rs.getString("loc"));

		dept_list.add(vo);
	}

	for (int i = 0; i < dept_list.size(); i++) {
		System.out.println(dept_list.get(i).getdName());
	}

	rs.close();
	pst.close();
	conn.close(); // restores the maxActive to its set value (20)
					// otherwise, it will decrease every time someone connects
					// which results in an exception (21st connection cannot be accepted)
					// a large database/website would set it up in a large quantity.
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script>
	function send(data) {
		let form = document.getElementById("m_form");
		let hid = document.getElementById("hid");
		
		hid.value = data;
		
		form.submit();
	}
</script>
</head>
<body>
	<form action="employee_list.jsp" id="m_form">
		<table border="1">
			<caption>Department List</caption>
			<thead>
				<tr>
					<th>Department<br>ID
					</th>
					<th>Department<br>Name
					</th>
					<th>Location</th>
				</tr>
			</thead>
			<tbody>

				<%
					for (int i = 0; i < dept_list.size(); i++) {
						DeptVO vo = dept_list.get(i);
				%>

				<tr>

					<td><%=vo.getDeptNO()%></td>
					<td>
						<a href="javascript:send(<%=vo.getDeptNO()%>);" name="deptno">
							<%=vo.getdName()%>
						</a>
					</td>
					<td><%=vo.getLoc()%></td>

				</tr>

				<%
					}
				%>

			</tbody>
		</table>
		<input type="hidden" value="" id="hid" name="deptno">
	</form>
</body>
</html>