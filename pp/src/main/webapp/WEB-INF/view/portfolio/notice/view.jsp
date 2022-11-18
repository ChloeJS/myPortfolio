<%@ page language="java" 
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="java.net.*"%>

<!doctype html>
<html lang="ko">
<head>
<title><%=util.Property.title %></title>
<%@ include file="/WEB-INF/view//include/headHtml.jsp" %>
<script>

function goEdit() {
	if (confirm("수정하시겠습니까?")) {
		location.href = "update.do?notice_no="+${view.notice_no};
	}
}

function goDelete() {
	if (confirm("삭제하시겠습니까?")) {
		location.href = "delete.do?notice_no=" + ${view.notice_no};
	}
}
</script>
</head>
<body>
<div id="boardWrap" class="bbs">
	<div class="pageTitle">
		<h2>공지사항</h2>
	</div>
	<!--//pageTitle-->
	<!--//search-->
	<div class="write">
		<form name="frm" id="frm" action="view.do" method="GET" enctype="multipart/form-data">
		<input type="hidden" name="cmd" value="view">
		<table>
			<colgroup>
				<col style="width:150px"/>
				<col style="width:*"/>
				<col style="width:150px"/>
				<col style="width:*"/>
			</colgroup>
			<tbody>
				<tr>
					<th>작성일</th>
					<td>
						${view.notice_regdate }
					</td>
					<th>조회수</th>
					<td>
						${view.notice_viewcount }
					</td>
				</tr>
				<tr>
					<th>제목</th>
					<td>
						${view.notice_title }
					</td>
					<th>작성자</th>
					<td>
						${view.notice_writer }
					</td>
				</tr>
				<tr>
					<th>내용</th>
					<td colspan="3">
						${view.notice_content }
					</td>
				</tr>
				<tr>
					<th>첨부파일</th>
					<td colspan="3">
					<c:forEach var="fileList" items="${fileList }" varStatus="fvoStatus">
						<a href="/pp/download.jsp?oName=${fileList.filename_org}&sName=${fileList.filename_real}" target="_blank"> ${fileList.filename_org} </a>
						
					</c:forEach>
					</td>
				</tr>
			</tbody>
		</table>
		</form>
		<div class="btnSet">
			<div class="left">
				<a href="javascript:;" class="btn" onclick="location.href='index.do';">목록</a>
			</div>
			<div class="right">
				<a href="javascript:;" class="btn" onclick="goEdit();">수정</a>
				<a href="javascript:;" class="btn" onclick="goDelete();">삭제</a>
			</div>
		</div>
		<div style="height:300px;"></div>
	</div>
	<!--//list-->
</div>
<!--//boardWrap-->
</body>
</html>
