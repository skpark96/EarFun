<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<link rel="stylesheet" href="/resources/css/user/home.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<%@ include file="../../includes/header.jsp"%>
<%@ include file="../../includes/nav.jsp"%>

<div class="signUp-page">
	<div class="form">
		<h1>나의 정보 보기</h1>
		<div class="floor1">
			<div class="info"
				onclick="location.href='http://localhost:8090/main'">
				<i class="fas fa-headphones fa-lg"></i>&nbsp;EAR FUN
			</div>
			<!-- <strong>EAR FUN</strong> -->
			<div class="activity"
				onclick="location.href='http://localhost:8090/user/board/myMusic'">내
				음악</div>
		</div>
		<div class="floor1">
			<div class="info"
				onclick="location.href='http://localhost:8090/user/myPage/modify'">회원정보
				수정</div>
			<div class="activity"
				onclick="location.href='http://localhost:8090/user/shop/cartList'">장바구니</div>
		</div>
		<div class="floor2">
			<div class="order"
				onclick="location.href='http://localhost:8090/user/shop/orderList'">주문내역
				조회</div>
			<div class="counsel"
				onclick="location.href='http://localhost:8090/user/board/qnaList'">1:1문의</div>
		</div>
	</div>
</div>

<%@ include file="../../includes/footer.jsp"%>