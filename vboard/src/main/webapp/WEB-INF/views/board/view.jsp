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
<!-- board/read 경로로 들어왔기 때문에 "../" 상위 경로로 한번 나간 후 css 경로지정 -->
<link href="../resources/css/boardStyle.css" rel="stylesheet" type="text/css" media="screen">
<!-- view.js -->
<script type="text/javascript" src="../resources/js/view.js"></script>

</head>
<body>
	<jsp:include page="../include/boardHeader.jsp" />
	
	<div class="wrap">
		<!-- 그리드 분배 9, 3-->
		<div class="row">
			<!-- 메인 -->
			<div class="col-sm-9 text-left">
				
				<div class="wrap">
					<div class="panel-group">
						<div class="panel panel-default">

							<!-- 작성글 헤더(글 제목, 글 정보) -->
							<div class="panel-heading">
								<h3>${v_content.b_title}
									<c:if test="${v_content.b_reply_count > 0}">
										[${v_content.b_reply_count}]
									</c:if>
								</h3>
								<div id="boardInfo" class="text-right">
									번호 ${v_content.b_num}
									<span class="bar">|</span>
									${v_content.b_writer}
									<span class="bar">|</span>
									<fmt:formatDate pattern="yyyy-MM-dd" value="${v_content.b_reg_date}" />
									<span class="bar">|</span>
									조회 ${v_content.b_hit}
									<span class="bar">|</span>
									추천 ${v_content.b_recommend}
									<span class="bar">|</span>
									댓글 ${replyPageMaker.replyTotalCount}
								</div>
							</div>

							<!-- 작성글 바디(글 내용) -->
							<div class="panel-body">
								
								<p>${v_content.b_content}</p><br><br><br><br>
							
								<div class="well text-center">
									<form id="recommend" action="recommend?page=${page}&perPageNum=${perPageNum}" method="post">
										<input type="hidden" name="b_num" value="${v_content.b_num}">
										<c:if test="${login_session != null}">
											<input id="u_id" type="hidden" name="u_id" value="${login_session.u_id}">
											<input id="u_recommend_active_time" type="hidden" name="u_recommend_active_time" value="${u_recommend_active_time}">
										</c:if>
										<button id="recommendSubmit" type="button" class="btn btn-info">추천 ${v_content.b_recommend}</button>
									</form>
								</div>
								
								<form name="readForm" role="form" method="post">
									<input type="hidden" id="file_no" name="file_no" value="">
								</form>
								<div id="fileup">
								<span>첨부파일 목록</span>
									<div class="form-group">
										<c:forEach var="file" items="${file}">
											<a href="#" onclick="fn_fileDown('${file.file_no}'); return false;">${file.org_file_name}</a>(${file.file_size}kb)<br>
										</c:forEach>
									</div>
								</div>	
								<!-- 글 수정 버튼 -->
								<button type="button" class="btn btn-success pull-right" onclick="location.href='updateForm?b_num=${v_content.b_num}&page=${page}&perPageNum=${perPageNum}'">글 수정</button>
							</div>

							<!-- 작성글 푸터(댓글) -->
							<div class="panel-footer">
								<h5>전체 댓글 ${replyPageMaker.replyTotalCount}개</h5>
								<div id="replyList">
									<!-- js에서 파라미터로 사용되는 히든 값 -->
									<input id="hidden_page" type="hidden" value="${page}"> <input id="hidden_perPageNum" type="hidden" value="${perPageNum}"> <input id="hidden_b_num" type="hidden" value="${v_content.b_num}">

									<table id="reply_table" class="table table-hover text-center">
										<c:forEach items="${replyList}" var="replyList">
											<tr>
												<td>
													<input type="hidden" value="${v.content.b_num}">
												</td>
												<td>${replyList.reply_id}</td>
												<td>
													<c:choose>
														<c:when test="${replyList.reply_id eq login_session.u_id}">
															<input id="reply_content_${replyList.reply_index}" class="form-control" value="${replyList.reply_content}">
														</c:when>
														<c:otherwise>
															${replyList.reply_content}
														</c:otherwise>
													</c:choose>

												</td>
												<td>
													<fmt:formatDate pattern="yyyy-MM-dd hh:mm:ss" value="${replyList.reply_reg_date}" />
												</td>
												<c:if test="${replyList.reply_id eq login_session.u_id}">
													<td>
														<button onclick="replyDeleteFunc(${replyList.reply_index});" type="button" class="btn btn-danger">삭제</button>
														<button onclick="replyUpdateFunc(${replyList.reply_index});" type="button" class="btn btn-success">수정</button>
													</td>
												</c:if>
											</tr>
										</c:forEach>
									</table>
								</div>
								
								<!-- 댓글 페이징 처리 -->
								<div class="row text-center">
									<ul class="pagination">
										<c:if test="${replyPageMaker.replyPrev}">
											<li><a href="index${replyPageMaker.replyMakeQuery(replyPageMaker.replyStartPage-1)}"><span class="glyphicon glyphicon-menu-left"></span></a></li>
										</c:if>

										<c:forEach begin="${replyPageMaker.replyStartPage}" end="${replyPageMaker.replyEndPage}" var="replyPageIndex">
											<c:choose>
												<c:when test="${param.replyPage eq replyPageIndex}">
													<li class="active"><a href="view${replyPageMaker.replyMakeQuery(replyPageIndex)}&b_num=${v_content.b_num}&page=${page}&perPageNum=${perPageNum}">${replyPageIndex}</a></li>
												</c:when>
												<c:otherwise>
													<li><a href="view${replyPageMaker.replyMakeQuery(replyPageIndex)}&b_num=${v_content.b_num}&page=${page}&perPageNum=${perPageNum}">${replyPageIndex}</a></li>
												</c:otherwise>
											</c:choose>
										</c:forEach>

										<c:if test="${replyPageMaker.replyNext}">
											<li><a href="index${replyPageMaker.replyMakeQuery(replyPageMaker.replyEndPage+1)}"><span class="glyphicon glyphicon-menu-right"></span></a></li>
										</c:if>
									</ul>
								</div>
								
								<!-- 세션 로그인 유저가 있는 경우, 댓글 작성 폼 show -->
								<c:if test="${login_session.u_id != null}">
									<div class="row">
										<form id="replyWrite" action="view/replyWrite?b_num=${v_content.b_num}&page=${page}&perPageNum=${perPageNum}" method="post">
											<div id="replyCaution" class="col-sm-4">
												<input name="b_num" type="hidden" value="${v_content.b_num}">
											</div>
											<div id="replyInfo" class="col-sm-12">
												<div class="input-group">
													<span class="input-group-addon">유저</span>
													<input id="reply_id" name="reply_id" type="text" class="form-control" value="${login_session.u_id}" readonly>
												</div>
												<div class="input-group">
													<span class="input-group-addon">내용</span>
													<textarea id="reply_content" name="reply_content" class="form-control" rows="3" placeholder="댓글 내용을 작성하세요"></textarea>
												</div>
											</div>
										</form>
										<br><br><br><br><br><br>
										<div>
									<button id="replyWriteSubmit" type="button" class="btn btn-primary pull-right">댓글 등록</button>
									</div>					
									</div>
									
									
								</c:if>
							</div>
							<!-- panel footer end -->
						</div>
					</div>
				</div>
				<!-- 글목록 버튼 -->
				<button onclick="location.href='../index?page=${page}&perPageNum=${perPageNum}'" type="button" class="btn btn-primary">글목록</button>
			</div>
			<!-- 오른쪽 사이드 메뉴-->
			<div class="col-sm-3 sidenav">
				<div class="well">
					<a id="aw0" target="_blank" href="https://googleads.g.doubleclick.net/aclk?sa=l&amp;ai=CZxa2KNI8XvXjJ8jo2gSknJ3IC_je0Ltbv9Wa65QLjZ7Aq5cZEAEgyeqlJGCbg-qEtCmgAZj_9eUCyAECqQJHZhBQ0h4NPqgDAcgDyQSqBMQBT9ANXfw9cL_b-aBgplO8DSTVp_EF5WjWaVfQGf8hQga2IVw8rOE4MVBBp9BHJPvizcNdgV-_GCZ-44LqAlRVlfSjSyOjxIaStDoZLj0eW7_O8cJ35ElW4sSm6zC_pQFAfDtKCNq8Tk44dIbQZp0Whni80NUexpRfp9n9Hrw9odzxdVWGaixnG25CQjHNMpE3sllInqo8HfAE-1kuC0PPWyu8xZqP1M9eJIn1wID3ZxYlS4UR9veb-G3W-kgQGWg0awdD3sAEuYfGodUCkAYBoAYCgAfQgIqaAYgHAZAHAqgHjs4bqAfVyRuoB5PYG6gHugaoB_LZG6gHpr4bqAfs1RuoB_PRG6gH7NUb2AcB0ggGCAAQAhgasQn2h6-m9diqEIAKAcgLAdgTDQ&amp;ae=1&amp;num=1&amp;cid=CAMSeQClSFh3mQOz6pzQLDGTMDwa0SwZK_ydFlVlE43p_XsovyWr6jrrtM0IqZSPg4tJ0zvpxkb0o4GUQMc2PjKbKx0xBogdxazmoC3PfilpxlCgOc5LUZGE6wWCl5b3Qz45swBEkwn2oiDZN6zb4QE8FIMvHd3h7SCSli8&amp;sig=AOD64_2chvtwiVHqauNELi-CEildS259lA&amp;client=ca-pub-5595302733721535&amp;nb=17&amp;adurl=https://unpacosmetics.com/product/detail.html%3Fproduct_no%3D173%26cate_no%3D147%26display_group%3D1%26gclid%3DCjwKCAiAj-_xBRBjEiwAmRbqYoMOFY5ckKuWgbryaWgzxKNh_ToBOzEpKHdHzS4lUwvmYrf_dVOGyxoC7roQAvD_BwE" data-asoch-targets="ad0">
					<img src="https://tpc.googlesyndication.com/simgad/4299291505332439932?sqp=4sqPyQQ7QjkqNxABHQAAtEIgASgBMAk4A0DwkwlYAWBfcAKAAQGIAQGdAQAAgD-oAQGwAYCt4gS4AV_FAS2ynT4&amp;rs=AOga4qmPyj-lCYqciknnbfDpT3nKFB5pAQ" border="0" width="200" alt="" class="img_ad"></a>
				</div>
			</div>
		</div>
	</div><br><br>
	<div class="wrapper">
	<jsp:include page="../include/footer.jsp" />
	</div>
</body>
</html>