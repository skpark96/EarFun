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
			<h1>상황별 음악 등록</h1>

			<label for="m_caption">제목</label> <input type="text" id="m_caption"
				name="m_caption" required="required" />

			<div class="music_div1">
				<label for="m_title01" class="music_label">① 곡명</label> <input
					type="text" id="m_title01" name="m_title01" class="music"
					required="required" /> <label for="m_artist01">아티스트</label> <input
					type="text" id="m_artist01" name="m_artist01" class="music"
					required="required" /> <label for="m_album01">앨범</label> <input
					type="text" id="m_album01" name="m_album01" class="music"
					required="required" /> <span class="plus1"><i
					class="fas fa-plus"></i></span>
			</div>
			<div class="music_div2">
				<label for="m_title02" class="music_label">② 곡명</label> <input
					type="text" id="m_title02" name="m_title02" class="music" /> <label
					for="m_artist02">아티스트</label> <input type="text" id="m_artist02"
					name="m_artist02" class="music" /> <label for="m_album02">앨범</label>
				<input type="text" id="m_album02" name="m_album02" class="music" />
				<span class="plus2"><i class="fas fa-plus"></i></span>
			</div>
			<div class="music_div3">
				<label for="m_title03" class="music_label">③ 곡명</label> <input
					type="text" id="m_title03" name="m_title03" class="music" /> <label
					for="m_artist03">아티스트</label> <input type="text" id="m_artist03"
					name="m_artist03" class="music" /> <label for="m_album03">앨범</label>
				<input type="text" id="m_album03" name="m_album03" class="music" /><span
					class="plus3"><i class="fas fa-plus"></i></span>
			</div>
			<div class="music_div4">
				<label for="m_title04" class="music_label">④ 곡명</label> <input
					type="text" id="m_title04" name="m_title04" class="music" /> <label
					for="m_artist04">아티스트</label> <input type="text" id="m_artist04"
					name="m_artist04" class="music" /> <label for="m_album04">앨범</label>
				<input type="text" id="m_album04" name="m_album04" class="music" /><span
					class="plus4"><i class="fas fa-plus"></i></span>
			</div>
			<div class="music_div5">
				<label for="m_title05" class="music_label">⑤ 곡명</label> <input
					type="text" id="m_title05" name="m_title05" class="music" /> <label
					for="m_artist05">아티스트</label> <input type="text" id="m_artist05"
					name="m_artist05" class="music" /> <label for="m_album05">앨범</label>
				<input type="text" id="m_album05" name="m_album05" class="music" /><span
					class="plus5"><i class="fas fa-plus"></i></span>
			</div>
			<div class="music_div6">
				<label for="m_title06" class="music_label">⑥ 곡명</label> <input
					type="text" id="m_title06" name="m_title06" class="music" /> <label
					for="m_artist06">아티스트</label> <input type="text" id="m_artist06"
					name="m_artist06" class="music" /> <label for="m_album06">앨범</label>
				<input type="text" id="m_album06" name="m_album06" class="music" /><span
					class="plus6"><i class="fas fa-plus"></i></span>
			</div>
			<div class="music_div7">
				<label for="m_title07" class="music_label">⑦ 곡명</label> <input
					type="text" id="m_title07" name="m_title07" class="music" /> <label
					for="m_artist07">아티스트</label> <input type="text" id="m_artist07"
					name="m_artist07" class="music" /> <label for="m_album07">앨범</label>
				<input type="text" id="m_album07" name="m_album07" class="music" /><span
					class="plus7"><i class="fas fa-plus"></i></span>
			</div>
			<div class="music_div8">
				<label for="m_title08" class="music_label">⑧ 곡명</label> <input
					type="text" id="m_title08" name="m_title08" class="music" /> <label
					for="m_artist08">아티스트</label> <input type="text" id="m_artist08"
					name="m_artist08" class="music" /> <label for="m_album08">앨범</label>
				<input type="text" id="m_album08" name="m_album08" class="music" /><span
					class="plus8"><i class="fas fa-plus"></i></span>
			</div>
			<label for="m_contents">상세 설명</label>
			<textarea rows="20" cols="50" id="m_contents" name="m_contents"></textarea>
			<label for="m_img">이미지</label> <input type="file" id="m_image"
				name="file" />
			<div class="select_img">
				<img class="m_img_thumb" src="" />
			</div>

			<button type="submit">등록</button>

			<input type="hidden" name="${_csrf.parameterName }"
				value="${_csrf.token}" />
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

											// 글 등록 버튼을 누르면 첨부파일의 정보도 함께 전송 되도록 수정.
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
						/* ajax 처리시 csrf 값을 함께 전송하기 위한 준비.
						스프링 시큐리티는 데이터 전송시 csrf 값을 꼭 확인 하므로 */

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
													// 첨부 파일 업로드 결과를 json으로 받으면, 화면에 표시.
												}
											});// end_ajax
										});// end_change

						function showUploadResult(uploadResultArr) {
							if (!uploadResultArr || uploadResultArr.length == 0) {
								// json 처리 결과가 없다면 함수 종료.
								return;
							}

							var uploadUL = $(".uploadResult ul");
							var str = "";

							// each 구문은 전달된 배열의 길이 만큼, 
							// each 이후의 함수를 반복 처리.
							$(uploadResultArr)
									.each(
											function(i, obj) {
												var fileCallPath = encodeURIComponent(obj.uploadPath
														+ "/"
														+ obj.uuid
														+ "_"
														+ obj.fileName);
												// encodeURIComponent :  uri 로 전달되는 특수문자의 치환. & ?
												var fileLink = fileCallPath
														.replace(new RegExp(
																/\\/g), "/");
												// 전달되는 값들 중에서 BackSlash를 찾아서 Slash로 변경.

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
<script>
	$("#m_image").change(
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