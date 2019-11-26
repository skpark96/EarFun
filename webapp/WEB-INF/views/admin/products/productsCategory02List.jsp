<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%><!-- jstl core 쓸때 태그에 c 로 표시. -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!-- jstl fmt 쓸때 위와 같음.
fmt : formatter 형식 맞춰서 표시 -->

<%@ include file="../../includes/header.jsp"%>
<%@ include file="../../includes/admin_nav.jsp"%>

<style>
.totalProducts {
	display: inline-block;
}

.category00 {
	float: left;
}

.category01 {
	float: left;
}

.category02 {
	float: left;
}
</style>
<!-- sidebar-wrapper  -->
<main class="page-content">
<div class="container-fluid">
	<!-- Page Heading -->
	<h1 class="h3 mb-2 text-gray-800">Tables</h1>
	<p class="mb-4">
		DataTables is a third party plugin that is used to generate the demo
		table below. For more information about DataTables, please visit the <a
			target="_blank" href="https://datatables.net">official DataTables
			documentation</a>.
	</p>

	<!-- DataTales Example -->
	<div class="card shadow mb-4">
		<div class="card-header py-3" align="right">
			<div class="totalProducts">상품수 ${pageMaker.total }</div>
			<!-- <h6 class="m-0 font-weight-bold text-primary">DataTables Example</h6> -->
			<a href="http://localhost:8090/admin/products/productsList" class="category00">전체&nbsp;&nbsp;&nbsp;</a>
			<a href="http://localhost:8090/admin/products/productsCategory01List" class="category01">이어폰/헤드폰&nbsp;&nbsp;&nbsp;</a>
			<a href="http://localhost:8090/admin/products/productsCategory02List" class="category02">악세서리&nbsp;&nbsp;&nbsp;</a>
		</div>
		<div class="card-body">
			<div class="table-responsive">
				<table class="table table-bordered" id="dataTable" width="100%"
					cellspacing="0">
					<thead>
						<tr>
							<th>품번</th>
							<th>상품명</th>
							<th>썸네일</th>
							<th>브랜드</th>
							<th>가격</th>
							<th>수량</th>
							<th>등록일</th>
							<th>수정일</th>
						</tr>
					</thead>
					<!-- <tfoot>
					<tr>
						<th>Name</th>
						<th>Position</th>
						<th>Office</th>
						<th>Age</th>
						<th>Start date</th>
						<th>Salary</th>
					</tr>
				</tfoot> -->
					<tbody>
						<c:forEach var="list" items="${list }">
							<tr>
								<td><c:out value="${list.p_no }" /></td>
								<td><a href="${list.p_no }" class="move"> <c:out
											value="${list.p_name }" />
								</a></td>
								<td><img src="${list.p_thumbImg }" class="thumbImg" /></td>
								<td><c:out value="${list.p_brand }" /></td>
								<td><c:out value="${list.p_price }" /></td>
								<td><c:out value="${list.p_stock }" /></td>
								<td><fmt:formatDate pattern="yyyy-MM-dd"
										value="${list.p_date }" /></td>
								<td><fmt:formatDate pattern="yyyy-MM-dd"
										value="${list.p_updateDate }" /></td>

								</div>
								<!-- <td>$320,800</td> -->
							</tr>
						</c:forEach>
					</tbody>
				</table>


				<div>
					<div class="col-lg-12">
						<form id="categoryForm" action="/admin/products/productsCategory02List"
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
				</div>


				<form id="categoryForm" action="/admin/products/productsCategory02List"
					method="get">
					<input type="hidden" name="pageNum"
						value="${pageMaker.cri.pageNum }"> <input type="hidden"
						name="amount" value="${pageMaker.cri.amount }"> <input
						type="hidden" name="type" value="${pageMaker.cri.type }">
					<input type="hidden" name="keyword"
						value="${pageMaker.cri.keyword }">
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
</main>
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
							categoryForm.attr("action",
									"/admin/products/productsView");
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
	display: block;
	/* 	max-width: 100px;
	max-height: 100px; */
	width: 120px;
	height: 120px;
}
</style>

<%@ include file="../../includes/footer.jsp"%>










