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



			<h1>장바구니</h1>
			<div class="noticeList">

				<table id="checkboxTestTbl" summary="">
					<colgroup>
						<col class="cate">
						<col class="tit">
						<col class="date">
						<col class="count">
					</colgroup>
					<thead>
						<tr>
							<th class="checkbox"><input type="checkbox" /></th>
							<th class="thumb">-</th>
							<th class="title">상품</th>
							<th class="price">가격</th>
							<th class="stock">수량</th>
							<th class="thumb">-</th>
						</tr>
					</thead>

					<tbody class="tbody">
						<c:set var="total" value="0" />
						<c:forEach var="cartList" items="${cartList}">

							<tr>
								<td class="checkbox"><input type="checkbox" name="checkbox"
									class="checkbox" data-c_no="${cartList.c_no}" /></td>
								<td class="thumb"><a href="${cartList.p_no}" class="move"><img
										src="${cartList.p_thumbImg}" /></a></td>
								<td class="title"><a href="${cartList.p_no}" class="move"><c:out
											value="${cartList.p_name}" /></a></td>
								<td class="price"><fmt:formatNumber pattern="###,###,###"
										value="${cartList.p_price}" /></td>
								<td class="stock"><c:out value="${cartList.c_stock}" /></td>
								<td class="btDelete"><a data-c_no="${cartList.c_no}"
									class="btSelectDelete"><img
										src="../../resources/img/images/btn_delete.gif" border="0"
										style="cursor: pointer;"></a></td>
								<%-- <td class="date"><fmt:formatDate pattern="yyyy-MM-dd"
										value="${list.regDate}" /></td> --%>
							</tr>

							<%-- <fmt:formatNumber pattern="###,###,###"
								value="${cartList.p_price * cartList.c_stock}" />원 --%>
							<c:set var="total"
								value="${total + cartList.p_price * cartList.c_stock}" />
						</c:forEach>



					</tbody>
				</table>
				<div class="divCartList">
					<strong class="ctrlTxt">선택상품을</strong> <img
						src="../../resources/img/images/btn_delete2.gif" border="0"
						style="cursor: pointer;" class="btSelectDelete">
				</div>
				<br> <br>
				<div class="xans-element- xans-order xans-order-basketpackage">
					<div class="xans-element- xans-order xans-order-totalsummary">
						<table class="totalPrice" border="1" summary="">
							<thead class="thead2">
								<tr>
									<th scope="col"><span>총 상품금액</span></th>
									<th scope="col">총 배송비</th>
									<th scope="col" class="total">결제예정금액</th>
								</tr>
							</thead>
							<tbody class="tbody2">
								<tr>
									<td class="price"><div class="box">
											<strong><fmt:formatNumber pattern="###,###,###"
													value="${total}" /></strong><strong class="tail"></strong> <span
												class="tail displaynone"></span>
										</div></td>
									<td class="option"><div class="box">
											<strong>+ </strong><strong>2,500</strong><strong class="tail"></strong>
											<span class="tail displaynone"></span>
										</div></td>
									<td class="total"><div class="box">
											<strong>= </strong><strong><fmt:formatNumber
													pattern="###,###,###" value="${total+2500}" /></strong><strong
												class="tail"></strong> <span class="tail displaynone"></span>
										</div></td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>

				<br>
				<div class="btBuy">
					<a href="javascript:g_detail_cart_add_pc('buy')"><img
						class="btBuy" src="../../resources/img/images/buy.jpg" border="0"></a>
				</div>
				<br>
				<div class="orderInfo">
					<form role="form" method="post" autocomplete="off">
						<input type="hidden" name="${_csrf.parameterName}"
							value="${_csrf.token}" /> <input type="hidden"
							name="total_price" value="${total}" />

						<div class="divO_rec">
							<label for="" class="labelO_rec">수령인&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
							<input type="text" name="o_rec" id="o_rec" required="required" />
						</div>

						<div class="divO_phone">
							<label for="o_phone" class="labelO_phone">휴대전화&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
							<input type="text" onKeyup="inputPhoneNumber(this);"
								maxlength="13" name="o_phone" id="o_phone" required="required">
						</div>

						<div class="divU_addr1">
							<label for="u_addr1">배송지 주소&nbsp;&nbsp;</label> <input
								type="text" placeholder="우편 번호" name="u_addr1" id="u_addr1"
								required="required" />
							<button type="button" id="addrBtn" onclick="execPostCode();">주소
								찾기</button>
						</div>

						<div class="divU_addr2">
							<label for="u_addr2"></label> <input type="text"
								placeholder="도로명 주소" name="u_addr2" id="u_addr2"
								required="required" />
						</div>

						<div class="divU_addr3">
							<label for="u_addr1"></label> <input type="text"
								placeholder="상세 주소" name="u_addr3" id="u_addr3"
								required="required" />
						</div>

						<div class="divBt">
							<button type="submit" class="btOrder">주문하기</button>
							<button type="button" class="btCancel">취소</button>
						</div>

					</form>
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

				<form id="actionForm" action="/user/shop/cartList" method="get">
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
				actionForm.attr("action", "/user/shop/shopView");
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



<script>
	$(document)
			.ready(
					function() {
						var tbl = $("#checkboxTestTbl");

						// 테이블 헤더에 있는 checkbox 클릭시
						$(":checkbox:first", tbl).click(function() {
							// 클릭한 체크박스가 체크상태인지 체크해제상태인지 판단
							if ($(this).is(":checked")) {
								$(":checkbox", tbl).attr("checked", "checked");
							} else {
								$(":checkbox", tbl).removeAttr("checked");
							}

							// 모든 체크박스에 change 이벤트 발생시키기               
							$(":checkbox", tbl).trigger("change");
						});

						// 헤더에 있는 체크박스외 다른 체크박스 클릭시
						$(":checkbox:not(:first)", tbl)
								.click(
										function() {
											var allCnt = $(
													":checkbox:not(:first)",
													tbl).length;
											var checkedCnt = $(
													":checkbox:not(:first)",
													tbl).filter(":checked").length;

											// 전체 체크박스 갯수와 현재 체크된 체크박스 갯수를 비교해서 헤더에 있는 체크박스 체크할지 말지 판단
											if (allCnt == checkedCnt) {
												$(":checkbox:first", tbl).attr(
														"checked", "checked");
											} else {
												$(":checkbox:first", tbl)
														.removeAttr("checked");
											}
										})
								.change(
										function() {
											if ($(this).is(":checked")) {
												// 체크박스의 부모 > 부모 니까 tr 이 되고 tr 에 selected 라는 class 를 추가한다.
												$(this).parent().parent()
														.addClass("selected");
											} else {
												$(this)
														.parent()
														.parent()
														.removeClass("selected");
											}
										});
					});
</script>

<script>
	var csrfHeaderName = "${_csrf.headerName}";
	var csrfTokenValue = "${_csrf.token}";
	$(".btSelectDelete").click(function() {
		var confirm_val = confirm("선택하신 상품을 삭제하시겠습니까?");
		if (confirm_val) {
			var checkArr = new Array();
			$("input[class='checkbox']:checked").each(function() {
				checkArr.push($(this).attr("data-c_no"));
			});

			$.ajax({
				url : "/user/shop/deleteCart",
				type : "post",
				data : {
					checkbox : checkArr
				},
				beforeSend : function(xhr) {
					xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
				},
				success : function() {
					location.href = "/user/shop/cartList";
				}
			});
		}
	});
</script>
<script>
	function execPostCode() {
		new daum.Postcode({
			oncomplete : function(data) {
				// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

				// 도로명 주소의 노출 규칙에 따라 주소를 조합한다.
				// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
				var fullRoadAddr = data.roadAddress; // 도로명 주소 변수
				var extraRoadAddr = ''; // 도로명 조합형 주소 변수

				// 법정동명이 있을 경우 추가한다. (법정리는 제외)
				// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
				if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
					extraRoadAddr += data.bname;
				}
				// 건물명이 있고, 공동주택일 경우 추가한다.
				if (data.buildingName !== '' && data.apartment === 'Y') {
					extraRoadAddr += (extraRoadAddr !== '' ? ', '
							+ data.buildingName : data.buildingName);
				}
				// 도로명, 지번 조합형 주소가 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
				if (extraRoadAddr !== '') {
					extraRoadAddr = ' (' + extraRoadAddr + ')';
				}
				// 도로명, 지번 주소의 유무에 따라 해당 조합형 주소를 추가한다.
				if (fullRoadAddr !== '') {
					fullRoadAddr += extraRoadAddr;
				}

				// 우편번호와 주소 정보를 해당 필드에 넣는다.
				console.log(data.zonecode);
				console.log(fullRoadAddr);

				$("[name=u_addr1]").val(data.zonecode);
				$("[name=u_addr2]").val(fullRoadAddr);

			}
		}).open();
	}
</script>

<script>
	function inputPhoneNumber(obj) {

		var number = obj.value.replace(/[^0-9]/g, "");
		var phone = "";

		if (number.length < 4) {
			return number;
		} else if (number.length < 7) {
			phone += number.substr(0, 3);
			phone += "-";
			phone += number.substr(3);
		} else if (number.length < 11) {
			phone += number.substr(0, 3);
			phone += "-";
			phone += number.substr(3, 3);
			phone += "-";
			phone += number.substr(6);
		} else {
			phone += number.substr(0, 3);
			phone += "-";
			phone += number.substr(3, 4);
			phone += "-";
			phone += number.substr(7);
		}
		obj.value = phone;
	}
</script>

<script>
	$(".btBuy").click(function() {
		$(".orderInfo").slideDown(100);
		/* $(".btBuy").slideUp(); */
	});
</script>
<script>
	$(".btCancel").click(function() {
		$(".orderInfo").slideUp(100);
		$(".btBuy").slideDown(100);
	});
</script>
<%@ include file="../../includes/footer.jsp"%>
