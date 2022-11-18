<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!doctype html>
<html lang="ko">
<head>
<title><%=util.Property.title %></title>
<%@ include file="/WEB-INF/view//include/headHtml.jsp" %>
<script>

function goEdit() {
	if (confirm("수정하시겠습니까?")) {
		location.href = "edit.do?reply_no="+${data.reply_no};
	}
}

function goDelete() {
	if (confirm("삭제하시겠습니까?")) {
		location.href = "delete.do?reply_no="+${data.reply_no};
	}
}

function goReply(){
	
}

</script>
</head>
<body>
<div id="boardWrap" class="bbs">
	<div class="pageTitle">
		<h2>답변게시판</h2>
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
						${data.reply_regdate }
					</td>
					<th>조회수</th>
					<td>
						${data.reply_viewcount }
					</td>
				</tr>
				<tr>
					<th>제목</th>
					<td>
						${data.reply_title }
					</td>
					<th>작성자</th>
					<td>
						관리자 
					</td>
				</tr>
				<tr>
					<th>내용</th>
					<td colspan="3">
						${data.reply_content }
					</td>
				</tr>
				<tr>
					<th>첨부파일</th>
					<td colspan="3">
						<a href="" target="_blank">첨부파일명.docx</a>
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
				<a href="edit.do?reply_no=${data.reply_no }" class="btn" onclick="goEdit();">수정</a>
				<a href="javascript:;" class="btn" onclick="goDelete();">삭제</a>
				<a href="addReply.do?reply_no=${data.reply_no }" class="btn" onclick="goReply();" style="background-color:beige; color:#515151;">답변등록</a>
			</div>
		</div>
		<div style="height:300px;"></div>
	</div>
	<!--//list-->
</div>
<!--//boardWrap-->
</body>
</html>
