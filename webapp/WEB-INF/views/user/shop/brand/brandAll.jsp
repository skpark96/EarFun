<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<link rel="stylesheet" href="/resources/css/user/brandAll.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<%@ include file="../../../includes/header.jsp"%>
<%@ include file="../../../includes/nav.jsp"%>

<div class="signUp-page">
	<div class="form">
		<h1>브랜드(All)</h1>
		<img src="../../../resources/img/images/aukey.jpg" class="logos"
			onclick="location.href='http://localhost:8090/user/shop/brand/aukey'">
		<img src="../../../resources/img/images/beatsbydrdre.jpg"
			class="logos"
			onclick="location.href='http://localhost:8090/user/shop/brand/beatsbydrdre'">
		<img src="../../../resources/img/images/bose.jpg" class="logos"
			onclick="location.href='http://localhost:8090/user/shop/brand/bose'">
		<img src="../../../resources/img/images/britz.jpg" class="logos"
			onclick="location.href='http://localhost:8090/user/shop/brand/britz'">
		<img src="../../../resources/img/images/etymotic.jpg" class="logos"
			onclick="location.href='http://localhost:8090/user/shop/brand/etymotic'">
		<img src="../../../resources/img/images/gogroove.jpg" class="logos"
			onclick="location.href='http://localhost:8090/user/shop/brand/gogroove'">
		<img src="../../../resources/img/images/kaotica.jpg" class="logos"
			onclick="location.href='http://localhost:8090/user/shop/brand/kaotica'">
		<img src="../../../resources/img/images/nexum.jpg" class="logos"
			onclick="location.href='http://localhost:8090/user/shop/brand/nexum'">
		<img src="../../../resources/img/images/sony.jpg" class="logos"
			onclick="location.href='http://localhost:8090/user/shop/brand/sony'">
		<img src="../../../resources/img/images/westone.jpg" class="logos"
			onclick="location.href='http://localhost:8090/user/shop/brand/westone'">
	</div>
</div>

<style>
.logos {
	width: 200px;
	height: 200px;
	border: 2px solid #e1e5eb;
	margin: 10px 0px;
	cursor: pointer;
}
</style>

<%@ include file="../../../includes/footer.jsp"%>