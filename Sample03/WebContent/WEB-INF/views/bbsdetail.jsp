<%@page import="bit.com.a.model.BbsDto"%>
<%@page import="mpicker.com.a.model.BbsDto"%>
<%@page import="mpicker.com.a.model.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Bbs Detail</title>
<style type="text/css">
h1{text-align: center}
.main{ position: absolute; left:40%; width:600px; height: 800px; }
th,td{ padding: 10px;
}
.btns{ width:300px; height: 200px}
.update, .delete{  width: 50px; height: 50px; background: #fff; cursor: pointer; float:left;text-align:center;
line-height:50px; border: 1px solid #000; color:#fff; background: #000 }
.back, .reply{ width: 100px; height: 50px; background: #fff; cursor: pointer;text-align:center; 
float:left; line-height:50px; border: 1px solid #000; color:#fff; background: #000}
.update, .delete, .back, .reply{ margin: 10px 10px;}
.update{ margin-left:30px;}
.reply{ margin-left:10px;}
.back{ margin-left:90px;}
.back:hover{border: 1px solid #000; background: #fff; color:#000;}
.reply:hover{border: 1px solid #000; background: #fff; color:#000;}
.update:hover{border: 1px solid #000; background: #fff; color:#000;}
.delete:hover{border: 1px solid #000; background: #fff; color:#000;}
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
</head>
<body>
<%
	// session info
	MemberDto loginuser = (MemberDto)session.getAttribute("loginuser");
	if(loginuser == null){
		%>
			<script type="text/javascript">
				alert('로그인 세션 만료!');
			</script>
		<% 
		response.sendRedirect("login.do");
	}
%>
<%
	// bbs detail
	BbsDto dto = (BbsDto)request.getAttribute("dto");
%>
<h1>BBS DETAIL</h1>
<div class="main">
<table>
	<tr>
		<th>작성자</th>
		<td><input type="text" name="id" value="<%=dto.getId() %>" readonly="readonly"></td>
	</tr>
	<tr>
		<th>제목</th>
		<td><input type="text" name="title" value="<%=dto.getTitle() %>" readonly="readonly"></td>
	</tr>
	<tr>
		<th>조회수</th>
		<td><input type="text" value="<%=dto.getReadcount() %>" readonly="readonly"></td>
	</tr>
	<tr>
		<th>작성시간</th>
		<td><input type="text" value="<%=dto.getWdate() %>" readonly="readonly"></td>
	</tr>
	<tr>
		<th>정보</th>
		<td><input type="text" value="<%=dto.getRef() %>-<%=dto.getStep() %>-<%=dto.getDepth() %>" readonly="readonly"></td>
	</tr>
	<tr>
		<td colspan="2">
			<textarea rows="15" cols="35" name="content" readonly="readonly"> <%=dto.getContent() %></textarea>
		</td>
	</tr>
</table>
<div class="btns">
<% if(loginuser.getId().equals(dto.getId())){ 
	%>
		<div class="update" onclick="update()">
			수정
		</div>
		<div class="delete" onclick="deletebbs()">
			삭제
		</div>
	<%
}
%>
	<div class="reply" onclick="reply()">
		댓글쓰기
	</div>
	<div class="back" onclick="back()">
		뒤로가기
	</div>
</div>
</div>
<script type="text/javascript">
function update(){
	location.href="update.do?seq=<%=dto.getSeq()%>"
}
function deletebbs(){
	if(confirm("게시글을 삭제하시겠습니까?")){
		 $.ajax({
			url:"bbsdelete.do",
			data:"seq=<%=dto.getSeq()%>",
			async: true,
			success: function(data){
				if(data =="true"){
					alert("삭제 성공");
					location.href="bbslist.do";
				}else{
					alert("삭제 실패")
				}
			},
			error: function(){
				alert('error');
				
			}
	
		});
		}
}
function back(){
	location.href="bbslist.do";
}
function reply(){
	location.href="reply.do?seq=<%=dto.getSeq()%>";
}

</script>


</body>
</html>