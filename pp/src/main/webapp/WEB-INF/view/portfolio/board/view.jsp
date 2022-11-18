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

// 게시글 수정
function goEdit() {
	if (confirm("수정하시겠습니까?")) {
		location.href = "update.do?no="+${view.no};
	}
}

// 게시글 삭제
function goDelete() {
	if (confirm("삭제하시겠습니까?")) {
		location.href = "delete.do?no=" + ${view.no};
	}
}

// 댓글 목록 조회
function getComment(pageNum){
	$.ajax({
		url : "/pp/portfolio/comment/index.do",
		method : "GET",
		data : {
			pageNum : pageNum,
			tablename : 'board', // 어떤 게시판인지
			board_no : ${view.no} // 어떤 게시글인지
		},
		success : function(result){
			 $("#commentPart").html(result); 
		}
	});
}

// 댓글 목록 조회 함수 실행
$(function(){
	getComment(1);
});

// 댓글 저장 (10/29 아직 회원정보가 없어서 로그인 체크는 안함)
function saveComment(){
	if (confirm('댓글을 등록하시겠습니까?')){
		$.ajax({
			url : "/pp/portfolio/comment/insert.do",
			method : "GET",
			data : {
				tablename : "board", // 어떤 게시판인지
				board_no : ${view.no}, // 어떤 게시글인지
				comment_content :  $("#comment_content").val(), // 작성한 댓글내용
				user_no : 1 // 작성자가 누구인지 (회원정보 아직 없음-추후보완)
			},
			success : function(result){
				console.log(result);
				if (result == 1){ // 결과값(컨트롤러의 insert메서드가 리턴해주는 값)이 1이면 정상 등록!
					alert("댓글이 정상적으로 등록되었습니다.");
					$("#comment_content").val(""); // 댓글이 정상적으로 등록되면, 작성란을 빈칸으로 초기화해준다.
					getComment(1); // 등록한 글이 가장 위로 올라오기 때문에(regdate DESC) 댓글 목록 1페이지를 보여줘야 한다.
				}
			}
		});
	}
}


function updateComment(comment_no){
	if (confirm('댓글을 수정하시겠습니까?')){
		$.ajax({
			url : "/pp/portfolio/comment/update.do?comment_no="+comment_no,
			method : "GET",
			data : {
				tablename : "board", // 어떤 게시판인지
				board_no : ${view.no}, // 어떤 게시글인지
				comment_content :  $("#comment_content").val(), // 작성한 댓글내용
				user_no : 1 // 작성자가 누구인지 (회원정보 아직 없음-추후보완)
			},
			success : function(result){
				console.log(result);
				if (result == 1){ // 결과값(컨트롤러의 insert메서드가 리턴해주는 값)이 1이면 정상 등록!
					alert("댓글이 정상적으로 수정되었습니다.");
				}
			}
		});
	}
} 

// 댓글 삭제
function delComment(comment_no){
	$.ajax({
		url : "/pp/portfolio/comment/delete.do?comment_no=" + comment_no,
		success : function(result){
			if (result == "1") {
				console.log(result);
				alert("댓글이 정상적으로 삭제되었습니다.");
				getComment(1); // 정상적으로 삭제되어도 댓글목록의 첫 페이지로 가야한다.
			}
		}
	})
}


// 댓글 답변 달기



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
			<form name="frm" id="frm" action="view.do" method="GET" enctype="multipart/form-data">
				<input type="hidden" name="cmd" value="view">
				<table>
					<colgroup>
						<col style="width: 150px" />
						<col style="width: *" />
						<col style="width: 150px" />
						<col style="width: *" />
					</colgroup>
					<tbody>
						<tr>
							<th>작성일</th>
							<td>${view.regdate }</td>
							<th>조회수</th>
							<td>${view.viewcount }</td>
						</tr>
						<tr>
							<th>제목</th>
							<td>${view.title }</td>
							<th>작성자</th>
							<td>${view.user_name }</td>
						</tr>
						<tr>
							<th>내용</th>
							<td colspan="3">${view.content }</td>
						</tr>
						<tr>
							<th>첨부파일</th>
							<td colspan="3">
							<c:forEach var="fileList" items="${fileList }" varStatus="fvoStatus">
								<a href="/pp/download.jsp?oName=${fileList.filename_org}&sName=${fileList.filename_real}" target="_blank"> ${fileList.filename_org} </a>
							</c:forEach></td>
						</tr>
					</tbody>
				</table>
			</form>
			<div class="btnSet">
				<div class="left">
					<a href="javascript:;" class="btn"
						onclick="location.href='index.do?pageNum=${param.pageNum}';">목록</a>
				</div>
				<div class="right">
					<a href="javascript:;" class="btn" onclick="goEdit();">수정</a> 
					<a href="javascript:;" class="btn" onclick="goDelete();">삭제</a>
				</div>
			</div>
			
		</div>
		<!--//list-->
		<div>
			
			<br>
			<div id="commentPart"></div><!-- 댓글 목록 출력을 위해 -->
			
			<form method="get" name="frm" id="frm" action="" enctype="multipart/form-data">
				<table class="board_write">
					<colgroup>
						<col width="*" />
						<col width="100px" />
					</colgroup>
					<tbody>
						<tr>
						<br>
						<hr>
							<tr><h3 style="padding:10px">댓글 작성</h3></tr>
							<td style="padding:10px;"><textarea name="comment_content" id="comment_content" style="height: 70px; width: 100%; float:center;" ></textarea></td>
							<td>
								<div class="btnSet" style="text-align: center;">
									<a class="btn" href="javascript:saveComment();">등록</a>
								</div>
							</td>
						</tr>
					</tbody>
				</table>
			</form>
		</div>
	</div>
	<!--//boardWrap-->
</body>
</html>
