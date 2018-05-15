<%@page import="org.json.simple.JSONArray"%>
<%@page import="java.util.ArrayList"%>
<%@page import="vo.MovieVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/json; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	List<MovieVO> list = new ArrayList<>();
	list.add(new MovieVO("Dirty Computer Trailer", "../movie/Dirty Computer Trailer.mp4"));
	list.add(new MovieVO("Come Alive", "../movie/Come Alive Kinetic Typography.mp4"));
	list.add(new MovieVO("I Like That", "../movie/I_Like_That.mp4"));
	
	// arraylist --(convert into)-> json array
	out.print(JSONArray.toJSONString(list));
%>
