<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<link rel="stylesheet" href="/resources/css/user/login.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/normalize/5.0.0/normalize.min.css">

<%@ include file="../../includes/header.jsp"%>
<%@ include file="../../includes/nav.jsp"%>
<div class="login-page">
	<div class="form">
		<h1>회원탈퇴</h1>
		<h2>${error}</h2>
		<h2>${logout}</h2>

		<!-- <form class="register-form" >
       <input type="text" placeholder="name" />
         <input type="password" placeholder="password" />
         <input type="text" placeholder="email address" />
         
         <button>create</button>
         
         <p class="message">Already registered? <a href="#">Sign In</a></p>
    </form> -->

		<form method="post" class="login-form" id="loginForm"
			name="withDrawalForm">
			<input type="text" id="u_id" name="u_id" value="${user.u_id}"
				placeholder="아이디" required="required" /> <input type="password"
				id="u_pw" name="u_pw" placeholder="비밀번호" required="required" />

			<button type="submit" id="withDrawalBtn" name="withDrawalBtn">탈퇴</button>

			<input type="hidden" name="${_csrf.parameterName}"
				value="${_csrf.token}" />
		</form>
	</div>
</div>

<c:if test="${msg == false }">
	<p>입력한 비밀번호가 잘 못 되었습니다.</p>
</c:if>

<script type="text/javascript">
	// 비밀번호 미입력시 경고창
	/* function checkValue(){
	    if(!document.deleteform.pwd.value){
	        alert("비밀번호를 입력하지 않았습니다.");
	        return false;
	    }
	} */

	$(document).ready(function() {
		$("#withDrawalBtn").click(function() {
			// 확인 대화상자 
			if (confirm("정말 탈퇴 하시겠습니까?")) {
				document.withDrawalForm.action = "/user/myPage/withDrawal";
				document.withDrawalForm.submit();
			} else {
				return false;
			}
		});
	});
</script>

<%@ include file="../../includes/footer.jsp"%>