<%@page import="vo.PersonVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   
<!-- c(Core) : if, choose, forEach와 같은 제어문을 사용할 수 있도록 하는 라이브러리 -->    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    

<!-- fmt( format ) : 출력형식( 날짜, 숫자 ) -->
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    
<%
	//JSTL( JSP Standard Tag Library )
	//연산이나 조건, 반복문인 if, for문 등을 태그 영역 안에서 편하게 처리할 수 있도록 준비된 라이브러리
%>    

<%
	//현재 년/월/일/시/분/초
	Date today = new Date();
	request.setAttribute("today", today);
	
	int money = 12000000;
	request.setAttribute("money", money);
	
	//배열
	String[] fruit_arr = { "사과", "배", "포도", "참외" };
	request.setAttribute("arr", fruit_arr);
	
	//리스트
	ArrayList<String> sido = new ArrayList<>();
	sido.add("서울");
	sido.add("경기");
	sido.add("인천");
	sido.add("대전");
	sido.add("대구");
	sido.add("광주");
	sido.add("부산");
	
	request.setAttribute("sido", sido);
	
	PersonVO vo1 = new PersonVO();
	vo1.setName("홍길동");
	vo1.setAge(20);
	
	PersonVO vo2 = new PersonVO();
	vo2.setName("김길동");
	vo2.setAge(30);
	
	PersonVO vo3 = new PersonVO();
	vo3.setName("박길동");
	vo3.setAge(40);
	
	ArrayList<PersonVO> p_list = new ArrayList<>();
	p_list.add(vo1);
	p_list.add(vo2);
	p_list.add(vo3);
	
	request.setAttribute("p_list", p_list);
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

	JSTL의 fmt<br>
	<fmt:formatDate value="${ today }"/> <br>
	<fmt:formatDate value="${ today }" pattern="yyyy년 MM월 dd일"/> <br>
	
	잔고 : <fmt:formatNumber value="${ money }"/>원

	<hr>
	
	<ul>
		<!-- var : 한바퀴 돌때마다 변화된 begin값을 갱신
		     begin : 시작값
		     end : 끝 값
		     step : 증가값     -->
		<c:forEach var="n" begin="1" end="5" step="1">
		
			<c:if test="${ n mod 2 eq 1 }">
				<li> <font color="red">안녕( ${ n } )</font> </li>
			</c:if>
		
			<c:if test="${ n mod 2 eq 0 }">
				<li> <font color="green">안녕( ${ n } )</font></li>
			</c:if>
		</c:forEach>
	
	</ul>
	
	<hr>
	
	배열을 출력하는 forEach문
	<ul>
	
		<!-- for( String fruit : arr ){  } -->
		<c:forEach var="fruit" items="${ arr }">
		
			<li>${ fruit }</li>
		
		</c:forEach>
	
	</ul>
	
	<hr>
	
	<ul>
	
		<!-- for( String value : sido ){  } -->
		<c:forEach var="value" items="${ sido }">
			
			<li>
				${ value }
			</li>
		
		</c:forEach>
	
	</ul>
	
	<hr>
	
	인덱스로 접근하기
	<ul>
	
		<c:forEach var="value" items="${ sido }" varStatus="cnt">
			
			<li>
				<!-- cnt.count : 순번(1부터)
				     cnt.index : index(0부터) -->
				     
				<c:if test="${ cnt.count mod 2 eq 0 }">     
					${ cnt.count } / ${ cnt.index }
				</c:if>
			</li>
			
		</c:forEach>
	
	</ul>
	
	<hr>
	
	<ul>
	
		<c:forEach var="p" items="${ p_list }">
		
			<li>
				${ p.name } / ${ p.age }
			</li>
		
		</c:forEach>
	
	</ul>
	
	
</body>
</html>


























