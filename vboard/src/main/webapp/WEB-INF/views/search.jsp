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
<link rel="stylesheet" type="text/css" href="resources/css/search.css">
<!-- favicon -->
<link rel="icon" href="resources/img/j_favicon.png" type="image/x-icon" />
<!-- indexSearch.js -->
<script type="text/javascript" src="resources/js/indexSearch.js"></script>
</head>

<body>
	<!-- header include -->
	<jsp:include page="include/header.jsp" />

	<!-- main content -->
	<div class="container-fluid text-center">
		<!-- 그리드 분배 9, 3-->
		<div class="wrap">
			
			<!-- 메인 -->
			<div class="col-sm-9 text-left">
			<h3 style="text-align: center">게시물 검색 결과 ${pageMaker.totalCount}개</h3>
				<br><br>
				<!-- 작성 글 목록 -->
				<div class="row">
					<table id="bbs" class="table table-hover text-center">
						<thead>
							<tr>
								<th id="bbsNo">번호</th>
								<th id="bbsTitle">제목</th>
								<th id="bbsNick">글쓴이</th>
								<th id="bbsDate">날짜</th>
								<th id="bbsHit">조회</th>
								<th id="bbsReq">추천</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${list}" var="list">
								<tr>
									<td>${list.b_num}</td>
									<td>
										<a href="board/view${pageMaker.makeQuery(pageMaker.pc.page)}&b_num=${list.b_num}">${list.b_title}</a>
										<c:if test="${list.b_reply_count > 0}">
											[${list.b_reply_count}]
										</c:if>
									</td>
									<td>${list.b_writer}</td>
									<td>
										<fmt:formatDate pattern="yyyy-MM-dd" value="${list.b_reg_date}" />
									</td>
									<td>${list.b_hit}</td>
									<td>${list.b_recommend}</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>

				</div>
				<!-- 글쓰기 버튼 -->
				<div class="row">
					<ul class="nav navbar-nav navbar-right">
						<li>
							<button onclick="location.href='board/writeForm'" type="button" class="btn btn-primary">글쓰기</button>
						</li>
					</ul>
				</div>

				<!-- 페이징 처리 -->
				<div class="row text-center">
					<ul class="pagination">
						<c:if test="${pageMaker.prev}">
							<li>
								<a href="search${pageMaker.makeQuery(pageMaker.startPage-1)}&search_condition=${search_condition}&search_content=${search_content}"><span class="glyphicon glyphicon-menu-left"></span></a>
							</li>
						</c:if>
						<c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="pageIndex">
							<c:choose>
								<c:when test="${param.page eq pageIndex}">
									<li class="active">
										<a href="search${pageMaker.makeQuery(pageIndex)}&search_condition=${search_condition}&search_content=${search_content}">${pageIndex}</a>
									</li>
								</c:when>
								<c:otherwise>
									<li>
										<a href="search${pageMaker.makeQuery(pageIndex)}&search_condition=${search_condition}&search_content=${search_content}">${pageIndex}</a>
									</li>
								</c:otherwise>
							</c:choose>

						</c:forEach>

						<c:if test="${pageMaker.next}">
							<li>
								<a href="search${pageMaker.makeQuery(pageMaker.endPage+1)}&search_condition=${search_condition}&search_content=${search_content}"><span class="glyphicon glyphicon-menu-right"></span></a>
							</li>
						</c:if>
					</ul>
				</div>
			</div>

			<!-- 오른쪽 사이드 메뉴-->
			<div class="col-sm-3 sidenav">
				<div class="side"></div>
				<div class="well">
					<a id="aw0" target="_blank" href="https://www.googleadservices.com/pagead/aclk?sa=L&amp;ai=CM19XpNJMXunPDZTKqAH29KTQAoz_o95bv8yCzpILst3whNEIEAEgwIGpK2Cbg-qEtCmgAby42sEDyAECqQKiyM3m9d4MPqgDAcgDyQSqBLUBT9BIAKm13FxCOm5wqYBvWDtK1s4yBB1k71IrPqIIUjSepoYSOGOTahIvY5xBS_i0hQP3Nd7GJSZyfEV-x49AI_5wOe8sLw26ssL8X_jrXxed8xzVhZtiCt4C2XDDA0T0ZiUcQVC0ZSyMgAaWZIiJJJ4ZATFYvTUf8cBOi1bVJVMh8hrXNqcgCGs7nGSF6Oi4KVk11uu3i60UCqPn6ks-l3xCUKz66jKM0f9dO9ps0kMbWTNwA8AEjO_rhd8CkAYBoAYCgAesx6U-iAcBkAcCqAeOzhuoB9XJG6gHk9gbqAe6BqgH8tkbqAemvhuoB-zVG6gH89EbqAfs1RuoB8LaG9gHAdIIBggAEAIYGrEJ_CXF0tzYfnCACgHICwHYEwKYFgE&amp;num=1&amp;cid=CAMSeQClSFh34GCotIE2Y2tIsPprqv-69ahmp_S3sAM2F-m_Wvpy7xIoMxO2pwyrPliAAIFvR7XllWdOsZy-kTRtya1t6S8PBB7ZXmUI0Qwy3nUk5x0h1OpwCAsYqjGToSSPfu-3wjobAc9AnctqO1W2JqMEgyjVMkoJ2jw&amp;sig=AOD64_1jNe7Wr0ndcrS4_GW3udCE6UXkUQ&amp;client=ca-pub-9149544643103323&amp;nb=17&amp;adurl=https://www.ktmmobile.com/event/eventDetail.do%3FntcartSeq%3D786%26pageNo%3D1%26sbstCtg%3DE%26searchValue%3D%26utm_source%3Dgdn%26utm_medium%3Ddisplay%26utm_campaign%3Dpcpromo_200215%26utm_content%3Dbn2" data-asoch-targets="ad0">
					<img src="https://tpc.googlesyndication.com/daca_images/simgad/3658343294872942928" border="0" width="200" alt="" class="img_ad"></a>
				</div>
			</div>
		</div>
	</div>

	<!-- footer include -->
	<jsp:include page="include/footer.jsp" />

</body>

</html>