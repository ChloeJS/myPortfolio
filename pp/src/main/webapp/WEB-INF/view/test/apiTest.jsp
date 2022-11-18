<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<title>Document</title>
<script>
	$(function() {
		getList(1); // 문서가 열리면 1페이지니까
	});

	function getList(page) { // 페이지 누를 때마다, 검색 누를 때마다 반복 실행시킬 거니까 -> 함수로 만듦

		$.ajax({ // ajax는 객체를 매개변수로 넘겨줌

			url : "http://localhost:8080/project/api/board/list",
			type : "get",
			contentType : "json",
			cache : false, // 2페이지 눌러도 예전 내용 계속 나오지 않도록
			data : {
				page : page,
				pageRow : $("#pageRow").val(),
				stype : $("#stype").val(),
				sword : $("#sword").val()
			},
			success : function(res) {
				//console.log(res['totalCount']);
				$("#totalCount").text(res['totalCount']);
				$("#totalPage").text(res['totalPage']);
				$("#page").text(res['page']);

				var html = "<tr>";
				html += "<th>번호</th>";
				html += "<th>제목</th>";
				html += "<th>작성자</th>";
				html += "<th>조회수</th>";
				html += "<th>작성일</th>";
				html += "</tr>";

				$.each(res['items'], function(i, e) {
					html += "<tr>";
					html += "<td>" + e['no'] + "</td>";
					html += "<td>" + e['title'] + "</td>";
					html += "<td>" + e['writer'] + "</td>";
					html += "<td>" + e['viewcount'] + "</td>";
					html += "<td>" + e['regdate'] + "</td>";
					html += "</tr>";
				});
				html += "<tr><td colspan='5' align='center'>";

				if (res['prev'])
					html += "<a href='javascript:getList("
							+ (res['startPage'] - 1) + ")'>이전</>";
				for (var i = res['startPage']; i <= res['endPage']; i++) {
					if (i == res['page']) {
						html += " <b>" + i + "</b>";
					} else {
						html += " <a href='javascript:getList(" + i + ")'>" + i
								+ "</a>";
					}
				}
				if (res['next'])
					html += "<a href='javascript:getList("
							+ (res['endPage'] + 1) + ")'>다음</>";
				html += "</td></tr>";

				$("#boardTable").html(html);
				// after
				// append(게시판 페이징 말고, 스크롤 내리면서 계속 추가될 때 유용) 만 기억
				// remove(), empty() 의 차이

			},
			error : function(res) {
				console.log(res);
			}
		});
	}
</script>
</head>
<body>
	전체
	<span id="totalCount"></span>건 페이지
	<span id="page"></span>/
	<span id="totalPage"></span>
	<select id="pageRow" onchange="getList(1);">
		<option value="10">10개</option>
		<option value="20">20개</option>
		<option value="40">40개</option>
	</select>

	<table border="1" id="boardTable">


	</table>

	<select id="stype">
		<option value="all">전체</option>
		<option value="title">제목</option>
		<option value="content">내용</option>
	</select>
	<input type="text" id="sword">
	<input type="button" value="검색" onclick="getList(1);">
</body>
</html>