<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>WeSche - Study Group</title>
<!-- Favicon -->
<link href="./assets/img/brand/favicon.png" rel="icon" type="image/png">
<!-- Fonts -->
<link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700" rel="stylesheet">
<!-- Icons -->
<link href="./assets/js/plugins/nucleo/css/nucleo.css" rel="stylesheet" />
<link href="./assets/js/plugins/@fortawesome/fontawesome-free/css/all.min.css" rel="stylesheet" />
<!-- CSS Files -->
<link href="./assets/css/argon-dashboard.css?v=1.1.2" rel="stylesheet" />

<style type="text/css">
.card-footer {
	width: 100% !important;
}

td {
	width: 130px;
}

.tdseq {
	width: 150px ! important;
}

.dtotitle:hover {
	cursor: pointer;
}

.text-btn2 {
	display: inline-block;
	height: 31px;
	border: 1px solid #d3d3d3;
	cursor: pointer;
	text-align: center;
	vertical-align: top;
	background: white;
	border-radius: 0.375rem;
}
</style>
</head>

<body class="">

	<jsp:include page="common.jsp" />

	<div class="main-content">
		<jsp:include page="Navbar.jsp" />

		<!-- End Navbar -->
		<!-- Header -->
		<div class="header bg-gradient-primary pb-8 pt-5 pt-md-8">
			<div class="container-fluid"></div>
		</div>
		<div class="container-fluid mt--7">
			<!-- Table -->
			<div class="row">
				<div class="col">
					<div class="card shadow">
						<div class="card-header border-0">
							<h3 class="mb-0" style="float: left; font-weight: bold;">Study Group</h3>
							<input class="text-btn2" style="float: right;" type="button" value="작성" onclick="location.href='studyinsertform.do'">
						</div>
						<div class="table-responsive">
							<table class="table align-items-center table-flush" style="text-align: center;">
								<thead class="thead-light">
									<tr>
										<th class="thcol" scope="col" style="width: 150px;">No</th>
										<th class="thcol" scope="col" style="width: 440px;">Title</th>
										<th class="thcol" scope="col" style="width: 130px;">Writer</th>
										<th class="thcol" scope="col" style="width: 130px;">Date</th>
										<th class="thcol" scope="col" style="width: 130px;">Views</th>
										<th class="thcol" scope="col" style="width: 130px;">Tags</th>
									</tr>
								</thead>

								<tbody>
									<c:choose>
										<c:when test="${empty study }">
											<tr>
												<td colspan="4" align="center" style="text-align: center;">작성된 글이 없습니다.</td>
											</tr>
										</c:when>

										<c:otherwise>
											<c:forEach items="${study }" var="rbdto">
												<tr class="maintr">
													<td class="tdseq">
														<span class="mb-0 text-sm">${rbdto.rbseq }</span>
													</td>

													<th scope="row" class="dtotitle" id="pdtotitle"><span class="mb-0 text-sm" id="dtotitle">
															<a href="studydetail.do?rbseq=${rbdto.rbseq }">${rbdto.title }</a>
														</span></th>

													<td>
														<span class="badge badge-dot">${rbdto.memberid }</span>
													</td>
													<td>
														<fmt:formatDate value="${rbdto.rbdate }" pattern="yyyy.MM.dd" />
													</td>
													<td>
														<div class="align-items-center">${rbdto.rbcount }</div>
													</td>
													<td style="text-align: center;">${rbdto.tag }</td>
												</tr>
											</c:forEach>
										</c:otherwise>
									</c:choose>


								</tbody>
							</table>
						</div>



						<div class="card-footer">
							<nav aria-label="..">
								<ul class="pagination mb-0" style="justify-content: center;">
									<c:if test="${pageMaker.prev }">
										<li class="page-item">
											<a class="page-link" href="study.do${pageMaker.makeSearch(pageMaker.startPage-1) }"><i class="fa fa-chevron-left"></i></a>
										</li>
									</c:if>
									<c:forEach begin="${pageMaker.startPage }" end="${pageMaker.endPage }" var="pageNum">
										<li class="page-item">
											<a class="page-link" href="study.do${pageMaker.makeSearch(pageNum) }"><i class="fa">${pageNum }</i></a>
										</li>
									</c:forEach>
									<c:if test="${pageMaker.next && pageMaker.endPage >0 }">
										<li class="page-item">
											<a class="page-link" href="study.do${pageMaker.makeSearch(pageMaker.endPage+1) }"><i class="fa fa-chevron-right"></i></a>
										</li>
									</c:if>
								</ul>
							</nav>

							<!-- search -->
							<form role="form" method="get">
								<div class="search" style="margin-top: 18px; text-align: center;">
									<select name="searchType" style="padding: 2px;">
										<option value="tc" <c:out value="${scri.searchType eq 'tc' ? 'selected' : ''}"/>>제목+내용</option>
										<option value="t" <c:out value="${scri.searchType eq 't' ? 'selected' : ''}"/>>제목</option>
										<option value="c" <c:out value="${scri.searchType eq 'c' ? 'selected' : ''}"/>>내용</option>
										<option value="w" <c:out value="${scri.searchType eq 'w' ? 'selected' : ''}"/>>작성자</option>
										<option value="ta" <c:out value="${scri.searchType eq 'ta' ? 'selected' : ''}"/>>태그</option>
									</select>

									<input type="text" name="keyword" id="keywordInput" value="${scri.keyword}" />

									<button id="searchBtn" type="button" class="text-btn2">검색</button>

									<script>
										$(function() {
											$('#searchBtn')
													.click(
															function() {
																self.location = "study.do"
																		+ "?searchType="
																		+ $(
																				"select option:selected")
																				.val()
																		+ "&keyword="
																		+ encodeURIComponent($(
																				'#keywordInput')
																				.val());
															});
										});
									</script>
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>


			<!— Footer —>
			<jsp:include page="footer.jsp" />
		</div>
	</div>
	<!—   Core   —>
	<script src="./assets/js/plugins/jquery/dist/jquery.min.js"></script>
	<script src="./assets/js/plugins/bootstrap/dist/js/bootstrap.bundle.min.js"></script>
	<!—   Optional JS   —>
	<!—   Argon JS   —>
	<script src="./assets/js/argon-dashboard.min.js?v=1.1.2"></script>
	<script src="https://cdn.trackjs.com/agent/v3/latest/t.js"></script>
	<script>
		window.TrackJS && TrackJS.install({
			token : "ee6fab19c5a04ac1a32a645abde4613a",
			application : "argon-dashboard-free"
		});
	</script>
</body>

</html>