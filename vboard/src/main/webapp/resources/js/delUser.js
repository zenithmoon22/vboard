$(document).ready(function() {
	// 로그인 정보 키 입력시 유효성 검사

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
	
	$("#delUser").click(function() {
		if (confirm("탈퇴하시겠습니까?")) {
			location.href = "delUser";
		} else {
			return;
		}
	});

})

// 일반 로그인 유효성 검사
function validateDel() {

	alert("aa");
}

