<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<%@ include file="../../includes/header.jsp"%>
<%@ include file="../../includes/admin_nav.jsp"%>

<link rel="stylesheet" href="/resources/css/admin/board_view.css">

<!-- sidebar-wrapper  -->
<main class="page-content">
<div class="container-fluid">
	<div class="view-page">
		<form method="post" action="/admin/board/funnyView">
			<input type="hidden" name="${_csrf.parameterName}"
				value="${_csrf.token}" /> <input type="hidden" name="pageNum"
				value="${cri.pageNum}" /> <input type="hidden" name="amount"
				value="${cri.amount}" /> <input type="hidden" name="type"
				value="${cri.type}" /> <input type="hidden" name="keyword"
				value="${cri.keyword}" />

			<h1>퍼니's Pick 상세 보기</h1>

			<label for="f_no">번호</label> <input class="form-control" name="f_no"
				readonly="readonly" value='<c:out value="${list.f_no}"/>'> <label
				for="regDate">등록일</label> <input class="form-control" name="regDate"
				readonly="readonly"
				value='<fmt:formatDate pattern="yyyy-MM-dd" value="${list.regDate}" />'>

			<label for="f_caption">제목</label> <input class="form-control"
				name="f_caption" readonly="readonly"
				value='<c:out value="${list.f_caption}"/>'>

			<div class="music_div">
				<label for="f_title01" class="music_label">① 곡명</label> <input
					type="text" name="f_title01" class="music" readonly="readonly"
					value='<c:out value="${list.f_title01}"/>'> <label
					for="f_artist01">아티스트</label> <input type="text" name="f_artist01"
					class="music" readonly="readonly"
					value='<c:out value="${list.f_artist01}"/>'> <label
					for="f_album01">앨범</label> <input type="text" name="f_album01"
					class="music" readonly="readonly"
					value='<c:out value="${list.f_album01}"/>'> <label
					for="f_title02" class="music_label">② 곡명</label> <input type="text"
					name="f_title02" class="music" readonly="readonly"
					value='<c:out value="${list.f_title02}"/>'> <label
					for="f_artist02">아티스트</label> <input type="text" name="f_artist02"
					class="music" readonly="readonly"
					value='<c:out value="${list.f_artist02}"/>'> <label
					for="f_album02">앨범</label> <input type="text" name="f_album02"
					class="music" readonly="readonly"
					value='<c:out value="${list.f_album02}"/>'> <label
					for="f_title03" class="music_label">③ 곡명</label> <input type="text"
					name="f_title03" class="music" readonly="readonly"
					value='<c:out value="${list.f_title03}"/>'> <label
					for="f_artist03">아티스트</label> <input type="text" name="f_artist03"
					class="music" readonly="readonly"
					value='<c:out value="${list.f_artist03}"/>'> <label
					for="f_album03">앨범</label> <input type="text" name="f_album03"
					class="music" readonly="readonly"
					value='<c:out value="${list.f_album03}"/>'> <label
					for="f_title04" class="music_label">④ 곡명</label> <input type="text"
					name="f_title04" class="music" readonly="readonly"
					value='<c:out value="${list.f_title04}"/>'> <label
					for="f_artist04">아티스트</label> <input type="text" name="f_artist04"
					class="music" readonly="readonly"
					value='<c:out value="${list.f_artist04}"/>'> <label
					for="f_album04">앨범</label> <input type="text" name="f_album04"
					class="music" readonly="readonly"
					value='<c:out value="${list.f_album04}"/>'> <label
					for="f_title05" class="music_label">⑤ 곡명</label> <input type="text"
					name="f_title05" class="music" readonly="readonly"
					value='<c:out value="${list.f_title05}"/>'> <label
					for="f_artist05">아티스트</label> <input type="text" name="f_artist05"
					class="music" readonly="readonly"
					value='<c:out value="${list.f_artist05}"/>'> <label
					for="f_album05">앨범</label> <input type="text" name="f_album05"
					class="music" readonly="readonly"
					value='<c:out value="${list.f_album05}"/>'> <label
					for="f_title06" class="music_label">⑥ 곡명</label> <input type="text"
					name="f_title06" class="music" readonly="readonly"
					value='<c:out value="${list.f_title06}"/>'> <label
					for="f_artist06">아티스트</label> <input type="text" name="f_artist06"
					class="music" readonly="readonly"
					value='<c:out value="${list.f_artist06}"/>'> <label
					for="f_album06">앨범</label> <input type="text" name="f_album06"
					class="music" readonly="readonly"
					value='<c:out value="${list.f_album06}"/>'> <label
					for="f_title07" class="music_label">⑦ 곡명</label> <input type="text"
					name="f_title07" class="music" readonly="readonly"
					value='<c:out value="${list.f_title07}"/>'> <label
					for="f_artist07">아티스트</label> <input type="text" name="f_artist07"
					class="music" readonly="readonly"
					value='<c:out value="${list.f_artist07}"/>'> <label
					for="f_album07">앨범</label> <input type="text" name="f_album07"
					class="music" readonly="readonly"
					value='<c:out value="${list.f_album07}"/>'> <label
					for="f_title08" class="music_label">⑧ 곡명</label> <input type="text"
					name="f_title08" class="music" readonly="readonly"
					value='<c:out value="${list.f_title08}"/>'> <label
					for="f_artist08">아티스트</label> <input type="text" name="f_artist08"
					class="music" readonly="readonly"
					value='<c:out value="${list.f_artist08}"/>'> <label
					for="f_album08">앨범</label> <input type="text" name="f_album08"
					class="music" readonly="readonly"
					value='<c:out value="${list.f_album08}"/>'>
			</div>

			<label for="f_contents">상세 설명</label>
			<textarea rows="20" cols="20" class="form-control" name="f_contents"
				readonly="readonly"><c:out value="${list.f_contents}" /></textarea>
			<div class="select_img">
				이미지<br> <img src="${list.f_thumbImg}" />
			</div>
			<div class="btn_div">
				<button type="submit" data-oper="modify" class="btn btn-warning">수정</button>
				<button type="submit" data-oper="list" class="btn btn-info">목록</button>
			</div>


		</form>

		<form id="operForm" action="/admin/board/funnyModify" method="get">
			<input type="hidden" id="f_no" name="f_no" value="${list.f_no}" /> <input
				type="hidden" name="pageNum" value="${cri.pageNum}" /> <input
				type="hidden" name="amount" value="${cri.amount}" /> <input
				type="hidden" name="type" value="${cri.type}"> <input
				type="hidden" name="keyword" value="${cri.keyword}">
		</form>
	</div>
</div>
<!-- page-wrapper --> </main>
<!-- page-content" -->



<script>
	$(document).ready(function() {
		var operForm = $("#operForm");
		$("button[data-oper='modify']").on("click", function(e) {
			operForm.attr("action", "/admin/board/funnyModify").submit();
		});
		$("button[data-oper='list']").on("click", function(e) {
			operForm.find("#f_no").remove();
			operForm.attr("action", "/admin/board/funnyList");
			operForm.submit();
		});
		/* 폼에서 어떤 버튼이 눌렸는지 확인 후, 액션을 변경 혹은 일부 값을 삭제하여 전송.*/
	});
</script>



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
								formObj
										.attr("action",
												"/admin/board/funnyList").attr(
												"method", "get");
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