<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script src="/resources/js/addressapi.js"></script>

<link rel="stylesheet" href="/resources/css/user/signUp.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<%@ include file="../../includes/header.jsp"%>
<%@ include file="../../includes/nav.jsp"%>

<div class="signUp-page">
	<div class="form">
		<h1>회원 정보 수정</h1>

		<form role="form" method="post" id="signUpForm"
			class="signUp-form">

			<input type="hidden" name="${_csrf.parameterName}"
				value="${_csrf.token}" />
				<label for="u_id">아이디</label> <input
				type="text" id="u_id" name="u_id" value="${user.u_id }" placeholder="사용할 아이디 입력"
				required="required" readonly="readonly" style="font-weight: bold;">
			<div id="checkId"></div>

			<label for="u_pw">비밀번호</label> <input type="password" id="u_pw"
				name="u_pw" placeholder="비밀번호를 입력하세요."
				required="required">
			<div id="checkPw"></div>

			<label for="u_pw">비밀번호 확인</label><input type="password" id="u_pw2"
				name="u_pw2" required="required">
				
			<div id="checkPw2"></div>

			<label for="u_name" id="label1">닉네임</label>
			<input type="text" name="u_name" value="${user.u_name }" required="required" readonly="readonly" style="font-weight: bold;"> <span id="checkName"></span>
			<label for="u_phone">연락처</label>
				<input type="text" onKeyup="inputPhoneNumber(this);" maxlength="13" name="u_phone" id="u_phone" value="${user.u_phone }"
				required="required">
				
				<label for="u_email">이메일</label>
				<input type="email" id="u_email" name="u_email" value="${user.u_email }" readonly="readonly" style="font-weight: bold;">
			<div id="checkEmail"></div>

			<label for="u_addr">주소</label><br> <input type="text"
				placeholder="우편 번호" name="u_addr1" id="u_addr1" value="${user.u_addr1 }" readonly="readonly">
			<button type="button" id="addrBtn" onclick="execPostCode();">주소
				찾기</button>

			<input placeholder="도로명 주소" name="u_addr2" id="u_addr2" value="${user.u_addr2 }" type="text"
				readonly="readonly" /> <input placeholder="상세 주소" name="u_addr3"
				id="u_addr3" value="${user.u_addr3 }" type="text" />


			<button type="submit" id="signUpBtn">수정</button>
			<button type="button" onclick="history.go(-1);">취소</button>
			<button type="button" id="addrBtn" onclick="location.href='http://localhost:8090/user/myPage/withDrawal'">회원탈퇴</button>
		</form>
	</div>

</div>
<script src="http://code.jquery.com/jquery-latest.js"></script>

<script>
	$(document).ready(function() {

		$('#signUpBtn').click(function() {

			alert("내 정보 변경이 완료 되었습니다.");

		});

	});
</script>
<script>
	var csrfHeaderName = "${_csrf.headerName}";
	var csrfTokenValue = "${_csrf.token}";

	/* 정규식 */
	var empJ = /\s/g; // 공백
	var idJ = /^[a-z0-9]{4,12}$/;
	// a~z. 0~9로 시작하는 4~12자리 아이디
	var pwJ = /^(?=.*\\d)(?=.*[~`!@#$%\\^&*()-])(?=.*[a-z])(?=.*[A-Z]).{8,16}$/;
	// a~z, A~Z, 0~9로 시작하는 8~16자리 비밀번호
	var nameJ = /^(?=.*[가-힣])(?=.*[a-z])(?=.*[A-Z]).{2,6}$/;
	// 가~힣, a~z, A~Z로 이뤄진 문자만으로 2~6자리 
	var emailJ = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;


	
	/* 비밀번호 유효성 검사 */
	$("#u_pw").keyup(function() {

		if ($("#u_pw").val() == "") {
			var u_pw = $('#u_pw').val();

			$('#checkPw').text('비밀번호를 입력해주세요 :)');
			$('#checkPw').css('color', 'red');
			$("#signUpBtn").attr("disabled", true);
		} else {
			$("#checkPw").text("");
			$("#signUpBtn").attr("disabled", false);
		}
	});

	/* 비밀번호 확인 유효성 검사 */
	$("#u_pw2").keyup(function() {
		if ($("#u_pw").val() != $(this).val()) {

			$("#checkPw2").text("비밀번호가 일치하지 않습니다.");
			$("#checkPw2").css('color', 'red');
		} else {
			$("#checkPw2").text('');
		}
	});


</script>
<script>
	function execPostCode() {
		new daum.Postcode({
			oncomplete : function(data) {
				// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

				// 도로명 주소의 노출 규칙에 따라 주소를 조합한다.
				// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
				var fullRoadAddr = data.roadAddress; // 도로명 주소 변수
				var extraRoadAddr = ''; // 도로명 조합형 주소 변수

				// 법정동명이 있을 경우 추가한다. (법정리는 제외)
				// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
				if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
					extraRoadAddr += data.bname;
				}
				// 건물명이 있고, 공동주택일 경우 추가한다.
				if (data.buildingName !== '' && data.apartment === 'Y') {
					extraRoadAddr += (extraRoadAddr !== '' ? ', '
							+ data.buildingName : data.buildingName);
				}
				// 도로명, 지번 조합형 주소가 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
				if (extraRoadAddr !== '') {
					extraRoadAddr = ' (' + extraRoadAddr + ')';
				}
				// 도로명, 지번 주소의 유무에 따라 해당 조합형 주소를 추가한다.
				if (fullRoadAddr !== '') {
					fullRoadAddr += extraRoadAddr;
				}

				// 우편번호와 주소 정보를 해당 필드에 넣는다.
				console.log(data.zonecode);
				console.log(fullRoadAddr);

				$("[name=u_addr1]").val(data.zonecode);
				$("[name=u_addr2]").val(fullRoadAddr);

			}
		}).open();
	}
</script>

<script>
	function inputPhoneNumber(obj) {

		var number = obj.value.replace(/[^0-9]/g, "");
		var phone = "";

		if (number.length < 4) {
			return number;
		} else if (number.length < 7) {
			phone += number.substr(0, 3);
			phone += "-";
			phone += number.substr(3);
		} else if (number.length < 11) {
			phone += number.substr(0, 3);
			phone += "-";
			phone += number.substr(3, 3);
			phone += "-";
			phone += number.substr(6);
		} else {
			phone += number.substr(0, 3);
			phone += "-";
			phone += number.substr(3, 4);
			phone += "-";
			phone += number.substr(7);
		}
		obj.value = phone;
	}
</script>
<%@ include file="../../includes/footer.jsp"%>