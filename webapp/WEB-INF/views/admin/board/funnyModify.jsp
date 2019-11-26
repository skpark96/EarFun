<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<%@ include file="../../includes/header.jsp"%>
<%@ include file="../../includes/admin_nav.jsp"%>

<link rel="stylesheet" href="/resources/css/admin/board_modify.css">

<!-- sidebar-wrapper  -->
<main class="page-content">
<div class="container-fluid">
	<div class="modify-page">
		<form method="post" action="/admin/board/funnyModify"
			enctype="multipart/form-data">
			<h1>퍼니's Pick 수정</h1>

			<input type="hidden" name="${_csrf.parameterName}"
				value="${_csrf.token}" /> <input type="hidden" name="pageNum"
				value="${cri.pageNum}" /> <input type="hidden" name="amount"
				value="${cri.amount}" /> <input type="hidden" name="type"
				value="${cri.type}"> <input type="hidden" name="keyword"
				value="${cri.keyword}"> <label for="f_no">번호</label> <input
				class="form-control" name="f_no" readonly="readonly"
				value='<c:out value="${list.f_no}"/>'> <label
				for="f_caption">제목</label> <input class="form-control"
				name="f_caption" value='<c:out value="${list.f_caption}"/>'>

			<div class="music_div">
				<label for="f_title01" class="music_label">① 곡명</label> <input
					type="text" id="f_title01" name="f_title01" class="music"
					required="required" /> <label for="f_artist01">아티스트</label> <input
					type="text" id="f_artist01" name="f_artist01" class="music"
					required="required" /> <label for="f_album01">앨범</label> <input
					type="text" id="f_album01" name="f_album01" class="music"
					required="required" /> <label for="f_title02" class="music_label">②
					곡명</label> <input type="text" id="f_title02" name="f_title02" class="music" />
				<label for="f_artist02">아티스트</label> <input type="text"
					id="f_artist02" name="f_artist02" class="music" /> <label
					for="f_album02">앨범</label> <input type="text" id="f_album02"
					name="f_album02" class="music" /> <label for="f_title03"
					class="music_label">③ 곡명</label> <input type="text" id="f_title03"
					name="f_title03" class="music" /> <label for="f_artist03">아티스트</label>
				<input type="text" id="f_artist03" name="f_artist03" class="music" />
				<label for="f_album03">앨범</label> <input type="text" id="f_album03"
					name="f_album03" class="music" required="required" /> <label
					for="f_title04" class="music_label">④ 곡명</label> <input type="text"
					id="f_title04" name="f_title04" class="music" /> <label
					for="f_artist04">아티스트</label> <input type="text" id="f_artist04"
					name="f_artist04" class="music" /> <label for="f_album04">앨범</label>
				<input type="text" id="f_album04" name="f_album04" class="music" />
				<label for="f_title05" class="music_label">⑤ 곡명</label> <input
					type="text" id="f_title05" name="f_title05" class="music" /> <label
					for="f_artist05">아티스트</label> <input type="text" id="f_artist05"
					name="f_artist05" class="music" /> <label for="f_album05">앨범</label>
				<input type="text" id="f_album05" name="f_album05" class="music" />
				<label for="f_title06" class="music_label">⑥ 곡명</label> <input
					type="text" id="f_title06" name="f_title06" class="music" /> <label
					for="f_artist06">아티스트</label> <input type="text" id="f_artist06"
					name="f_artist06" class="music" /> <label for="f_album06">앨범</label>
				<input type="text" id="f_album06" name="f_album06" class="music" />
				<label for="f_title07" class="music_label">⑦ 곡명</label> <input
					type="text" id="f_title07" name="f_title07" class="music" /> <label
					for="f_artist07">아티스트</label> <input type="text" id="f_artist07"
					name="f_artist07" class="music" /> <label for="f_album07">앨범</label>
				<input type="text" id="f_album07" name="f_album07" class="music" />
				<label for="f_title08" class="music_label">⑧ 곡명</label> <input
					type="text" id="f_title08" name="f_title08" class="music" /> <label
					for="f_artist08">아티스트</label> <input type="text" id="f_artist08"
					name="f_artist08" class="music" /> <label for="f_album08">앨범</label>
				<input type="text" id="f_album08" name="f_album08" class="music" />
			</div>

			<label for="f_contents">상세 설명</label>
			<textarea rows="20" cols="40" class="form-control" name="f_contents"><c:out
					value="${list.f_contents}" /></textarea>
			<label for="f_img">이미지</label> <input type="file" id="f_image"
				name="file" />
			<div class="select_img">
				<img class="f_img_thumb" src="" /> <input type="hidden"
					name="f_image" value="${list.f_image }" /> <input type="hidden"
					name="f_thumbImg" value="${list.f_thumbImg }" />
			</div>

			<div class="btn_div">
				<button type="submit" data-oper="modify" class="btn btn-warning">수정</button>
				<button type="submit" data-oper="remove" class="btn btn-danger">삭제</button>
				<button type="submit" data-oper="list" class="btn btn-info">목록</button>
			</div>
		</form>
	</div>
</div>
<!-- page-wrapper --> </main>
<!-- page-content" -->



<script>
	$(document).ready(
			function() {
				console.log("history.state : " + history.state);
				var formObj = $("form");

				$('button').on(
						"click",
						function(e) {
							e.preventDefault();
							var operation = $(this).data("oper");
							console.log(operation);

							if (operation === 'remove') {
								formObj.attr("action",
										"/admin/board/funnyRemove");

							} else if (operation === 'list') {
								formObj
										.attr("action",
												"/admin/board/funnyList").attr(
												"method", "get");
								formObj.empty();

							} else if (operation === 'modify') {
								formObj.attr("action",
										"/admin/board/funnyModify").attr(
										"method", "post");
							}
							formObj.submit();
						});
			});
</script>
<script>
	$("#f_image").change(
			function() {
				if (this.files && this.files[0]) {
					var reader = new FileReader;
					reader.onload = function(data) {
						$(".select_img img").attr("src", data.target.result)
								.width(250);
					}
					reader.readAsDataURL(this.files[0]);
				}
			});
</script>