<%@page import="mpicker.com.a.model.MemberDto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<h1>All Member</h1>

<%
	List<MemberDto> memlist = (List<MemberDto>)request.getAttribute("memlist");
	for(int i = 0; i < memlist.size(); i++){
		MemberDto dto = memlist.get(i);
		%>	
		<ul>
			<li>ID : <%=dto.getId() %></li>
			<li>PWD : <%=dto.getPwd() %></li>
			<li>NAME : <%=dto.getName() %></li>
			<li>EMAIL : <%=dto.getEmail() %></li>
			<li><%=dto.getAuth() %></li>
		</ul>
		<%
	}
%>
</body>
</html>