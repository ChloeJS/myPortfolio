<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>jackson ���̺긮 Ȱ���� api �ǽ�</title>
</head>
<body>
	<h3>list</h3>
	<div>
		<table>
			<thead>
				<tr>
					<th>��ȣ</th>
					<th>����</th>
					<th>��ȸ��</th>
					<th>�ۼ���</th>
					<th>�ۼ���</th>
				</tr>
			</thead>
			<tbody>

				<c:forEach var="list" items="${lists }">
					<tr>
						<td style="text-align: center;">${list.no }</td>
						<td style="text-align: center;">${list.title }</td>
						<td style="text-align: center;">${list.member_name }</td>
						<td style="text-align: center;">${list.comment_count }</td>
						<td style="text-align: center;">${list.regdate }</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
	</form>
</body>
</html>

