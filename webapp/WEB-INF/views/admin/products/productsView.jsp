<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>

<%@ include file="../../includes/header.jsp"%>
<%@ include file="../../includes/admin_nav.jsp"%>

<link rel="stylesheet" href="/resources/css/admin/view.css">

<!-- sidebar-wrapper  -->
<main class="page-content">
<div class="container-fluid">
	<div class="modify-page">
		<form method="post" action="/admin/products/productsModify"
			enctype="multipart/form-data">
			<input type="hidden" name="${_csrf.parameterName}"
				value="${_csrf.token}" /> <input type="hidden" name="pageNum"
				value="${cri.pageNum}" /> <input type="hidden" name="amount"
				value="${cri.amount}" /> <input type="hidden" name="type"
				value="${cri.type}" /> <input type="hidden" name="keyword"
				value="${cri.keyword}" />

			<h1>상품 상세 보기</h1>

			<label for="p_no">번호</label> <input class="form-control" name="p_no"
				readonly="readonly" value='<c:out value="${list.p_no}"/>'> <label
				for="p_name">상품명</label> <input class="form-control" name="p_name"
				readonly="readonly" value='<c:out value="${list.p_name}"/>'>

			<label for="p_brand">브랜드</label> <input class="form-control"
				name="p_brand" readonly="readonly"
				value='<c:out value="${list.p_brand}"/>'> <label
				for="p_price">가격</label> <input class="form-control" name="p_price"
				readonly="readonly" value='<c:out value="${list.p_price}"/>'>

			<label for="p_point">포인트</label> <input class="form-control"
				name="p_point" readonly="readonly"
				value='<c:out value="${list.p_point}"/>'> <label
				for="p_stock">수량</label> <input class="form-control" name="p_stock"
				readonly="readonly" value='<c:out value="${list.p_stock}"/>'>

			<label for="p_contents">상세 설명</label>
			<textarea rows="3" cols="5" class="form-control"
				readonly="readonly" name="p_contents"><c:out
					value="${list.p_contents}" /></textarea>

			<div class="select_img">
				제품 사진 미리 보기 <br> <img src="${list.p_thumbImg}" />
			</div>

			<div class="btn_div">
				<button type="submit" data-oper="modify" class="btn btn-warning">수정</button>
				<button type="submit" data-oper="list" class="btn btn-info">목록</button>
			</div>
		</form>

		<form id="operForm" action="/admin/products/productsRegister"
			method="get">
			<input type="hidden" id="p_no" name="p_no" value="${list.p_no}" />
		</form>
	</div>
</div>
<!-- page-wrapper --> </main>
<!-- page-content" -->



<script>
   $(document).ready(function () {
      var operForm = $("#operForm");
      $("button[data-oper='modify']").on("click", function (e) {
         operForm.attr("action", "/admin/products/productsModify").submit();
      });
      $("button[data-oper='list']").on("click", function (e) {
         operForm.find("#bno").remove();
         operForm.attr("action", "/admin/products/productsList");
         operForm.submit();
      });
      /* 폼에서 어떤 버튼이 눌렸는지 확인 후, 액션을 변경 혹은 일부 값을 삭제하여 전송.*/
   });
</script>


<script>
   $(document).ready(function () {   
      var formObj = $("form");
         $('button').on("click", function (e) {
         /* 버튼이 클릭된다면, */
         e.preventDefault();/* 버튼의 기본 기능을 막고 */
         var operation = $(this).data("oper");
         /* 버튼에서 data oper 를 가져와서 변수에 할당. */
         console.log(operation);
         /* 웹브라우저 콘솔로 해당 변수 출력 */

         if (operation === 'list') {
            formObj.attr("action", "/admin/products/productsList").attr("method", "get");
            formObj.empty();
         }
         formObj.submit();
      });
   });
</script>



<script>
$(document).ready(function(){
   (function(){
      var bno='<c:out value="${board.bno}"/>';
      // 화면상에 공유된 bno 값 가져와 사용 준비.
      $.getJSON("/board/getAttachList"
            ,{bno:bno}, function(arr){
               console.log(arr);
               
               var str = "";
               $(arr).each(function (i, attach) {
                  str += "<li data-path='";
                  str+=attach.uploadPath+"' data-uuid='";
                  str+=attach.uuid+"' data-filename='";
                  str+=attach.fileName+"' data-type='";
                  str+=attach.fileType+"'><div>";
                  str+="<img src='/resources/img/attach.png'>";
                  str+="<span>"+attach.fileName+"</span><br/> ";
                  
                  str+="</div></li>";
               });
               $(".uploadResult ul").html(str);
            });
   })();
   // bno를 전달하여 콘트롤러에서 처리후, 첨부파일 목록을 콘솔로 출력.
   
   $(".uploadResult").on("click", "li", function (e) {
      console.log("download file");
      var liObj = $(this);
      var path = encodeURIComponent(liObj.data("path")
            + "/" + liObj.data("u_id") + "_" + liObj.data("filename"));
      self.location="/download?fileName="+path;
   });
   
});
</script>