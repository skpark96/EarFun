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
<main class="page-content" style="padding-bottom: 300px;">
<div class="container-fluid">

	<!-- Page Heading -->
	<h1 class="h3 mb-2 text-gray-800">상품 목록</h1>
	<p class="mb-4">EAR FUN에서 등록되어 판매중인 상품 목록입니다.</p>

	<!-- DataTales Example -->
	<table id="dataTable" class="ui celled table">
		<thead>
			<tr>
				<th>품번</th>
				<th>상품명</th>
				<th>미리 보기</th>
				<th>브랜드</th>
				<th>가격</th>
				<th>수량</th>
				<th>등록일</th>
				<th>수정일</th>
			</tr>
		</thead>

		<tfoot>
			<tr>
				<th colspan="8" style="text-align: right; white-space: nowrap;">
					전체 상품 수 <label style="color: red;">${pageMaker.total}</label> 개
				</th>
			<tr>
		</tfoot>

		<tbody>
			<c:forEach var="list" items="${list}">
				<tr>
					<td><c:out value="${list.p_no}" /></td>
					<td><a href="${list.p_no}" class="move"> <c:out
								value="${list.p_name}" /></a></td>
					<td><img src="${list.p_thumbImg}" class="thumbImg" /></td>
					<td><c:out value="${list.p_brand}" /></td>
					<td><fmt:formatNumber pattern="###,###,###"
							value="${list.p_price }" /></td>
					<c:if test="${list.p_stock != 0}">
						<td><c:out value="${list.p_stock}" /></td>
					</c:if>
					<c:if test="${list.p_stock == 0}">
						<td><c:out value="${list.p_stock}" /><span
							style="color: red;">&nbsp;&nbsp;(SOLD OUT)</span></td>
					</c:if>
					<td><fmt:formatDate pattern="yyyy-MM-dd"
							value="${list.p_date}" /></td>
					<td><fmt:formatDate pattern="yyyy-MM-dd"
							value="${list.p_updateDate}" /></td>
				</tr>
			</c:forEach>
		</tbody>
	</table>

	<div>
		<div class="col-lg-12">
			<form id="categoryForm" class="searchForm"
				action="/admin/products/productsList" method="get">
				<select name="type">
					<option value="" ${pageMaker.cri.type==null?"selected":"" }>
						--</option>
					<option value="P" ${pageMaker.cri.type eq "P"?"selected":"" }>
						상품명</option>
					<option value="B" ${pageMaker.cri.type eq "B"?"selected":"" }>
						브랜드</option>
				</select> <input type="text" name="keyword" /> <input type="hidden"
					name="pageNum" value="${pageMaker.cri.pageNum}"> <input
					type="hidden" name="amount" value="${pageMaker.cri.amount}">

				<button class="btn btn-warning">검색</button>
			</form>
		</div>
	</div>

	<div class="col-lg-12">
		<ul class="pagination">
			<c:if test="${pageMaker.prev}">
				<li class="page-item"><a href="${pageMaker.startPage - 1}"
					class="page-link">이전</a></li>
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

	<form id="categoryForm" method="get"
		action="/admin/products/productsList">
		<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum}">
		<input type="hidden" name="amount" value="${pageMaker.cri.amount}">
		<input type="hidden" name="type" value="${pageMaker.cri.type}">
		<input type="hidden" name="keyword" value="${pageMaker.cri.keyword}">
	</form>
	<!-- DataTables Example -->
</div>
<!-- page-wrapper --> </main>
<!-- page-content" -->



<script type="text/javascript">
	var actionForm = $("#actionForm");
	$(".page-item a").on("click", function(e) {
		e.preventDefault();
		console.log("click");
		actionForm.find("input[name='pageNum']").val($(this).attr("href"));
		actionForm.submit();
	});

	$(".move").on(
			"click",
			function(e) {
				e.preventDefault();
				actionForm.append("<input type='hidden' name='p_no' "
						+ "value='" + $(this).attr("href") + "'>");
				actionForm.attr("action", "/admin/products/productsView");
				actionForm.submit();
			});

	var categoryForm = $("#categoryForm");
	$(".page-item a").on("click", function(e) {
		e.preventDefault();
		console.log("click");
		categoryForm.find("input[name='pageNum']").val($(this).attr("href"));
		categoryForm.submit();
	});

	$(".move").on(
			"click",
			function(e) {
				e.preventDefault();
				categoryForm.append("<input type='hidden' name='p_no' "
						+ "value='" + $(this).attr("href") + "'>");
				categoryForm.attr("action", "/admin/products/productsView");
				categoryForm.submit();
			}); // end of ready();
</script>



<!-- 검색 -->
<script>
	var categoryForm = $("#categoryForm");
	$("#categoryForm button").on("click", function(e) {
		if (!categoryForm.find("option:selected").val()) {
			alert("검색 종류를 선택하세요.");
			return false;
		}
		if (!categoryForm.find("input[name='keyword']").val()) {
			alert("키워드를 입력하세요.");
			return false;
		}

		categoryForm.find("input[name='pageNum']").val(1);
		e.preventDefault();
		categoryForm.submit();
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