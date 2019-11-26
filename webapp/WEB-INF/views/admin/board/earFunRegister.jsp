<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="../../includes/header.jsp"%>
<%@ include file="../../includes/admin_nav.jsp"%>

<link rel="stylesheet" href="/resources/css/admin/board_register.css">

<!-- sidebar-wrapper  -->
<main class="page-content">
<div class="container-fluid">
	<div class="register-page">
		<form role="form" method="post" enctype="multipart/form-data">
			<h1>이어펀's Pick 등록</h1>

			<label for="e_caption">제목</label> <input type="text" id="e_caption"
				name="e_caption" required="required" />

			<div class="music_div1">
				<label for="e_title01" class="music_label">① 곡명</label> <input
					type="text" id="e_title01" name="e_title01" class="music"
					required="required" /> <label for="e_artist01">아티스트</label> <input
					type="text" id="e_artist01" name="e_artist01" class="music"
					required="required" /> <br> <label for="e_album01">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;앨범</label>
				<input type="text" id="e_album01" name="e_album01" class="music"
					required="required" /> <label for="e_video01" class="music_label">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					뮤비</label> <input type="text" id="e_video01" name="e_video01" class="music" /><span
					class="plus1"><i class="fas fa-plus"></i></span>
			</div>

			<div class="music_div2">
				<label for="e_title02" class="music_label">② 곡명</label> <input
					type="text" id="e_title02" name="e_title02" class="music"
					required="required" /> <label for="e_artist02">아티스트</label> <input
					type="text" id="e_artist02" name="e_artist02" class="music"
					required="required" /> <br> <label for="e_album02">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;앨범</label>
				<input type="text" id="e_album02" name="e_album02" class="music"
					required="required" /> <label for="e_video02" class="music_label">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					뮤비</label> <input type="text" id="e_video02" name="e_video02" class="music" /><span
					class="plus2"><i class="fas fa-plus"></i></span>
			</div>

			<div class="music_div3">
				<label for="e_title03" class="music_label">③ 곡명</label> <input
					type="text" id="e_title03" name="e_title03" class="music"
					required="required" /> <label for="e_artist03">아티스트</label> <input
					type="text" id="e_artist03" name="e_artist03" class="music"
					required="required" /> <br> <label for="e_album03">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;앨범</label>
				<input type="text" id="e_album03" name="e_album03" class="music"
					required="required" /> <label for="e_video03" class="music_label">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					뮤비</label> <input type="text" id="e_video03" name="e_video03" class="music" /><span
					class="plus3"><i class="fas fa-plus"></i></span>
			</div>

			<div class="music_div4">
				<label for="e_title04" class="music_label">④ 곡명</label> <input
					type="text" id="e_title04" name="e_title04" class="music"
					required="required" /> <label for="e_artist04">아티스트</label> <input
					type="text" id="e_artist04" name="e_artist04" class="music"
					required="required" /> <br> <label for="e_album04">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;앨범</label>
				<input type="text" id="e_album04" name="e_album04" class="music"
					required="required" /> <label for="e_video04" class="music_label">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					뮤비</label> <input type="text" id="e_video04" name="e_video04" class="music" /><span
					class="plus4"><i class="fas fa-plus"></i></span>
			</div>

			<div class="music_div5">
				<label for="e_title05" class="music_label">⑤ 곡명</label> <input
					type="text" id="e_title05" name="e_title05" class="music"
					required="required" /> <label for="e_artist05">아티스트</label> <input
					type="text" id="e_artist05" name="e_artist05" class="music"
					required="required" /> <br> <label for="e_album05">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;앨범</label>
				<input type="text" id="e_album05" name="e_album05" class="music"
					required="required" /> <label for="e_video05" class="music_label">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					뮤비</label> <input type="text" id="e_video05" name="e_video05" class="music" /><span
					class="plus5"><i class="fas fa-plus"></i></span>
			</div>

			<div class="music_div6">
				<label for="e_title06" class="music_label">⑥ 곡명</label> <input
					type="text" id="e_title06" name="e_title06" class="music"
					required="required" /> <label for="e_artist06">아티스트</label> <input
					type="text" id="e_artist06" name="e_artist06" class="music"
					required="required" /> <br> <label for="e_album06">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;앨범</label>
				<input type="text" id="e_album06" name="e_album06" class="music"
					required="required" /> <label for="e_video06" class="music_label">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					뮤비</label> <input type="text" id="e_video06" name="e_video06" class="music" /><span
					class="plus6"><i class="fas fa-plus"></i></span>
			</div>

			<div class="music_div7">
				<label for="e_title07" class="music_label">⑦ 곡명</label> <input
					type="text" id="e_title07" name="e_title07" class="music"
					required="required" /> <label for="e_artist07">아티스트</label> <input
					type="text" id="e_artist07" name="e_artist07" class="music"
					required="required" /> <br> <label for="e_album07">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;앨범</label>
				<input type="text" id="e_album07" name="e_album07" class="music"
					required="required" /> <label for="e_video07" class="music_label">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					뮤비</label> <input type="text" id="e_video07" name="e_video07" class="music" /><span
					class="plus7"><i class="fas fa-plus"></i></span>
			</div>

			<div class="music_div8">
				<label for="e_title08" class="music_label">⑧ 곡명</label> <input
					type="text" id="e_title08" name="e_title08" class="music"
					required="required" /> <label for="e_artist08">아티스트</label> <input
					type="text" id="e_artist08" name="e_artist08" class="music"
					required="required" /> <br> <label for="e_album08">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;앨범</label>
				<input type="text" id="e_album08" name="e_album08" class="music"
					required="required" /> <label for="e_video08" class="music_label">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					뮤비</label> <input type="text" id="e_video08" name="e_video08" class="music" /><span
					class="plus8"><i class="fas fa-plus"></i></span>
			</div>

			<label for="e_contents">상세 설명</label>
			<textarea rows="20" cols="50" id="e_contents" name="e_contents"></textarea>
			<label for="e_img">이미지</label> <input type="file" id="e_image"
				name="file" />
			<div class="select_img">
				<img class="e_img_thumb" src="" />
			</div>
			<button type="submit">등록</button>

			<input type="hidden" name="${_csrf.parameterName}"
				value="${_csrf.token}" /> <input type="hidden"
				name="${_csrf.parameterName}" value="${_csrf.token}" />
		</form>
	</div>
</div>
<!-- page-wrapper --> </main>
<!-- page-content" -->



<script>
	$(document)
			.ready(
					function(e) {
						var formObj = $("form[role='form']");
						$("button[type='submit']")
								.on(
										"click",
										function(e) {
											e.preventDefault();
											console.log("submit clicked");

											var str = "";
											$(".uploadResult ul li")
													.each(
															function(i, obj) {
																var jobj = $(obj);
																console
																		.dir(jobj);
																console
																		.log("-----------------");
																console
																		.log(jobj
																				.data("filename"));

																str += "<input type='hidden' name='attachList[";
																str += i
																		+ "].fileName' value='"
																		+ jobj
																				.data("filename")
																str += "'>";

																str += "<input type='hidden' name='attachList[";
																str += i
																		+ "].uuid' value='"
																		+ jobj
																				.data("uuid")
																str += "'>";

																str += "<input type='hidden' name='attachList[";
																str += i
																		+ "].uploadPath' value='"
																		+ jobj
																				.data("path")
																str += "'>";

																str += "<input type='hidden' name='attachList[";
																str += i
																		+ "].fileType' value='"
																		+ jobj
																				.data("type")
																str += "'>";
															});
											formObj.append(str).submit();

											// 첨부파일의 정보들을 li 의 data 값으로 가지고 있다가
											// hidden 으로 폼에 포함.
										});

						var regex = new RegExp("(.*?)\.(exe|sh|zip|alz)$");

						var maxSize = 5242880; // 5MB

						function checkExtension(fileName, fileSize) {
							if (fileSize >= maxSize) {
								alert("파일 크기 초과");
								return false;
							}

							if (regex.test(fileName)) {
								alert("해당 종류의 파일은 업로드 불가.");
								return false;
							}
							return true;
						}

						var csrfHeaderName = "${_csrf.headerName}";
						var csrfTokenValue = "${_csrf.token}";

						$("input[type='file']")
								.change(
										function(e) {
											var formData = new FormData();
											var inputFile = $("input[name='uploadFile']");
											var files = inputFile[0].files;
											for (var i = 0; i < files.length; i++) {
												if (!checkExtension(
														files[i].name,
														files[i].size)) {
													return false;
												}
												formData.append("uploadFile",
														files[i]);
											}

											$.ajax({
												url : '/uploadAjaxAction',
												processData : false,
												contentType : false,
												beforeSend : function(xhr) {
													xhr.setRequestHeader(
															csrfHeaderName,
															csrfTokenValue);
												},
												data : formData,
												type : 'POST',
												dataType : 'json',
												success : function(result) {
													console.log(result);
													showUploadResult(result);
												}
											});// end_ajax
										});// end_change

						function showUploadResult(uploadResultArr) {
							if (!uploadResultArr || uploadResultArr.length == 0) {
								return;
							}

							var uploadUL = $(".uploadResult ul");
							var str = "";

							$(uploadResultArr)
									.each(
											function(i, obj) {
												var fileCallPath = encodeURIComponent(obj.uploadPath
														+ "/"
														+ obj.uuid
														+ "_"
														+ obj.fileName);
												var fileLink = fileCallPath
														.replace(new RegExp(
																/\\/g), "/");

												str += "<li data-path='";
         str += obj.uploadPath+"' data-uuid='";
         str += obj.uuid+"' data-filename='";
         str += obj.fileName+"' data-type='";
         str += obj.image+"'><div>";
												str += "<img src='/resources/img/landscape.png'>";
												str += "<span>" + obj.fileName
														+ "</span> ";
												str += "<b data-file='"+fileCallPath;
         str += "' data-type='file'>[x]</b>";
												str += "</div></li>";
											});
							uploadUL.append(str);
						}// end_showUploadResult

						$(".uploadResult").on(
								"click",
								"b",
								function(e) {
									console.log("delete file");

									var targetFile = $(this).data("file");
									var type = $(this).data("type");
									var targetLi = $(this).closest("li");

									$.ajax({
										url : '/deleteFile',
										data : {
											fileName : targetFile,
											type : type
										},
										beforeSend : function(xhr) {
											xhr.setRequestHeader(
													csrfHeaderName,
													csrfTokenValue);
										},
										dataType : 'text',
										type : 'POST',
										success : function(result) {
											alert(result);
											targetLi.remove();
										}
									})
								});
						$(".music_div2").slideUp();
						$(".music_div3").slideUp();
						$(".music_div4").slideUp();
						$(".music_div5").slideUp();
						$(".music_div6").slideUp();
						$(".music_div7").slideUp();
						$(".music_div8").slideUp();
					}); // end of ready
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
<script>
	$(".plus1").click(function() {
		$(".music_div2").slideToggle(100);
	});
	$(".plus2").click(function() {
		$(".music_div3").slideToggle(100);
	});
	$(".plus3").click(function() {
		$(".music_div4").slideToggle(100);
	});
	$(".plus4").click(function() {
		$(".music_div5").slideToggle(100);
	});
	$(".plus5").click(function() {
		$(".music_div6").slideToggle(100);
	});
	$(".plus6").click(function() {
		$(".music_div7").slideToggle(100);
	});
	$(".plus7").click(function() {
		$(".music_div8").slideToggle(100);
	});
</script>