<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/seat.css">
    

<!-- Trigger/Open The Modal -->
<!-- <button id="myBtn">Open Modal</button> -->
<!-- <button id="myBtn">Open Modal</button> 
 -->
<!-- The Modal -->
<div id="myModal" class="modal">

  <!-- Modal content -->
  <div id="modal-content" class="modal-content">
  	<div>
	    <span class="close">×</span>
  	</div>
	<div class="select-seat">
	<div class="screen"> screen</div>
	<div class="seats">
		<div class="right">
			
		</div>
		<div class="center">
			
		</div>
		<div class="left">
			
		</div>
	
	</div>
	<div class="btn">좌석선택</div>
</div>
	

  </div>

</div>


<script type="text/javascript">


//modal
// 1. madal
$(function() {
	  $(document).ready(function() {
	 
	    $("#myBtn").click(function() {
			if($("#ticketNum").val() == 0){
				alert('구매할 티켓 개수를 설정하세요');
				return false;
			}
		var ticketnum = $("#ticketNum").val();
	      $("#myModal").css({
	        "display": "block",
	        "transition":"all 0.3s ease-in-out"
	      });
	      

	      
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


	
	var rownum=16;
	var coltxt = 64;	//A의 아스키 코드 값 
	
	for(var i=0; i<50; i++){
		if(i % 5 == 0){
			rownum = 16;
			coltxt++;
		}
		var seatnum = String.fromCharCode(coltxt)+rownum;
		$(".left").append("<div class='seat' id="+seatnum+"></div>");
		rownum++;
	}
	
	coltxt = 64;
	rownum = 1;
	for(var i=0; i<50; i++){
		if(i % 5 == 0){
			rownum = 1;
			coltxt++;
		}
		var seatnum = String.fromCharCode(coltxt)+rownum;
		$(".right").append("<div class='seat' id="+seatnum+"></div>");
		rownum++;
	}
	rownum = 6;
	coltxt = 64;
	for(var i=0; i<100; i++){
		if(i % 10 == 0){
			rownum = 6;
			coltxt++;
		}
		var seatnum = String.fromCharCode(coltxt)+rownum;
		$(".center").append("<div class='seat' id="+seatnum+"></div>");
		rownum++;
	}

// ticket number
var arr = new Array();
var count = 0;
// 좌석 선택시 이벤트
$(".seat").click(function(){
	var $this = $(this);
	// 두번 클릭햇을시 
 	if(arr.includes($this.attr('id'))){
		count--;
		arr.splice(arr.indexOf($this.attr("id")),1);
		$this.css("backgroundColor","#fff");
	}
 	else if(count == ticketnum){
		// 모두 선택했을 때
		alert('좌석을 모두 선택');
	}
	else{
		$this.css("backgroundColor","#000");
		arr.push($this.attr("id"));
		count++;
	} 
	console.log($this.attr("id"));
	console.log(count);
	console.log(arr);
	

});

	

//좌석 결정하기 
$(".btn").click(function(){
	
	alert(count);
	if(count<ticketnum){
		alert('좌석을 모두 선택해주세요.');
		return false;
	}
	
	
	var str="";
	for ( var i =0; i< arr.length-1; i++) {
		str += arr[i] + ','
	}
	str += arr[arr.length-1];
	if(confirm("선택한 좌석 : " + str + '\n선택한 좌석으로 결제하시겠습니까?')){
		// console.log('good');
		$("#seats").val(str);
		$("#seats-txt").text(str);
		console.log($("#seats").val());
		// form close
		$("#myModal").css({
	        "display": "none"
	      });

	}
});

</script>


