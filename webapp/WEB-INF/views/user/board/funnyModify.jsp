<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<%@ include file="../../includes/header.jsp"%>
<%@ include file="../../includes/nav.jsp"%>

<link rel="stylesheet" href="/resources/css/user/funny_modify.css">

<!-- sidebar-wrapper  -->
<main class="page-content">
<div class="container-fluid">

	<div class="modify-page">
		<form method="post" action="/user/board/funnyModify"
			enctype="multipart/form-data">
			<h1>퍼니's Pick 수정</h1>

			<input type="hidden" name="${_csrf.parameterName}"
				value="${_csrf.token}" /> <input type="hidden" name="pageNum"
				value="${cri.pageNum}" /> <input type="hidden" name="amount"
				value="${cri.amount}" /> <input type="hidden" name="type"
				value="${cri.type}"> <input type="hidden" name="keyword"
				value="${cri.keyword}"> <label for="f_no">번호</label> <input
				class="form_control" name="f_no" readonly="readonly"
				value='<c:out value="${list.f_no}"/>'> <label for="u_id">작성자</label>
			<input class="form_control" name="u_id" readonly="readonly"
				value='<c:out value="${list.u_id}"/>'> <label
				for="f_caption">제목</label> <input class="form_control"
				name="f_caption" value='<c:out value="${list.f_caption}"/>'>

			<div class="hashtag">
				<label for="f_hashtag">태그</label> <br> <input
					class="form_control" name="f_hashtag01"
					value='<c:out value="${list.f_hashtag01}"/>' /> <input
					class="form_control" name="f_hashtag02"
					value='<c:out value="${list.f_hashtag02}"/>' /> <input
					class="form_control" name="f_hashtag03"
					value='<c:out value="${list.f_hashtag03}"/>' />
			</div>

			<div class="music_div1">
				<label for="f_title01">① 곡명</label> <input type="text"
					id="f_title01" name="f_title01" class="music" required="required"
					value='<c:out value="${list.f_title01}"/>' /> <label
					for="f_artist01">아티스트</label> <input type="text" id="f_artist01"
					name="f_artist01" class="music" required="required"
					value='<c:out value="${list.f_artist01}"/>' /> <br>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<label for="f_album01">앨범</label> <input
					type="text" id="f_album01" name="f_album01" class="music"
					required="required" value='<c:out value="${list.f_album01}"/>' />
				<label for="f_video01">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;뮤비</label>
				<input type="text" id="f_video01" name="f_video01" class="music"
					required="required" value='<c:out value="${list.f_video01}"/>' />
				<span class="plus1"><i class="fas fa-plus"></i></span>
			</div>

			<div class="music_div2">
				<label for="f_title02">② 곡명</label> <input type="text"
					id="f_title02" name="f_title02" class="music"
					value='<c:out value="${list.f_title02}"/>' /> <label
					for="f_artist02">아티스트</label> <input type="text" id="f_artist02"
					name="f_artist02" class="music"
					value='<c:out value="${list.f_artist02}"/>' /> <br>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<label for="f_album02">앨범</label> <input
					type="text" id="f_album02" name="f_album02" class="music"
					value='<c:out value="${list.f_album02}"/>' /> <label
					for="f_video02">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;뮤비</label>
				<input type="text" id="f_video02" name="f_video02" class="music"
					value='<c:out value="${list.f_video02}"/>' /> <span class="plus1"><i
					class="fas fa-plus"></i></span>
			</div>

			<div class="music_div3">
				<label for="f_title03">③ 곡명</label> <input type="text"
					id="f_title03" name="f_title03" class="music"
					value='<c:out value="${list.f_title03}"/>' /> <label
					for="f_artist03">아티스트</label> <input type="text" id="f_artist03"
					name="f_artist03" class="music"
					value='<c:out value="${list.f_artist03}"/>' /> <br>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<label for="f_album03">앨범</label> <input
					type="text" id="f_album03" name="f_album03" class="music"
					value='<c:out value="${list.f_album03}"/>' /> <label
					for="f_video03">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;뮤비</label>
				<input type="text" id="f_video03" name="f_video03" class="music"
					value='<c:out value="${list.f_video03}"/>' /> <span class="plus1"><i
					class="fas fa-plus"></i></span>
			</div>

			<div class="music_div4">
				<label for="f_title04">④ 곡명</label> <input type="text"
					id="f_title04" name="f_title04" class="music"
					value='<c:out value="${list.f_title04}"/>' /> <label
					for="f_artist04">아티스트</label> <input type="text" id="f_artist04"
					name="f_artist04" class="music"
					value='<c:out value="${list.f_artist04}"/>' /> <br>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<label for="f_album04">앨범</label> <input
					type="text" id="f_album04" name="f_album04" class="music"
					value='<c:out value="${list.f_album04}"/>' /> <label
					for="f_video04">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;뮤비</label>
				<input type="text" id="f_video04" name="f_video04" class="music"
					value='<c:out value="${list.f_video04}"/>' /> <span class="plus1"><i
					class="fas fa-plus"></i></span>
			</div>

			<div class="music_div5">
				<label for="f_title05">⑤ 곡명</label> <input type="text"
					id="f_title05" name="f_title05" class="music"
					value='<c:out value="${list.f_title05}"/>' /> <label
					for="f_artist05">아티스트</label> <input type="text" id="f_artist05"
					name="f_artist05" class="music"
					value='<c:out value="${list.f_artist05}"/>' /> <br>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<label for="f_album05">앨범</label> <input
					type="text" id="f_album05" name="f_album05" class="music"
					value='<c:out value="${list.f_album05}"/>' /> <label
					for="f_video05">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;뮤비</label>
				<input type="text" id="f_video05" name="f_video05" class="music"
					value='<c:out value="${list.f_video05}"/>' /> <span class="plus1"><i
					class="fas fa-plus"></i></span>
			</div>

			<div class="music_div6">
				<label for="f_title06">⑥ 곡명</label> <input type="text"
					id="f_title06" name="f_title06" class="music"
					value='<c:out value="${list.f_title06}"/>' /> <label
					for="f_artist06">아티스트</label> <input type="text" id="f_artist06"
					name="f_artist06" class="music"
					value='<c:out value="${list.f_artist06}"/>' /> <br>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<label for="f_album06">앨범</label> <input
					type="text" id="f_album06" name="f_album06" class="music"
					value='<c:out value="${list.f_album06}"/>' /> <label
					for="f_video06">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;뮤비</label>
				<input type="text" id="f_video06" name="f_video06" class="music"
					value='<c:out value="${list.f_video06}"/>' /> <span class="plus1"><i
					class="fas fa-plus"></i></span>
			</div>

			<div class="music_div7">
				<label for="f_title07">⑦ 곡명</label> <input type="text"
					id="f_title07" name="f_title07" class="music"
					value='<c:out value="${list.f_title07}"/>' /> <label
					for="f_artist07">아티스트</label> <input type="text" id="f_artist07"
					name="f_artist07" class="music"
					value='<c:out value="${list.f_artist07}"/>' /> <br>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<label for="f_album07">앨범</label> <input
					type="text" id="f_album07" name="f_album07" class="music"
					value='<c:out value="${list.f_album07}"/>' /> <label
					for="f_video07">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;뮤비</label>
				<input type="text" id="f_video07" name="f_video07" class="music"
					value='<c:out value="${list.f_video07}"/>' /> <span class="plus1"><i
					class="fas fa-plus"></i></span>
			</div>

			<div class="music_div8">
				<label for="f_title08">⑧ 곡명</label> <input type="text"
					id="f_title08" name="f_title08" class="music"
					value='<c:out value="${list.f_title08}"/>' /> <label
					for="f_artist08">아티스트</label> <input type="text" id="f_artist08"
					name="f_artist08" class="music"
					value='<c:out value="${list.f_artist08}"/>' /> <br>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<label for="f_album08">앨범</label> <input
					type="text" id="f_album08" name="f_album08" class="music"
					value='<c:out value="${list.f_album08}"/>' /> <label
					for="f_video08">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;뮤비</label>
				<input type="text" id="f_video08" name="f_video08" class="music"
					value='<c:out value="${list.f_video08}"/>' /> <span class="plus1"><i
					class="fas fa-plus"></i></span>
			</div>

			<label for="f_contents">상세 설명</label>
			<textarea rows="20" cols="40" class="form-control" name="f_contents"><c:out
					value="${list.f_contents}" /></textarea>

			<label for="f_img">이미지</label> <input type="file" id="f_image"
				name="file" />

			<div class="select_img">
				<img class="f_img_thumb" src="" /> <input type="hidden"
					name="f_image" value="${list.f_image}" /> <input type="hidden"
					name="f_thumbImg" value="${list.f_thumbImg}" />
			</div>

			<div class="btn_div">
				<button type="submit" id="btnModify" data-oper="modify"
					class="btn btn-warning">수정</button>
				<button type="submit" id="btnDelete" data-oper="remove"
					class="btn btn-danger">삭제</button>
				<button type="submit" data-oper="list" class="btn btn-info">목록</button>
			</div>
		</form>
	</div>
</div>
<!-- page-wrapper --> </main>
<!-- page-content" -->



<!-- 수정/삭제 여부 알림창 -->
<script>
   $(document).ready(function () {
      $("btnModify").click(function () {
         if (confirm("정말로 수정 하시겠습니까?")) {
            document.form1.action = "";
            document.form1.submit();
         }
      });
   });
   
   $(document).ready(function () {
      $("btnDelete").click(function () {
         if (confirm("정말로 삭제 하시겠습니까?")) {
            document.form1.action = "";
            document.form1.submit();
         }
      });
   });
</script>

<!-- 게시물 수정/삭제 -->
<script>
   $(document).ready(
      function() {
         console.log("history.state : " + history.state);
         var formObj = $("form");

         $('button').on("click", function(e) {
            e.preventDefault();
            var operation = $(this).data("oper");
            console.log(operation);

            if (operation === 'remove') {
               formObj.attr("action", "/user/board/funnyRemove");
            } else if (operation === 'list') {
               formObj.attr("action",
                  "/user/board/funnyList").attr(
                  "method", "get");
               formObj.empty();

            } else if (operation === 'modify') {
               formObj.attr("action",
                  "/user/board/funnyModify").attr(
                  "method", "post");
            }
            formObj.submit();
         });
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

<!-- 첨부 이미지 변경 -->
<script>
   $("#f_image").change(
         function() {
            if (this.files && this.files[0]) {
               var reader = new FileReader;
               reader.onload = function(data) {
                  $(".select_img img").attr("src", data.target.result).width(250);
               }
               reader.readAsDataURL(this.files[0]);
            }
         });
</script>