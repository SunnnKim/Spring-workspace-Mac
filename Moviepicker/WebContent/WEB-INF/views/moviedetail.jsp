<%@page import="mpicker.com.a.model.MovieDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../include/header.jsp" %><!-- header -->
<%@ include file="../../include/location.jsp" %><!-- location -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/moviedetail.css">
<%
	MovieDto dto = (MovieDto)request.getAttribute("dto");

%>

<!-- Movie Detail -->
<div class="content-box">
	<div class="detail-info">
		<div class="detail-img">
			<img src="<%=dto.getImgSrc()%>">
		</div>
		<div class="detail-contents">
			<div class="detail-title" id="title"><%=dto.getTitle() %></div>
			<div class="orginal-title"><%= dto.getOrigintitle() %></div>
			<ul>
				<li>별점</li>
				<li>장르</li>
				<li>개봉일</li>
				<li>감독</li>
				<li>주연</li>
			</ul>
			<ul class="content-value">
				<li><%=dto.getStarrate() %></li>
				<li><%=dto.getGanre() %></li>
				<li><%=dto.getMovieDate() %></li>
				<li><%=dto.getDirector() %></li>
				<li><%=dto.getCasting() %></li>
			</ul>
			<div class="viewers">
				<%=dto.getResereRate() %>
			</div>
			  <%
			  	if(!dto.getMovieDate().contains("예정")){
		       %>
				    <div class="reserve-btn hover1">
						<a href="reserveone.do?tit=<%=dto.getTitle()%>">예매하기</a>
					</div>
		       	<% }
			  	else { %>
		     <%  	}
		       	%>
			
		</div>
		
	</div>
	
	<!-- movie detail explanation -->
	<div class="detail-txt">
		<div class="detail-title">ABOUT MOVIE</div>
		<p><%=dto.getAboutMovie() %> </p>
	</div>
	<div class="making-note">
		<div class="detail-title">MAKING NOTE</div>	
		<p>
			<%= dto.getMakingNote() %>
		</p>
	</div>

</div>

<script>
	$("#title-tab").text("Movie Picker:: Movie");	// 제목 
	// location
	$("#menu1").text("Box Office");
	$("#menu2").text($("#title").text());
		
</script>
<%@ include file="../../include/footer.jsp" %>