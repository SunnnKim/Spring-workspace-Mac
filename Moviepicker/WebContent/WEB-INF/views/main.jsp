<%@page import="mpicker.com.a.model.MovieDto"%>
<%@page import="java.util.List"%>
<%@page import="mpicker.com.a.movie.MovieManager"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%

 List<MovieDto> list = MovieManager.getMaindata();
System.out.println("size:" +list.size());
%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Movie Picker</title>
</head>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/reset.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/header.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/footer.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/main.css">

<script src="https://kit.fontawesome.com/a9726fbbf3.js" crossorigin="anonymous"></script>
<link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR&display=swap" rel="stylesheet">
<body>
<div class="header-box">
    <div class="user-option">
        <a href="#"><span>JOIN</span></a>
        <a href="#"><span>LOGIN</span></a>
    </div>
    <div class="gnb">
        <ul>
            <li>
            	<a href="#">
	                <i class="fas fa-bars"></i>
 				</a>
            </li>
            <li><a href="#">Box Office</a></li>
            <li><a href="#">Tickets</a></li>
            <li><a href="#">Schedule</a></li>
            <li><a href="#">Comments</a></li>
            <li>
            	<a href="#">
                	<i class="fas fa-user-circle"></i>
            	</a>
            </li>
        </ul>
    </div>
    <div class="img">
        <img src="${pageContext.request.contextPath}/images/logo.png">
    </div> 
</div>

<div class="content-box">
	<div class="top-content">
		<p>BOX OFFICE</p>
	</div>
	<div class="depth2">
		<ul>
			<li><a href="#" class="on">예매율순</a></li>
			<li><a href="#">현재상영작</a></li>
			<li><a href="#">개봉예정작</a></li>
		</ul>
	</div>
	<div class="movies">
	
	<%
	if(list.size()>0){
		for(int i=0; i<list.size();i++){
			MovieDto dto = list.get(i);
			%>
				<div class="img">
					<a href="<%=dto.getUrl()%>">
						<img alt="영화 표지" src="<%=dto.getImgSrc()%>">
<!-- 						<img alt="영화 표지" src="http://img.cgv.co.kr/Movie/Thumbnail/Poster/000083/83126/83126_320.jpg"> -->
					</a>
					<div class="info">
						<strong><%= dto.getTitle() %></strong>
						<span>
							 <%= dto.getResereRate()%>
						</span>
					</div>
					<div class="heart">
						<!-- <i class="far fa-heart"> -->
						
						 <!-- </i> -->
					</div>
					
					<div class="reserve-btn hover1">
						예매하기
					</div>
				</div>
		
			<%
		}
	}else{
	%>
	
	
	<%
	}	
	%>
		
	</div>

	<div class="more-btn hover2">
		<i class="fas fa-search-plus"></i>
		<span>더 많은 영화보기</span>
	</div>
	
</div><!-- content-box  -->

<!-- Schedule-box -->
<div class="schedule-box">
	<div class="top-content">
		<p>RESERVATION</p>
	</div>
	<div class="mid-content">
		<div class="search">
			<input type="text" value="12" maxlength="50">
			<a href="#">
				<i class="fas fa-search"></i>
			</a>
		</div>
		<div class="btm-line">영화 제목으로 검색하기</div>
	</div>
	<div class="btm-content">
		<div class="sch-icon">
			<a href="#">
				<i class="far fa-calendar-alt"></i>
			</a>
		</div>
	
		<div class="btm-line2">영화 일정보기</div>
	
	</div>
	
	
	
</div><!-- Schedule-box -->

<!-- fixed image box -->
<div class="lastcontent-box">
	<div class="top-content">
		<p>Recommadation</p>
	</div>
</div>

<div class="footer">
    <div class="inner">
        <ul>
            <li>회사소개</li>
            <li>인재채용</li>
            <li>사회공헌</li>
            <li>광고/제휴/부대사업문의</li>
            <li>이용약관</li>
            <li>개인정보처리방침</li>
            <li>윤리경영</li>
        </ul>
        <div class="footer_logo">
            <img src="${pageContext.request.contextPath}/images/logo.png" alt="logo"/>
        </div>
        <p>
            <strong>Movie Picker</strong> 서울특별시 서초구 서초4동 강남대로 459<br>
            대표자명 김선주 · 개인정보보호책임자 김우중 · 사업자등록번호 10-3423-7750 · 통신판매업신고번호 제 60299호<br>
            COPYRIGHT © MoviePicker, Inc. All rights reserved
        </p>
        <div class="sns-content">
            <i class="fab fa-instagram"></i>
            <i class="fab fa-facebook-f"></i>
            <i class="fab fa-twitter"></i>
            <i class="fab fa-line"></i>
            <i class="fab fa-apple"></i>
        </div>
    </div>
</div>

</body>
</html>