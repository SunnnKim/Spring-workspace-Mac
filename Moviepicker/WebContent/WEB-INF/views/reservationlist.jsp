<%@page import="mpicker.com.a.model.ReserveDto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../include/header.jsp" %><!-- header -->
<%@ include file="../../include/location.jsp" %><!-- location -->
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
System.out.println(list.size());
%>




<div class="content-box clfix">
	<div class="content-wrapper">
		<div class="menu">
			<div class="depth03"><a href="#">회원정보</a></div>
			<div class="depth03"><a href="#" id="on">예매내역</a></div>
			<div class="depth03"><a href="#">코멘트</a></div>
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
			<% // 여기에 반복해서 만들기 %>
				<div class="reservelist-contents">
					<div class="reserve-content">
						<span>1</span>
						<span>작은아씨들</span>
						<span>2020.03.21</span>
						<span class="reserve-btn">
							<a href="#">
								상세보기
							</a>
						</span>
					</div><!-- reserve-content -->
				</div><!-- reservelist-contents -->
				<div class="reservelist-paging">
					<span class="on">1</span>
					<span><a href="#">2</a></span>
					<span><a href="#">3</a></span>
					<span><a href="#">4</a></span>
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