<%@page import="mpicker.com.a.model.MovieDto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../include/header.jsp" %><!-- header -->
<%@ include file="../../include/location.jsp" %><!-- location -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/movielist.css">

<%
List<MovieDto> list = (List<MovieDto>) request.getAttribute("list");
String choice = (String) request.getParameter("choice");
%>

<div class="content-box">
	<div class="movielist-box">
	    <span>BOX OFFICE</span>
	    <div class="movie-sorting">
	        <ul>
	        <% if(choice.equals("now")){
				%>
	            <li><a href="movielist.do?choice=now" id="released" class="on">현재상영작</a></li>
	            <li><a href="movielist.do?choice=scheduled" id="scheduled">개봉예정작</a></li>
				<%
	        }else{
				%>
	            <li><a href="movielist.do?choice=now" id="released">현재상영작</a></li>
	            <li><a href="movielist.do?choice=scheduled" id="scheduled" class="on">개봉예정작</a></li>
				<%
	        	
	        }
	        	%>
	        </ul>
	    </div>
	<% for(int i=0; i< list.size(); i++) { 
		MovieDto dto = list.get(i);
		%>
		<div class="movie-content">
		        <div class="title-img">
		            <a href="moviedetail.do?movieid=<%=dto.getUrl()%>">
		                <div class="img-cover hover1">
		                	<div>
			                	<%=dto.getAboutMovie() %>
		                	</div>
		                </div>
		                <img src="<%=dto.getImgSrc()%>">
		            </a>
		        </div>
		        <div class="movielist-title"><%=dto.getTitle() %></div>
		        <div><%=dto.getResereRate() %></div>
		        <div class="movie-stars">
		            <i class="fas fa-star"></i>
		             <%=dto.getStarrate() %>
		        </div>
		        <% if(dto.getResereRate().contains("예매율")){ 
		        %>
			        <div class="reserve-btn">
			            <a href="reserveone.do?tit=<%=dto.getTitle()%>">
			                예매하기
			            </a>
			        </div>
		        <%
		       	}else{
		       		%>
		       		<div class="reserve-btn">
			            <a href="moviedetail.do?movieid=<%=dto.getUrl()%>">
			               영화정보
			            </a>
			        </div>
		       		<%
		       	}
		       	%>
		        
		    </div> <!-- movie-content -->
		    
		
		
		<%
		
		}	
	%>
	</div> <!-- movielist-box -->
</div> <!-- content-box -->





<script>
	$("#title-tab").text("Movie Picker:: Box Office");	// 제목 
</script>
<%@ include file="../../include/footer.jsp" %>