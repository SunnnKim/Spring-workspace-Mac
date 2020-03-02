<%@page import="mpicker.com.a.model.BbsDto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%!
// 여기는 들여쓰기 만드는 함수 
public String arrow (int depth){
	String rs = "<i class='fas fa-angle-double-right'></i>";
	String nbsp = "&nbsp;&nbsp;&nbsp;&nbsp;";
	
	String ts = "";
	for(int i =0; i< depth; i++ ) {
		ts += nbsp;	// 앞에 부분의 여백
	}
	
	return depth==0? "": ts+rs ;
}%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Bbs List</title>
<style type="text/css">
h1{text-align: center}
.main { text-align: center; position: absolute;top:20%; left:25%; height: 1000px;}
.search{ }
.search ul {list-style: none}
.search ul li { float: left; margin: 0 20px;}
.writebtn { width:100px; height: 30px; text-align: center; transition:all 0.2s ease-in-out; 
line-height: 30px;border: 1px solid; float:right; background: #000; color:#fff;}
.writebtn:hover{border: 1px solid #000; background: #fff; color:#000;}
.searchBtn:hover{border: 1px solid #000; background: #fff; color:#000; }
.searchBtn{ transition:all 0.2s ease-in-out; width: 100px; height:30px; background: #000; color: #fff; text-align: center; cursor:pointer;
line-height: 30px}
</style>
<script src="https://kit.fontawesome.com/a9726fbbf3.js" crossorigin="anonymous"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
</head>
<body>
<h1>Hello BBS user! ${loginuser.name} </h1>
<div class="main" align="center" >
<table>
<col width="100"> <col width="400"><col width="80">
<tr style="border-bottom: 3px solid">
	<th>번호</th>
	<th>제목</th>
	<th>작성자</th>
</tr>
<tr>
	<td colspan="3" style="border-bottom: 3px solid; padding:10px 0; margin-bottom: 10px"></td>
</tr>
<%
	List<BbsDto> list = (List<BbsDto>)request.getAttribute("list");
	if(list.size() > 0){
		for( int i = 0; i<list.size(); i++ ){
			BbsDto dto = list.get(i);
			if(dto.getDel()== 0){	// 지워지지 않은 게시글 일 때
			%>
			<tr>
				<td><%=i+1 %></td>
				<td style="text-align: left">
					<%= arrow(dto.getDepth()) %>
					<a href="bbsdetail.do?seq=<%=dto.getSeq()%>">
						<%=dto.getTitle() %>
					</a>
				</td>
				<td><%=dto.getId()%></td>
			</tr>
			<%
		}else{
			%>
			<tr>
				<td><%=i+1 %></td>
				<td style="text-align: left"><%= arrow(dto.getDepth()) %> 해당 게시글은 삭제되었습니다.</td>
				<td></td>
			</tr>
			<%
		}
			}
	}else{
	%>
		<tr>
			<td colspan="3">작성된 글이 없습니다.</td>
		</tr>
	<%
	}

%>
</table>
<div class="search">
<form id="search" action="search.do">
	<ul>
		<li>
			<select id="choice" name="choice">
				<option value="id" selected="selected">작성자</option>
				<option value="title">제목</option>
				<option value="content">내용</option>
			</select>
		</li>
		<li>
			<input type="text" name="searchword">
		</li>
		<li>
			<div class="searchBtn" onclick="search()">검색하기</div>
		</li>
	</ul>
</form>
</div>
<a href="bbswrite.do">
	<div class="writebtn">
		글쓰기
	</div>
</a>
</div>

<script type="text/javascript">

function search(){
	if($("input[name=searchword]").val().trim() == ""){
		alert("검색어를 입력하세요");
		$("input[name=searchword]").focus();
		return;
	}
	$("#search").submit();
}
</script>


</body>
</html>