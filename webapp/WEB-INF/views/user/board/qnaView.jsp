<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<link rel="stylesheet" href="/resources/css/user/notice_view.css">
<link rel="stylesheet" type="text/css"
	href="https://cdnjs.cloudflare.com/ajax/libs/semantic-ui/2.3.1/semantic.min.css" />
<link rel="stylesheet" type="text/css"
	href="https://cdn.datatables.net/1.10.20/css/dataTables.semanticui.min.css" />

<script type="text/javascript"
	src="https://code.jquery.com/jquery-3.3.1.js"></script>
<script type="text/javascript"
	src="https://cdn.datatables.net/1.10.20/js/jquery.dataTables.min.js"></script>
<script type="text/javascript"
	src="https://cdn.datatables.net/1.10.20/js/dataTables.semanticui.min.js"></script>
<script type="text/javascript"
	src="https://cdnjs.cloudflare.com/ajax/libs/semantic-ui/2.3.1/semantic.min.js"></script>

<%@ include file="../../includes/header.jsp"%>
<%@ include file="../../includes/nav.jsp"%>

<!-- sidebar-wrapper  -->
<main class="page-content">
<div class="container-fluid">
	<div class="inner-notice container" id="contents-wrap">
		<div class="sub-contents-wrap inner-wrap">
			<div id="wrapper">
				<div id="contents" class="notice">
					<h1 style="font-size: 31px;">1:1 문의 상세보기</h1>
					<div class="noticeView">
						<h3>[${list.q_category }]&nbsp;${list.q_title}</h3>
						<div class="noticeInfo">
							<dl class="date">
								<dt class="acchidden">등록일</dt>
								<dd>
									<fmt:formatDate pattern="yyyy-MM-dd" value="${list.q_date}" />
								</dd>
							</dl>
						</div>
						<div class="noticeCnts">
							<span>${list.q_contents}</span>
						</div>
						<div class="replyView">
							<h3>[답변]</h3>
						</div>
						<br>
						<c:forEach var="reply" items="${reply}">
							<div class="replyCnts">
								<span>${reply.r_contents}</span>
							</div>
						</c:forEach>
					</div>

				</div>
				<div class="customer-list-box">
					<div class="btn-area ar">
						<button type="submit" data-oper="list" class="btn-box board">목록</button>
					</div>
				</div>
			</div>


			<form method="post" action="/user/board/qnaView"
				enctype="multipart/form-data">
				<input type="hidden" name="${_csrf.parameterName}"
					value="${_csrf.token}" /> <input type="hidden" name="pageNum"
					value="${cri.pageNum}" /> <input type="hidden" name="amount"
					value="${cri.amount}" /> <input type="hidden" name="type"
					value="${cri.type}"> <input type="hidden" name="keyword"
					value="${cri.keyword}">
			</form>
		</div>
	</div>
</div>

<%@ include file="../../includes/footer.jsp"%> <!-- page-wrapper -->
</main>
<!-- page-content" -->


<script>
	$(document).ready(
			function() {
				var formObj = $("form");
				$('button').on(
						"click",
						function(e) {
							/* 버튼이 클릭된다면, */
							e.preventDefault();/* 버튼의 기본 기능을 막고 */
							var operation = $(this).data("oper");
							/* 버튼에서 data oper 를 가져와서 변수에 할당. */
							console.log(operation);
							/* 웹브라우저 콘솔로 해당 변수 출력 */

							if (operation === 'list') {
								formObj.attr("action", "/user/board/qnaList")
										.attr("method", "get");
								formObj.empty();
							}
							formObj.submit();
						});
			});
</script>

<script type="text/javascript">
	$(function() {
		$('#helpdesk_sub_menu').find('.auth-check').click(
				function(e) {
					pd(e);
					var returnUrl = location.protocol + '//' + location.host
							+ $(this).attr('href');
					userLoginCheck(null, returnUrl);
				});
	});
</script>