<%@page import="mpicker.com.a.dao.ReserveDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../include/header.jsp" %><!-- header -->
<%@ include file="../../include/location.jsp" %><!-- location -->


<%	// 예매 정보 넘어옴	
ReserveDto dto = (ReserveDto) request.getAttribute("dto");

%>

<link rel="stylesheet" href="${pageContext.request.contextPath}/css/beforepay.css">
<div class="content-box">

<!-- 결제 정보 입력 -->
	<input type="hidden" name="id" value="session에서 얻어오기">
	<div class="page-label">
		Reservation
	</div>
	
	<!-- 티켓 계산 -->
	<div class="lables">영화 정보</div>
	<div class="movie-info">
		<div class="movieTitle">
			<%=dto.getMovieTitle() %>
			<input type="hidden" name="movieTitle" value="<%=dto.getMovieTitle()%>">
		</div>
		<div class="theater">
			<%=dto.getTheater() %>
			<input type="hidden" name="location" value="<%=dto.getLocation()%>">
			<input type="hidden" name="theater" value="<%=dto.getTheater()%>">
		</div>
		<div class="movieDate">
			<%= dto.getMovieDate()%>
			<input type="hidden" name="movieDate" value="<%=dto.getMovieDate()%>">
		</div>
		<div class="movieTime">
			<%=dto.getMovieTime() %>
			<input type="hidden" name="movieTime" value="<%=dto.getMovieTime()%>">
		</div>
	</div>
	<div class="lables">결제 정보</div>
	<div class="reserve-info">
		<div class="tickets-info">
			<div class="reserve-label">티켓</div>
			
			<div class="ticket-num">
				<span>성인</span>
				<div class="adult-ticket">
					<i class="fas fa-plus-circle" onclick="adultPlus()"></i>
					<span id="adult-num">0</span>
					<i class="fas fa-minus-circle"  onclick="adultMinus()"></i>
				</div>
			</div>
			
			<div class="ticket-num">
				<span>청소년</span>
				<div class="adult-ticket">
					<i class="fas fa-plus-circle"  onclick="childPlus()"></i>
					<span id="child-num">0</span>
					<i class="fas fa-minus-circle"  onclick="childMinus()"></i>
				</div>
			</div>
			<div class="ticket-total">
				<span>Total</span>
				<span class="ticketNum">0</span>
			</div>
		</div>
			<!-- input -->
			<input type="hidden" id="ticketNum" name="ticketNum" value="0">
		
		<!-- seat -->
		<div class="seat-info">
			<div class="reserve-label">좌석</div>
			<div class="seats-info">
				<div class="seat-select" id="myBtn">
					좌석 선택하기
				</div>
				<p id="seats-txt"></p>
				<!-- input -->
				<input type="hidden" id="seats" name="seats">
			</div>
			
		</div>
		<div class="price-info">
			<div>
			
			</div>
		
		</div>
	</div>
	
	
	<%@ include file="../../modal.jsp" %>	
	
	
</div>

<script>
$("#title-tab").text("Movie Picker:: Reservation");	// 탭 제목

//location
$("#menu1").text("Tickets");
$("#menu2").text("예매하기");


function childPlus(){
	var num = $("#child-num").text();
	num = parseInt(num)+1;
	if(num > 10 ){
		return false;
	}
	$("#child-num").text(num);
	$("#ticketNum").val(parseInt($("#ticketNum").val())+1);
	$(".ticketNum").text($("#ticketNum").val());
}
function childMinus(){
	var num = $("#child-num").text();
	num = parseInt(num)-1;
	if(num < 0 ){
		return false;
	}
	$("#child-num").text(num);
	$("#ticketNum").val($("#ticketNum").val()-1);
	$(".ticketNum").text($("#ticketNum").val());
}
function adultPlus(){
	var num = $("#adult-num").text();
	num = parseInt(num)+1;
	if(num > 10 ){
		return false;
	}
	$("#adult-num").text(num);
}
function adultMinus(){
	var num = $("#adult-num").text();
	num = parseInt(num)-1;
	if(num < 0 ){
		return false;
	}
	$("#adult-num").text(num);
}

</script>

<%@ include file="../../include/footer.jsp" %>