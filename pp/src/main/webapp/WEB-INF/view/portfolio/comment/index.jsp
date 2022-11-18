<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!-- 댓글은 여러 게시판에서 활용할 수 있기 때문에 따로 작성한다. -->
<hr>
<div style="float:left;"><h3 style="padding:10px">댓글 목록</h3></div>
<div style="float:right;"><h4 style="padding:10px;">총 ${pageInfo.totalCount}개</strong>  |  ${pageInfo.pageNum }/${pageInfo.totalPage }페이지</h4></div>
                <table class="list">
                    <colgroup>
                        <col width="*" />
                        <%-- <col width="100px" />
                        <col width="200px" />
                        <col width="150px" /> --%>
                    </colgroup>
                    <tbody>
						<c:if test="${empty commList}">
				             <tr>
				                 <td class="first" colspan="8">등록된 댓글이 없습니다.</td>
				             </tr>
						</c:if>
	                    <c:if test="${!empty commList}">
	                     <c:forEach var="vo" items="${commList}">
	                         <tr>
	                             <td class="txt_l" style="text-align:left;">
	                                  <p style="padding-bottom:5px;display: inline-block">뮤즈회원
		                              <p style="float:right">${vo.comment_regdate }
		                              	<a href="javascript:delComment(${vo.comment_no });">삭제 |</a> 
		                             	<a id='updateCom' href="javascript:updateComment(${vo.comment_no });">수정 |</a>
		                             	<a href="javascript:commentReply(${vo.comment_no });">답글</a>
		                              </p>
		                              </p>
	                                  ${vo.comment_content } 
	                              <div style="float:right">
	                              
	                              </div>
	                              </td>
	                         </tr>
	                     </c:forEach>
                    </c:if>
                    </tbody>
                </table>
                
                <div class="pagenate clear"> 
					<ul class='paging'>
					<!-- 이전페이지 -->
					<c:if test="${pageInfo.prev == true }">
						<li><a href="javascript:getComment(${pageInfo.startPage - 1})"><</a></li>
					</c:if>
					<!-- 페이지별 -->
						<c:forEach var="nowPage" begin="${pageInfo.startPage}" end="${pageInfo.endPage }">
							<li><a href='javascript:getComment(${nowPage});' <c:if test="${vo.pageNum == nowPage }"> class='current'</c:if>>${nowPage}</a></li>
						</c:forEach>
					<!-- 다음페이지 -->
					<c:if test="${pageInfo.next == true }">
						<li><a href="javascript:getComment(${pageInfo.endPage + 1})">></a></li>
					</c:if>
					</ul>
				</div>
           