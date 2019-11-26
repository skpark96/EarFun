<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<link rel="stylesheet" href="/resources/css/user/findId_Result.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/normalize/5.0.0/normalize.min.css">

<%@ include file="../includes/header.jsp"%>
<%@ include file="../includes/nav.jsp"%>
<script>
	$(function() {
		$("#loginBtn").click(function() {
			location.href = '../user/login';
		})
	})
</script>
<title>아이디 찾기</title>
</head>
<body>
	<div class="login-page">
		<div class="form">
			<h1>아이디 찾기</h1>
			<h5>고객님의 정보와 일치하는 아이디입니다.</h5>
			<form class="login-form" id="loginForm" name="loginForm">
				<div>
					<input type="text" value="${u_id}" style="text-align: center;"
						readonly />

					<button type="button" class="loginBtn">로그인</button>
					<button type="button" class="findPw"
						onclick="location.href='http://localhost:8090/user/findPw'">비밀번호
						찾기</button>

				</div>
			</form>
		</div>
	</div>


</body>
<%@ include file="../includes/footer.jsp"%>