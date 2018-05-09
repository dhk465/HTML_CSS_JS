<%@page import="vo.EmpVO"%>
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
	//a resource (context.xml) for tomcat to refer to
	InitialContext ic = new InitialContext();
	Context ctx = (Context) ic.lookup("java:comp/env");
	DataSource dataSource = (DataSource) ctx.lookup("jdbc/oracle_test");

	// DB connection object
	Connection conn = dataSource.getConnection();

	// sql
	String deptNO = request.getParameter("deptno");
	String sql = "select * from employees where dept=";
	PreparedStatement pst = conn.prepareStatement(sql + deptNO);
	
	// query via pst and then send the result via an ResultSet obj
	ResultSet rs = pst.executeQuery();

	// ArrayList to save the employees info
	ArrayList<EmpVO> emp_list = new ArrayList<>();

	while (rs.next()) {
		EmpVO vo = new EmpVO();
		
		// save the current employee info to vo
		vo.setEmpID(rs.getInt("emp_id"));
		vo.setEmpName(rs.getString("name"));
		vo.setEmpPos(rs.getString("position"));
		vo.setDeptID(rs.getInt("dept"));
		
		emp_list.add(vo);
	}
	
	for (int i = 0; i < emp_list.size(); i++) {
		System.out.println(emp_list.get(i).getEmpName());
	}
	
	rs.close();
	pst.close();
	conn.close();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<table border="1">
			<caption>Dept. <%=deptNO%> Employee List</caption>
			<thead>
				<tr>
					<th>Employee ID</th>
					<th>Name</th>
					<th>Position</th>
				</tr>
			</thead>
			<tbody>

				<%
					for (int i = 0; i < emp_list.size(); i++) {
						EmpVO vo = emp_list.get(i);
				%>

				<tr>

					<td><%=vo.getEmpID()%></td>
					<td><%=vo.getEmpName()%></td>
					<td><%=vo.getEmpPos()%></td>

				</tr>

				<%
					}
				%>

			</tbody>
		</table>
</body>
</html>