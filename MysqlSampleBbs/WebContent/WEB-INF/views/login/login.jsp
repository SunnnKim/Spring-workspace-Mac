<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
    <script src="https://kit.fontawesome.com/e11681bffc.js" crossorigin="anonymous"></script>
	 <link href="${pageContext.request.contextPath}/css/login.css" rel="stylesheet">
</head>
<body>



<div class="box">
    <img src="${pageContext.request.contextPath}/images/login.png">
    <div class="content">
        <span>
            <i class="far fa-envelope"></i>
        </span>
        <input type="text" size="30" placeholder="Enter email address" name="email">
    </div>
    <div class="content">
        <span>
            <i class="fas fa-key"></i>
        </span>
        <input type="password" size="30" placeholder="Enter password" name="pwd">
    </div>
    <div class="btn-box">
        <div class="btn">login</div>
        <div>
            <a href="join.do">아직도 회원이 아니신가요?</a>
        </div>
    </div>

</div>

<script>

document.querySelector(".btn").onclick = function(){
    var regExp = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;
    var email = document.querySelector('input[name=email]');
    var pwd = document.querySelector('input[name=pwd]');
    
    if( email.value === "" || pwd.value === "" ){
        email.focus();
        alert('아이디/비밀번호를 모두 입력해주세요');
        return false;
    }
    if( regExp.test(email.value) == false ){
        alert('이메일 형식을 맞춰주세요!');
        email.focus();
        return false;
    }


}





//if()

</script>







</body>
</html>