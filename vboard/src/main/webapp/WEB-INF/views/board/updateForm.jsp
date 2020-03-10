<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
<link href="../resources/css/updateForm.css" rel="stylesheet" type="text/css" media="screen">

<!-- include summernote css/js-->
<link href="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.11/summernote-bs4.css" rel="stylesheet">
<script src="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.11/summernote-bs4.js"></script>
<!-- include summernote-ko-KR -->
<script src="../resources/js/summernote-ko-KR.js"></script>

<!-- updateBoard.js -->
<script type="text/javascript" src="../resources/js/updateBoard.js"></script>
</head>

<body>
	<jsp:include page="../include/boardHeader.jsp" />

	<div class="updateform">
		<!-- 그리드 분배 9, 3-->
		<div class="row">
			<!-- 메인 -->
			<div class="col-sm-9 text-left">
				<div class="wrap">
					<div class="panel-group">
						<div class="panel panel-default">
							<!-- 작성글 헤더(글 제목, 글 정보) -->
							<div class="panel-heading">
								<h4>글 수정</h4>
							</div>
							<!-- 작성글 바디(글 내용) -->
							<div class="panel-body">
								
								<!-- 글 작성 폼 -->
								<div class="row">
									<form onSubmit="return checkInput(this)" id="update" action="update" method="post" enctype="multipart/form-data">
										<!-- hidden value -->
										<input type="hidden" id="b_num" name="b_num" value="${u_content.b_num}">
										<input type="hidden" id="b_writer" name="b_writer" value="${u_content.b_writer}">
										<input type="hidden" id="fileNoDel" name="fileNoDel[]" value=""> 
										<input type="hidden" id="fileNameDel" name="fileNameDel[]" value=""> 
										
										<div class="input-group">	
											<span class="input-group-addon">
												<i class="glyphicon glyphicon-user"></i>
											</span>
											<input readonly id="u_id" type="text" class="form-control" name="u_id" value="${login_session.u_id}">
										</div>
										<div class="input-group">
											<span class="input-group-addon">제목</span>
											<input id="b_title" type="text" class="form-control" name="b_title" placeholder="글 제목" value="${u_content.b_title}">
										</div>
										<!-- 썸머노트 -->
										<textarea id="summernote" name="b_content">${u_content.b_content}</textarea>
										
										<h4>첨부 파일</h4>
											<div id = "fileup">
												<c:forEach var="file" items="${file}" varStatus="var">
												<div>
													<input type="hidden" id="file_no" name="file_no_${var.index}" value="${file.file_no}">
													<input type="hidden" id="file_name" name="file_name" value="file_no_${var.index}">
													<a href="#" id="fileName" onclick="return false;">${file.org_file_name}</a>(${file.file_size}kb)
													<button id="fileDel" onclick="fn_del('${file.file_no}','file_no_${var.index}');" type="button">삭제</button><br>
												</div>
												</c:forEach><br>
										<button type="button" class="fileAdd_btn">파일추가</button><br><br>
											<table >
												<tr>
													<td  style="width :300px"></td>
													<td  id="fileIndex">											
													</td>
												</tr>
											</table>
											</div>
											<hr>
											
										<button id="deleteSubmit" type="button" class="btn btn-danger pull-left">글 삭제하기</button>
										<button id="updateSubmit" type="button" class="btn btn-success pull-right">글 수정하기</button>
									</form>
								</div>
							</div>
							<!-- 작성글 푸터(댓글) -->
							<div class="panel-footer"></div>
						</div>
					</div>
				</div>
				<!-- 글목록 버튼 -->
				<button onclick="location.href='../index?page=${page}&perPageNum=${perPageNum}'" type="button" class="btn btn-primary pull-right">글목록</button>
			</div>
			<!-- 오른쪽 사이드 메뉴-->
			<div class="col-sm-3 sidenav">
				<div class="well">
					<a id="aw0" target="_blank" href="https://www.googleadservices.com/pagead/aclk?sa=L&amp;ai=CWNjc39o8XqamLIWyqAGz446QCIX8l8Bbv-bflpwLst3whNEIEAEgyeqlJGCbg-qEtCmgAby42sEDyAECqQJHZhBQ0h4NPqgDAcgDyQSqBLwBT9AJwh23wA_exQ1_EpAqNV8pOFKNAzfuIKrssayBhO7T3vA9w6zZSZtc5Adge0V34GMHjZeG-MDbPXdc2oHHFJ_PGjILy_VStAMRq07HD5MK9r37WhbHJGUMHFR5qXADKwlagrwnjU71VdYh4XgLk80diEm-8nHYXMjz5WGviK6RdQwlkmRpAnRAU_BanxenEZPwNXeCk9F2QzACFEvCBAQp0ngKfqZkB8EaYeAZnTfMbc8FEhXtg1ZUZyzABIXUoNDXApAGAaAGAoAHrMelPogHAZAHAqgHjs4bqAfVyRuoB5PYG6gHugaoB_LZG6gHpr4bqAfs1RuoB_PRG6gH7NUb2AcB0ggGCAAQAhgasQk-tgTFdr9pXIAKAcgLAdgTApgWAQ&amp;ae=1&amp;num=1&amp;cid=CAMSeQClSFh3RC6A9lUrt7419U31BaZxcIk4OXO6p8VqUkOKF0BKkSGB9zyAvBFst_q4MyOOvNqs1ZNAR3GML5Tr3exLH3gd9nj5MlR_AADGCVz4LUF7hh0wg-oHPwS7kFXgi5aJ8mIQpK8L0wdidXx3B7QToJmXzMz7aOY&amp;sig=AOD64_3aEEmA74XjtzIO5wGRChGcIW6F5w&amp;client=ca-pub-5595302733721535&amp;nb=17&amp;adurl=https://www.ktmmobile.com/event/eventDetail.do%3FntcartSeq%3D791%26pageNo%3D1%26sbstCtg%3DE%26searchValue%3D%26utm_source%3Dgdn%26utm_medium%3Ddisplay%26utm_campaign%3Dpcpromo_200201%26utm_content%3Dbn4%26gclid%3DCjwKCAiAj-_xBRBjEiwAmRbqYp8_Q7fjA1d5JwaHUNRZ2ZUcHvI3gXUvLEFQe_eGSmgwSGp-WwhKGhoCTVAQAvD_BwE" data-asoch-targets="ad0">
					<img src="https://tpc.googlesyndication.com/simgad/11602061416364195532?sqp=4sqPyQQrQikqJwhfEAEdAAC0QiABKAEwCTgDQPCTCUgAUAFYAWBfcAJ4AcUBLbKdPg&amp;rs=AOga4ql19y3TotijLvYlKsMBNqy5bBxqWw" border="0" width="220" alt="" class="img_ad"></a>
				</div>
			</div>
		</div>

	</div>

	<jsp:include page="../include/footer.jsp" />

</body>

</html>