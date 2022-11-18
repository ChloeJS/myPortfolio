<%@ page contentType="text/html; charset=utf-8" %>
<!doctype html>
<html lang="ko">
<head>
<title><%=util.Property.title %></title>
<%@ include file="/WEB-INF/view//include/headHtml.jsp" %>
</head>
<body>
<div id="boardWrap" class="bbs">
	<div class="pageTitle">
		<h2>프로필</h2>
	</div>
	<!--//pageTitle-->
	<div class="write">
		<table>
			<colgroup>
				<col style="width:150px"/>
				<col style="width:*"/>
				<col style="width:150px"/>
				<col style="width:*"/>
			</colgroup>
			<tbody>
				<tr>
					<th>이름</th>
					<td>김지수</td>
					<th>나이</th>
					<td>
						30세 (만 29세)
					</td>
				</tr>
				<tr>
					<th>연락처</th>
					<td>010-9566-3711
					</td>
					<th>이메일</th>
					<td>etcs0603@gmail.com
					</td>
				</tr>
				<tr>
					<th>주소</th>
					<td colspan="3">
						서울특별시 강남구 압구정로 
					</td>
				</tr>
				<tr>
					<th rowspan="3">학력</th>
					<td colspan="3">
						동명여자고등학교 문과계열 졸업 (2009.03 ~ 2012.02)
					</td>
				</tr>
				<tr>
					<td colspan="3">
						편입 졸업 (2012.03 ~ 2014.02)
					</td>
				</tr>
				<tr>
					<td colspan="3">
						가톨릭대학교 사회복지학과 졸업 (2015.03 ~ 2017.08)
					</td>
				</tr>
				<tr>
					<th rowspan="2">이력</th>
					<td colspan="3">
						 한국후지필름비즈니스이노베이션 
					</td>
				</tr>
				<tr>
					<td colspan="3">
						기간 - 2020.06~2022.05 (2년) <br>
						직책 - 재경부 영업관리팀(주임) <br> 
						업무 - 직판 매출채권, 여신 및 고객 신용 관리, AR 관리 및 마감 담당
					</td>
				</tr>
				<tr>
					<th rowspan="3">자격증</th>
					<td colspan="3">
						SQL개발자 (한국데이터베이스진흥센터) - 최종합격
					</td>
				</tr>
				<tr>
					<td colspan="3">
						리눅스 마스터 2급 (한국정보통신인력개발센터) - 1차합격
					</td>
				</tr>
				<tr>
					<td colspan="3">
						TOEIC (ETS) - 755점
					</td>
				</tr>
				<tr>
					<th rowspan="3">교육이수</th>
					<td colspan="3">
						`빅데이터 분석(with파이썬)과 엘라스틱 서치를 활용한 자바(JAVA) 웹개발자 양성` 과정 이수
					</td>
				</tr>
				<tr>
					<td colspan="3">
						기간 : 2022.05 ~ 2022.12 <br>
						기관 : 더조은컴퓨터아카데미 <br>
						내용 : SQL, JAVA, HTML, CSS/JAVAScript, JSP/Servlet, Git/Maven/Gradle, 서버 배포, Spring Framework <br>
							  파이썬 기본 개념, Jupyter 개발환경 구축, 웹 크롤링, 데이터 전처리/시각화, API, MongoDB(NoSQL), AWS, Elastic Search 
					</td>
				</tr>
				<tr>
					<td colspan="3">
						TOEIC (ETS) - 755점
					</td>
				</tr>
			</tbody>
		</table>
	</div>
</div>
<!--//boardWrap-->
</body>
</html>