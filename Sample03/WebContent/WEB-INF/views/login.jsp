<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style type="text/css">
.content {
	height: 250px;
	margin-top: 100px;
}
.content h1{ margin: 50px 0; text-align: center; }
.content ul { list-style: none;  position: relative; left:35%}
.content ul li { margin: 50px 0; }
.content ul li span { display:inline-block; font-size: 20px; width:50px;}
.content ul li input{ height: 25px; width: 200px ;}
.button { heigth:200px; position:relative; left: 40% }
.button .login { width:100px; height:50px; border: 1px solid black; text-align: center; line-height: 50px;
background: black; border-radius: 3px; color: #fff; float: left; cursor: pointer;}
.button .join { width:100px; height:50px; border: 1px solid black; text-align: center; line-height: 50px;
background: black; border-radius: 3px; color: #fff; float: left; margin-left:40px;cursor: pointer;}
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<title> LOGIN </title>
</head>
<body>
<form id="frm" action="./logincheck.do" method="post">
<div class="content">
	<h1>L O G I N</h1>
	<ul>
		<li>
			<span>ID</span>
			<input type="text" name="id" id="id">
		</li>
		<li>
			<span>PW</span>
			<input type="text" name="pwd" id="pwd">
		</li>
	</ul>
</div>
</form>
<div class="button">
	<div class="login" onclick="login()">로그인</div>
	<div class="join" onclick="join()">회원가입</div>
</div>

<script type="text/javascript">
function login(){
	if($("#id").val() =="") {
		alert("아이디를 입력하세요");
		$("#id").focus();
		return;
	}
	if($("#pwd").val() =="") {
		alert("패스워드를 입력하세요");
		$("#pwd").focus();
		return;
	}
	$("#frm").submit();
}
function join(){

	location.href="./join.do";
	
}

</script>
</body>
</html>