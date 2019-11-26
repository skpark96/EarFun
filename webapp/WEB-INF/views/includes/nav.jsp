<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<style>
@font-face {
	font-family: 'NANUMSQUAREROUNDB';
	src: url('/resources/fonts/NANUMSQUAREROUNDB.TTF');
}

a {
	font-family: 'NANUMSQUAREROUNDB' !important;
	font-weight: 300;
}

.main_menu .main-menu-item ul li .nav-link:hover {
	color: green !important;
}
</style>

<div class="main_menu_iner">
	<div class="container">
		<div class="row align-items-center ">
			<div class="col-lg-12">
				<nav
					class="navbar navbar-expand-lg navbar-light justify-content-between">
					<a class="navbar-brand" href="/main"> <i
						class="fas fa-headphones"></i> <strong>EAR FUN</strong>

					</a>

					<button class="navbar-toggler" type="button" data-toggle="collapse"
						data-target="#navbarSupportedContent"
						aria-controls="navbarSupportedContent" aria-expanded="false"
						aria-label="Toggle navigation">
						<span class="navbar-toggler-icon"></span>
					</button>

					<div id="navbarSupportedContent"
						class="collapse navbar-collapse main-menu-item justify-content-center">
						<ul class="navbar-nav">
							<li class="nav-item"><a style="font-weight: 700;"
								class="nav-link"
								href="http://localhost:8090/user/shop/brand/brandAll">브랜드(ALL)</a>
							</li>
							<li class="nav-item dropdown"><a style="font-weight: 700;"
								class="nav-link dropdown-toggle" href="/user/shop/category00"
								id="navbarDropdown" role="button" data-toggle="dropdown"
								aria-haspopup="true" aria-expanded="false">이어폰/헤드폰</a>
								<div class="dropdown-menu" aria-labelledby="navbarDropdown">
									<a class="dropdown-item" href="/user/shop/category01">이어폰</a> <a
										class="dropdown-item" href="/user/shop/category02">헤드폰</a> <a
										class="dropdown-item" href="/user/shop/category03">블루투스</a>
								</div></li>
							<li class="nav-item dropdown"><a style="font-weight: 700;"
								class="nav-link dropdown-toggle" href="/user/shop/category10"
								id="navbarDropdown" role="button" data-toggle="dropdown"
								aria-haspopup="true" aria-expanded="false">악세서리</a>
								<div class="dropdown-menu" aria-labelledby="navbarDropdown">
									<a class="dropdown-item" href="/user/shop/category11">케이블</a> <a
										class="dropdown-item" href="/user/shop/category12">케이스/파우치</a>
									<a class="dropdown-item" href="/user/shop/category13">청소도구</a>
								</div></li>

							<li class="nav-item dropdown"><a style="font-weight: 700;"
								class="nav-link dropdown-toggle"
								href="http://localhost:8090/user/board/funnyList"
								id="navbarDropdown" role="button" data-toggle="dropdown"
								aria-haspopup="true" aria-expanded="false">게시판</a>
								<div class="dropdown-menu" aria-labelledby="navbarDropdown">
									<a class="dropdown-item" href="/user/board/funnyList">퍼니's
										Pick!</a> <a class="dropdown-item" href="/user/board/earFunList">이어펀's
										Pick!</a> <a class="dropdown-item" href="/user/board/moodList">상황별
										음악</a>
								</div></li>

							<li class="nav-item dropdown"><a style="font-weight: 700;"
								class="nav-link dropdown-toggle"
								href="/user/board/userNoticeList" id="navbarDropdown"
								role="button" data-toggle="dropdown" aria-haspopup="true"
								aria-expanded="false">고객센터</a>
								<div class="dropdown-menu" aria-labelledby="navbarDropdown">
									<a class="dropdown-item" href="/user/board/userNoticeList">공지사항</a>
									<a class="dropdown-item" href="/user/board/qnaRegister">1:1
										문의</a>
								</div></li>
						</ul>
					</div>
					<!-- <a href="#" class="btn_1 d-none d-lg-block">book now</a> -->
				</nav>
			</div>
		</div>
	</div>
</div>
</header>
</body>
<!-- Header part end-->