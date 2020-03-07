<%@page import="mpicker.com.a.model.ReserveDto"%>
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
	<div class="page-label">
		Reservation
	</div>
	
	<!-- 티켓 계산 -->
	<div class="lables">영화 정보</div>
	<div class="movie-info">
		<div class="movieTitle">
			<%=dto.getMovieTitle() %>
		</div>
		<div class="theater">
			<%=dto.getTheater() %>
		</div>
		<div class="movieDate">
			<%= dto.getMovieDate()%>
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
			
		
		<!-- seat -->
		<div class="seat-info">
			<div class="reserve-label">좌석</div>
			<div class="seats-info">
				<div class="seat-select" id="myBtn">
					좌석 선택하기
				</div>
				<p id="seats-txt"></p>
			</div>
			
		</div>
		<!-- 결제방법 -->
		<div class="payment-info">
			<div class="reserve-label">결제방법</div>
			<div class="payment-info2">
				<label>
					<input onclick="selectPayment()" type="radio" class="payment p1" name="group" value="신용카드" checked="checked">신용카드
				</label>
				<label>
					<input onclick="selectPayment()" type="radio" class="payment p2" name="group" value="무통장입금">무통장 입금
				</label>
				<label>
					<input onclick="selectPayment()" type="radio" class="payment p3" name="group" value="카카오페이">카카오페이
				</label>
				<label>
					<input onclick="selectPayment()" type="radio" class="payment p4" name="group" value="네이버페이">네이버페이
				</label>
			</div>
		</div>
		<!-- 가격정보 -->
		<div class="price-info">
		<div class="reserve-label">금액</div>
			<div class="price-info2">
				<span class="totalPrice">0</span> 원
			</div>
		</div>
		
		
		<!-- 결제하기 버튼 -->
		<div class="pay-btn hover1" onclick="gotopay()">
			결제하기
		</div>
	</div>
</div>
	
	
	<%@ include file="../../modal.jsp" %>	
	
	


<!-- input / hidden -->
<form id="frm" action="" method="post">
	<input type="hidden" name="email" value="<%=loginuser.getEmail()%>">
	<input type="hidden" name="movieTitle" value="<%=dto.getMovieTitle()%>">
	<input type="hidden" name="location" value="<%=dto.getLocation()%>">
	<input type="hidden" name="theater" value="<%=dto.getTheater()%>">
	<input type="hidden" name="movieDate" value="<%=dto.getMovieDate()%>">
	<input type="hidden" name="movieTime" value="<%=dto.getMovieTime()%>">
	<input type="hidden" name="payment" value="신용카드">
	<input type="hidden" id="seats" name="seats">
	<input type="hidden" id="ticketNum" name="ticketNum" value="0">
	<input type="hidden" name="price" value="0">
</form>
<!-- @@@@@@@@@@ Java script @@@@@@@@@@@ -->
<script>
$("#title-tab").text("Movie Picker:: Reservation");	// 탭 제목

//location
$("#menu1").text("Tickets");
$("#menu2").text("예매하기");

// 티켓 1개 가격 
var one_price = <%= dto.getPrice()%>;


/* 결제방법 선택 */
function selectPayment(){
	$("input[name=payment]").val($("input[name=group]:checked").val());
}

/* 청소년 +  */
function childPlus(){
	var num = $("#child-num").text();
	num = parseInt(num)+1;
	if(num > 10 ){
		return false;
	}
	$("#child-num").text(num);
	$("#ticketNum").val(parseInt($("#ticketNum").val())+1);
	$(".ticketNum").text($("#ticketNum").val());
	reset();


	// 가격 +
	var plus_price = one_price * 0.8;
	var p = parseInt($("input[name=price]").val());
	$("input[name=price]").val( p + plus_price );
	var p_str = $("input[name=price]").val();
	$(".totalPrice").text(addComma(p_str));



}

/* 청소년 - */
function childMinus(){
	var num = $("#child-num").text();
	num = parseInt(num)-1;
	if(num < 0 ){
		return false;
	}
	$("#child-num").text(num);
	$("#ticketNum").val(parseInt($("#ticketNum").val())-1);
	$(".ticketNum").text($("#ticketNum").val());

	reset();
	// 가격 -

	var plus_price = one_price * 0.8;
	var p = parseInt($("input[name=price]").val());
	$("input[name=price]").val( p - plus_price );
	var p_str = $("input[name=price]").val();
	$(".totalPrice").text(addComma(p_str));
	
}
/* 성인 + */
function adultPlus(){
	var num = $("#adult-num").text();
	num = parseInt(num)+1;
	if(num > 10 ){
		return false;
	}
	$("#adult-num").text(num);
	$("#ticketNum").val(parseInt($("#ticketNum").val())+1);
	$(".ticketNum").text($("#ticketNum").val());

	reset();
	// 가격 +
	var p = parseInt($("input[name=price]").val());
	$("input[name=price]").val( p + one_price );
	var p_str = $("input[name=price]").val();
	$(".totalPrice").text(addComma(p_str));
	
	
}
/* 성인 - */
function adultMinus(){
	var num = $("#adult-num").text();
	num = parseInt(num)-1;
	if(num < 0 ){
		return false;
	}
	$("#adult-num").text(num);
	$("#ticketNum").val(parseInt($("#ticketNum").val())-1);
	$(".ticketNum").text($("#ticketNum").val());

	reset();
	// 가격 -
	var p = parseInt($("input[name=price]").val());
	$("input[name=price]").val( p - one_price );
	var p_str = $("input[name=price]").val();
	$(".totalPrice").text(addComma(p_str));
	
}


 // 3자리 이상이면 콤마 붙이기
function addComma( number ){
	return number.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
}
// 결제하기 버튼 
function gotopay(){
	// 작성안한부분확인하기
	if($("input[name=id]").val()==""){
		alert('로그인 확인');
		return false;
	}
	if($("input[name=ticketNum]").val()=="0"){
		alert('티켓 장수를 선택하세요!');
		
		return false;
	}
	if($("input[name=seats]").val()==""){
		alert('좌석을 선택해주세요!');
		return false;
	}
	if($("input[name=payment]").val()==""){
		alert('결제방법을 선택하세요!');
		return false;
	}
	/* if($("input[name=price]").val()==""){
		alert('');
		return false;
	} */
	if(confirm('결제하시겠습니까?')){
		$("#frm").attr({"action":"pay.do","method":"post"});
		$("#frm").submit();
	}
}
</script>

<%@ include file="../../include/footer.jsp" %>