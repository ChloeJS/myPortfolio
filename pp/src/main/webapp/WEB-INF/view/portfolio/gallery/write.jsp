<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!doctype html>
<html lang="ko">
<head>
<title><%=util.Property.title %></title>
<%@ include file="/WEB-INF/view//include/headHtml.jsp" %>
<script>
var oEditors; // 에디터 객체 담을 곳
$(document).ready(function(e){
	oEditors = setEditor("<%=request.getContextPath()%>", "contents"); // 에디터 셋팅
});

function goSave() {
	if ($("#title").val() == "") {
		alert('상품명을 입력해 주세요.');
		$("#title").focus();
		return false;
	} else if ($("#price").val() == ""){
		alert('가격을 입력해 주세요.');
		$("#price").focus();
		return false;
	}
	var sHTML = oEditors.getById["contents"].getIR();
	if (sHTML == "") {
		alert('상품설명을 입력해 주세요.');
		$("#contents").focus();
		return false;
	} else {
		oEditors.getById["contents"].exec("UPDATE_CONTENTS_FIELD", []);	// 에디터의 내용이 textarea에 적용됩니다.
	}
	$('#frm').submit();
}
</script>
</head>
<body>
<div id="boardWrap" class="bbs">
	<div class="pageTitle">
		<h2>갤러리</h2>
	</div>
	<!--//pageTitle-->
	<!--//search-->
	<div class="write">
		<form name="frm" id="frm" action="write.do" method="post" enctype="multipart/form-data">
		<input type="hidden" name="cmd" value="write">
		<table>
			<colgroup>
			
				<col style="width:150px"/>
				<col style="width:*"/>
			</colgroup>
			<tbody>
				<tr>
					<th>상품명</th>
					<td>
						<input type="text" id="title" name="gallery_title" value="" style="width:20%"/>
					</td>
				</tr>
				<tr>
					<th>가격</th>
					<td>
						<input type="text" id="price" name="price" value="" style="width:10%"/>  원
					</td>
				</tr>
				<tr>
					<th>상품설명</th>
					<td>
						<textarea id="contents" name="gallery_content" rows="25" ></textarea>
					</td>
				</tr>
				
				<tr>
					<th>상품이미지</th>
					<td>
						<input type="file" name="filename" multiple="multiple">
					</td>
				</tr>
			</tbody>
		</table>
		</form>
		<div class="btnSet">
			<div class="right">
				<a href="javascript:;" class="btn" onclick="goSave();"> 저장</a>
			</div>
		</div>
		<div style="height:300px;"></div>
	</div>
	<!--//list-->
</div>
<!--//boardWrap-->
</body>
</html>
