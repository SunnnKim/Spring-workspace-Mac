<%@page import="mpicker.com.a.model.BbsDto"%>
<%@page import="mpicker.com.a.model.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Bbs Replt</title>
<style type="text/css">
h1{text-align: center}
.main1{ position: absolute; left:40%; width:600px; height: 800px; }
th,td{ padding: 10px;
}
.main{ position: absolute; top:100%; left:40%; width:500px; height: 700px; }
.main h1{display: inline-block;
    text-align: center;
    width: 260px;}
th,td{ padding: 10px;
}
.btn, .back{ width: 100px; height: 50px; background: #fff; cursor: pointer; float:left;text-align:center;
line-height:50px; border: 1px solid #000; color:#fff; background: #000}
.btn{ margin:0 20px;margin-left: 40px}
.btn:hover{border: 1px solid #000; background: #fff; color:#000;}
.back:hover{border: 1px solid #000; background: #fff; color:#000;}
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

</head>
<body>
<h1>Bbs Reply</h1>
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
<div class="main1">
<table>
	<tr>
		<th>작성자</th>
		<td><input type="text" value="<%=dto.getId() %>" readonly="readonly"></td>
	</tr>
	<tr>
		<th>제목</th>
		<td><input type="text" value="<%=dto.getTitle() %>" readonly="readonly"></td>
	</tr>
	<tr>
		<th>조회수</th>
		<td><input type="text" value="<%=dto.getReadcount() %>" readonly="readonly"></td>
	</tr>
	<tr>
		<th>정보</th>
		<td><input type="text" value="<%=dto.getRef() %>-<%=dto.getStep() %>-<%=dto.getDepth() %>" readonly="readonly"></td>
	</tr>
	<tr>
		<td colspan="2">
			<textarea rows="15" cols="35" readonly="readonly"> <%=dto.getContent() %></textarea>
		</td>
	</tr>
</table>
</div>
<div class="main">
<h1>댓글</h1>
<table>
	<tr>
		<th>작성자</th>
		<td><input type="text" name="id" value="<%=loginuser.getId() %>" readonly="readonly"></td>
	</tr>
	<tr>
		<th>제목</th>
		<td><input type="text" name="title"></td>
	</tr>
	<tr>
		<td colspan="2">
			<textarea rows="15" cols="35" name="content"></textarea>
		</td>
	</tr>
</table>
	<div class="btn" onclick="btn()">
		댓글쓰기
	</div>
	<div class="back" onclick="back()">
		뒤로가기
	</div>
</div>
<script type="text/javascript">

function btn(){
	//document.querySelector("#frm").submit;
	if($("input[name=title]").val()===""){
		alert("제목을 입력하세요");
		$("input[name=title]").focus();
		return;
	}
	if($("textarea[name=content]").val()===""){
		alert("내용을 입력하세요");
		$("textarea[name=content]").focus();
		return;
	}
	var senddata = {
		seq:<%=dto.getSeq()%>,
		id:$("input[name=id]").val(),
		title:$("input[name=title]").val(),
		content:$("textarea[name=content]").val(),
		ref:<%=dto.getRef()%>,
		step:<%=dto.getStep()+1%>,
		depth:<%=dto.getDepth()+1%>
	};
	 $.ajax({
		url:"replyinsert.do",
		data:senddata,
		async: true,
		success: function(data){
			if(data =="true"){
				alert("글쓰기 성공");
				location.href="bbslist.do";
			}else{
				alert("글쓰기 실패")
			}
		},
		error: function(){
			alert('error');
			
		}

	});
	
}
function back(){
	location.href="bbslist.do";
}

</script>

</body>
</html>