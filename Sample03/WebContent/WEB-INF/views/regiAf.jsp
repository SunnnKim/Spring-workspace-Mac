<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	boolean success = (boolean) request.getAttribute("success");
	if( success ){
		%>
			<script type="text/javascript">
				alert("회원가입성공");	
				location.href="login.do";
			</script>
		<%
	}else{
		%>
			<script type="text/javascript">
				alert("회원가입 실패");	
				location.href="join.do";
			</script>
		<%
	}
%>

</body>
</html>