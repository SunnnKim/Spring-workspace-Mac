<%@page import="mpicker.com.a.model.MovieDto"%>
<%@page import="java.util.List"%>
<%@page import="mpicker.com.a.movie.MovieManager"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<!-- 
<a href="main.do?choice=now">main.do</a>
 -->
<a href="movielist.do?choice=now">main.do</a>
<%
MovieDto dto = MovieManager.getMovieDetail("/moviedb/main?movieId=119916");
List<MovieDto> list = MovieManager.getMaindata("https://movie.daum.net/premovie/released");
for(int i=0; i<list.size(); i++) {
}

%>
</body>
</html>