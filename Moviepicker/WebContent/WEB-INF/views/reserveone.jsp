<%@page import="mpicker.com.a.model.MemberDto"%>
<%@page import="mpicker.com.a.model.MovieDto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../include/header.jsp" %><!-- header -->
<%@ include file="../../include/location.jsp" %><!-- location -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/reserve.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/modal.css">
<%
	// login Session -> header
	boolean logincheck = true;

	if( loginuser == null ){
		logincheck = false;
	}
%>
<%
String title = (String)request.getParameter("tit");
%>
<div class="content-box">

	<div class="page-label">
		Tickets
	</div>
	<form action="" method="post" id="frm">
	<div class="schedule">
		<div class="select-box1">
			<p>영화</p>
			<div class="select-movie">
				<div class="movies"> <%= title %></div>
				<input type="hidden" id="movieTitle" name="movieTitle">
			</div>
		</div>
		<div class="select-box2-1">
			<p>지역 선택</p>
			<div class="select-theater-1">
				<div class="locations">서울</div>
				<div class="locations">경기/인천</div>
				<div class="locations">부산/울산/경남</div>
				<div class="locations">대구/경북</div>
				<div class="locations">대전/충청/강원</div>
				<div class="locations">광주/전라/제주</div>
				
				<input type="hidden" id="location" name="location">
			</div>
		</div>
		<div class="select-box2">
			<p>극장 선택</p>
			<div class="select-theater">
			<!-- 동적생성 -->
			</div>
			<input type="hidden" id="theater" name="theater">
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
			</div>
			<input type="hidden" id="movieDate" name="movieDate">
			<input type="hidden" id="price" name="price" value="11000">
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
				<input type="hidden" id="id" name="id">
			</div>
		</div>
	</div>
	</form>
	<div class="btn-content">
		<div class="reserve-btn hover1" id="myBtn">
			예매하기
		</div>
	</div>

</div>

<!-- 확인용 Modal -->
<!-- Modal source -->
<!-- Trigger/Open The Modal -->

<!-- The Modal -->
<div id="myModal" class="modal">

  <!-- Modal content -->
  <div id="modal-content" class="modal-content">
    <span class="close">×</span>
    <div class="modal-title">예매 확인</div>
	<div class="modal-info">
		
	</div>
	<div class="modal-btn" id="gotopage">
		결제하기
	</div>
  </div>

</div>

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

// 지역별 극장 데이터
var seoul = [ 
	'대한극장', '메가박스 강남','메가박스 이수', '메가박스 상암','메가박스 코엑스', '롯데시네마 서울대입구', '롯데시네마-명동','롯데시네마-월드타워',
	'CGV 신촌아트레온','CGV 여의도','CGV 용산','CGV 성신여대','Cinema Hall-예술의 전당'
];
var inchoen = [
	'메가박스 일산점', '메가박스 부평구청점','메가박스 연수', '메가박스 동탄','메가박스 광명아울렛점','롯데시네마-일산서구','롯데시네마-송도','롯데시네마-이천아울렛점',
	'CGV 화성동탄점','CGV 평택점','CGV 산본점','CGV 안양시청점','CGV 과천정부청사'
];
var busan = [
	'메가박스 광복', '메가박스 동래','메가박스 센텀시티', '메가박스 울산성남점','메가박스 마산','롯데시네마-해운대','롯데시네마-통영터미널','롯데시네마-진주혁신점',
	'CGV 사상','CGV 오투(부산대)','CGV 덕천','CGV 부산극장','CGV 양산라피에스타'
];
var daegu = [
	'메가박스 경산하양', '메가박스 대구KTX점','메가박스 구미공단', '메가박스 문경 ','메가박스 포항서구점','롯데시네마-진주혁신점',
	'CGV 경북도청'
	];
var daejeon= [
	'메가박스 대전시청점', '메가박스 서산점','금성시네마', '메가박스 충남도청점 ','메가박스 내포점','롯데시네마-대천',
	'CGV 홍성','CGV 카이스트점','CGV 공주시청점','CGV 유성'
	];
var	jeju = [
	'메가박스 제주', '메가박스 광주','메가박스 여수웅천', '메가박스 목포하당','메가박스 남원점','롯데시네마-군산',
	'CGV 서귀포점','CGV 순천터미널점','CGV 목포'
	];
	
var locationTheater = {
		"서울": seoul,
		"경기/인천":inchoen,
		"부산/울산/경남":busan,
		"대구/경북":daegu,
		"대전/충청/강원":daejeon,
		"광주/전라/제주":jeju,
}
//지역 클릭 
$(".locations").click(function(){
	var $this = $(this);
	// 여기다 값넣어두기 
	$this.css({'backgroundColor':'#037b94',"color":"#fff"}).siblings('div').css({'backgroundColor':'white',"color":"#000"});
	$("#location").val($this.text());
	var arr = new Array();
	var str="";
	for(var key in locationTheater){
		if($this.text() === key){
			arr=locationTheater[key];
		}
	}
	for( var i in arr ){
		str += "<div class='theaters'>" + arr[i] + "</div>"
	}
	$(".select-theater").text("");
	$(".select-theater").append(str);
	$(".select-theater").show(500);
	
});

</script>


<script>

$("#title-tab").text("Movie Picker:: Reservation");	// 제목 

//location
$("#menu1").text("Tickets");
$("#menu2").text("예매하기");

// 영화 선택하기 전 초기화 및 숨겨두기
$(".select-theater").hide();
$(".select-theater-1").hide();
$("#year").hide();
$("#month").hide();
$(".select-date").hide();
$(".select-time").hide();
$(".reserve-btn").hide();

$(document).ready(function(){
	
	// 영화 클릭 
		var $this =$(".movies");
		// 여기다 값넣어두기 
		$this.css({'backgroundColor':'#037b94',"color":"#fff"}).siblings('div').css({'backgroundColor':'white',"color":"#000"});
		$("#movieTitle").val($this.text());
		$(".select-theater-1").show(1000);
	
	// 지역 클릭은 위에서 구현  
	
	// 극장클릭 
	$(document).on("click",".theaters",function(event){
		var $this = $(this);
		// 여기다 값넣어두기 
		$this.css({'backgroundColor':'#037b94',"color":"#fff"}).siblings('div').css({'backgroundColor':'white',"color":"#000"});
		$("#theater").val($this.text());
		$("#year").show(1000);
		$("#month").show(1000);
		$(".select-date").show(500);
		
		console.log($("#theater").val());
	});
	// 날짜 클릭
	$(document).on("click",".dates",function(event){
		var $this = $(this);
		// 여기다 값넣어두기 
		$this.css({'backgroundColor':'#037b94',"color":"#fff"}).siblings('div').css({'backgroundColor':'white',"color":"#000"});
		$("#movieDate").val($("#year").text().trim()+"."+$("#month").text().trim()+"."+$this.text());
		$(".select-time").show(1000);
	});

	// 시간 클릭 
	$(".times").click(function(){
		var $this = $(this);
		// 여기다 값넣어두기 
		$this.css({'backgroundColor':'#037b94',"color":"#fff"}).siblings('div').css({'backgroundColor':'white',"color":"#000"});
		$("#movieTime").val($this.text());
		$(".reserve-btn").show(800);

		// 조조 (8000) 및 심야 (9000) 할인 / 정가 11000
		if($("#movieTime").val().includes('조조')){
			$("#price").val('8000');
		}
		if($("#movieTime").val().includes('심야')){
			$("#price").val('9000');
		}else{
			$("#price").val('11000');
		}
	});
	
});	


// 예매하기 버튼 클릭
// 1. madal
$(function() {
	  $(document).ready(function() {
	 
	    $("#myBtn").click(function() {
			var modalStr = "<ul>";
			modalStr += "<li>"+ $("#movieTitle").val()+"</li>";
			modalStr += "<li><b>지역&nbsp;&nbsp;</b>"+ $("#location").val()+"</li>";
			modalStr += "<li><b>극장&nbsp;&nbsp;</b>"+ $("#theater").val()+"</li>";
			modalStr += "<li><b>날짜&nbsp;&nbsp;</b>"+ $("#movieDate").val()+"</li>";
			modalStr += "<li><b>상영시간&nbsp;&nbsp;</b>"+ $("#movieTime").val()+"</li>";
			
			modalStr += "</ul>";
			 
	      $("#myModal").css({
	        "display": "block",
	        "transition":"all 0.3s ease-in-out"
	      });
	      
		$(".modal-info").html(modalStr);
		

	      
	    });
	 
	    $(".close").click(function() {
	      $("#myModal").css({
	        "display": "none"
	      });
	    });
	 
	    $("html").click(function(event) {
	      if (event.target.id === "myModal") {
	        $("#myModal").css({
	          "display": "none"
	        });
	      }
	    });
	 
	  });
	 
	});


//2. 결제창으로 이동 
$("#gotopage").click(function(){
	// session 확인
	var logincheck = <%=logincheck%>;
	if(logincheck ==  false ){
		alert('로그인이 필요합니다.');
		location.href="login.do";
		return false;
	}
	$("#frm").attr("action","beforepay.do");
	$("#frm").submit();
});
</script>
<%@ include file="../../include/footer.jsp" %>