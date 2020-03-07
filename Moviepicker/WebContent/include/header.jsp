<%@page import="mpicker.com.a.model.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title id="title-tab">Document</title>
</head>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/reset.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/header.css">
<script src="https://kit.fontawesome.com/a9726fbbf3.js" crossorigin="anonymous"></script>
<link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR&display=swap" rel="stylesheet">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.min.js"></script>
<%
// session
MemberDto loginuser = (MemberDto)session.getAttribute("loginuser");
%>
<body>
<div class="header-box">

    <div class="user-option">
       <% if(loginuser==null){
		%>
	        <a href="join.do"><span>JOIN</span></a>
	        <a href="login.do"><span>LOGIN</span></a>
		<%
    	}else{
    		%>
	        <a href="mypage.do"><span>Mypage</span></a>
	        <a href="logout.do"><span>Logout</span></a>
    		<%
    	}
    	%>
    </div>
    <div class="gnb">
        <ul>
            <li>
            	<a href="#">
	                <i class="fas fa-bars"></i>
 				</a>
            </li>
            <li><a href="movielist.do?choice=now">Box Office</a></li>
            <li><a href="reserve.do">Tickets</a></li>
            <li><a href="#">Schedule</a></li>
            <li><a href="#">Comments</a></li>
            <li>
            <!-- 마이페이지 -> 예매내역 -->
            <% if(loginuser==null){
			%>
            	<a href="login.do" onclick="loginAlert()">
                	<i class="fas fa-user-circle"></i>
            	</a>
			<%
	    	}else{
	    		%>
            	<a href="mymovielist.do">
                	<i class="fas fa-user-circle"></i>
            	</a>
	    		<%
	    	}
	    	%>
            	
            </li>
        </ul>
    </div>
    <div class="img">
        <img src="${pageContext.request.contextPath}/images/logo.png" onclick="location.href='main.do?choice=now'">
    </div> 
</div>

<script type="text/javascript">

//로그인 안되어있을 시 경고 
function loginAlert(){
	alert('로그인이 필요합니다.');
}
</script>



