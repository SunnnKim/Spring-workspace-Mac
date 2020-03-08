<%@page import="mpicker.com.a.model.ReserveDto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../include/header.jsp" %><!-- header -->
<%@ include file="../../include/location.jsp" %><!-- location -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/mypage.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/mypageinfo.css">
<script src="${pageContext.request.contextPath}/js/util.js"></script>

<%
// 로그인 세션만료 시
if(loginuser == null ){ %>
	<script>
		alert('로그인 세션이 만료되었습니다!');
		location.href="main.do?choice=now";
	</script>
<% } %>
<div class="content-box clfix">
	<div class="content-wrapper">
		<div class="menu">
			<div class="depth03"><a href="#"  id="on">회원정보</a></div>
			<div class="depth03"><a href="reservationlist.do?page=1">예매내역</a></div>
			<div class="depth03"><a href="#">코멘트</a></div>
			<div class="depth03"><a href="deleteaccountview.do">회원탈퇴</a></div>
		</div><!-- menu -->
		
		<div class="contents">
			<div class="title">
					<span>회원정보</span>
			</div>
			<div class="bbs-wrapper">
				<div class="member-info">
					<div>아이디</div>
					<div><%=loginuser.getEmail() %></div>
					<input type="hidden" name="email" value="<%=loginuser.getEmail() %>">
				</div>
				<div class="member-info password">
					<div>현재 비밀번호</div>
					<div>
						<input type="password" size="30" name="nowpwd">
						<div id="now-password-message"></div>
					</div>
				</div>
				<div class="member-info password">
					<div>변경 비밀번호</div>
					<div>
						<input type="password" size="30" placeholder="비밀번호를 변경하시려면 입력하세요" name="pwd">
						<div id="password-message"></div>
					</div>
				</div>
				<div class="member-info password">
					<div>비밀번호 확인</div>
					<div>
						<input type="password" size="30" placeholder="비밀번호를 변경하시려면 입력하세요" name="pwdCheck">
						<div id="password-chk-message"></div>
					</div>
				</div>
				<div class="member-info password">
					<div>이름</div>
					<div class="name-box">
						<input type="text" value="<%=loginuser.getName() %>" readonly="readonly" name="name">
						<span id="change-name">변경</span>
						<div id="name-message"></div>
					</div>
					
				</div>
				
				
				
			</div><!-- bbs-wrapper -->
			<div id="update-btn">
				<div>정보 수정</div>
			</div>
		</div><!-- contents -->
	</div>
	
	
</div>


<script>
$("#title-tab").text("Movie Picker:: My Page");	// 탭 제목

//location
$("#menu1").text("My Page");
$("#menu2").text("예매내역");


$(document).ready( function(){
		
	var nameCheck = true;
	var nowpasswordCheck = true;
	var passwordCheck = true;
	var passwordCheckCheck = true;
	
	// 이름 변경하기 버튼
	$("#change-name").click(function(){
		$("input[name=name]").attr("readonly",false);
	}); 

	
	/* 현재 패스워드 입력 정규표현식 */
	$("input[name=nowpwd]").keyup(function () {
		
	  if ($(this).val().length >= 4) {
	
		$.ajax({
			url:"pwdcheck.do",
			type:"post",
			data:{
				pwd:$("input[name=nowpwd]").val()
			},success:function(data){
				//alert('success');
				
				console.log(data);
				if(data == "true"){
					nowpasswordCheck = true;
				    message("#now-password-message", "correct", "Correct");
					}
				else{
					nowpasswordCheck = false;
				    message("#now-password-message", "warn", "현재 비밀번호가 틀렸습니다.");
				}
				
			},error: function(error){
				alert("error");
				console.log(error);
			}
		});
	
			 
	  }else {
	    nowpasswordCheck = false;
	   	message("#now-password-message", "warn", "비밀번호는 4자 이상 15자 이하 입니다.");
	  }
	// 모두 빈칸일때
		if($("input[name=pwd]").val()=="" && $("input[name=nowpwd]").val()=="" && $("input[name=pwdCheck]").val()==""){
			nowpasswordCheck = passwordCheck = passwordCheckCheck = true;
			$("#password-chk-message").text("");
			$("#password-message").text("");
			$("#now-password-message").text("");
		}
	  
	  if ($(this).val().length >= 15) {
	    $(this).val($(this).val().substring(0, 15));
	  }
	});
	
	/* 패스워드 변경 정규표현식 */
	$("input[name=pwd]").keyup(function () {
		// 현재 비번 입력 안했을 시 
		if($("input[name=nowpwd]").val()=="") {
		    nowpasswordCheck = false;
		   	message("#now-password-message", "warn", "현재 비밀번호를 입력해주세요!");
		 }
		if ($(this).val().length >= 4) {
	    passwordCheck = true;
	    message("#password-message", "correct", "올바른 형식입니다.");
	  }else {
	    passwordCheck = false;
	    message("#password-message", "warn", "비밀번호는 4자 이상 15자 이하 입니다.");
	  }
		// 모두 빈칸일때
		if($("input[name=pwd]").val()=="" && $("input[name=nowpwd]").val()=="" && $("input[name=pwdCheck]").val()==""){
			nowpasswordCheck = passwordCheck = passwordCheckCheck = true;
			$("#password-chk-message").text("");
			$("#password-message").text("");
			$("#now-password-message").text("");
		}
	  if ($(this).val().length >= 15) {
	    $(this).val($(this).val().substring(0, 15));
	  }
	});
	/* 패스워드 확인 정규표현식  */
	$("input[name=pwdCheck]").keyup(function () {
		if($("input[name=nowpwd]").val()=="") {
		    nowpasswordCheck = false;
		   	message("#now-password-message", "warn", "현재 비밀번호를 입력해주세요!");
		 }
		if($("input[name=pwd]").val()=="") {
		    nowpasswordCheck = false;
		   	message("#password-message", "warn", "변경할 비밀번호를 입력해주세요!");
		 }
	  if ($(this).val() === $("input[name=pwd]").val() && $(this).val() != "") {
	    passwordCheckCheck = true;
	    message("#password-chk-message", "correct", "일치합니다.");
	  }else {
	    passwordCheckCheck = false;
	    message("#password-chk-message", "warn", "일치하지 않습니다.");
	  }
		// 모두 빈칸일때
		if($("input[name=pwd]").val()=="" && $("input[name=nowpwd]").val()=="" && $("input[name=pwdCheck]").val()==""){
			nowpasswordCheck = passwordCheck = passwordCheckCheck = true;
			$("#password-chk-message").text("");
			$("#password-message").text("");
			$("#now-password-message").text("");
		}

	 if ($(this).val().length >= 15) {
	    $(this).val($(this).val().substring(0, 15));
	  }
	});
	 /* 이름 입력 정규표현식 */
    $("input[name=name]").keyup(function () {
		nameCheck = false;
      if ($(this).val().length >= 1) {
        nameCheck = true;
        message("#name-message", "correct", "올바른 형식입니다.");
      }else {
        nameCheck = false;
        message("#name-message", "warn", "이름은 한 글자 이상 10글자 이하 입니다.");
      }
      
      if ($(this).val().length >= 10) {
        $(this).val($(this).val().substring(0, 10));
      }
    });




	 
	// btn click
	/* submit  */
    $("#update-btn").click(function() {


      if (!nameCheck) {
        message("#email-message", "warn", "이름을 정확히 입력해주세요.");
        return false;
      }
      if (!nowpasswordCheck) {
        message("#password-message", "warn", "현재 비밀번호를 정확히 입력해주세요.");
        return false;
      }
      if (!passwordCheck) {
        message("#password-message", "warn", "변경된 비밀번호를 정확히 입력해주세요.");
        return false;
      }
      if (!passwordCheckCheck) {
        message("#password-message", "warn", "변경된 비밀번호를 확인해주세요.");
        return false;
      }

		// 회원가입 확인 
	if(confirm('정보를 수정하시겠습니까?')){
		$.ajax({
	        url: "updatemember.do",
	        data: {
	          email: $("input[name=email]").val(),
	          name: $("input[name=name]").val(),
	          pwd: $("input[name=pwd]").val()
	        },
	        dataType:"json",
	        type: "post",
	        success: function(data) {
		        if(data == true){
			       	alert('회원정보를 수정했습니다.');
			       	location.reload();
		        }else{
			       	alert('회원정보수정 실패');
		        }
	       },
	      	error: function (err) {
			       	alert('회원정보수정 실패');
			        console.log(err);
	      }
	    });

	}
      
      
  });

});

</script>

<%@ include file="../../include/footer.jsp" %>