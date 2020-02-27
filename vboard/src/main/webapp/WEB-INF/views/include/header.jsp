<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!-- 커스텀 header CSS -->
<link rel="stylesheet" type="text/css" href="resources/css/header.css">
<!-- watch.js -->
<script type="text/javascript" src="resources/js/main.js"></script>

<!-- 최상단 네비 -->
  <nav class ="navbar navbar-default">
        <div class="navbar-header"> <!-- 홈페이지의 로고 -->
            <button type="button" class="navbar-toggle collapsed"
                data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"
                aria-expand="false">
                <span class ="icon-bar"></span> <!-- 줄였을때 옆에 짝대기 -->
                <span class ="icon-bar"></span>
                <span class ="icon-bar"></span>
            </button>
            <img src="resources/img/ch.png" width="120px" height="50px" >
        </div>
		
        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
            <ul class="nav navbar-nav">
            	<li>&emsp;&emsp;</li>
                <li><a href="main" >메인</a></li>
                <li>&emsp;&emsp;</li>
                <li><a href="index">게시판</a></li>
                <li>
                	<body onload="printClock()">
					<div style="width:500px; height:50px; padding:8px; margin-left:20px; color:#666;font-size:25px; text-align:center;" id="clock">
					</div>
                </li>
            </ul>
            <ul class="nav navbar-nav navbar-right">
            	<c:choose>
            	<c:when test="${login_session == null}">
                <li class="dropdown">
                <a href="#" class = "dropdown-toggle"
                    data-toggle="dropdown" role ="button" aria-haspopup="true"
                    aria-expanded="false">접속하기<span class="caret"></span></a>
                    <ul class="dropdown-menu">
                        <li><a href="loginForm">로그인</a></li>
                        <li><a href="signUpForm">회원가입</a></li>                     
                    </ul>
                </li>
                </c:when>
                <c:otherwise>
                <li id="userImageLi"><img src="resources/img/profile.jpg" class="img-circle" width="60px" height="40px" >
                </li>
                <li><a>${login_session.u_id} 님</a></li>
                <li class="dropdown">
                <a href="#" class = "dropdown-toggle"
                    data-toggle="dropdown" role ="button" aria-haspopup="true"
                    aria-expanded="false">회원관리<span class="caret"></span></a>
                    <ul class="dropdown-menu">
                        <li><a href="logOut">로그아웃</a></li>
                        <li><a href="delUserForm">회원탈퇴</a></li>   
                    </ul>
                </li>
                </c:otherwise>
                </c:choose>
                
            </ul>
        </div>
    </nav>
