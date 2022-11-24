<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!doctype html>
<html lang="ko">
<head>
<title><%=util.Property.title %></title>
<%@ include file="/WEB-INF/view//include/headHtml.jsp" %>
<script>
</script>
</head>
<body>
<div id="boardWrap" class="bbs">
	<div class="pageTitle">
		<h2><b>REVIEW</b></h2>
		<h4 style="float:right">댓글게시판</h4>
	</div>
	<!--//pageTitle-->
	<!--//search-->
	<div class="list">
			<table>
				<caption> 목록 </caption>
				<colgroup>
					<col width="50px" />
					<col width="*" />
					<col width="10%" />
					<col width="10%" />
					<col width="10%" />
				</colgroup>
				<thead>
					<tr>
						<th>번호</th>
						<th>제목</th>
						<th>작성자</th>
						<th>작성일</th>
						<th>조회수</th>
					</tr>
				</thead>
				<tbody>
				<c:if test="${empty data }">
					<tr>
						<td colspan="5">등록된 데이터가 없습니다.</td>
					</tr>
				</c:if>
				<c:if test="${not empty data }">
					<c:forEach items="${data}" var="vo" varStatus="status">
						<tr>
							<td>${totalCount - status.index - ((pageInfo.pageNum - 1) * pageInfo.pageRow) }</td>
							<td><a href="view.do?no=${vo.no }&pageNum=${pageInfo.pageNum}">${vo.title }  [${vo.comment_count}]</a></td>
							<td>회원1 </td>
							<td>${vo.regdate } </td>
							<td>${vo.viewcount }</td>
						</tr>
					</c:forEach>
				</c:if>
			
				</tbody>
			</table>
		<div class="pagenate clear">
			<ul class='page'>
				<c:if test="${pageInfo.prev}">
					<li><a href="index.do?pageNum=${pageInfo.startPage - 1 }"> 이전 </a></li>  <!-- 페이지 이전 -->
				</c:if>
				
				<c:forEach var="nowPage" begin="${pageInfo.startPage }" end="${pageInfo.endPage}">
					<li><a href="index.do?pageNum=${nowPage}" <c:if test ="${pageInfo.pageNum == nowPage}"> class='current'</c:if>>${nowPage }</a></li> <!-- 현재 페이지 (for문) -->
				</c:forEach>
				
				<!-- <li><a href='javascript:;' class='current'>1</a></li>
					<li><a href='/portfolio/board/index.do?reqPageNo=2'>2</a></li>
					<li><a href='/portfolio/board/index.do?reqPageNo=3'>3</a></li> -->
					
				<c:if test="${pageInfo.next }">
					<li><a href="index.do?pageNum=${pageInfo.endPage + 1 }"> 다음 </a></li>  <!-- 페이지 다음 -->
				</c:if>
			
			</ul> 
		</div>
		<div class="btnSet">
			<div class="right">
				<a href="write.do" class="btn">작성</a>
			</div>
		</div>
	</div>
	<!--//list-->
</div>
<!--//boardWrap-->
</body>
</html>