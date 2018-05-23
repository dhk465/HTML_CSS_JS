<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	//쿠키정보를 읽어올 페이지
	//쿠키는 클라이언트에 저장되기 때문에 request를 통해 읽어온다.
	Cookie[] cookies = request.getCookies();
	
	StringBuffer sb = new StringBuffer();
	
	if( cookies != null ){
		
		sb.append("<ul>");
		
		for( Cookie c : cookies ){
			
			if( !c.getName().equalsIgnoreCase( "JSESSIONID" ) ){
				
				String str = String.format( "<li><a href='%s'>%s'</a></li>", 
														c.getValue(), c.getName() );
				sb.append(str);
				
			}
			
		}
		
		sb.append("</ul>");
		
	}

%>    
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

	<style>
		#box{
			position:absolute;
			left:300px;
			top:50px;
			width:200px;
			height:300px;
			border:2px solid red;		
		}
	</style>

</head>

<body>
	
	<div id="box">
		최근 방문 페이지
		<%= sb.toString() %>
	</div>
	
</body>

</html>














