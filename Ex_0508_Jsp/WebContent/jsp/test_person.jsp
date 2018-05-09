<%@page import="vo.PersonVO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	
	ArrayList<PersonVO> pList = new ArrayList<>();
	pList.add( new PersonVO( "홍길동", 20, "010-111-2222" ) );
	pList.add( new PersonVO( "박길동", 23, "010-222-3333" ) );
	pList.add( new PersonVO( "조길동", 25, "010-333-4444" ) );
	pList.add( new PersonVO( "이길동", 39, "010-444-5555" ) );

%>    
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Insert title here</title>
		
		<style>
			.td3{width:150px;}
			td{ width:100px;
			    text-align:center; }
		</style>
		
	</head>
	
	<body>
	
		<table border="1">
			<caption>회원정보</caption>
		
			<tr>
				<td>이름</td>
				<td>나이</td>
				<td>전화번호</td>
			</tr>
					
			<% for( int i = 0; i < pList.size(); i++ ){ %>		
					
					<tr>
						<td> <%=pList.get(i).getName() %> </td>
						<td> <%=pList.get(i).getAge() %> </td>
						<td class="td3"> <%=pList.get(i).getTel() %></td>
					</tr>
					
			<% } %>		
		</table>
	
	</body>
</html>


























