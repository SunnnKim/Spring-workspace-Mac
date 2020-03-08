<%@page import="mpicker.com.a.model.ReserveDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../include/header.jsp" %><!-- header -->
<%@ include file="../../include/location.jsp" %><!-- location -->
<%
// 결제 상태 확인하기
boolean success = (boolean) request.getAttribute("success");
ReserveDto dto = null;
if(!success){
	%>
	<script>
		alert('결제 실패');
		location.href="reserve.do";
	</script>
	<%
}else{
	dto = (ReserveDto) request.getAttribute("dto");
}
%> 
<div class="content-box">

<!-- 결제정보 보기  -->
	<div class="page-label">
		결제 내역
	</div>
	
	<!-- 티켓 계산 -->
	<div class="lables">영화 정보</div>
	<div class="movie-info">
			<div class="movieTitle">
				<%= dto.getMovieTitle() %>
			</div>
			<div class="theater">
				<%=dto.getLocation() %>
			</div>
			<div class="theater">
				<%=dto.getTheater() %>
			</div>
			<div class="movieDate">
				<%=dto.getMovieDate() %>
			</div>
			<div class="movieTime">
				<%=dto.getMovieTime() %>
			</div>
	</div>
	<div class="lables">결제 정보</div>
	<div class="reserve-info">
		<div class="tickets-info">
			<div class="reserve-label">티켓</div>
			<div class="ticket-num">
				<span> 티켓 매수 </span>
				<span class="data">
					<%=dto.getTicketNum() %>&nbsp;&nbsp;매
				</span>
			</div>
			<div class="ticket-num">
				<span>좌석 정보</span>
				<span class="data">
					<%=dto.getSeats() %>
				</span>
			</div>
		</div>
		<div class="tickets-info">
		<div class="reserve-label">결제</div>
			<div class="ticket-num">
					<span>결제 방법</span>
					<span class="data">
						<%=dto.getPayment() %>
					</span>
			</div>
			<div class="ticket-num">
					<span>결제 금액</span>
					<span class="data">
						<%=dto.getPrice() %>&nbsp;&nbsp;원
					</span>
			</div>
		</div>
	</div>
	<div class="btn">
		<a href="reservationlist.do?page=1">목록보기</a>
	</div>
</div>
<script>
$("#title-tab").text("Movie Picker:: My page");	// 탭 제목

//location
$("#menu1").text("My page");
$("#menu2").text("결제내역");
</script>

<%@ include file="../../include/footer.jsp" %>