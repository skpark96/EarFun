<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<link rel="stylesheet" href="/resources/css/footer.css">

<footer>
	<div class="contents-wrap">
		<!-- <i class="fas fa-headphones"></i> -->

		<div class="footer-contents-wrap">
			<ul class="footer-link-ul clear">
				<li><a href="http://localhost:8090/user/board/userNoticeList">공지사항</a></li>
				<li><a href="#">사이트맵</a></li>
				<li><a href="#">오시는길</a></li>
			</ul>
			<br>
			<div class="footer-text-1">
				업체명 : ㈜EAR FUN (이어펀)&nbsp;&nbsp;|&nbsp;&nbsp;사업자등록번호 :
				121-86-24448&nbsp;&nbsp;&nbsp;<br> 주소 : 인천 남구 학익동 663-1 태승빌딩 5층
				(1층 홈플러스)&nbsp;&nbsp;|&nbsp;&nbsp;전화번호 : 032-876-3332
			</div>

			<div class="footer-text-2">
				Copyright &copy;
				<script>
					document.write(new Date().getFullYear());
				</script>
				<span class="span">EAR FUN</span> All rights reserved.
			</div>
		</div>

		<a href="javascript:;" class="go-top-btn" id="go-top-btn">TOP</a>
	</div>
</footer>

<script>
	$("#go-top-btn").on("click", function() {
		$("html, body").animate({
			scrollTop : 0
		}, "slow");
		return false;
	});
</script>