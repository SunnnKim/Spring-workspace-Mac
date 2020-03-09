<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<table class="list_table" style="width: 85%;">
	<colgroup>
		<col style="width: 70px">
		<col style="width: auto">
		<col style="width: 100px">
	</colgroup>
	<thead>
		<tr>
			<th>번호</th>
			<th>제목</th>
			<th>작성자</th>
		</tr>
	</thead>
	<tbody>
		<!-- bbslist가 비었을 때 (null) -->
		<c:if test="${empty list}"> 
			<tr>
				<td colspan="3">작성된 글이 없습니다.</td>
			</tr>
		</c:if>
		
		<!-- 글 있을 때 -->
		<c:forEach items="${list }" var="bbs" varStatus="vs">
			<tr class="_hover_tr">
				<td>${vs.count }</td>
				<td style="text-align: left"><a href="bbsdetail.do?seq=${bbs.seq }">${bbs.title }</a></td>
				<td>${bbs.id }</td>
			</tr>
		</c:forEach>
	</tbody>


</table>





