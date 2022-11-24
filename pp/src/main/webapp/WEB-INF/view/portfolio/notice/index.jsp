<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!doctype html>
<html lang="ko">
<head>
<title><%=util.Property.title%></title>
<%@ include file="/WEB-INF/view//include/headHtml.jsp"%>
<script>
function goDelete(no) {
	if (confirm("삭제하시겠습니까?")) {
		location.href = "delete.do?notice_no="+no;
		location.href= "index.do";
	}
}
</script>
</head>
<body>
	<div id="boardWrap" class="bbs">
		<div class="pageTitle">
			<h2>
				<b>NOTICE</b>
			</h2>
			<h4 style="float: right">기본게시판</h4>
		</div>
		<!--//pageTitle-->
		<!--//search-->
		<div class="list">
			<table>
				<caption>목록</caption>
				<colgroup>
					<col width="50px" />
					<col width="*" />
					<col width="10%" />
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
						<th>삭제</th>
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
								<td><a href="view.do?notice_no=${vo.notice_no }">${vo.notice_title }</a></td>
								<td>★관리자★</td>
								<td><fmt:formatDate pattern="yyyy-MM-dd hh:MM:ss" value="${vo.notice_regdate }" /></td>
								<td>${vo.notice_viewcount }</td>
								<td><a href="javascript:;" class="btn" onclick="goDelete(${vo.notice_no})">삭제</a></td>
							</tr>
						</c:forEach>
					</c:if>

				</tbody>
			</table>
			<div class="pagenate clear">
				<ul class='page'>
					<c:if test="${pageInfo.prev}">
						<li><a href="index.do?pageNum=${pageInfo.startPage - 1 }">
								이전 </a></li>
						<!-- 페이지 이전 -->
					</c:if>

					<c:forEach var="nowPage" begin="${pageInfo.startPage }"
						end="${pageInfo.endPage}">
						<li>
						<a href="index.do?pageNum=${nowPage}"
							<c:if test ="${pageInfo.pageNum == nowPage}"> class='current'</c:if>>${nowPage }</a></li>
						<!-- 현재 페이지 (for문) -->
					</c:forEach>

					<!-- <li><a href='javascript:;' class='current'>1</a></li>
					<li><a href='/portfolio/notice/index.do?reqPageNo=2'>2</a></li>
					<li><a href='/portfolio/notice/index.do?reqPageNo=3'>3</a></li> -->

					<c:if test="${pageInfo.next }">
						<li><a href="index.do?pageNum=${pageInfo.endPage + 1 }"> 다음 </a></li>
						<!-- 페이지 다음 -->
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