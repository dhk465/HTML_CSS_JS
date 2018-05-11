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
	#disp, #disp2 {
		position:absolute;
		width:280px;
		height:180px;
	}
	.addhead {
		background: #39464e;
		color: #fff;
	}
	caption {
		margin: 5px;
		font-weight: bold;
		border: 3px solid #335;
	}
</style>
<script>
		
	function del(id){
		
		if( confirm("Delete this entry?") == false ){
			// if refused
			return;
		}
		
		// if confirmed
		location.href="delete_entry.jsp?id=" + id;
		
	}
		
	function update(id, name, kor, eng, mat){
			
		let disp2 = document.getElementById("disp2");
		
		disp2.style.left = (window.innerWidth / 2 - 140) + "px";
		disp2.style.top = (window.innerHeight / 2 - 90) + "px";
		
		disp2.style.display = 'block';
		
		document.getElementsByName("id")[0].value = id;
		document.getElementsByName("name2")[0].value = name;
		document.getElementsByName("kor2")[0].value = kor;
		document.getElementsByName("eng2")[0].value = eng;
		document.getElementsByName("mat2")[0].value = mat;
		
		disp2.get
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
		let disp2 = document.getElementById("disp2");
		disp.style.display = "none";
		disp2.style.display = "none";
		document.getElementsByName("name")[0].value = "";
		document.getElementsByName("kor")[0].value = "";
		document.getElementsByName("eng")[0].value = "";
		document.getElementsByName("mat")[0].value = "";
	}
	
	function send(form) {
		let name = form.name.value.trim();
		let kor = form.kor.value.trim();
		let eng = form.eng.value.trim();
		let mat = form.mat.value.trim();
		
		if (name == '') {
			alert("Insert a name.");
			form.name.focus();
			return;
		}
		
		let number = /^[0-9]+$/;
		if (!number.test(kor) || kor < 0 || kor > 100) {
			alert(`${kor} contains an invalid input.`);
			form.kor.value = '';
			form.kor.focus();
			return;
		}
		if (!number.test(eng) || eng < 0 || eng > 100) {
			alert(`${eng} contains an invalid input.`);
			form.eng.value = '';
			form.eng.focus();
			return;
		}
		if (!number.test(mat) || mat < 0 || mat > 100) {
			alert(`${mat} contains an invalid input.`);
			form.mat.value = '';
			form.mat.focus();
			return;
		}
		
		form.action = "score_register.jsp";
		form.submit();
	}
	function send2(form) {
		let name = form.name2.value.trim();
		let kor = form.kor2.value.trim();
		let eng = form.eng2.value.trim();
		let mat = form.mat2.value.trim();
		
		if (name == '') {
			alert("Insert a name.");
			form.name2.focus();
			return;
		}
		
		let number = /^[0-9]+$/;
		if (!number.test(kor) || kor < 0 || kor > 100) {
			alert(`${kor} contains an invalid input.`);
			form.kor2.value = '';
			form.kor2.focus();
			return;
		}
		if (!number.test(eng) || eng < 0 || eng > 100) {
			alert(`${eng} contains an invalid input.`);
			form.eng2.value = '';
			form.eng2.focus();
			return;
		}
		if (!number.test(mat) || mat < 0 || mat > 100) {
			alert(`${mat} contains an invalid input.`);
			form.mat2.value = '';
			form.mat2.focus();
			return;
		}
		
		form.action = "score_update.jsp";
		form.submit();
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
				<th colspan="2"></th>
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
				<td><input type="button" value="Modify" onclick="update('<%= vo.getId() %>','<%= vo.getName() %>','<%= vo.getKor() %>','<%= vo.getEng() %>','<%= vo.getMat() %>');"></td>
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
	<div id="disp2" style="display:none">
		<form action="">
			<input type="hidden" name="id">
			<table>
				<caption>Modify exam results</caption>
				<tr>
					<th class="addhead">Name</th>
					<td>
						<input type="text" placeholder="Name" name="name2">
					</td>
				</tr>
				<tr>
					<th class="addhead">Korean</th>
					<td>
						<input type="text" placeholder="between 0 and 100" name="kor2">
					</td>
				</tr>
				<tr>
					<th class="addhead">English</th>
					<td>
						<input type="text" placeholder="between 0 and 100" name="eng2">
					</td>
				</tr>
				<tr>
					<th class="addhead">Mathematics</th>
					<td>
						<input type="text" placeholder="between 0 and 100" name="mat2">
					</td>
				</tr>
				<tr>
					<td colspan="2" align="center">
						
						<input type="button" value="Confirm" onclick="send2(this.form);">
					 	<input type="button" value="Cancel" onclick="cancel();">
						
					</td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>