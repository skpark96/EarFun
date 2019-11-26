<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<link rel="stylesheet" href="/resources/css/user/findPw.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<title>비밀번호 찾기</title>
</head>

<%@ include file="../includes/header.jsp"%>
<%@ include file="../includes/nav.jsp"%>

<c:if test="${message == false}">
	<p style="color: #eb4034;">항목을 전부 기입했는지 확인하세요.</p>
</c:if>
<div class="find-page">
	<div class="form">
		<h1>비밀번호 찾기</h1>

		<form action="../user/findPw" method="post">
			<input type="text" id="u_id" name="u_id" value="${user.u_id}"
				class="regId" placeholder="아이디를 입력하세요." required="required" /> <input
				type="text" id="u_email" name="u_email" value="${user.u_email}"
				class="regEmail" value="${user.u_email}" placeholder="이메일을 입력하세요."
				required="required" />

			<button type="submit" class="subBtn">확인</button>
			<button type="button" class="cancle" onclick="history.go(-1);">취소</button>

			<input type="hidden" name="${_csrf.parameterName}"
				value="${_csrf.token}" />
		</form>
	</div>
</div>

<%@ include file="../includes/footer.jsp"%>