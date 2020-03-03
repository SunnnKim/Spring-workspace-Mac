<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../include/header.jsp" %><!-- header -->
<%@ include file="../../include/location.jsp" %><!-- location -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/moviedetail.css">


<!-- Movie Detail -->
<div class="content-box">
	<div class="detail-img">
		<img src="https://img1.daumcdn.net/thumb/C155x225/?fname=https%3A%2F%2Ft1.daumcdn.net%2Fmovie%2Fmovie-private%2Ff9e87dc2c95d52f792bb2db809c62ac3f24dabf7">
	</div>
	<div class="detail-info">
		<span id="title">title</span>
		<ul>
			<li>원제목</li>
			<li>장르</li>
			<li>개봉일</li>
			<li>감독</li>
			<li>주연</li>
		</ul>
		<span id="viewers">누적관객</span>
		<div class="reserve-btn">
			<a href="">예매하기</a>
		</div>
	</div>


</div>

<script>
	$("#title-tab").text("Movie Picker:: Movie");	// 제목 
</script>
<%@ include file="../../include/footer.jsp" %>