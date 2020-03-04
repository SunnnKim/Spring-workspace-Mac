<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../include/header.jsp" %><!-- header -->
<%@ include file="../../include/location.jsp" %><!-- location -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/reserve.css">

<div class="content-box">
	<div class="page-label">
		Tickets
	</div>
	<div class="schedule">
		<div class="select-box1">
			<p>영화</p>
			<div class="select-movie">
				<div class="movies"> 영화1 </div>
				<input type="hidden" id="movieTitle" name="movieTitle">
			</div>
		</div>
		<div class="select-box2">
			<p>극장 선택</p>
			<div class="select-theater">
				<div class="theaters"> 극장1 </div>
				<div class="theaters"> 극장2 </div>
				<div class="theaters"> 극장3 </div>
				<div class="theaters"> 극장4 </div>
				<div class="theaters"> 극장5 </div>
				<div class="theaters"> 극장6 </div>
				<div class="theaters"> 극장7 </div>
				<div class="theaters"> 극장8 </div>
				
				<input type="hidden" id="theater" name="theater">
			</div>
		</div>
		<div class="select-box3">
			<p>날짜 선택</p>
			<div id="year"></div>
			<div id="month">
				<i class="fas fa-angle-left" onclick="getMonthMinus()"></i>
				<span id="month-val"></span>
				<i class="fas fa-angle-right" onclick="getMonthPlus()"></i>
			</div>
			<div class="select-date">
				<input type="hidden" id="movieDate" name="theater">
			</div>
		</div>
		
		<div class="select-box4">
			<p>시간 선택</p>
			<div class="select-time">
				<div class="times">9:00 (조조)</div>
				<div class="times">10:40 (조조)</div>
				<div class="times">12:10</div>
				<div class="times">13:00</div>
				<div class="times">14:45</div>
				<div class="times">16:00</div>
				<div class="times">17:30</div>
				<div class="times">18:50</div>
				<div class="times">20:10</div>
				<div class="times">21:25</div>
				<div class="times">22:40</div>
				<div class="times">23:55 (심야)</div>
				<input type="hidden" id="movieTime" name="movieTime">
			</div>
		</div>
	</div>
	<div class="btn-content">
		<div class="reserve-btn hover1">
			예매하기
		</div>
	</div>

</div>

<!-- 확인용 Modal -->


<!-- @@@@@@@@@@@@ Javascript @@@@@@@@@@@@@@ -->
<script>
// 달력 
var today = new Date();
var year = today.getFullYear();
var month = today.getMonth()+1;
var date = today.getDate();
var day = today.getDay();

//  마지막 날 구하기
var last   = new Date(year, month); 
last  = new Date( last - 1 ).getDate(); 

$("#year").text(year);
$("#month-val").html('&nbsp;&nbsp;&nbsp;'+month+ '&nbsp;&nbsp;&nbsp;');

console.log(last);
getDate(date);
function getDate( num ){
	$(".select-date").html("");
	for(var i=1; i<=10; i++){
		if(num <= last){
			$(".select-date").append('<div class="dates">'+ num++ +"</div>");
		}
	}
}

var pressmonth = month;

function getMonthPlus(){
	pressmonth++;
	if(pressmonth >= month+2 ){
		alert('스케쥴이 없습니다!');
		pressmonth--;
		return false;
	}
	if(date<last){
		alert('스케쥴이 없습니다!');
		pressmonth--;
		return false;
	}
	else if(pressmonth == 13 ){	//해를 넘어감 
		$("#year").text(year+1);
		$("#month-val").html('&nbsp;&nbsp;&nbsp;'+ 1 + '&nbsp;&nbsp;&nbsp;');
		getDate(1);	
	}
	else {
		$("#month-val").html('&nbsp;&nbsp;&nbsp;'+pressmonth+ '&nbsp;&nbsp;&nbsp;');
		getDate(1);	
	}
}
function getMonthMinus(){
	pressmonth--;
	if(pressmonth < month ){
		alert('현재 이전의 날짜는 볼 수 없습니다!');
		pressmonth++;
	}else if(pressmonth==12){
		$("#year").text(year);
		$("#month-val").html('&nbsp;&nbsp;&nbsp;'+pressmonth+ '&nbsp;&nbsp;&nbsp;');
	}
	else{
		$("#month-val").html('&nbsp;&nbsp;&nbsp;'+pressmonth+ '&nbsp;&nbsp;&nbsp;');
	}
	if(pressmonth==month){
		$("#month-val").html('&nbsp;&nbsp;&nbsp;'+pressmonth+ '&nbsp;&nbsp;&nbsp;');
		getDate( date );	
	}
}

</script>


<script>

$("#title-tab").text("Movie Picker:: Reservation");	// 제목 

//location
$("#menu1").text("Tickets");
$("#menu2").text("예매하기");

// 영화 선택하기 전 초기화 및 숨겨두기
$(".select-theater").hide();
$("#year").hide();
$("#month").hide();
$(".select-date").hide();
$(".select-time").hide();
$(".reserve-btn").hide();

$(document).ready(function(){
	
	// 영화 클릭 
	$(".movies").click(function(){
		var $this = $(this);
		// 여기다 값넣어두기 
		$this.css({'backgroundColor':'#037b94',"color":"#fff"}).siblings('div').css({'backgroundColor':'white',"color":"#000"});
		$("#movieTitle").val($this.text());
		$(".select-theater").show(1000);
	});
	
	// 극장클릭 
	$(".theaters").click(function(){
		var $this = $(this);
		// 여기다 값넣어두기 
		$this.css({'backgroundColor':'#037b94',"color":"#fff"}).siblings('div').css({'backgroundColor':'white',"color":"#000"});
		$("#theater").val($this.text());
		$("#year").show(1000);
		$("#month").show(1000);
		$(".select-date").show(500);
		
	});
	// 날짜 클릭
	$(document).on("click",".dates",function(event){
		var $this = $(this);
		// 여기다 값넣어두기 
		$this.css({'backgroundColor':'#037b94',"color":"#fff"}).siblings('div').css({'backgroundColor':'white',"color":"#000"});
		$("#movieDate").val($this.text());
		$(".select-time").show(1000);
	});

	// 시간 클릭 
	$(".times").click(function(){
		var $this = $(this);
		// 여기다 값넣어두기 
		$this.css({'backgroundColor':'#037b94',"color":"#fff"}).siblings('div').css({'backgroundColor':'white',"color":"#000"});
		$("#movieTime").val($this.text());
		$(".reserve-btn").show(800);
	});
	
});	
// 예매하기 버튼 클릭

</script>
<%@ include file="../../include/footer.jsp" %>