<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../include/header.jsp" %><!-- header -->
<%@ include file="../../include/location.jsp" %><!-- location -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/join.css">
<!-- font -->
<link href="https://fonts.googleapis.com/css?family=Chakra+Petch&display=swap" rel="stylesheet">

<script src="${pageContext.request.contextPath}/js/util.js"></script>
<div class="content-box">
	
	<div id="signup-page">
    <div id="signup-container">
        <div id="signup-header-box">
          <!-- <p>SIGN UP</p> -->
        </div>
        <div id="signup-logo-box">
        	Sign Up
        </div>
        <div id="signup-input-box">
            <div id="input-wrapper">
              <form action="" id="join-form">
                  <input placeholder="EMAIL" class="inputs" name="email" type="text">
                  <div class="messages" id="email-message">
                  </div>
                  <input placeholder="NAME" class="inputs" name="name" type="text">
                  <div class="messages" id="name-message">
                  </div>
                  <input placeholder="PASSWORD" class="inputs" name="pwd" type="password">
                  <div class="messages" id="password-message">
                  </div>
                  <input placeholder="PASSWORD CHECK" class="inputs" name="pwdCheck" type="password">
                  <div class="messages" id="password-chk-message">
                  </div>
                <input class="buttons" id="submit-button" type="button" value="Sign Up">
              </form>
            </div>
        </div>
        <div id="signup-footer-box">
            <br>
            <p>Movie Picker Company Present</p>
            <br>
            <p style="font-size: 12px;"><i class="far fa-copyright"></i> All rights reserved.</p>
        </div>
    </div>
</div>
	
</div>


<script>
$("#title-tab").text("Movie Picker:: Join Us");	// 탭 제목

//location
$("#menu1").text("Members");
$("#menu2").text("회원가입");
$(document).ready(function () {
    var emailCheck = false;
    var nameCheck = false;
    var passwordCheck = false;
    var passwordCheckCheck = false;
    /* email 정규표현식 */
    $("input[name=email]").keyup(function () {

      if (validateEmail($(this).val())) {
		// 이메일 중복 체크
		$.ajax({
			url:"emailcheck.do",
			data:"email="+$("input[name=email]").val(),
			type:"post",
			success: function(data){
				if(data == "false"){
					emailCheck = true;
			        message("#email-message", "correct", "Correct !");
				}else{
			        emailCheck = false;
			        message("#email-message", "warn", "이미 등록된 이메일입니다.");
				}
			},
			error:function(msg){
				alert('error');
				console.log(msg);
			}
		});
        
      }else {
        emailCheck = false;
        message("#email-message", "warn", "이메일을 입력해주세요.");
      }
      if ($(this).val().length > 30) {
        $(this).val($(this).val().substring(0, 30));
      }
	  

      
    });
    /* 이름 입력 정규표현식 */
    $("input[name=name]").keyup(function () {
      
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
    /* 패스워드 정규표현식 */
    $("input[name=pwd]").keyup(function () {
      
      if ($(this).val().length >= 4) {
        passwordCheck = true;
        message("#password-message", "correct", "올바른 형식입니다.");
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
      
      if ($(this).val() === $("input[name=pwd]").val()) {
        passwordCheckCheck = true;
        message("#password-chk-message", "correct", "일치합니다.");
      }else {
        passwordCheckCheck = false;
        message("#password-chk-message", "warn", "일치하지 않습니다.");
      }
      
      if ($(this).val().length >= 15) {
        $(this).val($(this).val().substring(0, 15));
      }
    });


    /* submit  */
    $("#submit-button").on("click", function() {
      if ($("input[name=email]").val() == ""/*  || !emailCheck */) {
        message("#email-message", "warn", "이메일을 정확히 입력해주세요.");
        return false;
      }
      if (!emailCheck) {
        return false;
      }
      if ($("input[name=name]").val() == "" || !nameCheck) {
        message("#email-message", "warn", "이름을 정확히 입력해주세요.");
        return false;
      }
      if ($("input[name=pwd]").val() == "" || !passwordCheck) {
        message("#password-message", "warn", "비밀번호를 정확히 입력해주세요.");
        return false;
      }
      if ($("input[name=pwd]").val() == "" || !passwordCheckCheck) {
        message("#password-message", "warn", "비밀번호를 확인해주세요.");
        return false;
      }

		// 회원가입 확인 
	if(confirm('가입하시겠습니까?')){
		$.ajax({
	        url: "insertmember.do",
	        data: {
	          email: $("input[name=email]").val(),
	          name: $("input[name=name]").val(),
	          pwd: $("input[name=pwd]").val()
	        },
	        dataType:"json",
	        type: "post",
	        success: function(data) {
		        if(data == true){
			       	alert($("input[name=name]").val()+'님, 회원가입을 축하합니다!');
			       	location.href = 'login.do';
		        }else{
			       	alert('회원가입 실패! 이메일 및 비밀번호를 확인해주세요 ');
		        }
	       },
	      	error: function (err) {
	        alert("로그인에 실패했습니다..");
	        console.log(err);
	      }
	    });

	}
      
      
  });
 });


</script>

<%@ include file="../../include/footer.jsp" %>