<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<%@ include file="../../includes/header.jsp"%>
<%@ include file="../../includes/admin_nav.jsp"%>

<link rel="stylesheet" href="/resources/css/admin/qna_view.css">

<!-- sidebar-wrapper  -->
<main class="page-content">
<div class="container-fluid">
	<div class="view-page">


		<h1>1:1 문의 상세 보기</h1>
		<label for="q_no">번호</label> <input class="form-control" name="q_no"
			readonly="readonly" value='<c:out value="${list.q_no}"/>'> <label
			for="q_date">등록일</label> <input class="form-control" name="q_date"
			readonly="readonly"
			value='<fmt:formatDate pattern="yyyy-MM-dd" value="${list.q_date}" />'>
		<label for="q_category">질문 유형</label> <input class="form-control"
			name="q_category" readonly="readonly"
			value='<c:out value="${list.q_category}"/>'><label
			for="q_writer">작성자</label> <input class="form-control"
			name="q_writer" readonly="readonly"
			value='<c:out value="${list.q_writer}"/>'> <label
			for="q_title">제목</label> <input class="form-control" name="q_title"
			readonly="readonly" value='<c:out value="${list.q_title}"/>'>

		<label for="q_contents">질문 내용</label>
		<textarea rows="7" class="form-control" name="q_contents"
			readonly="readonly">${list.q_contents}</textarea>




		<section class="reply-list">
			<ul></ul>
			<script>
							var q_no = ${list.q_no};
							$.getJSON("/admin/board/qnaReply" + "?q_no=" + q_no,	function(data) {
												var str = "";

												$(data).each(function() {
													var r_date = new Date(this.r_date);
													r_date = r_date.toLocaleDateString("ko-US")

													str += "<li data-q_no='" + this.q_no + "'>"
														+ "<div class='user-info'>"
														+ "<span class='date'>"	+ r_date + "</span>"
														+ "</div>"
														+ "<div class='r_contents'>" + this.r_contents + "</div>"
														+ "<hr>"
														+ "</li>";
												});

												$("section.reply-list ul").html(str);
												});
						</script>
			<strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[답변하기]</strong>
			<form role="form" method="post" autocomplete="off" class="statusForm">
				<input type="hidden" name="${_csrf.parameterName }"
					value="${_csrf.token}" /> <input type="hidden" name="pageNum"
					value="${pageMaker.cri.pageNum }"> <input type="hidden"
					name="amount" value="${pageMaker.cri.amount }"> <input
					type="hidden" name="type" value="${pageMaker.cri.type }"> <input
					type="hidden" name="keyword" value="${pageMaker.cri.keyword }"><input
					type="hidden" name="q_no" value="${list.q_no}" /> <input
					type="hidden" name="status" class="status" value="" />
				<div class="input-area">

					<textarea class="form-control" rows="7" name="r_contents"
						id="r_contents" placeholder="(이쪽을 클릭하시면 답변을 작성할 수 있습니다.)"
						style="font-family: Noto Sans KR, sans-serif; font-weight: 500; font-size: 12pt; color: #000;"></textarea>
				</div>
				<div class="bt-area">
					<button type="submit" id="reply_btn">등록하기</button>

					<script>
					$("#reply_btn").click(function() {
						$(".status").val("답변 완료");
						$(".statusForm").submit();
					});
				</script>
					<script>
										$("#reply_btn")
												.click(
														function() {
															
															var formObj = $(".reply-form form[role='form']");
															var q_no = $(
																	"#q_no")
																	.val();
															var r_contents = $(
																	"#r_contents")
																	.val()

															var data = {
																q_no : q_no,
																r_contents : r_contents
															};

															$
																	.ajax({
																		url : "/admin/board/qnaView",
																		type : "post",
																		data : data,
																		success : var q_no = ${list.q_no};
																		$.getJSON("/admin/board/qnaReply" + "?q_no="	+ q_no,	function(data) {
																			var str = "";

																			$(data).each(function() {
																				var r_date = new Date(this.r_date);
																				r_date = r_date.toLocaleDateString("ko-US")

																				str += "<li data-q_no='" + this.q_no + "'>"
																					+ "<div class='user-info'>"
																					+ "<span class='date'>"	+ r_date + "</span>"
																					+ "</div>"
																					+ "<div class='r_contents'>" + this.r_contents + "</div>"
																					+ "<hr>"
																					+ "</li>";
																			});

																			$("section.reply-list ul").html(str);
																			});
																	});
															
														});
									</script>
				</div>
			</form>
		</section>
		<form id="operForm" action="/admin/board/qnaView" method="get">
			<input type="hidden" id="q_no" name="q_no" value="${list.q_no}" /> <input
				type="hidden" name="pageNum" value="${cri.pageNum}" /> <input
				type="hidden" name="amount" value="${cri.amount}" /> <input
				type="hidden" name="type" value="${cri.type}"> <input
				type="hidden" name="keyword" value="${cri.keyword}">
		</form>
	</div>
</div>


<!-- page-wrapper --> </main>
<!-- page-content" -->



<!-- <script>
	$(document).ready(function() {
		var operForm = $("#operForm");
		$("button[data-oper='modify']").on("click", function(e) {
			operForm.attr("action", "/admin/board/earFunModify").submit();
		});
		$("button[data-oper='list']").on("click", function(e) {
			operForm.find("#e_no").remove();
			operForm.attr("action", "/admin/board/earFunList");
			operForm.submit();
		});
		/* 폼에서 어떤 버튼이 눌렸는지 확인 후, 액션을 변경 혹은 일부 값을 삭제하여 전송.*/
	});
</script> -->



<!-- <script>
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
								formObj.attr("action",
										"/admin/board/qnaList").attr(
										"method", "get");
								formObj.empty();
							}
							formObj.submit();
						});
			});
</script> -->



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