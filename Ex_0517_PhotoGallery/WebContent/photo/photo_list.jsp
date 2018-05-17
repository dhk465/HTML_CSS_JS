<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../css/photo.css">
</head>
<body>
	<div id="main_box">
	
		<h1>:::갤러리:::</h1>
	
		<div align="center" style="margin:10px">
			<input type="button" value="사진등록" onclick="location.href='insert_form.do'">
		</div>
		
		<div id="photo_box">
			<c:if test="${ empty list }">
				<div align="center" style="margin-top:100px">등록된 사진이 없습니다.</div>
			</c:if>
			
			<c:forEach var="vo" items="${ list }">
				<div class="photo_type">
					<img alt="${ vo.getTitle() }" src="../upload/${ vo.getFilename() }">
					
					<div class="title">${ vo.getTitle() }</div>
					
					<div align="center">
						<input type="button" value="삭제">
					</div>
				</div>
			</c:forEach>
		</div>
	
	</div>
</body>
</html>