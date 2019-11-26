<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script src="/resources/js/addressapi.js"></script>

<link rel="stylesheet" href="/resources/css/admin/reportView.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<%@ include file="../../includes/header.jsp"%>
<%@ include file="../../includes/nav.jsp"%>

<div class="signUp-page">
	<div class="form">
		<h1>신고 상세보기</h1>

		<form role="form" action="/user/board/report" method="post"
			id="signUpForm" class="signUp-form">

			<input type="hidden" name="${_csrf.parameterName}"
				value="${_csrf.token}" /> <label for="r_writer">작성자</label>
			<textarea rows="1" id="r_writer" name="r_writer" class="writer"
				readonly="readonly">${report.r_writer }</textarea>
			<label for="r_contents">신고 내용</label>
			<textarea rows="5" id="r_contents" name="r_contents" class="contents"
				readonly="readonly">${report.r_contents }</textarea>
			<label for="r_reason">신고 사유</label> <br>
			<textarea rows="5" id="r_reason" name="r_reason" class="reason"
				readonly="readonly">${report.r_reason }</textarea>
			<br>
			<!-- <div class="btDiv">
				<button type="submit" id="btReport">신고하기</button>
				<button type="button" onclick="history.go(-1);" id="btCancel">취소</button>
			</div> -->
		</form>
		<form role="form" method="post" class="statusForm">
			<input type="hidden" name="r_no" value="${report.r_no}" /> <input
				type="hidden" name="status" class="status" value="" /> <input
				type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
			<div class="btStatus">
				<button type="button" class="btStatus1">승인</button>
				<button type="button" data-oper="remove" class="btStatus2">거절</button>
			</div>
			<script>
				$(".btStatus1").click(function() {
					$(".status").val("승인");
					$(".statusForm").submit();

				});

				/* 				$(".btStatus2").click(function() {
				 $(".status").val("거절");
				 $(".statusForm").submit();
				 }); */
			</script>
			<script>
				var formObj = $("form");

				$('.btStatus2').on("click", function(e) {
					e.preventDefault();
					var operation = $(this).data("oper");
					console.log(operation);

					if (operation === 'remove') {
						formObj.attr("action", "/admin/report/reportRemove");

					}
					formObj.submit();
				});
			</script>
		</form>
	</div>

</div>
<script>
	$(document).ready(function() {

		$("#btReport").click(function() {

			alert("신고가 접수되었습니다.")

		});

	});
</script>
<%@ include file="../../includes/footer.jsp"%>