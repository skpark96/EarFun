<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<%@ include file="../../includes/header.jsp"%>
<%@ include file="../../includes/nav.jsp"%>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script src="../resources/js/addressapi.js"></script>

<link rel="stylesheet" type="text/css"
	href="/resources/css/user/cartList.css">
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



			<h1>내 음악</h1>
			<div class="noticeList">

				<table id="checkboxTestTbl" summary="">
					<colgroup>
						<col class="cate">
						<col class="tit">
					</colgroup>
					<thead>
						<tr>

							<th class="thumb">-</th>
							<th class="thumb">작성자</th>
							<th class="title">제목</th>
							<th class="thumb">등록일</th>

						</tr>
					</thead>

					<tbody class="tbody">
						<c:set var="total" value="0" />
						<c:forEach var="music" items="${music}">

							<tr>
								<td class="thumb"><a href="${music.f_no}" class="move"><img
										src="${music.f_thumbImg}" /></a></td>
								<td><c:out value="${music.u_id }" /></td>
								<td class="title"><a href="${music.f_no}" class="move"><c:out
											value="${music.f_caption}" /></a></td>


								<td class="thumb"><fmt:formatDate pattern="yyyy-MM-dd"
										value="${music.regDate}" /></td>
							</tr>

							<%-- <fmt:formatNumber pattern="###,###,###"
								value="${cartList.p_price * cartList.c_stock}" />원 --%>

						</c:forEach>



					</tbody>
				</table>



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



			</div>
		</div> --%>
	</div>
	<!-- page-wrapper -->
	<form id="actionForm" action="/user/board/myMusic" method="get">
		<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum}">
		<input type="hidden" name="amount" value="${pageMaker.cri.amount}">
		<input type="hidden" name="type" value="${pageMaker.cri.type}">
		<input type="hidden" name="keyword" value="${pageMaker.cri.keyword}">
	</form>
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
				actionForm.append("<input type='hidden' name='f_no' "
						+ "value='" + $(this).attr("href") + "'>");
				actionForm.attr("action", "/user/board/funnyView");
				actionForm.submit();
			});
</script>

<%@ include file="../../includes/footer.jsp"%>