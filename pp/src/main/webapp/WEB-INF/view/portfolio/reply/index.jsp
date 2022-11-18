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
		<h2><b>Q&A</b></h2>
		<h4 style="float:right">답변게시판</h4>
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
					<c:forEach var="vo" items="${data }" varStatus="status">
					<tr>
						<td>${totalCount - status.index - ((pageInfo.pageNum - 1) * pageInfo.pageRow) }</td>
							<td class="title">
								<c:forEach begin="1" end="${vo.depth }">&nbsp;&nbsp;&nbsp;</c:forEach>
								<c:if test="${vo.depth > 0 }"><img src="<%=util.Property.contextPath%>/img/ico_re.png"></c:if>
								<a href="/pp/portfolio/reply/view.do?reply_no=${vo.reply_no}">${vo.reply_title } [${vo.comment_count }]</a>
							</td>
						<td>관리자</td>
						<td class="date">${vo.reply_regdate }</td>
						<td>${vo.reply_viewcount }</td>
					</tr>
					</c:forEach>
				</c:if>
				<%-- 	<tr style='cursor:pointer;' onclick="location.href='/view.do?reply_no='${reply_no}">
						<td>11</td>
						<td class="title">
							&nbsp;&nbsp;<img src="<%=util.Property.contextPath%>/img/ico_re.png">
							답변게시판 제목입니다.
						</td>
						<td>관리자</td>
						<td>2020-01-01</td>
						<td>111</td>
					</tr>
					<tr style='cursor:pointer;' onclick="location.href='view.do?reply_no='">
						<td>11</td>
						<td class="title">답변게시판 제목입니다.</td>
						<td>관리자</td>
						<td>날짜</td>
						<td>조회수</td>
					</tr> --%>
				</tbody>
			</table>
		<div class="pagenate clear">
			<ul class='page'>
				<c:if test="${pageinfo.prev}">
					<li><a href="index.do?pageNum=${pageinfo.startPage - 1 }"> 이전 </a></li>  <!-- 페이지 이전 -->
				</c:if>
				<c:forEach var="nowPage" begin="${pageinfo.startPage }" end="${pageinfo.endPage}">
					<li><a href="index.do?pageNum=${nowPage}" <c:if test ="${pageinfo.pageNum == nowPage}"> class='current'</c:if>>${nowPage }</a></li> <!-- 현재 페이지 (for문) -->
				</c:forEach>
				<c:if test="${pageinfo.next }">
					<li><a href="index.do?pageNum=${pageinfo.endPage + 1 }"> 다음 </a></li>  <!-- 페이지 다음 -->
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
