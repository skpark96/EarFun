<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="../../includes/header.jsp"%>
<%@ include file="../../includes/nav.jsp"%>

<link rel="stylesheet" href="/resources/css/user/funny_register.css">

<!-- sidebar-wrapper  -->
<main class="page-content">
<div class="container-fluid">
	<div class="register-page">
		<form role="form" method="post" enctype="multipart/form-data">
			<h1>1:1 문의</h1>



			<div>
				<label for="q_category">질문 유형&nbsp;&nbsp;&nbsp;</label> <select
					class="music" name='q_category'>
					<option value='' selected>-- 선택 --</option>
					<option value='교환'>교환</option>
					<option value='환불'>환불</option>
					<option value='기타문의'>기타문의</option>
				</select><br> <label for="q_title" class="music_label">제목&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
				<input type="text" id="q_title" name="q_title" class="title"
					required="required" />
			</div>

			<label for="f_contents">질문 내용</label>
			<textarea rows="20" cols="50" id="q_contents" name="q_contents"></textarea>
			<button type="submit" onclick="alert('질문이 등록되었습니다.');"
				class="sub_btn">등록</button>
			<button type="button" class="can_btn" onclick="history.back(-1)">취소</button>

			<input type="hidden" name="${_csrf.parameterName}"
				value="${_csrf.token}" />
		</form>
	</div>
</div>
<!-- page-wrapper --> </main>
<!-- page-content" -->

<script>
	$("sub_btn").on("click", function() {

	});
</script>

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
						} // end of showUploadResult

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