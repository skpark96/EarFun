<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.css">
<link rel="stylesheet" href="/resources/css/user/new_arrivals.css">


<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script>

<style>/* 
    /* This centers the img and video */
img, video {
	display: block;
	margin: 0 auto;
	height: 750px !important;
	width: 1200px;
}

.icon01 {
	/* width: 150px;
    	height: auto; */
	max-width: 250px;
	height: auto !important;
}

/* .slider { 
    	vertical-align: middle;
    	display: inline-block;
    	float: none !important; 
    } */
.slider {
	
}

.bx-wrapper img {
	margin: 0 auto;
}

* /
    
    body {
	background-color: #157998;
}

h1 {
	color: #fff;
	text-align: center;
}

.bx-wrapper {
	/* max-width: 1024px !important; */
	width: 1200px;
	height: 760px;
}

.clear {
	clear: both;
	margin: 0 auto;
}

.items {
	/* 상품 가로 나열 css */
	width: 400px; /* 이미지 사이즈보다 크게 */
	fload: left;
	margin: 0 13px;
	text-align: center;
}

.slider-section {
	padding-left: 350px;
}

.arrow {
	margin-top: 12px;
	letter-spacing: -3px;
}
</style>

<script>
	$(document).ready(function() {
		$('.slider').bxSlider({
			auto : true,
			autoHover : true,
			speed : 500,
			pause : 4000,
			mode : 'horizontal',
			captions : true,
			autoControls : false,
			pager : true,
			slideWidth : 1700,
			adaptiveHeight : true
		});

		var slider = $('.slider').bxSlider();
		var mql = window.matchMedia("screen and (max-width: 2000px)");
		mql.addListener(function(e) {
			if (!e.matches) {
				slider.reloadSlider();
			}
		});
	});
</script>

<!-- slider start -->
<section class="slider-section">
	<ul class="slider">
		<li class="slider-li"><img class="slider-img"
			src="../resources/img/main/computer.jpg" /></li>
		<li class="slider-li"><img class="slider-img"
			src="../resources/img/main/headphone.png" /></li>
		<li class="slider-li"><img class="slider-img"
			src="../resources/img/main/autumn.png" /></li>
	</ul>
</section>
<!-- slider end -->

<!--top place start-->
<section class="top_place section_padding">
	<div class="container">
		<div class="row justify-content-center">
			<h2 onclick="location.href='http://localhost:8090/user/login'"
				style="font-size: 46px; cursor: pointer;">새 상품&nbsp;</h2>
			<span
				onclick="location.href='http://localhost:8090/user/shop/category00'"
				class="arrow"
				style="font-family: Noto Sans KR, sans-serif; font-size: 14pt; font-weight: 500; color: #000; cursor: pointer;">
				&gt;&gt;&gt;</span>
			<hr style="width: 1200px;">
			<div class="totalProducts">
				<!-- DataTales Example -->
				<div class="dummy">
					<section class="contents">

						<ul class="info">

							<c:forEach var="list" items="${list }">

								<li class="prd_list"><a href="${list.p_no }" class="move"><img
										src="${list.p_thumbImg }" class="thumbImg" /></a>

									<div class="brand">
										[
										<c:out value="${list.p_brand }" />
										]
									</div> <strong><a href="${list.p_no }" class="move"
										style="font-size: 18px; color: #1c1c1c;"> <c:out
												value="${list.p_name }" /> <br>
									</a></strong>
									<div class="price">
										<strong><fmt:formatNumber pattern="###,###,###"
												value="${list.p_price }" />원</strong>
									</div> <br></li>
							</c:forEach>
						</ul>

					</section>
					<form id="categoryForm" action="/main" method="get">
						<input type="hidden" name="pageNum"
							value="${pageMaker.cri.pageNum }"> <input type="hidden"
							name="amount" value="${pageMaker.cri.amount }"> <input
							type="hidden" name="type" value="${pageMaker.cri.type }">
						<input type="hidden" name="keyword"
							value="${pageMaker.cri.keyword }">

					</form>
					<script>
						var categoryForm = $("#categoryForm");

						$(".move")
								.on(
										"click",
										function(e) {
											e.preventDefault();
											categoryForm
													.append("<input type='hidden' name='p_no' "
															+ "value='"
															+ $(this).attr(
																	"href")
															+ "'>");
											categoryForm.attr("action",
													"/user/shop/shopView");
											categoryForm.submit();
										});
					</script>

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
</section>
<!--top place end-->

<!--top place start-->
<section class="event_part section_padding">
	<div class="container">
		<div class="row">
			<div class="col-lg-12">
				<div class="event_slider owl-carousel">
					<div class="single_event_slider">
						<div class="row justify-content-end">
							<div class="col-lg-6 col-md-6">
								<div class="event_slider_content">
									<h5>Upcoming Event</h5>
									<h2>Maldeve - Asia</h2>
									<p>Waters make fish every without firmament saw had.
										Morning air subdue. Our. Air very one. Whales grass is fish
										whales winged.</p>
									<p>
										date: <span>12 Aug 2019</span>
									</p>
									<p>
										Cost: <span>Start from $820</span>
									</p>
									<p>
										Organizer: <span> Martine Agency</span>
									</p>
									<div class="rating">
										<span>Rating:</span>
										<div class="place_review">
											<a href="#"><i class="fas fa-star"></i></a> <a href="#"><i
												class="fas fa-star"></i></a> <a href="#"><i
												class="fas fa-star"></i></a> <a href="#"><i
												class="fas fa-star"></i></a> <a href="#"><i
												class="fas fa-star"></i></a>
										</div>
									</div>
									<a href="#" class="btn_1">Plan Details</a>
								</div>
							</div>
						</div>
					</div>
					<div class="single_event_slider">
						<div class="row justify-content-end">
							<div class="ol-lg-6 col-md-6">
								<div class="event_slider_content">
									<h5>Upcoming Event</h5>
									<h2>Maldeve - Asia</h2>
									<p>Waters make fish every without firmament saw had.
										Morning air subdue. Our. Air very one. Whales grass is fish
										whales winged.</p>
									<p>
										date: <span>12 Aug 2019</span>
									</p>
									<p>
										Cost: <span>Start from $820</span>
									</p>
									<p>
										Organizer: <span> Martine Agency</span>
									</p>
									<div class="rating">
										<span>Rating:</span>
										<div class="place_review">
											<a href="#"><i class="fas fa-star"></i></a> <a href="#"><i
												class="fas fa-star"></i></a> <a href="#"><i
												class="fas fa-star"></i></a> <a href="#"><i
												class="fas fa-star"></i></a> <a href="#"><i
												class="fas fa-star"></i></a>
										</div>
									</div>
									<a href="#" class="btn_1">Plan Details</a>
								</div>
							</div>
						</div>
					</div>
					<div class="single_event_slider">
						<div class="row justify-content-end">
							<div class="ol-lg-6 col-md-6">
								<div class="event_slider_content">
									<h5>Upcoming Event</h5>
									<h2>Maldeve - Asia</h2>
									<p>Waters make fish every without firmament saw had.
										Morning air subdue. Our. Air very one. Whales grass is fish
										whales winged.</p>
									<p>
										date: <span>12 Aug 2019</span>
									</p>
									<p>
										Cost: <span>Start from $820</span>
									</p>
									<p>
										Organizer: <span> Martine Agency</span>
									</p>
									<div class="rating">
										<span>Rating:</span>
										<div class="place_review">
											<a href="#"><i class="fas fa-star"></i></a> <a href="#"><i
												class="fas fa-star"></i></a> <a href="#"><i
												class="fas fa-star"></i></a> <a href="#"><i
												class="fas fa-star"></i></a> <a href="#"><i
												class="fas fa-star"></i></a>
										</div>
									</div>
									<a href="#" class="btn_1">Plan Details</a>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>
<!--top place end-->

<!--::industries start::-->
<section class="hotel_list section_padding">
	<div class="container">
		<div class="row justify-content-center">
			<div class="col-xl-6">
				<div class="section_tittle text-center">
					<h2>EAR FUN</h2>
					<p>귀가 즐거운 곳! EAR FUN에서 나만의 음악 생활을 즐겨보세요.</p>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="col-lg-4 col-sm-6">
				<div class="single_ihotel_list">
					<img src="../resources/img/main/logo/digital-campaign.png"
						class="icon01" alt="게시판">
					<div class="hotel_text_iner">
						<h3>
							<a href="#">다양한 컨텐츠</a>
						</h3>
						<div class="place_review">
							<a href="#"><i class="fas fa-star"></i></a> <a href="#"><i
								class="fas fa-star"></i></a> <a href="#"><i class="fas fa-star"></i></a>
							<a href="#"><i class="fas fa-star"></i></a> <a href="#"><i
								class="fas fa-star"></i></a>
							<!-- <span>(210 review)</span> -->
						</div>
						<p>일반 쇼핑몰과 차별화된 다양한 컨텐츠</p>
						<!-- <h5>
							From <span>$500</span>
						</h5> -->
					</div>
				</div>
			</div>
			<div class="col-lg-4 col-sm-6">
				<div class="single_ihotel_list">
					<img src="../resources/img/main/logo/audio.png" class="icon01"
						alt="오디오">
					<div class="hotel_text_iner">
						<h3>
							<a href="#">약 100여개의 다양한 제품</a>
						</h3>
						<div class="place_review">
							<a href="#"><i class="fas fa-star"></i></a> <a href="#"><i
								class="fas fa-star"></i></a> <a href="#"><i class="fas fa-star"></i></a>
							<a href="#"><i class="fas fa-star"></i></a> <a href="#"><i
								class="fas fa-star"></i></a>
							<!-- <span>(210 review)</span> -->
						</div>
						<p>고객의 소비 패턴에 맞는 제품 추천</p>
						<!-- <h5>
							From <span>$500</span>
						</h5> -->
					</div>
				</div>
			</div>
			<div class="col-lg-4 col-sm-6">
				<div class="single_ihotel_list">
					<img src="../resources/img/main/logo/discussion.png" class="icon01"
						alt="관리자">
					<div class="hotel_text_iner">
						<h3>
							<a href="#">빠르고 친절한 응대</a>
						</h3>
						<div class="place_review">
							<a href="#"><i class="fas fa-star"></i></a> <a href="#"><i
								class="fas fa-star"></i></a> <a href="#"><i class="fas fa-star"></i></a>
							<a href="#"><i class="fas fa-star"></i></a> <a href="#"><i
								class="fas fa-star"></i></a>
							<!-- <span>(210 review)</span> -->
						</div>
						<p>사용자 맞춤 서비스</p>
						<!-- <h5>
							From <span>$500</span>
						</h5> -->
					</div>
				</div>
			</div>
		</div>
	</div>
</section>
<!--::industries end::-->