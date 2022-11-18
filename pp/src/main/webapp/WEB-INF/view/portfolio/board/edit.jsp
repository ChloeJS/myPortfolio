<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="java.net.*"%>

<!doctype html>
<html lang="ko">
<head>
<title><%=util.Property.title %></title>
<%@ include file="/WEB-INF/view//include/headHtml.jsp" %>
<script>
var oEditors; // 에디터 객체 담을 곳
$(document).ready(function(e){
	oEditors = setEditor("<%=request.getContextPath()%>", "content"); // 에디터 셋팅
});

function goSave() {
	if ($("#title").val() == "") {
		alert('제목을 입력해 주세요.');
		$("#title").focus();
		return false;
	}
	var sHTML = oEditors.getById["content"].getIR();
	if (sHTML == "") {
		alert('내용을 입력해 주세요.');
		$("#content").focus();
		return false;
	} else {
		oEditors.getById["content"].exec("UPDATE_CONTENTS_FIELD", []);	// 에디터의 내용이 textarea에 적용됩니다.
	}
	$('#frm').submit();
}
</script>
<script>
function delete_file(file_no) {
	console.log(file_no)
	$.ajax({
		url: "../board/deleteFile.do",
		type : "GET",
		data : {
			file_no : file_no
		},
		success : function(res){
			console.log(res)
		}
	})
}


</script>
</head>
<body>
<div id="boardWrap" class="bbs">
	<div class="pageTitle">
		<h2>댓글게시판</h2>
	</div>
	<!--//pageTitle-->
	<!--//search-->
	<div class="write">
		<form name="frm" id="frm" action="update.do" method="POST" enctype="multipart/form-data">
		<input type="hidden" name="cmd" value="edit">
		<input type="hidden" name="no" value="${view.no }">
		<input type="hidden" name="idx" value="1">
		<table>
			<colgroup>
				<col style="width:150px"/>
				<col style="width:*"/>
			</colgroup>
			<tbody>
				<tr>
					<th>제목</th>
					<td>
						<input type="text" id="title" name="title" value="${view.title }" />
					</td>
				</tr>
				<tr>
					<th>내용</th>
					<td>
						<textarea id="content" name="content" rows="25">${view.content }</textarea>
					</td>
				</tr>
				<tr>
					<th>첨부파일</th>
					<td>
					<c:forEach var="fileList" items="${fileList }" varStatus="fvoStatus">
						<input type="checkbox" id="filename_chk" name="filename_chk" value="${fileList.file_no }" onchange="delete_file(${fileList.file_no})" title="첨부파일을 삭제하시려면 체크해주세요" />
						<p><a href="/pp/download.jsp?oName=${fileList.filename_org}&sName=${fileList.filename_real}" data-no="${fileList.no }" target="_blank"> ${fileList.filename_org} </a><br />
					</c:forEach>
						<label for="filename_chk">기존 파일 삭제</label>
						</p>
					<input type="file" name="filename">
				</td>
			</tr>
		</tbody>
	</table>
	</form>
	<div class="btnSet">
		<div class="right">
			<a href="javascript:;" class="btn" onclick="goSave();">저장</a>
		</div>
	</div>
	<div style="height:300px;"></div>
</div>
<!--//list-->
</div>
<!--//boardWrap-->
</body>
</html>
