<%@ page contentType="text/html; charset=utf-8"%>
<!doctype html>
<html lang="ko">
<head>
<title><%=util.Property.title%></title>
<%@ include file="/WEB-INF/view//include/headHtml.jsp"%>

<style>
.main .box{
	background-color: #F5F5F5;
}
</style>

<script>
	$(document)
			.ready(
					function() {
						$(".trade_type")
								.each(
										function(idx, item) {
											if ($(".trade_type").eq(idx).prop(
													"checked")) { // 라디오박스 체크된 경우
												var val = $(
														"input:radio[name='trade_type']")
														.eq(idx).val();
												selectNation("export");
											}
										});

						$(".trade_type")
								.on(
										'ifChecked',
										function() {
											$(".trade_type")
													.each(
															function(idx, item) {
																if ($(
																		".trade_type")
																		.eq(idx)
																		.prop(
																				"checked")) { // 라디오박스 체크된 경우
																	var val = $(
																			"input:radio[name='trade_type']")
																			.eq(
																					idx)
																			.val();
																	selectNation(val);
																}
															});
										});

					});

	function selectPort(source, target, sel) {
		$("#" + target + " option").remove();

		var korea_city = [ "BUSAN", "INCHEON", "PYONGTAEK", "KWANGYANG" ];
		var korea_value = [ "KRPUS", "KRINC", "KRPTK", "KRKAN" ];
		var japan_city = [ "CHIBA", "HIROSHIMA", "KOBE", "NAGOYA", "OSAKA",
				"SHIMIZU", "TOKYO", "YOKOHAMA" ];
		var japan_value = [ "JPCHB", "JPHIJ", "JPUKB", "JPNGO", "JPOSA",
				"JPSMZ", "JPTYO", "JPYOK" ];
		var china_city = [ "NINGBO", "QINGDAO", "SHANGHAI", "TAICANG",
				"XINGANG", "ZHANGJIAGANG" ];
		var china_value = [ "CNNBG", "CNTAO", "CNSHA", "CNTAG", "CNTXG",
				"CNZJG" ];

		var nation = $("#" + source + " option:selected").val();
		if (nation == "korea") {
			for (var i = 0; i < korea_city.length; i++) {
				var isSel = "";
				if (korea_value[i] == sel)
					isSel = "selected";
				$("#" + target).append(
						"<option value="+korea_value[i]+" "+isSel+">"
								+ korea_city[i] + "</option>");
			}
		} else if (nation == "japan") {
			for (var i = 0; i < japan_city.length; i++) {
				var isSel = "";
				if (japan_value[i] == sel
						|| (sel == "" && japan_value[i] == "JPTYO"))
					isSel = "selected";
				$("#" + target).append(
						"<option value="+japan_value[i]+" "+isSel+">"
								+ japan_city[i] + "</option>");
			}
		} else if (nation == "china") {
			for (var i = 0; i < china_city.length; i++) {
				var isSel = "";
				if (china_value[i] == sel
						|| (sel == "" && china_value[i] == "CNSHA"))
					isSel = "selected";
				$("#" + target).append(
						"<option value="+china_value[i]+" "+isSel+">"
								+ china_city[i] + "</option>");
			}
		}
		$('#' + target).data('selectric').refresh();
	}

	function changeTab(v) {
		$("#curbl_notice").removeClass("on");
		$("#curbl_qna").removeClass("on");
		$("#curbl_" + v).addClass("on");

		$("#notice_tab").hide();
		$("#qna_tab").hide();
		$("#" + v + "_tab").show();
	}

	function selectNation(v) {
		if (v == "export") {
			$("#nation1 option").remove();
			$("#nation1").append("<option value='korea'>KOREA</option>");
			$("#nation1").data('selectric').refresh();
			selectPort('nation1', 'port1', '');

			$("#nation2 option").remove();
			$("#nation2").append("<option value='japan'>JAPAN</option>");
			$("#nation2").append("<option value='china'>CHINA</option>");
			$("#nation2").data('selectric').refresh();
			selectPort('nation2', 'port2', 'JPTYO');

		} else if (v == "import") {
			$("#nation1 option").remove();
			$("#nation1").append("<option value='japan'>JAPAN</option>");
			$("#nation1").append("<option value='china'>CHINA</option>");

			$("#nation1").data('selectric').refresh();
			selectPort('nation1', 'port1', 'JPTYO');

			$("#nation2 option").remove();
			$("#nation2").append("<option value='korea'>KOREA</option>");
			$("#nation2").data('selectric').refresh();
			selectPort('nation2', 'port2', '');
		}
	}

	function goSchedule() {
		var n1 = $("#nation1").val();
		var n2 = $("#nation2").val();
		var p1 = $("#port1").val();
		var p2 = $("#port2").val();
		var trade_type = $("input:radio[name=trade_type]:checked").val();
		var pYear = $("#pYear").val();
		var pMonth = $("#pMonth").val();

		parent.clickMenu('schedule1', '스케쥴', '/schedule/index.do?nation1=' + n1
				+ '&nation2=' + n2 + '&port1=' + p1 + '&port2=' + p2
				+ '&trade_type=' + trade_type + '&pYear=' + pYear + '&pMonth='
				+ pMonth);
	}

	function goCargo() {
		var stype = $("#cargo_stype").val();
		var sval = $("#cargo_sval").val();

		parent.clickMenu('cargo1', '화물추적', '/cargo/index.do?stype=' + stype
				+ '&sval=' + sval)
	}

	function goContainer() {
		var stype = $("#con_stype").val();
		var sval = $("#con_sval").val();

		parent.clickMenu('export0', '컨테이너<br>중량 조회',
				'/export/container/index.do?stype=' + stype + '&sval=' + sval)
	}
</script>
</head>
<body>
	<div id="boardWrap" class="bbs">
		<div class="main">
			<div class="wid48 fl_l">
				<div class="box notice">
					<h2>ORDER 주문내역조회</h2><br>
					<li>고객님께서 주문하신 상품의 주문내역을 확인하실 수 있습니다. <br>비회원의 경우, 주문서의 주문번호와 비밀번호로 주문조회가 가능합니다.</li>
					<li>
						<a href="javascript:;" onclick="parent.clickMenu('board2', 'Q&A', '/board/qna/view.do?idx=');">BBB
							<span>2020-01-01</span>
						</a>
					</li>
				</div>
				<div class="box notice" style="border: 1px solid #e9e9e9;">
					<h2>PROFILE 회원정보</h2><br>
					<li>회원이신 고객님의 개인정보를 관리하는 공간입니다. <br> 개인정보를 최신 정보로 유지하시면 보다 간편히 쇼핑을 즐기실 수 있습니다.</li>
					<li>
						<a href="javascript:;" onclick="parent.clickMenu('board2', 'Q&A', '/board/qna/view.do?idx=');">BBB
							<span>2020-01-01</span>
						</a>
					</li>
				</div>
				<div class="box notice">
					<h2>WISHLIST 관심상품 - 관심상품이미지/상품명 뜨게 수정</h2><br>
					<li>관심상품으로 등록하신 상품의 목록을 보여드립니다.</li>
					<li>
						<a href="javascript:;" onclick="parent.clickMenu('board2', 'Q&A', '/board/qna/view.do?idx=');">BBB
							<span>2020-01-01</span>
						</a>
					</li>
				</div>
				<div class="box notice">
					<h2>MY BOARD 게시물관리</h2><br>
					<li>고객님께서 작성하신 게시물을 관리하는 공간입니다. <br>고객님께서 작성하신 글을 한눈에 관리하실 수 있습니다.</li>
					<li>
						<a href="javascript:;" onclick="parent.clickMenu('board2', 'Q&A', '/board/qna/view.do?idx=');">BBB
							<span>2020-01-01</span>
						</a>
					</li>
				</div>
				<div class="box notice">
					<h2>REVIEW 리뷰관리</h2><br>
					<li>고객님께서 작성하신 상품 리뷰글을 관리하는 공간입니다. <br>고객님께서 작성하신 리뷰를 한눈에 확인하실 수 있습니다.</li>
					<li>
						<a href="javascript:;" onclick="parent.clickMenu('board2', 'Q&A', '/board/qna/view.do?idx=');">BBB
							<span>2020-01-01</span>
						</a>
					</li>
				</div>
			</div>
		</div>
	</div>
	<!--//contentsWrap-->
</body>
</html>
