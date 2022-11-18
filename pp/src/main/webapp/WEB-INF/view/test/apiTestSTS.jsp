<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script type="text/javascript">
function apiTest(pageNum){
	$.ajax ({
		url : "http://localhost:8081/api/board/list.do",
		method : 'GET',
		/* data : {
			pageNum : 2
		}, */
		success : function (response){
			//console.log(response)
			const jsonString = JSON.stringify(response)
			var result = JSON.parse(jsonString);
			console.log(result)
			console.log(result.prev)
			
			let topHtml = ''
			let apiListHtml = ''
			let pageHtml = ''
			
			topHtml += '<div style="float:left">'
			topHtml += '<p><span><strong>'
			topHtml += '총' + result.totalCount + '개 </strong> | \t' + result.pageNum + '/' + result.totalPage + '페이지 </span>'
			topHtml += '</p> </div>'
		/* 	
			pageHtml += '<div>'
			if (result.prev)
			pageHtml += ''
			
	 */
		$('#top').html(topHtml)
	}
	})
}

apiTest(2);

</script>
<body>
<div id="top"></div>
<div id="page">
	<ul class='paging'>
		<c:if test="${prev == true}">
		<li><a href="javascript:select(${pageNum});"></a></li>
		</c:if>
	</ul>
	
</div>

</body>
</html>