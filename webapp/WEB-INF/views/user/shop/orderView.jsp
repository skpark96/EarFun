<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<%@ include file="../../includes/header.jsp"%>
<%@ include file="../../includes/nav.jsp"%>

<link rel="stylesheet" type="text/css"
	href="/resources/css/user/orderView.css">
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
	<div id="wrapper">
		<div id="contents" class="notice">



			<h1>주문상세 조회</h1>
			<div class="noticeList">
				<table summary="">
					<colgroup>
						<col class="cate">
						<col class="tit">
						<col class="date">
						<col class="count">
					</colgroup>
					<thead>
						<tr>

							<th class="tit">상품정보</th>
							<th class="price">주문금액</th>
							<th class="stock">수량</th>
							<th class="status">주문 상태</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="orderView" items="${orderView}">

							<tr>

								<td class="tit"><a href="/user/shop/shopView?p_no=6"
									class="modve"><img class="thumb"
										src="${orderView.p_thumbImg}"></a><a
									href="/user/shop/shopView?p_no=6" class="dmove">${orderView.p_name}</a></td>
								<td class="price"><fmt:formatNumber pattern="###,###,###"
										value="${orderView.total_price }" /></td>
								<td class="stock">${orderView.c_stock }</td>
								<td class="status">${orderView.status }</td>
								<%-- 								<td class="tit">(${orderList.u_addr1}) ${orderList.u_addr2}
									${orderList.u_addr3}</td> --%>
							</tr>

						</c:forEach>
					</tbody>
				</table>
			</div>
			<br> <br>

			<div class="addr">
				<h2 style="color: #17191d;">배송지 정보</h2>
				<div class="noticeList">
					<table class="addrInfo" summary="">
						<colgroup>
							<col class="cate">
							<col class="tit">
							<col class="date">
							<col class="count">
						</colgroup>
						<!-- <thead>
						<tr>

							<th class="tit">상품정보</th>
							<th class="price">주문금액</th>
							<th class="stock">수량</th>
							<th class="status">주문 상태</th>
						</tr>
					</thead> -->
						<tbody>
							<c:forEach var="orderView" items="${orderView}">
								<tr>
									<td class="name">이름&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${orderView.o_rec }</td>
									<%-- 								<td class="tit">(${orderList.u_addr1}) ${orderList.u_addr2}
									${orderList.u_addr3}</td> --%>
								</tr>
								<tr>
									<td class="phone">연락처&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${orderView.o_phone }</td>
								</tr>
								<tr>
									<td class="addr">배송지
										주소&nbsp;&nbsp;&nbsp;&nbsp;(${orderView.u_addr1 })
										${orderView.u_addr2 } ${orderView.u_addr3 }</td>
								</tr>

							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
			<div class="pay">
				<h2 style="color: #17191d;">최종 결제 정보</h2>
				<div class="noticeList">
					<table class="addrInfo" summary="">
						<colgroup>
							<col class="cate">
							<col class="tit">
							<col class="date">
							<col class="count">
						</colgroup>
						<!-- <thead>
						<tr>

							<th class="tit">상품정보</th>
							<th class="price">주문금액</th>
							<th class="stock">수량</th>
							<th class="status">주문 상태</th>
						</tr>
					</thead> -->
						<tbody>
							<c:forEach var="orderView" items="${orderView}">
								<tr>
									<td class="name">주문
										합계&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<fmt:formatNumber
											pattern="###,###,###" value="${orderView.total_price }" />원
									</td>
									<%-- 								<td class="tit">(${orderList.u_addr1}) ${orderList.u_addr2}
									${orderList.u_addr3}</td> --%>
								</tr>
								<tr>
									<td class="phone">배송비
										&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;2,500원</td>
								</tr>
								<tr>
									<td class="addr">최종 결제 금액&nbsp;&nbsp;&nbsp;&nbsp;<fmt:formatNumber
											pattern="###,###,###"
											value="${orderView.total_price + 2500 }" />원
									</td>
								</tr>

							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
		</div>

		<%-- <div class="noticeList-page">
			<div class="form">
				<div class="col-lg-12">
					<ul class="pagination">
						<c:if test="${pageMaker.prev}">
							<li class="btPrev"><a href="${pageMaker.startPage - 1}"
								style="color: black; font-weight: bold;"><</a></li>
						</c:if>

						<c:forEach var="num" begin="${pageMaker.startPage}"
							end="${pageMaker.endPage}">
							<li
								class='paginationNum ${pageMaker.cri.pageNum==num?"active":"" }'>
								<a href="${num}"><strong>${num}</strong></a>
							</li>
						</c:forEach>

						<c:if test="${pageMaker.next}">
							<li class="btNext"><a href="${pageMaker.endPage + 1}"
								style="color: black; font-weight: bold;">></a></li>
						</c:if>
					</ul>
				</div>

				<form id="actionForm" action="/user/board/userNoticeList"
					method="get">
					<input type="hidden" name="pageNum"
						value="${pageMaker.cri.pageNum}"> <input type="hidden"
						name="amount" value="${pageMaker.cri.amount}"> <input
						type="hidden" name="type" value="${pageMaker.cri.type}"> <input
						type="hidden" name="keyword" value="${pageMaker.cri.keyword}">
				</form>

			</div>
		</div> --%>
	</div>
	<!-- page-wrapper -->
</main>
<!-- page-content" -->



<script type="text/javascript">
	var actionForm = $("#actionForm");
	$(".paginationNum a").on("click", function(e) {
		e.preventDefault();
		console.log("click");
		actionForm.find("input[name='pageNum']").val($(this).attr("href"));
		actionForm.submit();
	});

	$(".btPrev a").on("click", function(e) {
		e.preventDefault();
		console.log("click");
		actionForm.find("input[name='pageNum']").val($(this).attr("href"));
		actionForm.submit();
	});

	$(".btNext a").on("click", function(e) {
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
				actionForm.attr("action", "/user/shop/");
				actionForm.submit();
			});
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

<%@ include file="../../includes/footer.jsp"%>