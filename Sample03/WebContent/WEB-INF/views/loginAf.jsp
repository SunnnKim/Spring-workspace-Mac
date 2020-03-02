<%@page import="mpicker.com.a.model.MemberDto"%>
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
	MemberDto loginuser = (MemberDto)session.getAttribute("loginuser");
	if( loginuser != null ){
		%>
			<script type="text/javascript">
				alert("로그인 성공");
				location.href="bbslist.do";
			</script>
		<%
	}else{
		%>
			<script type="text/javascript">
				alert("아이디/비밀번호를 확인해주세요");	
				location.href="login.do";
			</script>
		<%
	}
		
%>

</body>
</html>