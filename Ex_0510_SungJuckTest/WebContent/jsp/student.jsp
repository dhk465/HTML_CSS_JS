<%@page import="java.text.DecimalFormat"%>
<%@page import="vo.TestVO"%>
<%@page import="java.util.List"%>
<%@page import="dao.TestDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	TestDAO dao = TestDAO.getInstance();
	List<TestVO> score_list = dao.selectList();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Test Score Table</title>
<style>
	table {
		border: 1px solid #777;
		text-align: center;
		border-collapse: collapse;
	}
	thead th {
		border-bottom: 2px solid #333;
	}
	tbody td {
		border-bottom: 1px solid #888;
	}
	th, td {
		padding: 10px 30px;
	}
	#disp {
		position:absolute;
		width:280px;
		height:180px;
	}
	.addhead {
		background: #39464e;
		color: #fff;
	}
</style>
<script>
		
		function del(no){
			
			if( confirm("Delete this entry?") == false ){
				// if refused
				return;
			}
			
			// if confirmed
			location.href="delete_entry.jsp?no=" + no;
			
		}
		
		function show_form() {
			let disp = document.getElementById("disp");
			disp.style.display = "block";
			
			// center
			disp.style.left = (window.innerWidth / 2 - 140) + "px";
			disp.style.top = (window.innerWidth / 2 - 90) + "px";
		}
	
		function cancel() {
			let disp = document.getElementById("disp");
			disp.style.display = "none";
			document.getElementsByName("name")[0].value = "";
			document.getElementsByName("kor")[0].value = "";
			document.getElementsByName("eng")[0].value = "";
			document.getElementsByName("mat")[0].value = "";
		}
	</script>
</head>
<body>
	<table>
		<caption>Test Scores</caption>
		<thead>
			<tr>
				<th>ID</th>
				<th>Name</th>
				<th>Korean</th>
				<th>English</th>
				<th>Mathematics</th>
				<th>Total</th>
				<th>Average</th>
				<th>Rank</th>
				<th></th>
			</tr>
		</thead>
		<tbody>
			<% for (int i = 0; i < score_list.size(); i++) {
				TestVO vo = score_list.get(i);
			%>
			<tr>
				<td><%= vo.getId() %></td>
				<td><%= vo.getName() %></td>
				<td><%= vo.getKor() %></td>
				<td><%= vo.getEng() %></td>
				<td><%= vo.getMat() %></td>
				<td><%= vo.getSum() %></td>
				<td><%= vo.getAvg() /* new DecimalFormat("#.##").format(avg) */ /* String.format("%.2f", avg) */ %></td>
				<td><%= vo.getRank() %></td>
				<td><input type="button" value="Delete" onclick="del('<%= vo.getId() %>');"></td>
			</tr>
			<% } %>
			<tr>
				<td>
					<input type="button" value="More" id="bt_append" onclick="show_form();">
				</td>
			</tr>
		</tbody>
	</table>
	<div id="disp" style="display:none">
		<form action="">
			<table>
				<caption>Add exam results</caption>
				<tr>
					<th class="addhead">Name</th>
					<td>
						<input type="text" placeholder="Name" name="name">
					</td>
				</tr>
				<tr>
					<th class="addhead">Korean</th>
					<td>
						<input type="text" placeholder="between 0 and 100" name="kor">
					</td>
				</tr>
				<tr>
					<th class="addhead">English</th>
					<td>
						<input type="text" placeholder="between 0 and 100" name="eng">
					</td>
				</tr>
				<tr>
					<th class="addhead">Mathematics</th>
					<td>
						<input type="text" placeholder="between 0 and 100" name="mat">
					</td>
				</tr>
				<tr>
					<td colspan="2" align="center">
						
						<input type="button" value="Add" onclick="send(this.form);">
					 	<input type="button" value="Cancel" onclick="cancel();">
						
					</td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>