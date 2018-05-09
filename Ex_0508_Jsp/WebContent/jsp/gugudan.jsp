<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
	<html>
	<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Insert title here</title>
	
		<style>
			
			table{ border-collapse:collapse; }
			tr{ height:30px; }
			td{ width:110px; 
			    text-align:center;}
			
		</style>
	
	</head>
	
	<!-- html주석 : 보안성이 떨어짐 -->
	<%-- jsp주석 : 보안성이 좋다. --%>
	<%-- id:jjj
	     pwd:1234 --%>
	
	<body>
	
		<table border="1">
			
			<%for( int i = 1; i <= 9; i++ ){%>
			
				<tr>
					<%for( int j = 2; j <= 9; j++ ){ %>
						
						<td> <%=j%> * <%=i%> = <%=i * j%> </td>
						
					<%} %>
				</tr>
				
			<%} //outer %>
			
		</table>	
	
	</body>

</html>







































