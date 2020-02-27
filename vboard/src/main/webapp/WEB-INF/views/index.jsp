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
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css?ver=3">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<!--  css -->
<link rel="stylesheet" type="text/css" href="resources/css/indexStyle.css">
<!-- icon -->
<link rel="icon" href="resources/img/icon.png" type="image/x-icon" />
<!-- indexSearch.js -->
<script type="text/javascript" src="resources/js/indexSearch.js"></script>
</head>

</head>

<body>
	<!-- header include -->
	<jsp:include page="include/header.jsp" />

	<!-- main content -->
	<div class="wrap">
		<!-- 그리드 분배 9, 3-->
		<div class="row">

			<!-- 메인 -->
			
				<h2>자유게시판</h2>
				<h4>전체 게시글 ${pageMaker.totalCount}개</h4>
				<!-- 작성 글 목록 -->
				<div class="row" id="rows">
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
											&nbsp;[${list.b_reply_count}]
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

				

				<!-- 페이징 처리 -->
				<div class="wraps">
					<ul class="pagination">
						<c:if test="${pageMaker.prev}">
							<li>
								<a href="index${pageMaker.makeQuery(pageMaker.startPage-1)}"><span class="glyphicon glyphicon-menu-left"></span></a>
							</li>
						</c:if>
						<c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="pageIndex">
							<c:choose>
								<c:when test="${param.page eq pageIndex}">
									<li class="active">
										<a href="index${pageMaker.makeQuery(pageIndex)}">${pageIndex}</a>
									</li>
								</c:when>
								<c:otherwise>
									<li>
										<a href="index${pageMaker.makeQuery(pageIndex)}">${pageIndex}</a>
									</li>
								</c:otherwise>
							</c:choose>

						</c:forEach>

						<c:if test="${pageMaker.next}">
							<li>
								<a href="index${pageMaker.makeQuery(pageMaker.endPage+1)}"><span class="glyphicon glyphicon-menu-right"></span></a>
							</li>
						</c:if>
					</ul>
				</div>	
				
					<!-- 검색 -->
					<nav id="searchNav" >
						<ul class="nav navbar-nav navbar">
							<li>
								<form onSubmit="return checkSearch(this)" id="search" action="search" method="post" class="navbar-form">
									<div class="form-group">
										<select class="form-control" id="search_condition" name="search_condition">
											<option value="titleAndContent">제목+내용</option>
											<option value="title">제목</option>
											<option value="content">내용</option>
											<option value="writer">글쓴이</option>
										</select>
									</div>
									<div class="form-group">
										<input id="search_content" name="search_content" type="text" class="form-control" placeholder="검색어를 입력하세요">
									</div>
									<button id="searchSubmit" type="button" class="btn btn-info">검색</button>
								</form>
							</li>
						</ul>
					</nav> 
					
					<!-- 글쓰기 버튼 -->
					<div class="row-center">
						<ul class="nav navbar-nav navbar-right">
							<li>
								<button onclick="location.href='board/writeForm'" type="button" class="btn btn-primary pull-right">글쓰기</button>
							</li>
						</ul>
					</div>
							
			</div>
			</div>
		</div>	
	<br>
	
	<!-- 사이드 메뉴-->
		<div>
			<div class="well">
				<a id="aw0" target="_blank" href="https://www.googleadservices.com/pagead/aclk?sa=L&amp;ai=C7yC-WiYxXoLBBtXzrQTYvpeIDYLPzrpbyaygyLQKsJAfEAEgmtvYRGCbg-qEtCmgAb3Kxs0DyAECqAMByAPJBKoEzwFP0KOGujtsgDyKeK1MJ9HTdEr-JN-4_OIX16-SemzGXJNGB6oUMpvUmQDzQQ9Y_fQL_T7BYp1K-_NzEYXGUiKIjko1cU9NYm7KIIVuQQskCfQ47Obe65PdvBI3drrdunFPn941WfLsi0soCP8ta2hcZCg0lVrcAR9mE8at-RnIOjQPP9hrJCsQ2OdXUByJW1mwympWjEpJBlPf_XqLvE6W0Wd6q7prAUafnXSHk7G_5Up5mGZxLoEc9aU3-DabeGqFiZLb5IKGS32b3XUZK43ABLiLpfmlApAGAaAGAoAHq7W5MogHAZAHAqgHjs4bqAfVyRuoB5PYG6gHugaoB_LZG6gHpr4bqAfs1RuoB_PRG6gH7NUb2AcB0ggGCAAQAhgasQlEmmnklL5_QYAKAcgLAdgTAg&amp;ae=1&amp;num=1&amp;cid=CAMSeQClSFh3-iWWd-3Lyrko9A_oMNTtElli_Gqkb8DSD6xg_XfmqMGkmFdWkW4mwBCrxGqpVhpcg_hDA2dgVMQPGmpLVwo-t7S6sqgvKA0oQbUHxmyBsOQM0o7w3cHQvaorVJiUqK8Oe-qQ9r9TsjXMoALWfuc2kmia2Bc&amp;sig=AOD64_0wUrSMng0JQnfn2UhwrhxEPRHWng&amp;client=ca-pub-1437272446407740&amp;nb=17&amp;adurl=https://www.intercom.com/drlp/customizable-bots%3Futm_source%3Dgoogle%26utm_medium%3Ddisplay%26utm_campaign%3D6537920846%26utm_ad_collection%3D78905951672%26_bt%3D384440716459%26_bg%3D78905951672%26utm_ad%3D384440716459%26offer%3Ddrcustombots%26utm_campaign_name%3Dgo_evg_acq_trial_pros_topics_bld_row_en%26utm_ad_collection_name%3Dmkt-a%26utm_ad_name%3Ddrcustombots_supercharge_static_300x250_20q3%26gclid%3DCjwKCAiA1L_xBRA2EiwAgcLKAydWa8tdvgoElaTk8eL8-6IBjt3eOQnWaVfq-OsjMJs01ZmV_-CJqBoC6l4QAvD_BwE" data-asoch-targets="ad0">
				<img src="https://tpc.googlesyndication.com/simgad/14871870301307135609?sqp=4sqPyQQrQikqJwhfEAEdAAC0QiABKAEwCTgDQPCTCUgAUAFYAWBfcAJ4AcUBLbKdPg&amp;rs=AOga4qnHCD1vuAcUkdoicw3eqfvQs84tsA" border="0" width="230"  height="170" alt="" class="img_ad"></a>
				&emsp;&emsp;
				<a id="aw0" target="_blank" href="https://programmers.co.kr/competitions/134/2020-nlp?utm_source=google&amp;utm_medium=gdn02_competition134&amp;utm_campaign=competition134&amp;gclid=CjwKCAiA1L_xBRA2EiwAgcLKA18_VmIC1hK0rlBmBEOV1m_bGw9ajdV9DntXjP01wwW9wGgGeT0qrRoCEhwQAvD_BwE" data-asoch-targets="ad0">
				<img src="https://tpc.googlesyndication.com/simgad/15244376720385197450?sqp=4sqPyQQrQikqJwhfEAEdAAC0QiABKAEwCTgDQPCTCUgAUAFYAWBfcAJ4AcUBLbKdPg&amp;rs=AOga4qkZs-FCl_FOpiyolbMpj-MMIE9ObA" border="0" width="230"  height="170" alt="" class="img_ad"></a>
				&emsp;&emsp;
				<a target="_blank" id="img_anch_COHo183YuecCFUghKgodD0gHew" href="https://adclick.g.doubleclick.net/pcs/click?xai=AKAOjssN_8-W-UNwLfma8AWcuugpHhPOhAC6Xk8ABUEefW0yZ87x2Hiu19d3MgSQKfRrTGwlB3-MGWmg3Sx4BPbPELvquR9rmYzzZRoWndelWOKQFQab5z2FgMAkQc6_V5GnsA3IH8fV6tRi4Tp3BcbDZ132ZECf5Xg_H-GiCBzr-s2_-MZzerQu1d9XJnTlchdJ2oFTC_WIc0iBcrlJ5Lm6AVePRFAxtlrn4pcNER4_pepiYAQa4TIO3K9v4FI49_19HCuZoFeANDsWt6e-tCy5vEMiz8RoZ_iE6T-H8dMvDLPmIuOiBqZkbEziuHfCfFwsWFEc1iR40Kkv2yrgwjmghbwX0tRNMEqTgVAVEiou65TZX35JRE8jrQBk7c_PaPN3O2m19ja71Yrr57_C4T4e1lw6nqq39T6OZVCdxeHtoAfrF8-qKPT0bd1ezRwvEgmOGG6sggVaxVItftJ0LeYbs8rR-xkzVjySrr-isqDAwqxl-66eMbModVGyBCnXDAmP0mvy2VOoP-6FbqiIB4xr-xnlirbrojzM_CQR9RjRCbHiTYqWqrAj1O3j-GfPYlZlLpYEtEpS-WlELmZYMwx8AVa40aPazCL6GCykB5E-805p-1-GZgc3xtl1Qgrqf498PfMKyZAncgwFWNQEMqGRUPDkDeIy6t0SR2fQ9Fc5XivEtbdJBOw5rbRhCNbR5pEbO9oEihlfadJVdBlNfkiyTB8tu65entb03uuGw9WWSwr7jbCss8OGXJnYCm8oaQ8pecXD4sPWLx-_GNc9zm7XI790dce8drvXDlqOACI5CSnh9OTwl8XigxaUP7axq5dzww0bZ7Ssa_YYWe8NODtmF-HVdojdG0yD8NWmkPn6hNs0LVmX86O4pddo1tYRGOqpWQ&amp;sai=AMfl-YSsZLYqrY6BBZCgVIui0YbxJe9EEobX41E6OHCeLhNbshROOcdcK3ooaTNeUDc1-g-JY5KZVnIZKgDh0HFyuIyz2uTfrro2D-OK-mLA9SpZYwwUgh5CjFoz2hM2MeWQ_005BscERf-cJ-oKctZBVSEN5ckeXfg4VPRH9RgqJrJSXvIgvySEBM3-aNjwEXEk0szYiqCdqYn7BmGEaGGz2iCWyZDPnM9cRJxQxcDEDSmKtKtwfmWgTQqsEFZ-21htCUsvcmVFuVay49fwCxdczd0Osuld09QSGI5-hHuiYfqwRxTp39s2D3mfoOlxMT5URiYXWvt2VCaWZFLGHwBptmvXglY-ei4XP-Dgm1OjzhM&amp;sig=Cg0ArKJSzLit_qvw731V&amp;urlfix=1&amp;adurl=https://www.shutterstock.com/search/valentines%2Bday%2Bchocolate%3Fpl%3DGDNKR-lggeneric%26cr%3D1%26utm_source%3Dadwords%26utm_medium%3Dacq_display%26utm_campaign%3Dimage_kr_lggeneric_lowintent%26utm_content%3DVdayChocolate_ko_image_serp%26dclid%3D%25edclid!">
				<img src="https://s0.2mdn.net/5546719/970x250_KR.jpg" alt="Advertisement" border="0" width="600" height="170"></a>
			</div>
		</div>

	<!-- footer include -->		
		<div class="wrapper">
			<jsp:include page="include/footer.jsp" />
		</div>
	
</body>

</html>