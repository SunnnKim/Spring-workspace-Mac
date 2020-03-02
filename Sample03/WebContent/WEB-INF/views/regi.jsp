<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

</head>
<body>
<h1 style="text-align: center">회원가입</h1>
<p style="text-align: center">환영합니다</p>
<div align="center">
<form id="frm" action="" method="post">

<table border="1">
<tr>
	<td>아이디</td>
	<td>
		<input type="text" id="id" name="id" size="20">
		id확인 
		<p id="idcheck" style="font-size: 8px"></p>
		<input type="button" id="btn" value="id확인">
		<input type="hidden" id="idCheckHidden" value="false">
	</td>
</tr>
<tr>
	<td>패스워드</td>
	<td>
		<input type="text" id="pwd" name="pwd" size="20">
	</td>
</tr>
<tr>
	<td>이름</td>
	<td>
		<input type="text" id="name" name="name" size="20">
	</td>
</tr>
<tr>
	<td>이메일</td>
	<td>
		<input type="text" id="email" name="email" size="20">
	</td>
</tr>
<tr>
	<td colspan="2">
		<input type="button" id="submitBtn" value="회원가입">
	</td>
</tr>

</table>

</form>
</div>
<script type="text/javascript">

$(document).ready(function() {
	$("#btn").click(function() {
		$.ajax({
			url: "idcheck.do",
			type:"post",
			data: "id="+$("#id").val(),
			// date: { "id" : $("#id").val() } 	// json 데이터(여러개 보낼수 있음)
			success: function( data ) {
				console.log(data.trim());
				if(data=="true"){
					$("#idcheck").text("아이디가 이미 있습니다");
					$("#idcheck").css("color","red");
					$("#idCheckHidden").val("false");
				}else{
					$("#idcheck").text("사용가능 한 아이디");
					$("#idcheck").css("color","blue");
					$("#idCheckHidden").val("true");
				}
			}		
		});
	
	});

	// submit
	$("#submitBtn").click(function(){
		if($("#idCheckHidden").val() == "false"){
			alert("id를 확인해주세요");
			$("#id").focus();
			return;
		}
		if($("#pwd").val() == ""){
			alert("비밀번호를 확인해주세요");
			$("#pwd").focus();
			return;
		}
		if($("#name").val() == ""){
			alert("이름을 확인해주세요");
			$("#name").focus();
			return;
		}
		if($("#email").val() == ""){
			alert("이메일을 확인해주세요");
			$("#email").focus();
			return;
		}

		$("#frm").attr("action","./insert.do");
		$("#frm").submit();
		
		
	});
	
	
	
});

</script>
</body>
</html>