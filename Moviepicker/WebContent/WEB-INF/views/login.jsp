<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../include/header.jsp" %><!-- header -->
<%@ include file="../../include/location.jsp" %><!-- location -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/login.css">
<script src="${pageContext.request.contextPath}/js/util.js"></script>
<link href="https://fonts.googleapis.com/css?family=Chakra+Petch&display=swap" rel="stylesheet">
<div class="content-box">
	<div id="login-page">
        <div id="login-container">
            <div id="login-header-box">
                <!-- <p>LOG IN</p> -->
            </div>
            <div id="login-logo-box">
            	MoviePicker
            </div>
            <div id="login-input-box">
                <div id="input-wrapper">
                    <form action="logincheck.do" id="login-form" method="post">
                    	<input placeholder="EMAIL" class="inputs" name="email" type="text">
                        <div class="messages" id="email-message">
                        </div>
                        <input placeholder="PASSWORD" class="inputs" name="pwd" type="password">
                        <div class="messages" id="password-message">
                        </div>
                        <input class="buttons" id="submit-button" type="button" value="Sign in">
                    </form>
                </div>
                <div id="extra-wrapper">
                    <a class="aTag" id="signup-button" href="join.do">아직 회원이 아니신가요?</a>
                    <div></div>
                </div>
            </div>
            <div id="login-footer-box">
                <br>
                <p>Movie Picker Company Present</p>
                <br>
                <p style="font-size: 12px;"><i class="far fa-copyright"></i> All rights reserved.</p>
            </div>
        </div>
    </div>
</div>

<script>
$("#title-tab").text("Movie Picker:: Log in");	// 탭 제목

//location
$("#menu1").text("Members");
$("#menu2").text("로그인");

$(document).ready(function () {
    var emailCheck = false;
    var passwordCheck = false;
    $("input[name=email]").keyup(function () {

      if (validateEmail($(this).val())) {
        emailCheck = true;
        message("#email-message", "correct", "Correct !");
      }else {
        emailCheck = false;
        message("#email-message", "warn", "이메일을 입력해주세요.");
      }
      if ($(this).val().length > 30) {
        $(this).val($(this).val().substring(0, 30));
      }
    });
    $("input[name=pwd]").keyup(function () {
      
      if ($(this).val().length >= 4) {
        passwordCheck = true;
        message("#password-message", "correct", "");
      }else {
        passwordCheck = false;
        message("#password-message", "warn", "비밀번호는 4자 이상입니다.");
      }
      
      if ($(this).val().length > 30) {
        $(this).val($(this).val().substring(0, 30));
      }
    });
    
    $("#submit-button").click(function() {
      if ($("input[name=email]").val() == "" || !emailCheck) {
        message("#email-message", "warn", "이메일을 입력해주세요.");
        return false;
      }
      if ($("input[name=pwd]").val() == "" || !passwordCheck) {
        message("#password-message", "warn", "비밀번호를 입력해주세요.");
        return false;
      }
      // 이 부분 수정
      $.ajax({
        type: "POST",
        dataType: "json",
        url: "logincheck.do",
        data: {
          email: $("input[name=email]").val(),
          pwd: $("input[name=pwd]").val()
        },
        success: function (res) {
          if (res) {
	       	  alert("로그인에 성공했습니다.");
	          location.href="main.do?choice=now";
          }else {
        	  message("#email-message", "warn","등록되지 않거나 잘못된 이메일입니다.");
              message("#password-message", "warn", "");
          }
       	}
      });
    });
  });
</script>

<%@ include file="../../include/footer.jsp" %>