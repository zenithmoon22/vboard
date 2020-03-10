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
<link href="../resources/css/writeForm.css" rel="stylesheet" type="text/css" media="screen">

<!-- include summernote css/js-->
<link href="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.11/summernote-bs4.css" rel="stylesheet">
<script src="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.11/summernote-bs4.js"></script>
<!-- include summernote-ko-KR -->
<script src="../resources/js/summernote-ko-KR.js"></script>
<!-- boardCRUD.js -->
<script type="text/javascript" src="../resources/js/writeForm.js"></script>

</head>

<body>
	<jsp:include page="../include/boardHeader.jsp" />

	<div class="container-fluid text-center">
		<!-- 그리드 분배 9, 3-->
		<div class="writeform">
			<!-- 메인 -->
			<div >
				<h2>자유게시판</h2>
				<div class="row">
				<div class="col-sm-9 text-left">
					<div class="panel-group">
						<div class="panel panel-default">
							<!-- 작성글 헤더(글 제목, 글 정보) -->
							<div class="panel-heading">
								<h4>글 쓰기</h4>
							</div>
							<!-- 작성글 바디(글 내용) -->
							
							<div class="panel-body">
						
								<!-- 글 작성 폼 -->							
								<div class="row">
									<form onSubmit="return checkInput(this)" id="write" action="write" method="post" enctype="multipart/form-data">
										<div class="input-group">
											<span class="input-group-addon">
												<i class="glyphicon glyphicon-user"></i>
											</span>
											<input readonly id="b_writer" type="text" class="form-control" name="b_writer" value="${login_session.u_id}">
										</div>
										<div class="input-group">
											<span class="input-group-addon">제목</span>
											<input type="text" class="form-control" name="b_title" id="b_title" placeholder="글 제목" value="">
										</div>
										<!-- 썸머노트 -->
										<textarea id="summernote" name="b_content"></textarea><br>
										
											<table class=fileAdd>
												<tr>
													<td><button class="fileAdd_btn" type="button">파일추가</button></td>
												</tr><br>
												<tr>
													<td id="fileIndex"></td>
												</tr>
											</table>

										<hr>
										<button onclick="location.href='../index'" type="button" class="btn btn-primary ">글목록</button>
										<input type="submit" id="writeSubmit" class="btn btn-success pull-right" value="작성완료">&emsp;
									</form>
								</div>
							</div>
						</div>
					</div>
				
				<!-- 글목록 버튼 -->
				
			</div>
			
				<div class="col-sm-3 sidenav">
					<div class="well">
						<a id="aw0" target="_blank" href="https://www.googleadservices.com/pagead/aclk?sa=L&amp;ai=COqlSnN08Xoa5J9j52gTdmL3ACYfQlbBblunRiIML-dPtpYwKEAEgyeqlJGCbg-qEtCmgAczz6MUDyAECqQJHZhBQ0h4NPqgDAcgDyQSqBMIBT9DJk0-rmzyTtQihErRGce7-8suYayq-Rj-M6y5MF_GSvOfNvl-hSW2VZsTzAU1Pjc6QRiXwbBvb0rdvRieKEUxw4VzB-bEuUOvN76KYCOXVRPiV-Sha7TaPjErYaj6VAhjCMOHuE31j6biEH_WzGOj2A9XpkSwORvSPxGYue-m919cOrCZ5AvDaO58V-4y3Oo9wrqOZiwybJwiIZsO0TDNrvBcp1U6S0GtsjPnFNC4FJ-4UiJD1zJhIlhwSyEbolSbABKif98joAZAGAaAGAoAHnIyXOogHAZAHAqgHjs4bqAfVyRuoB5PYG6gHugaoB_LZG6gHpr4bqAfs1RuoB_PRG6gH7NUb2AcB0ggGCAAQAhgasQlcCjng0ozuVYAKAcgLAdgTAg&amp;ae=1&amp;num=1&amp;cid=CAMSeQClSFh3-6sMnKYG4WJWMuB1_YdtdyiqjV1o7Dg7i-r0Vanr73mnID1okZAl4B0waiciU-tZSSau_Rza_hnltH4Si3g01SJIb6bObvh4JQrgDWXuA0nBbA7zQKAUqqAcTx-SQ740JKdIYXmkxWcqQ7HBeOeuI3P0DYM&amp;sig=AOD64_1UA6z7UgKdgT_k4ssp3dQONyqJ5g&amp;client=ca-pub-5595302733721535&amp;nb=17&amp;adurl=http://www.clipartkorea.co.kr/event/event.php%3Fseq%3D51%26gclid%3DCjwKCAiAj-_xBRBjEiwAmRbqYuWfiTUpfpycJMG4nNahLKG3J8V2djeCYPMKwjAzVTFVVV8tkt3QTRoCdl0QAvD_BwE" data-asoch-targets="ad0">
						<img src="https://tpc.googlesyndication.com/simgad/6092402782136411303?sqp=4sqPyQQ7QjkqNxABHQAAtEIgASgBMAk4A0DwkwlYAWBfcAKAAQGIAQGdAQAAgD-oAQGwAYCt4gS4AV_FAS2ynT4&amp;rs=AOga4qlifDx5okqdDxqnGjRBDm6KKxVtEA" border="0" width="200" alt="" class="img_ad"></a>
					</div>
				</div>
			
			</div>
			</div>
		</div>
	</div>

	<div>
	<jsp:include page="../include/footer.jsp" />
	</div>
</body>

</html>