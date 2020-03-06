<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../include/header.jsp" %><!-- header -->
<%@ include file="../../include/location.jsp" %><!-- location -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/login.css">
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
                    <form action="">
                        <input placeholder="ID" class="inputs" name="id" ty  pe="text">
                        <div class="messages">
                            <span class="warn">
                                <i class="fas fa-exclamation-triangle"></i>
                                sample message block.
                            </span>
                        </div>
                        <input placeholder="PASSWORD" class="inputs" name="password" type="text">
                        <div class="messages">
                            <span class="correct">
                                <i class="fas fa-check"></i>
                                sample message block.
                            </span>
                        </div>
                        <input class="buttons" id="submit-button" type="submit" value="Sign in">
                    </form>
                </div>
                <div id="extra-wrapper">
                    <a class="aTag" id="signup-button" href="#">아직 회원이 아니신가요?</a>
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

</script>

<%@ include file="../../include/footer.jsp" %>