<%@page import="bit.com.a.jsoup.MovieManager"%>
<%@page import="bit.com.a.jsoup.MovieDto"%>
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
<a href="main.do">main.do</a>
<%
List<MovieDto> list = MovieManager.getCGVdata();
System.out.println("size:" + list.size());
for(int i=0; i<list.size(); i++){
System.out.println("list(i) : " + list.get(i).toString());
	
}
%>
</body>
</html>