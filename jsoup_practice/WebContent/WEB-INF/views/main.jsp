<%@page import="bit.com.a.jsoup.MovieDto"%>
<%@page import="bit.com.a.jsoup.MovieManager"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>main.do</h1>
<%
	List<MovieDto> list = MovieManager.getCGVdata();
	System.out.println(list.size());

%>
</body>
</html>