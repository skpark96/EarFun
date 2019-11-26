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
		<form method="post" action="/admin/board/noticeModify"
			enctype="multipart/form-data">
			<h1>공지사항 수정</h1>

			<input type="hidden" name="${_csrf.parameterName}"
				value="${_csrf.token}" /> <input type="hidden" name="pageNum"
				value="${cri.pageNum}" /> <input type="hidden" name="amount"
				value="${cri.amount}" /> <input type="hidden" name="type"
				value="${cri.type}"> <input type="hidden" name="keyword"
				value="${cri.keyword}"> <label for="n_no">번호</label> <input
				class="form-control" name="n_no" readonly="readonly"
				value='<c:out value="${list.n_no}"/>'> <label for="n_title">제목</label>
			<input class="form-control" name="n_title"
				value='<c:out value="${list.n_title}"/>'> <label
				for="n_contents">상세 설명</label>
			<textarea rows="20" cols="40" class="form-control" name="n_contents"><c:out
					value="${list.n_contents}" /></textarea>

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
   $(document).ready(function () {
      console.log("history.state : " + history.state);
      var formObj = $("form");
      
      $('button').on("click", function (e) {
         e.preventDefault();
         var operation = $(this).data("oper");
         console.log(operation);

         if (operation === 'remove') {
            formObj.attr("action", "/admin/board/noticeRemove");
            
         } else if (operation === 'list') {
            formObj.attr("action", "/admin/board/noticeList").attr("method", "get");
            formObj.empty();
            
         } else if (operation === 'modify') {
            formObj.attr("action", "/admin/board/noticeModify").attr("method", "post");
         }
         formObj.submit();
      });
   });
</script>