<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%
	Date nowTime = new Date();
	SimpleDateFormat sf = new SimpleDateFormat("yyyy년 MM월 dd일 a hh:mm:ss");
%>
<!DOCTYPE html>
<html>
<head>
<title>Car story</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- 반응형 웹에 사용하는 메타태그 -->
<meta name="viewport" content="width=device-width", initial-scale="1" >  
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css?ver=3">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<!--  css -->
<link rel="stylesheet" type="text/css" href="resources/css/Main.css">
<!-- icon -->
<link rel="icon" href="resources/img/icon.png" type="image/x-icon" />

</head>

<body>
	<jsp:include page="include/header.jsp"/>
  
    <div class="container">
        <div class="jumbotron">
            <div class="container">
                <h2>Car story</h2>
                <p>자동차에 관한 정보를 나눌 수 있는 자유게시판입니다.<br>회원가입 후 이용 가능합니다.<p>    
            </div>
        </div>
    </div>
    <div class="container">
        <div id="myCarousel" class="carousel slide" data-ride="carousel">
            <ol class="carousel-indicators">
                <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
                <li data-target="#myCarousel" data-slide-to="0"></li>
                <li data-target="#myCarousel" data-slide-to="0"></li>
            </ol>
            <div class="carousel-inner">
                <div class="item active">
                    <img src="resources/img/1.jpg">
                </div>
                <div class="item">
                    <img src="resources/img/2.jpg">
                </div>
                <div class="item">
                    <img src="resources/img/3.jpg">
                </div>
            </div>
            <a class="left carousel-control" href="#myCarousel" data-slide="prev">
                <span class="glyphicon glyphicon-chevron-left"></span>
            </a>
            <a class="right carousel-control" href="#myCarousel" data-slide="next">
                <span class="glyphicon glyphicon-chevron-right"></span>
            </a>
        </div>
    </div>
    <br><br>
	<!-- footer include -->		
	<div>
		<jsp:include page="include/footer.jsp" />
	</div>

</body>
</html>
