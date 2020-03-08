<%@page import="mpicker.com.a.model.ReserveDto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../include/header.jsp" %><!-- header -->
<%@ include file="../../include/location.jsp" %><!-- location -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/mypage.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/reservationlist.css">
<%
// 로그인 세션만료 시
if(loginuser == null ){ %>
	<script>
		alert('로그인 세션이 만료되었습니다!');
		location.href="main.do?choice=now";
	</script>
<% } %>
<%
// List 가져오기 
List<ReserveDto> list = (List<ReserveDto>) request.getAttribute("list");
int allcontents = (int)request.getAttribute("allcontents");
int nowPage = Integer.parseInt(request.getParameter("page"));
// 총페이지 개수 구하기
int numOfPages = (int) Math.ceil( allcontents / 10.0 );
%>




<div class="content-box clfix">
	<div class="content-wrapper">
		<div class="menu">
			<div class="depth03"><a href="mypage.do">회원정보</a></div>
			<div class="depth03"><a href="#" id="on">예매내역</a></div>
			<div class="depth03"><a href="#">코멘트</a></div>
			<div class="depth03"><a href="deleteaccountview.do">회원탈퇴</a></div>
		</div><!-- menu -->
		
		<div class="contents">
			<div class="title">
					<span>예매내역</span>
			</div>
			<div class="bbs-wrapper">
				<div class="reservelist-title">
					<span>No</span>
					<span>제목</span>
					<span>예매일</span>
					<span></span>
				</div>
				<div class="reservelist-contents">
				<% // 여기에 반복해서 만들기
				for(int i=0; i<list.size(); i++ ){
					ReserveDto dto = list.get(i);
					%>
						<div class="reserve-content">
							<span><%=i+1 %></span>
							<span><%=dto.getMovieTitle() %></span>
							<span><%=dto.getMovieDate().split(" ")[0] %></span>
							<span class="reserve-btn">
								<a href="reservedetail.do?seq=<%=dto.getSeq()%>">
									상세보기
								</a>
							</span>
						</div><!-- reserve-content -->
					<%
				}
			%>
				</div><!-- reservelist-contents -->
				<div class="reservelist-paging">
				<%
					for(int i = 1; i <= numOfPages; i++){
						if( nowPage == i ){
							%>
							<span class="on"><%=i %></span>
							<%
						}else{
							%>
							<span>
								<a href="reservationlist.do?page=<%=i%>">
									<%=i %>
								</a>
							</span>
							<%
						}
						
					}
				%>
				</div>
				
			</div><!-- bbs-wrapper -->
		</div><!-- contents -->
	</div>
	
	
</div>


<script>
$("#title-tab").text("Movie Picker:: My Page");	// 탭 제목

//location
$("#menu1").text("My Page");
$("#menu2").text("예매내역");

</script>

<%@ include file="../../include/footer.jsp" %>