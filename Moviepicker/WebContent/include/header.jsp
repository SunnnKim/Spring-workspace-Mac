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





