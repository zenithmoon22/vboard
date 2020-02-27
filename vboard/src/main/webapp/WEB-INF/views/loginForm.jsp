<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">

<head>
<title>Car story</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- 부트스트랩3 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<!-- 커스텀 CSS -->
<link href="resources/css/loginStyle.css" rel="stylesheet" type="text/css" media="screen">
<!-- 로그인 유효성 검사 JS -->
<script type="text/javascript" src="resources/js/login.js"></script>
</head>

<body>
	<!-- header include -->
	<jsp:include page="include/header.jsp" />
	<br><br><br><br>
	
	<div class="container-fluid text-center">
		<div id="loginWrap" class="row">
			<div class="col-sm-2"></div>
			<div class="col-sm-8">
				<h2>Sign in to Car Story</h2><br><br>
				<!-- 로그인 폼-->
				<!-- ajax로 form 제출시 action 경로 생략 -->
				<form id="login" method="post">
					<!-- 아이디 -->
					<div id="idInputGroup" class="input-group">
						<span class="input-group-addon">
							<i class="glyphicon glyphicon-user"></i>
						</span>
						<input id="u_id" type="text" class="form-control" name="u_id" placeholder="4자리 이상 영문 아이디를 입력하세요">
					</div>
					<!-- 비밀번호 -->
					<div id="pwInputGroup" class="input-group">
						<span class="input-group-addon">
							<i class="glyphicon glyphicon-lock"></i>
						</span>
						<input id="u_pwd" type="password" class="form-control" name="u_pwd" placeholder="8자리 이상 비밀번호를 입력하세요">
					</div>
					<button onclick="validateLogin();return false;" class="btn btn-primary btn-block">로그인</button>
				</form>
				
				<!-- 로그인 옵션 -->
				<div id="loginOption">
					<button onclick="location.href='signUpForm'" class="btn btn-primary btn-block">회원가입</button>
				</div>
			</div>
			<div class="col-sm-2"></div>
		</div>
	</div>
	<div>
	<jsp:include page="include/footer.jsp" />
	</div>
</body>

</html>