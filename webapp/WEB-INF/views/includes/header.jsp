<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!doctype html>
<html lang="en">

<head>

<script type="text/javascript"
	src="http://code.jquery.com/jquery-3.2.1.min.js"></script>
<script src="<c:url value="/resources/js/jquery-1.12.1.min.js" />"></script>

<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>EAR FUN</title>
<!-- <link rel="icon" href="img/favicon.png"> -->

<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css">
<!-- animate CSS -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/animate.css">
<!-- owl carousel CSS -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/owl.carousel.min.css">
<!-- themify CSS -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/themify-icons.css">
<!-- flaticon CSS -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/flaticon.css">
<!-- fontawesome CSS -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/fontawesome/css/all.min.css">
<!-- magnific CSS -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/magnific-popup.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/gijgo.min.css">
<!-- niceselect CSS -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/nice-select.css">
<!-- slick CSS -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/slick.css">
<!-- style CSS -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/style.css">
</head>

<body>
	<!--::header part start::-->
	<header class="main_menu">
		<div class="sub_menu">
			<div class="container">
				<div class="row">
					<div class="col-lg-6 col-sm-12 col-md-6">
						<div class="sub_menu_right_content">
							<span>이어폰/헤드셋 전문 판매 쇼핑몰</span>
							<!-- <a href="#">Asia</a> <a href="#">Europe</a> -->
						</div>
					</div>
					<div class="col-lg-6 col-sm-12 col-md-6">
						<div class="sub_menu_social_icon">
							<c:if test="${user == null}">
								<span><a href="/user/login">로그인</a></span>
								<span><a href="/user/signUp">회원가입</a></span>
							</c:if>

							<c:if test="${user != null}">
								<c:if test="${user.auth == 1}">
									<span>${user.u_name}님</span>
									<span><a href="/admin/index">관리자 화면</a></span>
									<span><a href="/user/logout">로그아웃</a></span>
								</c:if>

								<c:if test="${user.auth == 0}">
									<span>${user.u_name}님</span>
									<span><a href="/user/myPage/home">나의 정보</a></span>
									<span><a href="/user/logout">로그아웃</a></span>
								</c:if>
							</c:if>
						</div>
					</div>
				</div>
			</div>
		</div>