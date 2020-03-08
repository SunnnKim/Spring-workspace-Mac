<%@page import="mpicker.com.a.model.ReserveDto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../include/header.jsp" %><!-- header -->
<%@ include file="../../include/location.jsp" %><!-- location -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/mypage.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/deleteaccount.css">
<script src="${pageContext.request.contextPath}/js/util.js"></script>


<%
// 로그인 세션만료 시
if(loginuser == null ){ %>
	<script>
		alert('로그인 세션이 만료되었습니다!');
		location.href="main.do?choice=now";
	</script>
<% } %>
<%
%>




<div class="content-box clfix">
	<div class="content-wrapper">
		<div class="menu">
			<div class="depth03"><a href="mypage.do">회원정보</a></div>
			<div class="depth03"><a href="reservationlist.do?page=1">예매내역</a></div>
			<div class="depth03"><a href="#">코멘트</a></div>
			<div class="depth03"><a href="#"  id="on">회원탈퇴</a></div>
		</div><!-- menu -->
		
		<div class="contents">
			<div class="title">
					<span>회원탈퇴</span>
			</div>
			<div class="bbs-wrapper">
				<div class="password-box">
					<p>회원 탈퇴를 위해 비밀번호를 입력해주세요.</p>
					<div class="password">
						<div>
							<input type="password" placeholder="비밀번호" size="30" name="pwd">
							<div id="password-message"></div>
						</div>
						<div>
							<input type="password" placeholder="비밀번호 확인" size="30" name="pwdCheck">
							<div id="password-chk-message"></div>
						</div>
						<div>
							<div id="btn">탈퇴하기</div>
						</div>
					</div>
				</div>
				
				<!-- 세션에서 이메일 가져오기  -->
				<input type="hidden" name="email" value="<%=loginuser.getEmail()%>">
			</div><!-- bbs-wrapper -->
		</div><!-- contents -->
	</div>
	
	
</div>


<script>
$("#title-tab").text("Movie Picker:: My Page");	// 탭 제목

//location
$("#menu1").text("My Page");
$("#menu2").text("회원탈퇴");


$(document).ready( function(){

	var passwordCheck = false;
	var passwordCheckCheck = false;
	
	
	/* 현재 패스워드 입력 정규표현식 */
	$("input[name=pwd]").keyup(function () {
		
	  if ($(this).val().length >= 4) {
	
		$.ajax({
			url:"pwdcheck.do",
			type:"post",
			data:{
				pwd:$("input[name=pwd]").val().trim()
			},success:function(data){

				if(data == "true"){
					passwordCheck = true;
				    message("#password-message", "correct", "Correct");
				}
				else{
					passwordCheck = false;
				    message("#password-message", "warn", "현재 비밀번호가 틀렸습니다.");
				}
				
			},error: function(error){
				alert("error");
				console.log(error);
			}
		});
	
			 
	  }else {
	    passwordCheck = false;
	   	message("#password-message", "warn", "비밀번호는 4자 이상 15자 이하 입니다.");
	  }

	  if ($(this).val().length >= 15) {
	    $(this).val($(this).val().substring(0, 15));
	  }
	});
	
	
	/* 패스워드 확인 정규표현식  */
	$("input[name=pwdCheck]").keyup(function () {
	if(passwordCheck == false){
	    passwordCheckCheck = false;
	   	message("#password-chk-message", "warn", "현재 비밀번호가 틀렸습니다.");
	   	return false;
	}
	if($("input[name=pwd]").val()=="") {
	    passwordCheck = false;
	   	message("#password-message", "warn", "현재 비밀번호를 입력해주세요!");
	   	return false;
	 }
	  if ($(this).val() === $("input[name=pwd]").val() && $(this).val() != "") {
	    passwordCheckCheck = true;
	    message("#password-chk-message", "correct", "일치합니다.");
	    return false;
	  }else {
	    passwordCheckCheck = false;
	    message("#password-chk-message", "warn", "일치하지 않습니다.");
	    return false;
	  }

	 if ($(this).val().length >= 15) {
	    $(this).val($(this).val().substring(0, 15));
	  }
	});


	// 탈퇴하기 버튼 

	 $("#btn").click(function() {

	      if (!passwordCheck) {
	        message("#password-message", "warn", "비밀번호를 정확히 입력해주세요.");
	        return false;
	      }
	      if (!passwordCheckCheck) {
	        message("#password-message", "warn", "비밀번호를 확인해주세요.");
	        return false;
	      }

			// 회원가입 확인 
		if(confirm('회원 탈퇴하시겠습니까?')){
			$.ajax({
		        url: "deleteaccount.do",
		        data: {
		          email: $("input[name=email]").val(),
		        },
		        dataType:"json",
		        type: "post",
		        success: function(data) {
			        if(data == true){
				       	alert('그동안 Movie Picker를 이용해주셔서 감사합니다.');
				       	location.href="logout.do";
			        }else{
				       	alert('회원탈퇴 실패');
			        }
		       },
		      	error: function (err) {
				       	alert('회원탈퇴 실패');
				        console.log(err);
		      }
		    });

		}
	      
	      
	  });

});

</script>

<%@ include file="../../include/footer.jsp" %>