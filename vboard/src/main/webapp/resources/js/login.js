$(document).ready(function() {
	// 로그인 정보 키 입력시 유효성 검사
	// 아이디
	$("#u_id").focus(function() {
		if ($("#id").val() == 0) {
			$("#idInputGroup").addClass("has-error");
		}
		$("#u_id").keyup(function() {
			if ($("#u_id").val().length >= 4) {
				$("#idInputGroup").removeClass("has-error");
				$("#idInputGroup").addClass("has-success");
				$("#idDupCheck").removeClass("disabled");
			} else {
				$("#idInputGroup").removeClass("has-success");
				$("#idInputGroup").addClass("has-error");
				$("#idDupCheck").addClass("disabled");
			}
		});
	});

	// 비밀번호
	$("#u_pwd").focus(function() {
		if ($("#u_pwd").val() == 0) {
			$("#pwInputGroup").addClass("has-error");
		}
		$("#u_pwd").keyup(function() {
			if ($("#u_pwd").val().length >= 8) {
				$("#pwInputGroup").removeClass("has-error");
				$("#pwInputGroup").addClass("has-success");
			} else {
				$("#pwInputGroup").removeClass("has-success");
				$("#pwInputGroup").addClass("has-error");
			}
		});
	});

})

// 일반 로그인 유효성 검사
function validateLogin() {

	if ($("#u_id").val() == "") {
		alert("아이디를 입력하세요");
		$("#u_id").focus();
		return;
	}
	if ($("#u_id").val().length < 4) {
		alert("아이디가 4자리 이상이어야 합니다");
		$("#u_id").focus();
		return;
	}

	if ($("#u_pwd").val() == "") {
		alert("비밀번호를 입력하세요");
		$("#u_pwd").focus();
		return;
	}
	if ($("#u_pwd").val().length < 8) {
		alert("비밀번호가 8자리 이상이어야 합니다");
		$("#u_pwd").val("");
		$("#u_pwd").focus();
		return;
	}

	// 모든 조건 만족시 AJAX 통신으로 form submit
	// AJAX: 비동기식 자바스크립트 XML(JSON)
	// form.serialize(): form 데이터를 string 형식으로 나열
	
	var formData = $("#login").serialize();
	$.ajax({
		url : "loginForm/login",
		type : "POST",
		data : formData,
		success : function(data) {
			if (data != "X") {
				if (data == "이메일 비활성화") {
					alert("이메일 인증이 필요합니다");
					location.href = "loginForm";
				} else {
					alert(data + " 님 안녕하세요");
					location.href = "index";
				}
			} else {
				alert("가입하지 않은 아이디이거나, 잘못된 비밀번호입니다.");
				location.href = "loginForm";
			}
		}
	});
}
