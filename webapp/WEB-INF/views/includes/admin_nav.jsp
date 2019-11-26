<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<link rel="stylesheet" href="/resources/css/admin/index.css">

<style>
.user-pic {
	width: 65px;
	height: 65px;
	float: left;
	padding: 20px;
}
</style>

<div class="page-wrapper chiller-theme toggled">
	<a id="show-sidebar" class="btn btn-sm btn-dark" href="#"> <i
		class="fas fa-bars"></i>
	</a>

	<nav id="sidebar" class="sidebar-wrapper">
		<div class="sidebar-content">
			<div class="sidebar-brand">
				<a href="/admin/index">관리자 화면</a>
				<div id="close-sidebar">
					<i class="fas fa-times"></i>
				</div>
			</div>

			<div class="sidebar-header">
				<div class="user-pic">
					<img src="/resources/img/admin.png">
				</div>

				<div class="user-info">
					<span class="user-name">ADMIN</span> <span class="user-role">관리자</span>
					<span class="user-status"> <i class="fa fa-circle"></i><span>접속중</span>
					</span>
				</div>
			</div>

			<!-- sidebar-search  -->
			<div class="sidebar-menu">
				<ul>
					<li class="header-menu"><span>관리자 메뉴</span></li>
					<li class="sidebar-dropdown"><a href="#"> <i
							class="fa fa-shopping-cart"></i> <span>상품 관리</span>
					</a>

						<div class="sidebar-submenu">
							<ul>
								<li><a href="/admin/products/productsRegister">상품 등록</a></li>
								<li><a href="/admin/products/productsList">상품 목록</a></li>
								<li><a href="/admin/order/orderList">주문내역 조회</a></li>
							</ul>
						</div></li>

					<li class="sidebar-dropdown"><a href="#"> <i
							class="fa fa-user-circle"></i> <span>회원 관리</span>
					</a>
						<div class="sidebar-submenu">
							<ul>
								<li><a href="/admin/user/userList">회원 목록</a></li>
								<li><a href="/admin/report/reportList">신고 접수내역</a></li>
								<li><a href="/admin/user/userBlackList">블랙리스트 관리</a></li>
							</ul>
						</div></li>

					<li class="sidebar-dropdown"><a href="#"> <i
							class="fa fa-cog"></i> <span>게시판 관리</span>
					</a>
						<div class="sidebar-submenu">
							<ul>
								<li><a href="/admin/board/funnyList">퍼니's 목록</a></li>
								<li><a href="/admin/board/earFunRegister">이어펀's 등록</a></li>
								<li><a href="/admin/board/earFunList">이어펀's 목록</a></li>
								<li><a href="/admin/board/moodRegister">상황별 음악 등록</a></li>
								<li><a href="/admin/board/moodList">상황별 음악 목록</a></li>
							</ul>
						</div></li>

					<li class="sidebar-dropdown"><a href="#"> <i
							class="fa fa-book"></i> <span>고객센터 관리</span>
					</a>
						<div class="sidebar-submenu">
							<ul>
								<li><a href="/admin/board/noticeRegister">공지사항 등록</a></li>
								<li><a href="/admin/board/noticeList">공지사항 목록</a></li>
								<li><a href="/admin/board/qnaList">1:1 문의</a></li>
							</ul>
						</div></li>

					<li><a href="/main"> <i class="fa fa-home"></i> <span>메인으로
								돌아가기</span>
					</a></li>
			</div>
			<!-- sidebar-menu  -->
		</div>
	</nav>

	<script>
		$(".sidebar-dropdown > a").click(function() {
			$(".sidebar-submenu").slideUp(200);
			if ($(this).parent().hasClass("active")) {

				$(".sidebar-dropdown").removeClass("active");
				$(this).parent().removeClass("active");

			} else {
				$(".sidebar-dropdown").removeClass("active");
				$(this).next(".sidebar-submenu").slideDown(200);
				$(this).parent().addClass("active");
			}
		});

		$("#close-sidebar").click(function() {
			$(".page-wrapper").removeClass("toggled");
		});

		$("#show-sidebar").click(function() {
			$(".page-wrapper").addClass("toggled");
		});
	</script>