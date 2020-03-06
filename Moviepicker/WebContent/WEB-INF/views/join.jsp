<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../include/header.jsp" %><!-- header -->
<%@ include file="../../include/location.jsp" %><!-- location -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/join.css">
<div class="content-box">
	
	<div id="signup-page">
    <div id="signup-container">
        <div id="signup-header-box">
          <!-- <p>SIGN UP</p> -->
        </div>
        <div id="signup-logo-box">
        	JOIN
        </div>
        <div id="signup-input-box">
            <div id="input-wrapper">
              <form action="">
                <input placeholder="EMAIL" class="inputs" name="email" type="text">
                <div class="messages">
                    <span class="warn">
                        <i class="fas fa-exclamation-triangle"></i>
                        sample message block.
                    </span>
                </div>
                <input placeholder="NAME" class="inputs" name="id" type="text">
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
                <input placeholder="PASSWORD CHECK" class="inputs" name="passwordcheck" type="text">
                <div class="messages">
                    <span class="correct">
                        <i class="fas fa-check"></i>
                        sample message block. 
                    </span>
                </div>
                <input class="buttons" id="submit-button" type="submit" value="Sign Up">
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

</script>

<%@ include file="../../include/footer.jsp" %>