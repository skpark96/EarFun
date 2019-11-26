<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%><!-- jstl core 쓸때 태그에 c 로 표시. -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!-- jstl fmt 쓸때 위와 같음.
fmt : formatter 형식 맞춰서 표시 -->

<link rel="stylesheet" href="/resources/css/user/prd_list.css">

<%@ include file="../../includes/header.jsp"%>
<%@ include file="../../includes/nav.jsp"%>

<!-- sidebar-wrapper  -->
<div class="signUp-page">
	<h1 class="title">이어폰/헤드폰</h1>
	<hr>
	<!-- <h6 class="m-0 font-weight-bold text-primary">DataTables Example</h6> -->
	<a href="http://localhost:8090/user/shop/category00" class="category00">전체&nbsp;&nbsp;&nbsp;</a>
	<a href="http://localhost:8090/user/shop/category01" class="category01">이어폰&nbsp;&nbsp;&nbsp;</a>
	<a href="http://localhost:8090/user/shop/category02" class="category02">헤드폰&nbsp;&nbsp;&nbsp;</a>
	<a href="http://localhost:8090/user/shop/category03" class="category03">블루투스&nbsp;&nbsp;&nbsp;</a>
	<br>
	<hr>
	<div style="text-align: left;">
		<strong>${pageMaker.total } 개</strong> <a
			href="http://localhost:8090/user/shop/lowPriceCategory13"
			class="lowPrice">낮은가격</a> <a
			href="http://localhost:8090/user/shop/highPriceCategory13"
			class="highPrice">높은가격&nbsp;&nbsp;&nbsp;</a>
	</div>

	<hr>

	<div class="totalProducts">
		<!-- DataTales Example -->
		<div class="dummy">
			<section class="contents">

				<ul class="info">

					<c:forEach var="list" items="${list }">

						<li class="prd_list"><a href="${list.p_no }" class="move"><img
								src="${list.p_thumbImg }" class="thumbImg" /><br> <br></a>

							<div class="brand">
								[
								<c:out value="${list.p_brand }" />
								]
							</div> <br> <strong><a href="${list.p_no }" class="move"
								style="font-size: 18px; color: #1c1c1c;"> <c:out
										value="${list.p_name }" /><br> <br>
							</a></strong>
							<div class="price">
								<strong><c:out value="${list.p_price }" />원</strong>
							</div> <br> </li>
					</c:forEach>
				</ul>

				<script>
					$(".addCart_btn").click(function() {
						var p_no = $(".p_no").val();

						var data = {
							p_no : p_no
						};

						$.ajax({
							url : "/user/shop/addCart",
							type : "get",
							data : data,
							success : function(result) {
								alert("카트 담기 성공");
							},
							error : function() {
								alert("카트 담기 실패");
							}
						});
					});
				</script>
			</section>
			<%-- 				<div>
					<div class="col-lg-12">
						<form id="categoryForm" action="/user/shop/category00"
							method="get">
							&nbsp;&nbsp;&nbsp;<select name="type">
								<option value="" ${pageMaker.cri.type==null?"selected":"" }>
									--</option>
								<option value="P" ${pageMaker.cri.type eq "P"?"selected":"" }>
									상품명</option>
								<option value="B" ${pageMaker.cri.type eq "B"?"selected":"" }>
									브랜드</option>

							</select> <input type="text" name="keyword" /> <input type="hidden"
								name="pageNum" value="${pageMaker.cri.pageNum }"> <input
								type="hidden" name="amount" value="${pageMaker.cri.amount }">
							<button class="btn btn-warning">Search</button>
						</form>
					</div>
				</div>


				<div>
					<ul class="pagination justify-content-center">
						<c:if test="${pageMaker.prev }">
							<li class="page-item previous"><a
								href="${pageMaker.startPage-1 }" class="page-link">prev</a></li>
						</c:if>

						<c:forEach var="num" begin="${pageMaker.startPage }"
							end="${pageMaker.endPage }">
							<li class='page-item ${pageMaker.cri.pageNum==num?"active":"" }'>
								<a href="${num }" class="page-link"> ${num }</a>
							</li>
						</c:forEach>

						<c:if test="${pageMaker.next }">
							<li class="page-item next"><a href="${pageMaker.endPage+1 }"
								class="page-link">next</a></li>
						</c:if>

					</ul>
				</div> --%>

			<form id="categoryForm" action="/user/shop/category00" method="get">
				<input type="hidden" name="pageNum"
					value="${pageMaker.cri.pageNum }"> <input type="hidden"
					name="amount" value="${pageMaker.cri.amount }"> <input
					type="hidden" name="type" value="${pageMaker.cri.type }"> <input
					type="hidden" name="keyword" value="${pageMaker.cri.keyword }">

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



<script type="text/javascript">
	$(document).ready(
			function() {
				var result = '<c:out value="${result}"/>';
				/* console.log("history.length : " + history.length);
				console.log("history.current : " + history.current);
				console.log("history.state : " + history.state);
				console.log("result : " + result); */
				checkModal(result);
				history.replaceState({}, null, null);
				// 스택구조에 누적된 히스토리 객체를 지워라
				// 3개의 인자는 state객체, 제목, url
				function checkModal(result) {
					if (result === '' || history.state != null) { /* 결과가 없거나 히스토리가 있다면 */
						// 값과 타입도 검사. 형태도 맞고 값도 맞는다면
						// 넘겨 받은 값이 있다면,
						// 스택구조로 쌓인 정보가 있다면
						/* if (result === '') { */
						return;
					}
					if (parseInt(result) > 0) {
						$(".modal-body").html(
								"게시글 " + parseInt(result) + "번이 등록");
						// 모달 바디에 주어진 문장으로 대체
					}
					$("#myModal").modal("show");// 모달 표시.
				}

				var categoryForm = $("#categoryForm");
				// 클래스 page-item 에 a 링크가 클릭 된다면,
				$(".page-item a").on(
						"click",
						function(e) {
							e.preventDefault();
							// 기본 이벤트 동작을 막고,
							console.log("click");
							// 웹 브라우저 검사 창에 클릭을 표시
							categoryForm.find("input[name='pageNum']").val(
									$(this).attr("href"));
							// 액션폼 인풋태그에 페이지넘 값을 찾아서,
							// href로 받은 값으로 대체함.
							categoryForm.submit();
						});

				$(".move").on(
						"click",
						function(e) {
							e.preventDefault();
							categoryForm
									.append("<input type='hidden' name='p_no' "
											+ "value='" + $(this).attr("href")
											+ "'>");
							categoryForm.attr("action", "/user/shop/shopView");
							categoryForm.submit();
						});

				/* 				var searchForm = $("#searchForm");
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

				 }); */

			});// end
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
	/* 	max-width: 100px;
	max-height: 100px; */
	width: 333px;
	height: 333px;
}
</style>

<%@ include file="../../includes/footer.jsp"%>