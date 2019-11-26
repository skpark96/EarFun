<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<%@ include file="../../includes/header.jsp"%>
<%@ include file="../../includes/admin_nav.jsp"%>

<link rel="stylesheet" href="/resources/css/admin/view.css">

<!-- sidebar-wrapper  -->
<main class="page-content">
<div class="container-fluid">
	<div class="modify-page">
		<form method="post" action="/admin/board/noticeView">
			<input type="hidden" name="${_csrf.parameterName}"
				value="${_csrf.token}" /> <input type="hidden" name="pageNum"
				value="${cri.pageNum}" /> <input type="hidden" name="amount"
				value="${cri.amount}" /> <input type="hidden" name="type"
				value="${cri.type}" /> <input type="hidden" name="keyword"
				value="${cri.keyword}" />

			<h1>공지사항 상세 보기</h1>

			<label for="n_no">번호</label> <input class="form-control" name="n_no"
				readonly="readonly" value='<c:out value="${list.n_no}"/>'> <label
				for="n_title">제목</label> <input class="form-control" name="n_title"
				readonly="readonly"
				value='[공지]&nbsp;<c:out value="${list.n_title}"/>'> <label
				for="regDate">등록일</label> <input class="form-control" name="regDate"
				readonly="readonly"
				value='<fmt:formatDate pattern="yyyy-MM-dd" value="${list.regDate}" />'>

			<label for="n_contents">상세 설명</label>
			<textarea rows="20" cols="20" class="form-control" name="n_contents"
				readonly="readonly"><c:out value="${list.n_contents}" /></textarea>

			<div class="btn_div">
				<button type="submit" data-oper="modify" class="btn btn-warning">수정</button>
				<button type="submit" data-oper="list" class="btn btn-info">목록</button>
			</div>
		</form>

		<form id="operForm" action="/admin/board/noticeModify" method="get">
			<input type="hidden" id="n_no" name="n_no" value="${list.n_no}" /> <input
				type="hidden" name="pageNum" value="${cri.pageNum}" /> <input
				type="hidden" name="amount" value="${cri.amount}" /> <input
				type="hidden" name="type" value="${cri.type}"> <input
				type="hidden" name="keyword" value="${cri.keyword}">
		</form>
	</div>
</div>
<!-- page-wrapper --> </main>
<!-- page-content" -->



<!-- <script>
   $(document).ready(function () {   
      var formObj = $("form");
         $('button').on("click", function (e) {
           e.preventDefault();
            var operation = $(this).data("oper");
            console.log(operation);

            if (operation === 'list') {
               formObj.attr("action", "/admin/board/noticeList")
                  .attr("method", "get");
               formObj.empty();
            }
            formObj.submit();
      });
   });
</script> -->




<script>
	$(document).ready(function() {
		var operForm = $("#operForm");
		$("button[data-oper='modify']").on("click", function(e) {
			operForm.attr("action", "/admin/board/noticeModify").submit();
		});
		$("button[data-oper='list']").on("click", function(e) {
			operForm.find("#n_no").remove();
			operForm.attr("action", "/admin/board/noticeList");
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
								formObj.attr("action",
										"/admin/board/noticeList").attr(
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

<!-- 이전 / 다음 글 처리 -->
<!-- <script>
   $("#preDoc").on("click", function () { 
      _this.preNextDoc('pre'); 
   }); 
   
   $("#nxtDoc").on("click", function () { 
      _this.preNextDoc('next'); }); 
      preNextDoc : function (flag) { 
         var _this = this; 
         var params = { 
            docnum : _this.docnum, 
            brdCode : _this.brdCode, 
            brdType : _this.brdType, 
            flag : flag, //pre,nxt 
            viewFlag : _this.viewFlag 
         } 
         $.ajax({ 
            type:"POST", 
            url: ePortalConfig.boardContext + "/preNextDoc", 
            dataType: "json", 
            data : params, 
            cache : false, 
            success : function (res) { // 이하 생략
         }
      }
   }
</script> -->