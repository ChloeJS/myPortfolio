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
		getList(1); // ������ ������ 1�������ϱ�
	});

	function getList(page) { // ������ ���� ������, �˻� ���� ������ �ݺ� �����ų �Ŵϱ� -> �Լ��� ����

		$.ajax({ // ajax�� ��ü�� �Ű������� �Ѱ���

			url : "http://localhost:8080/project/api/board/list",
			type : "get",
			contentType : "json",
			cache : false, // 2������ ������ ���� ���� ��� ������ �ʵ���
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
				html += "<th>��ȣ</th>";
				html += "<th>����</th>";
				html += "<th>�ۼ���</th>";
				html += "<th>��ȸ��</th>";
				html += "<th>�ۼ���</th>";
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
							+ (res['startPage'] - 1) + ")'>����</>";
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
							+ (res['endPage'] + 1) + ")'>����</>";
				html += "</td></tr>";

				$("#boardTable").html(html);
				// after
				// append(�Խ��� ����¡ ����, ��ũ�� �����鼭 ��� �߰��� �� ����) �� ���
				// remove(), empty() �� ����

			},
			error : function(res) {
				console.log(res);
			}
		});
	}
</script>
</head>
<body>
	��ü
	<span id="totalCount"></span>�� ������
	<span id="page"></span>/
	<span id="totalPage"></span>
	<select id="pageRow" onchange="getList(1);">
		<option value="10">10��</option>
		<option value="20">20��</option>
		<option value="40">40��</option>
	</select>

	<table border="1" id="boardTable">


	</table>

	<select id="stype">
		<option value="all">��ü</option>
		<option value="title">����</option>
		<option value="content">����</option>
	</select>
	<input type="text" id="sword">
	<input type="button" value="�˻�" onclick="getList(1);">
</body>
</html>