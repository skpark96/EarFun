<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<link rel="stylesheet" href="/resources/css/user/login.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/normalize/5.0.0/normalize.min.css">

<%@ include file="../includes/header.jsp"%>
<%@ include file="../includes/nav.jsp"%>

<!-- sidebar-wrapper  -->
<main class="page-content">
<div class="container-fluid">

	<div class="login-page">
		<div class="form">
			<h1>로그인</h1>
			<h2>${error}</h2>
			<h2>${logout}</h2>

			<form method="post" action="/user/login" class="login-form"
				id="loginForm" name="loginForm">
				<input type="text" id="u_id" name="u_id" placeholder="아이디"
					required="required" /> <input type="password" id="u_pw"
					name="u_pw" placeholder="비밀번호" required="required"
					onKeyDown="if(event.keyCode==13)loginProcess()" />

				<button type="submit" id="loginBtn" onclick="loginProcess()">로그인</button>

				<!-- <input class="tgl tgl-flat" id="cb4" type="checkbox" /> -->

				<input type="checkbox" id="saveId" name="saveId"
					class="tgl tgl-flat"> <label class="tgl-btn" for="saveId"></label>&nbsp;&nbsp;아이디
				기억하기</label>

				<p class="message" style="text-align: center;">
					아직 회원이 아니십니까? <a href="/user/signUp">회원가입</a>
				</p>

				<c:if test="${message == false}">
					<p style="color: #f00;">아이디 또는 비밀번호를 다시 확인하세요.</p>
				</c:if>

				<hr>
				<div class="find">
					<a href="/user/findId_Form" class="a_find">아이디 찾기</a>&nbsp;&nbsp; <a
						href="/user/findPw" class="a_find">비밀번호 찾기</a>
				</div>

				<input type="hidden" name="${_csrf.parameterName}"
					value="${_csrf.token}" />
			</form>
		</div>
	</div>
</div>
</main>

<!-- 아이디 기억하기 -->
<script>
   $(function () {
       var u_id = getCookie("CookieId");
       $("#u_id").val(u_id);
    
       if ($("#u_id").val() != "")
             $("#saveId").attr("checked", true);
   });
 
   function loginProcess () {
       var id = document.getElementById('u_id');
       var pw = document.getElementById('u_pw');
       var loginForm = document.getElementById('loginForm');
    
       /* if (id.value==""){ 
          // 아이디가 일치하지 않을 경우의 경고 메세지창
           alert("Enter ID");
              id.focus();
        
           return false;
        
       } else if (pw.value==""){
          // 비밀번호가 일치하지 않을 경우의 경고 메세지 창
           alert("Enter password");
           pw.focus();
        
           return false;
        
       } else  */ if ($("#saveId").is(":checked")) {
           var u_id = $("#u_id").val();
              setCookie("CookieId", u_id, 7); // 쿠키 7일동안 유지
           loginForm.submit();
        
       } else { // 쿠키 삭제
           deleteCookie("CookieId");
           loginForm.submit();
       }
   }

   // 쿠키 준비
   function setCookie (cookieName, value, exdays) {
       var exdate = new Date();
       exdate.setDate(exdate.getDate() + exdays);
       var cookieValue = escape(value) + ((exdays==null) ? "" : "; expires=" + exdate.toGMTString());
       document.cookie = cookieName + "=" + cookieValue;
   }
   
   // 쿠키 가져오기
   function getCookie (cookieName) {
       cookieName = cookieName + '=';
       var cookieData = document.cookie;
       var start = cookieData.indexOf(cookieName);
       var cookieValue = '';
    
       if (start != -1) {
           start += cookieName.length;
           var end = cookieData.indexOf(';', start);
        
           if (end == -1)end = cookieData.length;
           cookieValue = cookieData.substring(start, end);
       }
       return unescape(cookieValue);
   }

   // 쿠키 삭제
   function deleteCookie (cookieName){
       var expireDate = new Date();
       expireDate.setDate(expireDate.getDate() - 1);
       document.cookie = cookieName + "= " + "; expires=" + expireDate.toGMTString();
   }
</script>

<%@ include file="../includes/footer.jsp"%>