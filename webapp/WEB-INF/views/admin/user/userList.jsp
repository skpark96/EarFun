<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<%@ include file="../../includes/header.jsp"%>
<%@ include file="../../includes/admin_nav.jsp"%>

<link rel="stylesheet" type="text/css"
	href="/resources/css/admin/list.css" />
<link rel="stylesheet" type="text/css"
	href="https://cdnjs.cloudflare.com/ajax/libs/semantic-ui/2.3.1/semantic.min.css" />
<link rel="stylesheet" type="text/css"
	href="https://cdn.datatables.net/1.10.20/css/dataTables.semanticui.min.css" />

<script type="text/javascript"
	src="https://code.jquery.com/jquery-3.3.1.js"></script>
<script type="text/javascript"
	src="https://cdn.datatables.net/1.10.20/js/jquery.dataTables.min.js"></script>
<script type="text/javascript"
	src="https://cdn.datatables.net/1.10.20/js/dataTables.semanticui.min.js"></script>
<script type="text/javascript"
	src="https://cdnjs.cloudflare.com/ajax/libs/semantic-ui/2.3.1/semantic.min.js"></script>

<!-- sidebar-wrapper  -->
<main class="page-content">
<div class="container-fluid">

	<!-- Page Heading -->
	<h1 class="h3 mb-2 text-gray-800">회원 목록</h1>
	<p class="mb-4">EAR FUN에 가입되어 있는 회원 목록입니다.</p>

	<!-- DataTales Example -->
	<table id="dataTable" class="ui celled table"
		style="width: 100%; text-align: center;">
		<thead>
			<tr>
				<th>회원 번호</th>
				<th>아이디</th>
				<th>이름</th>
				<th>연락처</th>
				<th>이메일</th>
				<th>인증 여부</th>
				<th>가입일</th>
			</tr>
		</thead>

		<tfoot>
			<tr>
				<th colspan="7" style="text-align: right; white-space: nowrap;">
					전체 회원 수 <label style="color: red;">${pageMaker.total}</label> 명
				</th>
			<tr>
		</tfoot>

		<tbody>
			<c:forEach var="list" items="${list}">
				<tr>
					<td><c:out value="${list.u_no}" /></td>
					<td><c:out value="${list.u_id}" /></td>
					<td><c:out value="${list.u_name}" /></td>
					<td><c:out value="${list.u_phone}" /></td>
					<td><c:out value="${list.u_email}" /></td>
					<td><c:out value="${list.approval_status}" /></td>
					<td><fmt:formatDate pattern="yyyy-MM-dd"
							value="${list.regDate}" /></td>
				</tr>
			</c:forEach>
		</tbody>
	</table>

	<div>
		<div class="col-lg-12">
			<form id="searchForm" class="searchForm"
				action="/admin/user/userList" method="get">
				<select name="type">
					<option value="" ${pageMaker.cri.type == null?"selected":"" }>
						--</option>
					<option value="T" ${pageMaker.cri.type eq "T"?"selected":"" }>
						아이디</option>
					<option value="C" ${pageMaker.cri.type eq "C"?"selected":"" }>
						이름</option>
				</select> <input type="text" name="keyword" /> <input type="hidden"
					name="pageNum" value="${pageMaker.cri.pageNum}"> <input
					type="hidden" name="amount" value="${pageMaker.cri.amount}">

				<button class="btn btn-warning">검색</button>
			</form>
		</div>
	</div>

	<div>
		<ul class="pagination" style="float: right;">
			<c:if test="${pageMaker.prev}">
				<li class="page-item previous"><a
					href="${pageMaker.startPage - 1}" class="page-link">이전</a></li>
			</c:if>

			<c:forEach var="num" begin="${pageMaker.startPage}"
				end="${pageMaker.endPage}">
				<li class='page-item ${pageMaker.cri.pageNum==num?"active":"" }'>
					<a href="${num}" class="page-link"> ${num}</a>
				</li>
			</c:forEach>

			<c:if test="${pageMaker.next}">
				<li class="page-item next"><a href="${pageMaker.endPage + 1}"
					class="page-link">다음</a></li>
			</c:if>
		</ul>
	</div>

	<form id="actionForm" action="/admin/user/userList" method="get">
		<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum}">
		<input type="hidden" name="amount" value="${pageMaker.cri.amount}">
		<input type="hidden" name="type" value="${pageMaker.cri.type}">
		<input type="hidden" name="keyword" value="${pageMaker.cri.keyword}">
	</form>

	<!-- Modal 추가 -->
	<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">&times;</button>
				</div>

				<div class="modal-body" align="center">처리 완료.</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-primary" data-dismiss="modal">close</button>
				</div>
			</div>
		</div>
	</div>
	<!-- DataTables Example -->
</div>
<!-- page-wrapper --> </main>
<!-- page-content" -->



<!-- Modal -->
<script type="text/javascript">
	$(document).ready(
			function() {
				var result = '<c:out value="${result}"/>';

				checkModal(result);
				history.replaceState({}, null, null);

				function checkModal(result) {
					if (result === '' || history.state != null) {
						return;
					}
					if (parseInt(result) > 0) {
						$(".modal-body").html(
								"게시글 " + parseInt(result) + "번이 등록");
					}
					$("#myModal").modal("show");// 모달 표시.
				}

				$("#regBtn").on("click", function() {
					self.location = "/admin/products/productsRegister";
				});

				var actionForm = $("#actionForm");
				$(".page-item a").on(
						"click",
						function(e) {
							e.preventDefault();
							console.log("click");
							actionForm.find("input[name='pageNum']").val(
									$(this).attr("href"));
							actionForm.submit();
						});

				$(".move").on(
						"click",
						function(e) {
							e.preventDefault();
							actionForm
									.append("<input type='hidden' name='u_id' "
											+ "value='" + $(this).attr("href")
											+ "'>");
							actionForm.attr("action",
									"/admin/products/productsView");
							actionForm.submit();
						});

				var searchForm = $("#searchForm");
				$("#searchForm button").on("click", function(e) {

					if (!searchForm.find("option:selected").val()) {
						alert("검색 종류를 선택하세요.");
						return false;
					}

					if (!searchForm.find("input[name='keyword']").val()) {
						alert("키워드를 입력하세요.");
						return false;
					}

					searchForm.find("input[name='pageNum']").val(1);
					e.preventDefault();
					searchForm.submit();
				});
			}); // end of ready();
</script>



<!-- 검색 -->
<script>
	var actionForm = $("#actionForm");
	$("#actionForm button").on("click", function(e) {
		if (!actionForm.find("option:selected").val()) {
			alert("검색 종류를 선택하세요.");
			return false;
		}
		if (!actionForm.find("input[name='keyword']").val()) {
			alert("키워드를 입력하세요.");
			return false;
		}

		actionForm.find("input[name='pageNum']").val(1);
		e.preventDefault();
		actionForm.submit();
	});
</script>



<!-- DataTables -->
<script>
	$(document).ready(function() {
		$('#dataTable').DataTable({
			"paging" : false,
			"order" : [ [ 0, "desc" ] ],
			"info" : false,
			"filter" : false,
			"stateSave" : false,
			"language" : {
				"zeroRecords" : "데이터가 존재하지 않습니다."
			}
		});
	});
</script>