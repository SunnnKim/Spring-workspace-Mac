<%@page import="mpicker.com.a.model.BbsDto"%>
<%@page import="mpicker.com.a.model.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Bbs Update</title>
<style type="text/css">
h1{text-align: center}
.main{ position: absolute; left:40%; width:600px; height: 500px; }
th,td{ padding: 10px;
}
.btns{ width:300px; height: 200px}
.update {  width: 100px; height: 50px; background: #fff; cursor: pointer; float:left;text-align:center;
line-height:50px; border: 1px solid #000; color:#fff; background: #000 }
.back { width: 100px; height: 50px; background: #fff; cursor: pointer;text-align:center; 
float:left; line-height:50px; border: 1px solid #000; color:#fff; background: #000}
.update, .delete, .back, .reply{ margin: 10px 10px;}
.update{ margin-left:30px;}
.back{ margin-left:30px;}
.back:hover{border: 1px solid #000; background: #fff; color:#000;}
.reply:hover{border: 1px solid #000; background: #fff; color:#000;}
.update:hover{border: 1px solid #000; background: #fff; color:#000;}
.delete:hover{border: 1px solid #000; background: #fff; color:#000;}
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

</head>
<body>
<h1>Bbs Update</h1>
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
<div class="main">
<table>
	<tr>
		<th>작성자</th>
		<td><input type="text" name="id" value="<%=dto.getId() %>" readonly="readonly"></td>
	</tr>
	<tr>
		<th>제목</th>
		<td><input type="text" name="title" value="<%=dto.getTitle() %>"></td>
	</tr>
	<tr>
		<td colspan="2">
			<textarea rows="15" cols="35" name="content"> <%=dto.getContent() %></textarea>
		</td>
	</tr>
</table>
<div class="btns">
	<div class="update" onclick="update()">
		수정
	</div>
	<div class="back" onclick="back()">
		뒤로가기
	</div>
</div>
</div>

<script type="text/javascript">
function update(){
	if($("input[name=title]").val().trim()===""){
		alert("제목을 입력하세요");
		$("input[name=title]").focus();
		return;
	}
	if($("textarea[name=content]").val().trim()===""){
		alert("내용을 입력하세요");
		$("textarea[name=content]").focus();
		return;
	}

	if(confirm("수정하시겠습니까?")){
		var senddata = {
			seq:<%=dto.getSeq()%>,
			id:$("input[name=id]").val(),
			title:$("input[name=title]").val(),
			content:$("textarea[name=content]").val()
		};
			
		 $.ajax({
			url:"bbsupdate.do",
			data:senddata,
			async: true,
			success: function(data){
				if(data =="true"){
					alert("글 수정 성공");
					location.href="bbslist.do";
				}else{
					alert("글 수정 실패")
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