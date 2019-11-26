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
		<form method="post" action="/admin/board/earFunModify"
			enctype="multipart/form-data">
			<h1>이어펀's Pick 수정</h1>

			<input type="hidden" name="${_csrf.parameterName}"
				value="${_csrf.token}" /> <input type="hidden" name="pageNum"
				value="${cri.pageNum}" /> <input type="hidden" name="amount"
				value="${cri.amount}" /> <input type="hidden" name="type"
				value="${cri.type}"> <input type="hidden" name="keyword"
				value="${cri.keyword}"> <label for="e_no">번호</label> <input
				class="form-control" name="e_no" readonly="readonly"
				value='<c:out value="${list.e_no}"/>'> <label
				for="e_caption">제목</label> <input class="form-control"
				name="e_caption" value='<c:out value="${list.e_caption}"/>'>

			<div class="music_div">
				<label for="e_title01" class="music_label">① 곡명</label> <input
					type="text" id="e_title01" name="e_title01" class="music"
					required="required" /> <label for="e_artist01">아티스트</label> <input
					type="text" id="e_artist01" name="e_artist01" class="music"
					required="required" /> <label for="e_album01">앨범</label> <input
					type="text" id="e_album01" name="e_album01" class="music"
					required="required" /> <label for="e_title02" class="music_label">②
					곡명</label> <input type="text" id="e_title02" name="e_title02" class="music" />
				<label for="e_artist02">아티스트</label> <input type="text"
					id="e_artist02" name="e_artist02" class="music" /> <label
					for="e_album02">앨범</label> <input type="text" id="e_album02"
					name="e_album02" class="music" /> <label for="e_title03"
					class="music_label">③ 곡명</label> <input type="text" id="e_title03"
					name="e_title03" class="music" /> <label for="e_artist03">아티스트</label>
				<input type="text" id="e_artist03" name="e_artist03" class="music" />
				<label for="e_album03">앨범</label> <input type="text" id="e_album03"
					name="e_album03" class="music" /> <label for="e_title04"
					class="music_label">④ 곡명</label> <input type="text" id="e_title04"
					name="e_title04" class="music" /> <label for="e_artist04">아티스트</label>
				<input type="text" id="e_artist04" name="e_artist04" class="music" />
				<label for="e_album04">앨범</label> <input type="text" id="e_album04"
					name="e_album04" class="music" /> <label for="e_title05"
					class="music_label">⑤ 곡명</label> <input type="text" id="e_title05"
					name="e_title05" class="music" /> <label for="e_artist05">아티스트</label>
				<input type="text" id="e_artist05" name="e_artist05" class="music" />
				<label for="e_album05">앨범</label> <input type="text" id="e_album05"
					name="e_album05" class="music" /> <label for="e_title06"
					class="music_label">⑥ 곡명</label> <input type="text" id="e_title06"
					name="e_title06" class="music" /> <label for="e_artist06">아티스트</label>
				<input type="text" id="e_artist06" name="e_artist06" class="music" />
				<label for="e_album06">앨범</label> <input type="text" id="e_album06"
					name="e_album06" class="music" /> <label for="e_title07"
					class="music_label">⑦ 곡명</label> <input type="text" id="e_title07"
					name="e_title07" class="music" /> <label for="e_artist07">아티스트</label>
				<input type="text" id="e_artist07" name="e_artist07" class="music" />
				<label for="e_album07">앨범</label> <input type="text" id="e_album07"
					name="e_album07" class="music" /> <label for="e_title08"
					class="music_label">⑧ 곡명</label> <input type="text" id="e_title08"
					name="e_title08" class="music" /> <label for="e_artist08">아티스트</label>
				<input type="text" id="e_artist08" name="e_artist08" class="music" />
				<label for="e_album08">앨범</label> <input type="text" id="e_album08"
					name="e_album08" class="music" />
			</div>

			<label for="e_contents">상세 설명</label>
			<textarea rows="20" cols="40" class="form-control" name="e_contents"><c:out
					value="${list.e_contents}" /></textarea>
			<label for="e_img">이미지</label> <input type="file" id="e_image"
				name="file" />
			<div class="select_img">
				<img class="e_img_thumb" src="" /> <input type="hidden"
					name="e_image" value="${list.e_image }" /> <input type="hidden"
					name="e_thumbImg" value="${list.e_thumbImg }" />
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
										"/admin/board/earFunRemove");

							} else if (operation === 'list') {
								formObj.attr("action",
										"/admin/board/earFunList").attr(
										"method", "get");
								formObj.empty();

							} else if (operation === 'modify') {
								formObj.attr("action",
										"/admin/board/earFunModify").attr(
										"method", "post");
							}
							formObj.submit();
						});
			});
</script>
<script>
	$("#e_image").change(
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