<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<script src="https://kit.fontawesome.com/e11681bffc.js" crossorigin="anonymous"></script>
    <link href="${pageContext.request.contextPath}/css/join.css" rel="stylesheet">
</head>
<body>

  <div class="box">
        <img src="${pageContext.request.contextPath}/images/join.png">
    <div class="content">
        <span>
            <i class="far fa-envelope"></i>
        </span>
        <input type="text" size="25" placeholder="Enter email address" name="email">
        <span class="email-check">&nbsp;</span>
    </div>
    <div class="content">
        <span>
            <i class="fas fa-key"></i>
        </span>
        <input type="password" size="25" placeholder="Enter password" name="pwd">
        <span class="pwd-check">&nbsp;</span>
    </div>
    <div class="content">
        <span>
            <i class="fas fa-key"></i>
        </span>
        <input type="password" size="25" placeholder="Check password" name="pwdCheck">
        <span class="pwdcheck-check">&nbsp;</span>
    </div>
    <div class="content">
        <span>
            <i class="far fa-user"></i>
        </span>
        <input type="text" size="25" placeholder="Enter name" name="name">
        <span class="name-check">&nbsp;</span>

    </div>
    <div class="btn-box">
        <div class="btn">join</div>
        <div>
            <a href="login.do">login</a>
        </div>
    </div>

<script>
    var email = document.querySelector('input[name=email]');
   email.onkeyup = function(){
        var regExp = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;
        if( regExp.test(email.value) == true ){
            var check = document.querySelector('');
        }else{

        }
    
   }
   
    //var regExp = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;
    //var email = document.querySelector('input[name=id]');
    var pwd = document.querySelector('input[name=pwd]');
   

</script>


</body>
</html>