<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<link rel="stylesheet" href="/resources/css/user/brd_list.css">

<%@ include file="../../includes/header.jsp"%>
<%@ include file="../../includes/nav.jsp"%>

<!-- sidebar-wrapper  -->
<main class="page-content">
<div class="container-fluid">

	<div class="signUp-page">
		<h1 class="title">상황별 음악</h1>
		<br>
		<hr>
		<strong>${pageMaker.total} 개</strong> <a
			href="http://localhost:8090/user/shop/lowPriceCategory00"
			class="lowPrice">인기순</a> <a
			href="http://localhost:8090/user/shop/highPriceCategory00"
			class="highPrice">조회순&nbsp;&nbsp;&nbsp;</a>
		<hr>

		<div class="totalProducts">
			<!-- DataTales Example -->
			<div class="dummy">
				<section class="contents">
					<ul class="info">
						<c:forEach var="list" items="${list}">
							<li class="brd_list"><a href="${list.m_no}" class="move">
									<img src="${list.m_thumbImg}" class="thumbImg" /><br> <br>
							</a> <strong> <a href="${list.m_no}" class="move"
									style="font-size: 18px; color: #1c1c1c;"> <c:out
											value="${list.m_caption}" /><br> <br></a>
							</strong>

								<div class="price">
									조회수&nbsp;
									<c:out value="${list.viewCnt}" />
									<br> <br> </a>
									<fmt:formatDate pattern="yyyy-MM-dd" value="${list.regDate}" />
								</div> <br> <!-- <i class="far fa-heart fa-lg"
								style="margin-bottom: 20px; cursor: pointer;"></i> --></li>
						</c:forEach>
					</ul>
				</section>

				<form id="categoryForm" action="/user/board/moodList" method="get">
					<input type="hidden" name="pageNum"
						value="${pageMaker.cri.pageNum}"> <input type="hidden"
						name="amount" value="${pageMaker.cri.amount}"> <input
						type="hidden" name="type" value="${pageMaker.cri.type}"> <input
						type="hidden" name="keyword" value="${pageMaker.cri.keyword}">
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
								<button type="button" class="btn btn-primary"
									data-dismiss="modal">close</button>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
</main>



<script type="text/javascript">
	$(document)
			.ready(
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

						var categoryForm = $("#categoryForm");
						$(".page-item a").on(
								"click",
								function(e) {
									e.preventDefault();
									console.log("click");
									categoryForm.find("input[name='pageNum']")
											.val($(this).attr("href"));
									categoryForm.submit();
								});

						$(".move")
								.on(
										"click",
										function(e) {
											e.preventDefault();
											categoryForm
													.append("<input type='hidden' name='m_no' "
															+ "value='"
															+ $(this).attr(
																	"href")
															+ "'>");
											categoryForm.attr("action",
													"/user/board/moodView");
											categoryForm.submit();
										});
					}); // end of ready
</script>



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



<script>
	$(document).ready(function() {
		$('#dataTable').DataTable({
			"order" : [ [ 0, "desc" ] ], //정렬 0컬럼의 내림차순으로
			"paging" : false, // 페이징 표시 안함.
			"bFilter" : false, // 검색창 표시 안함.
			"info" : false
		// 안내창 표시 안함.
		})
	})
</script>

<style>
.thumbImg {
	/*    max-width: 100px;
   max-height: 100px; */
	width: 333px;
	height: 333px;
}
</style>

<%@ include file="../../includes/footer.jsp"%>