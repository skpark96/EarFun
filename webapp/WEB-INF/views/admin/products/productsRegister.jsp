<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="../../includes/header.jsp"%>
<%@ include file="../../includes/admin_nav.jsp"%>

<link rel="stylesheet" href="/resources/css/admin/register.css">

<!-- sidebar-wrapper  -->
<main class="page-content">
<div class="container-fluid">
	<div class="register-page">
		<form role="form" method="post" enctype="multipart/form-data">
			<h1>상품 등록</h1>

			<div class="inputArea">
				<label>1차 분류</label> <select class="category1" name="p_category">
					<option value="">전체</option>
				</select> <label>2차 분류</label> <select class="category2"
					name="p_sub_category">
					<option value="">전체</option>
				</select>
			</div>

			<label for="p_name">상품명</label> <input type="text" id="p_name"
				name="p_name" required="required" /> <label for="p_brand">브랜드</label>
			<input type="text" id="p_brand" name="p_brand" required="required" />

			<label for="p_price">판매 가격</label> <input type="text" id="p_price"
				name="p_price" value="" required="required" /> <label for="p_stock">상품
				수량</label> <input type="number" min="1" id="p_stock" name="p_stock" /> <label
				for="p_contents">상세 설명</label>
			<textarea rows="5" cols="50" id="p_contents" name="p_contents"></textarea>

			<br />
			<div class="inputArea">
				<label for="p_img">이미지</label> <input type="file" id="p_img"
					name="file" />

				<div class="select_img">
					<img class="p_img_thumb" src="" />
				</div>
			</div>

			<button type="submit">등록</button>

			<input type="hidden" name="${_csrf.parameterName}"
				value="${_csrf.token}" />
		</form>
	</div>
</div>
<!-- page-wrapper --> </main>
<!-- page-content" -->



<script>
	$("#p_img").change(
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
	function inputNumberFormat(obj) {
		obj.value = comma(uncomma(obj.value));
	}

	function comma(str) {
		str = String(str);
		return str.replace(/(\d)(?=(?:\d{3})+(?!\d))/g, '$1,');
	}

	function uncomma(str) {
		str = String(str);
		return str.replace(/[^\d]+/g, '');
	}
</script>

<script>
	// 컨트롤러에서 데이터 받기
	var jsonData = JSON.parse('${category}');
	console.log(jsonData);

	var cate1Arr = new Array();
	var cate1Obj = new Object();

	// 1차 분류 셀렉트 박스에 삽입할 데이터 준비
	for (var i = 0; i < jsonData.length; i++) {

		if (jsonData[i].level == "1") {
			cate1Obj = new Object(); //초기화
			cate1Obj.sub_category = jsonData[i].sub_category;
			cate1Obj.sub_name = jsonData[i].sub_name;
			cate1Arr.push(cate1Obj);
		}
	}

	// 1차 분류 셀렉트 박스에 데이터 삽입
	var cate1Select = $("select.category1")

	for (var i = 0; i < cate1Arr.length; i++) {
		cate1Select.append("<option value='" + cate1Arr[i].sub_category + "'>"
				+ cate1Arr[i].sub_name + "</option>");
	}

	$(document)
			.on(
					"change",
					"select.category1",
					function() {
						var cate2Arr = new Array();
						var cate2Obj = new Object();

						// 2차 분류 셀렉트 박스에 삽입할 데이터 준비
						for (var i = 0; i < jsonData.length; i++) {

							if (jsonData[i].level == "2") {
								cate2Obj = new Object(); //초기화
								cate2Obj.sub_category = jsonData[i].sub_category;
								cate2Obj.sub_name = jsonData[i].sub_name;
								cate2Obj.sub_codeRef = jsonData[i].sub_codeRef;

								cate2Arr.push(cate2Obj);
							}
						}

						var cate2Select = $("select.category2");

						cate2Select.children().remove();

						$("option:selected", this)
								.each(
										function() {
											var selectVal = $(this).val();
											cate2Select
													.append("<option value='" + selectVal + "'>전체</option>");

											for (var i = 0; i < cate2Arr.length; i++) {
												if (selectVal == cate2Arr[i].sub_codeRef) {
													cate2Select
															.append("<option value='" + cate2Arr[i].sub_category + "'>"
																	+ cate2Arr[i].sub_name
																	+ "</option>");
												}
											}
										});
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

					}); // end of ready
</script>