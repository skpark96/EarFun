<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>

<%@ include file="../../includes/header.jsp"%>
<%@ include file="../../includes/admin_nav.jsp"%>

<link rel="stylesheet" href="/resources/css/admin/modify.css">

<!-- sidebar-wrapper  -->
<main class="page-content">
<div class="container-fluid">
	<div class="modify-page">
		<form method="post" action="/admin/products/productsModify"
			enctype="multipart/form-data">
			<h1>상품 수정</h1>

			<input type="hidden" name="${_csrf.parameterName}"
				value="${_csrf.token}" /> <input type="hidden" name="pageNum"
				value="${cri.pageNum}" /> <input type="hidden" name="amount"
				value="${cri.amount}" /> <input type="hidden" name="type"
				value="${cri.type}"> <input type="hidden" name="keyword"
				value="${cri.keyword}"> <label for="p_no">번호</label> <input
				class="form-control" name="p_no" readonly="readonly"
				value='<c:out value="${list.p_no}"/>'> <label for="p_name">상품명</label>
			<input class="form-control" name="p_name"
				value='<c:out value="${list.p_name}"/>'> <label
				for="p_brand">브랜드</label> <input class="form-control" name="p_brand"
				value='<c:out value="${list.p_brand }"/>'> <label
				for="p_price">가격</label> <input class="form-control" name="p_price"
				value='<c:out value="${list.p_price }"/>'> <label
				for="p_stock">수량</label> <input class="form-control" name="p_stock"
				value='<c:out value="${list.p_stock }"/>'> <label
				for="p_contents">상세 설명</label>
			<textarea rows="3" class="form-control" name="p_contents"><c:out
					value="${list.p_contents}" /></textarea>

			<label for="p_img">이미지</label> <input type="file" id="p_img"
				name="file" />

			<div class="select_img">
				<img src="${list.p_thumbImg}" /> <input type="hidden"
					name="p_image" value="${list.p_image}" /> <input type="hidden"
					name="p_thumbImg" value="${list.p_thumbImg}" />
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



<!-- 첨부 파일 경로 -->
<script>
   $("#p_img").change(function() {
      if (this.files && this.files[0]) {
         var reader = new FileReader;
         reader.onload = function(data) {
               $(".select_img img").attr("src", data.target.result).width(500);
              }
           reader.readAsDataURL(this.files[0]);
      }
   });
</script>



<script>
   $(document).ready(function () {
      console.log("history.state : " + history.state);
      var formObj = $("form");
      
      $('button').on("click", function (e) {
         e.preventDefault();
         var operation = $(this).data("oper");
         console.log(operation);

         if (operation === 'remove') {
            formObj.attr("action", "/admin/products/productsRemove");
            
         } else if (operation === 'list') {
            formObj.attr("action", "/admin/products/productsList").attr("method", "get");
            formObj.empty();
            
         } else if (operation === 'modify') {
            formObj.attr("action", "/admin/products/productsModify").attr("method", "post");
         }
         formObj.submit();
      });
   });
</script>

<script>
   $(document) .ready(function () {
         (function() {
           var bno = '<c:out value="${board.bno}"/>';
            // 화면상에 공유된 bno 값 가져와 사용 준비.
            $.getJSON("/board/getAttachList", {bno : bno},
               function(arr) {
                   console.log(arr);

                    var str = "";
                    $(arr).each(function(i, attach) {
                       var fileCallPath = encodeURIComponent(
                             attach.uploadPath+ "/" + attach.uuid + "_" + attach.fileName);

                        str += "<li data-path='";
                        str+=attach.uploadPath+"' data-uuid='";
                  str+=attach.uuid+"' data-filename='";
                  str+=attach.fileName+"' data-type='";
                  str+=attach.fileType+"'><div>";
                                                   str += "<img src='/resources/img/attach.png'>";
                                                   str += "<span>"
                                                         + attach.fileName
                                                         + "</span>&nbsp;&nbsp;";
                                                   str += "<b data-file='"+fileCallPath;
                  str+="' data-type='file'>[x]</b>";

                                                   str += "</div></li>";
                                                });
                                    $(".uploadResult ul").html(str);
                                 });
                  })();
                  // 첨부파일 목록 표시 스크립트-끝

                  var csrfHeaderName = "${_csrf.headerName}";
                  var csrfTokenValue = "${_csrf.token}";

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
                  // 첨부파일의 x 버튼을 눌렀을때 처리 스크립트

                  // 첨부파일 등록과 표시 시작   
                  var regex = new RegExp("(.*?)\.(exe|sh|zip|alz)$");
                  // 정규표현식. 일부 파일의 업로드 제한.
                  // https://developer.mozilla.org/ko/docs/Web/JavaScript/Guide/%EC%A0%95%EA%B7%9C%EC%8B%9D
                  // https://regexper.com/

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
                                       // 첨부파일 업로드 결과를 json으로 받으면,
                                       // 그 내용을 화면에 표시.
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
                                    // encodeURIComponent : 
                                    // uri 로 전달되는 특수문자의 치환.
                                    // & ?
                                    var fileLink = fileCallPath
                                          .replace(new RegExp(
                                                /\\/g), "/");
                                    // 전달되는 값들 중에서 역슬러시를 찾아서 슬러시로 변경.

                                    str += "<li data-path='";
         str+=obj.uploadPath+"' data-uuid='";
         str+=obj.uuid+"' data-filename='";
         str+=obj.fileName+"' data-type='";
         str+=obj.image+"'><div>";
                                    str += "<img src='/resources/img/attach.png'>";
                                    str += "<span>" + obj.fileName
                                          + "</span> ";
                                    str += "<b data-file='"+fileCallPath;
         str+="' data-type='file'>[x]</b>";
                                    str += "</div></li>";
                                 });
                     uploadUL.append(str);
                  }// end_showUploadResult
                  // 첨부파일 서버 공간에 등록 및 목록 갱신 - 끝

                  // 수정 버튼을 눌렀을때 첨부파일 정보 숨김값으로 폼 전송 처리.   

               });// end_ready
</script>