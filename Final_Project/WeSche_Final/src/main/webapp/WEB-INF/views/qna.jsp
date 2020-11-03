<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="java.util.Date"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>WeSche - Q & A</title>
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
<body>
	<jsp:include page="common.jsp" />
	<div class="main-content">
		<jsp:include page="Navbar.jsp" />
		<jsp:include page="header.jsp" />
		<div class="container-fluid mt--7">
			<div class="row">
				<div class="col">
					<div class="card shadow">
						<div class="card-header border-0">
							<h3 class="mb-0" style="float: left; font-weight: bold;">Q & A</h3>
							<form action="qnainsertform.do" method="post" enctype="multipart/form-data">
								<input class="text-btn2" style="float: right;" type="submit" value="작성">
							</form>
						</div>
						<div>
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

									<tbody id="mainbody">
										<!-- -------------------------------------------------------------------- -->
										<c:choose>
											<c:when test="${empty dtoss }">
												<tr>
													<td colspan="4" align="center" style="text-align: center;">작성된 글이 없습니다.</td>
												</tr>
											</c:when>

											<c:otherwise>
												<c:forEach var="dto" items="${dtoss }">
													<tr class="maintr">
														<td class="tdseq">
															<span class="mb-0 text-sm">${dto.qbseq }</span>
														</td>

														<th scope="row" class="dtotitle" id="pdtotitle"><span id="dtotitle"><a href="#">${dto.title }</a></span></th>

														<td class="dtomemberid">
															<span class="badge badge-dot">${dto.memberid }</span>
														</td>

														<td class="dtoqbdate">
															<span>
																<fmt:formatDate var="now" value="<%=new java.util.Date()%>" pattern="yyyy.MM.dd" />
																<c:set var="fdto">
																	<fmt:formatDate value="${dto.qbdate }" pattern="yyyy.MM.dd" />
																</c:set>
																<c:set var="sdto">
																	<fmt:formatDate value="${dto.qbdate }" pattern="HH:mm" />
																</c:set>
																<c:choose>
																	<c:when test="${fdto eq  now}">${sdto }</c:when>
																	<c:otherwise>${fdto }</c:otherwise>
																</c:choose>
															</span>
														</td>

														<td class="dtoqbcount">
															<span>${dto.qbcount }</span>
														</td>

														<td class="dtoqbtag">
															<span>${dto.qbtag }</span>
														</td>

													</tr>

												</c:forEach>
											</c:otherwise>
										</c:choose>


										<!-- ---------------------------------------------------------------------------- -->

									</tbody>
								</table>
							</div>
						</div>

						<!-- 테이블 하단 페이징 처리 번호 -->
						<div class="card-footer">
								<nav aria-label="..">
									<ul class="pagination mb-0" style="justify-content: center;">
										<li id="first" class="page-item">
											<a class="page-link" tabindex="-1"> <i class="fas fa-angle-left">
													<i class="fas fa-angle-left"></i>
												</i> <span class="sr-only">First</span>
											</a>
										</li>
										<li id="prev" class="page-item">
											<a class="page-link" tabindex="-1"> <i class="fas fa-angle-left"></i> <span class="sr-only">Previous</span>
											</a>
										</li>


										<li id="One" class="page-item">
											<a class="page-link">1</a>
										</li>
										<li id="Two" class="page-item">
											<a class="page-link">2</a>
										</li>
										<li id="Three" class="page-item">
											<a class="page-link" >3</a>
										</li>


										<li id="next" class="page-item">
											<a class="page-link" > <i class="fas fa-angle-right"></i> <span class="sr-only">Next</span>
											</a>
										</li>
										<li id="last" class="page-item">
											<a class="page-link" > <i class="fas fa-angle-right">
													<i class="fas fa-angle-right"></i>
												</i> <span class="sr-only">Last</span>
											</a>
										</li>
									</ul>
								</nav>
						


						<form role="form" method="get">
							<input type="hidden" name="myno" value="${myno }">
							<input type="hidden" name="pagelength" value="${pagelength }">
							<div class="search" style="margin-top: 18px; text-align: center;">
								<select name="searchType" style="padding: 2px;">
									<option value="tc" <c:out value="${scri.searchType eq 'tc' ? 'selected' : ''}"/>>제목+내용</option>
									<option value="t" <c:out value="${scri.searchType eq 't' ? 'selected' : ''}"/>>제목</option>
									<option value="c" <c:out value="${scri.searchType eq 'c' ? 'selected' : ''}"/>>내용</option>
									<option value="w" <c:out value="${scri.searchType eq 'w' ? 'selected' : ''}"/>>작성자</option>
									<option value="ta" <c:out value="${scri.searchType eq 'ta' ? 'selected' : ''}"/>>태그</option>
								</select>

								<input type="text" name="keyword" id="keywordInput" value="${scri.keyword}" />

								<button id="searchBtn" type="button" class="text-btn2">작성</button>
								<script>
									$(function() {
										$('#searchBtn').click(function() {
															self.location = "qna.do?"
																	+ "myno=0"
																	+ "&searchType="
																	+ $("select option:selected").val()
																	+ "&keyword="+ encodeURIComponent($('#keywordInput').val());
														});
									});
								</script>
							</div>
						</form>
						</div>

					</div>
				</div>
			</div>
			<jsp:include page="footer.jsp" />
		</div>
	</div>
	<!--   Core   -->
	<script src="./assets/js/plugins/jquery/dist/jquery.min.js"></script>
	<script src="./assets/js/plugins/bootstrap/dist/js/bootstrap.bundle.min.js"></script>
	<!--   Optional JS   -->
	<!--   Argon JS   -->
	<script src="./assets/js/argon-dashboard.min.js?v=1.1.2"></script>
	<script src="https://cdn.trackjs.com/agent/v3/latest/t.js"></script>
	<script>
		window.TrackJS && TrackJS.install({
			token : "ee6fab19c5a04ac1a32a645abde4613a",
			application : "argon-dashboard-free"
		});
	</script>
	<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>


	<!-- 페이징 처리 -->
	<script type="text/javascript">
		$(function() {
			var res = ${res};
			var ress = parseInt(res / 5);
			var pagelength = (parseInt(res) % 5 == 0) ? ress : ress + 1;
			var oneval = $("#One").children("a").html();
			var twoval = $("#Two").children("a").html();
			var trdval = $("#Three").children("a").html();

			if (parseInt(pagelength) == 0) {
				$('#first').hide();
				$('#prev').hide();
				$('#next').hide();
				$('#last').hide();
				$('#One').hide();
				$('#Two').hide();
				$('#Three').hide();
			} else if (parseInt(pagelength) == 1) {
				$('#Two').hide();
				$('#Three').hide();
				$('#first').hide();
				$('#prev').hide();
				$('#next').hide();
				$('#last').hide();
			} else if (parseInt(pagelength) == 2) {
				$('#Three').hide();
				$('#first').hide();
				$('#prev').hide();
				$('#next').hide();
				$('#last').hide();
			} else if (parseInt(pagelength) == 3) {
				$('#first').hide();
				$('#prev').hide();
				$('#next').hide();
				$('#last').hide();
			}

			//----------------------------------------------------------------------------------------------------------
			//  << 버튼 클릭했을 때의 반응
			$(".pagination")
					.children("li#first")
					.click(
							function() {
								$('#One').show();
								$('#Two').show();
								$('#Three').show();

								//현재 페이지가 1인경우
								if ($('.active').children('a.page-link').html() == 1) {
									return false;

									//현재 페이지가 1이 아닌 경우
								} else {
									$("#One").children("a").html(1);
									$("#Two").children("a").html(2);
									$("#Three").children("a").html(3);

									var myno = $("#One").children("a").html();
									myno = parseInt(myno) - 1;
									$("#mainbody").children("tr").remove();

									var renewURL = $(location).attr('protocol')
											+ "//" + $(location).attr('host')
											+ "" + $(location).attr('pathname');
									renewURL += '?myno=' + myno;
									history.pushState(null, null, renewURL);

									$.ajax({
												url : "ajaxQBoard.do?myno="+ myno,
												type : "GET",
												dataType : "json",
												success : function(data) {
													var res = data.res;

													for (var i = 0; i < data.dtoss.length; i++) {
														var qbseq = data.dtoss[i]["qbseq"];
														var memberid = data.dtoss[i]["memberid"];
														var title = data.dtoss[i]["title"];
														var qbcount = data.dtoss[i]["qbcount"];
														var qbtag = data.dtoss[i]["qbtag"];
														var qqdate = data.dtoss[i]["qbdate"];

														var date = new Date();
														var dateyear = date.getFullYear(); //year
														var month = (1 + date.getMonth());
														month = month >= 10 ? month: '0' + month; //month 두자리 저장
														var day = date.getDate();
														day = day >= 10 ? day: '0' + day; //day 두자리로 저장

														var qdate = new Date(qqdate);
														var qdateyear = qdate.getFullYear(); //year
														var qmonth = (1 + qdate.getMonth());
														qmonth = qmonth >= 10 ? qmonth: '0' + qmonth; //month 두자리 저장
														var qday = qdate.getDate();
														qday = qday >= 10 ? qday: '0' + qday; //day 두자리로 저장

														var qhour = qdate.getHours();
														qhour = qhour >= 10 ? qhour: '0' + qhour;
														var qmin = qdate.getMinutes();
														qmin = qmin >= 10 ? qmin: '0' + qmin;
														if ((dateyear == qdateyear)&& (month == qmonth)&& (day == qday)) {
															var qbdate = qhour+ ":"+ qmin;
														} else {
															var qbdate = qdateyear+ "."+ qmonth+ "."+ qday+ ".";
														}

														var $addtr = $('<tr>');

														var td1 = $('<td>');
														td1.addClass('tdseq');
														var span1 = $('<span>').addClass('mb-0 text-sm').html(qbseq);
														td1.append(span1);
														$addtr.append(td1);

														var td2 = $('<th>');
														td2.attr('scope','row').addClass('dtotitle').attr('id','pdtotitle');

														var span2 = $('<span>').addClass('mb-0 text-sm').attr('id','dtotitle').html(title);
														td2.append(span2);
														$addtr.append(td2);

														var td3 = $('<td>');
														td3.addClass('dtomemberid');
														var span3 = $('<span>').addClass('mb-0 text-sm').html(memberid);
														td3.append(span3);
														$addtr.append(td3);

														var td4 = $('<td>');
														td4.addClass('dtoqbdate');
														var span4 = $('<span>').addClass('mb-0 text-sm').html(qbdate);
														td4.append(span4);
														$addtr.append(td4);

														var td5 = $('<td>');
														td5.addClass('dtoqbcount');
														var span5 = $('<span>').addClass('mb-0 text-sm').html(qbcount);
														td5.append(span5);
														$addtr.append(td5);

														var td6 = $('<td>');
														td6.addClass('dtoqbtag');
														var span6 = $('<span>').addClass('mb-0 text-sm').html(qbtag);
														td6.append(span6);
														$addtr.append(td6);

														$('#mainbody').append($addtr);

													}
												},
												error : function(data) {
													alert("QBoard ajax 에러");
												}
											});
									$("#One").attr("class", "page-item");
									$("#Two").attr("class", "page-item");
									$("#Three").attr("class", "page-item");
									$("#One").attr("class", "page-item active");
								}
							});

			//----------------------------------------------------------------------------------------------------------
			//  < 버튼 클릭했을 때의 반응

			$(".pagination")
					.children("li#prev")
					.click(
							function() {

								//현재페이지가 1페이지인 경우 action을 막겠다.
								if ($('.active').children('a.page-link').html() == 1) {
									return false;

									//현재 페이지가 1페이지가 아닌경우	
								} else {

									//현재 페이지가 1페이지가 아니고 active위치가 #One이 아닌경우
									if ($('.active').children('a.page-link').html() != $("#One").children("a").html()) {

										var myno = $('.active').children('a.page-link').html();
										myno = parseInt(myno) - 2;
										$("#mainbody").children("tr").remove();

										var renewURL = $(location).attr('protocol')+ "//"+ $(location).attr('host')
												+ ""
												+ $(location).attr('pathname');
										renewURL += '?myno=' + myno;
										history.pushState(null, null, renewURL);

										$.ajax({
													url : "ajaxQBoard.do?myno="
															+ myno,
													type : "GET",
													dataType : "json",
													success : function(data) {
														var res = data.res;

														for (var i = 0; i < data.dtoss.length; i++) {
															var qbseq = data.dtoss[i]["qbseq"];
															var memberid = data.dtoss[i]["memberid"];
															var title = data.dtoss[i]["title"];
															var qbcount = data.dtoss[i]["qbcount"];
															var qbtag = data.dtoss[i]["qbtag"];
															var qqdate = data.dtoss[i]["qbdate"];

															var date = new Date();
															var dateyear = date.getFullYear(); //year
															var month = (1 + date.getMonth());
															month = month >= 10 ? month: '0'+ month; //month 두자리 저장
															var day = date.getDate();
															day = day >= 10 ? day: '0' + day; //day 두자리로 저장

															var qdate = new Date(qqdate);
															var qdateyear = qdate.getFullYear(); //year
															var qmonth = (1 + qdate.getMonth());
															qmonth = qmonth >= 10 ? qmonth: '0'+ qmonth; //month 두자리 저장
															var qday = qdate.getDate();
															qday = qday >= 10 ? qday: '0'+ qday; //day 두자리로 저장

															var qhour = qdate.getHours();
															qhour = qhour >= 10 ? qhour: '0'+ qhour;
															var qmin = qdate.getMinutes();
															qmin = qmin >= 10 ? qmin: '0'+ qmin;
															if ((dateyear == qdateyear)
																	&& (month == qmonth)
																	&& (day == qday)) {
																var qbdate = qhour+ ":"+ qmin;
															} else {
																var qbdate = qdateyear+ "."+ qmonth+ "."+ qday+ ".";
															}

															var $addtr = $('<tr>');

															var td1 = $('<td>');
															td1.addClass('tdseq');
															var span1 = $('<span>').addClass('mb-0 text-sm').html(qbseq);
															td1.append(span1);
															$addtr.append(td1);

															var td2 = $('<th>');
															td2.attr('scope','row').addClass('dtotitle').attr('id','pdtotitle');
															var span2 = $('<span>').addClass('mb-0 text-sm').attr('id','dtotitle').html(title);
															td2.append(span2);
															$addtr.append(td2);

															var td3 = $('<td>');
															td3.addClass('dtomemberid');
															var span3 = $('<span>').addClass('mb-0 text-sm').html(memberid);
															td3.append(span3);
															$addtr.append(td3);

															var td4 = $('<td>');
															td4.addClass('dtoqbdate');
															var span4 = $('<span>').addClass('mb-0 text-sm').html(qbdate);
															td4.append(span4);
															$addtr.append(td4);

															var td5 = $('<td>');
															td5.addClass('dtoqbcount');
															var span5 = $('<span>').addClass('mb-0 text-sm').html(qbcount);
															td5.append(span5);
															$addtr.append(td5);

															var td6 = $('<td>');
															td6.addClass('dtoqbtag');
															var span6 = $('<span>').addClass('mb-0 text-sm').html(qbtag);
															td6.append(span6);
															$addtr.append(td6);

															$('#mainbody').append($addtr);

														}
													},
													error : function(data) {
														alert("QBoard ajax 에러");
													}
												});
										if ($('.active').children('a.page-link').html() == $("#Three").children("a").html()) {
											$("#Two").attr("class","page-item active");
											$("#Three").attr("class","page-item");
										} else {
											$("#One").attr("class","page-item active");
											$("#Two").attr("class", "page-item");
										}

										//현재 페이지가 1페이지가 아니고 active위치가 #One인 경우	
									} else {
										$('#Three').show();
										$('#Two').show();
										$('#One').show();
										var active = parseInt($('.active').children('a.page-link').html());
										$("#One").children("a").html(active - 3);
										$("#Two").children("a").html(active - 2);
										$("#Three").children("a").html(active - 1);

										var myno = $("#Three").children("a").html();
										myno = parseInt(myno) - 1;
										$("#mainbody").children("tr").remove();

										var renewURL = $(location).attr(
												'protocol')
												+ "//"
												+ $(location).attr('host')
												+ ""
												+ $(location).attr('pathname');
										renewURL += '?myno=' + myno;
										history.pushState(null, null, renewURL);

										$.ajax({
													url : "ajaxQBoard.do?myno="
															+ myno,
													type : "GET",
													dataType : "json",
													success : function(data) {
														var res = data.res;

														for (var i = 0; i < data.dtoss.length; i++) {
															var qbseq = data.dtoss[i]["qbseq"];
															var memberid = data.dtoss[i]["memberid"];
															var title = data.dtoss[i]["title"];
															var qbcount = data.dtoss[i]["qbcount"];
															var qbtag = data.dtoss[i]["qbtag"];
															var qqdate = data.dtoss[i]["qbdate"];

															var date = new Date();
															var dateyear = date
																	.getFullYear(); //year
															var month = (1 + date
																	.getMonth());
															month = month >= 10 ? month
																	: '0'
																			+ month; //month 두자리 저장
															var day = date
																	.getDate();
															day = day >= 10 ? day
																	: '0' + day; //day 두자리로 저장

															var qdate = new Date(
																	qqdate);
															var qdateyear = qdate
																	.getFullYear(); //year
															var qmonth = (1 + qdate
																	.getMonth());
															qmonth = qmonth >= 10 ? qmonth
																	: '0'
																			+ qmonth; //month 두자리 저장
															var qday = qdate
																	.getDate();
															qday = qday >= 10 ? qday
																	: '0'
																			+ qday; //day 두자리로 저장

															var qhour = qdate
																	.getHours();
															qhour = qhour >= 10 ? qhour
																	: '0'
																			+ qhour;
															var qmin = qdate
																	.getMinutes();
															qmin = qmin >= 10 ? qmin
																	: '0'
																			+ qmin;
															if ((dateyear == qdateyear)
																	&& (month == qmonth)
																	&& (day == qday)) {
																var qbdate = qhour
																		+ ":"
																		+ qmin;
															} else {
																var qbdate = qdateyear
																		+ "."
																		+ qmonth
																		+ "."
																		+ qday
																		+ ".";
															}

															var $addtr = $('<tr>');

															var td1 = $('<td>');
															td1
																	.addClass('tdseq');
															var span1 = $(
																	'<span>')
																	.addClass(
																			'mb-0 text-sm')
																	.html(qbseq);
															td1.append(span1);
															$addtr.append(td1);

															var td2 = $('<th>');
															td2
																	.attr(
																			'scope',
																			'row')
																	.addClass(
																			'dtotitle')
																	.attr('id',
																			'pdtotitle');
															var span2 = $(
																	'<span>')
																	.addClass(
																			'mb-0 text-sm')
																	.attr('id',
																			'dtotitle')
																	.html(title);
															td2.append(span2);
															$addtr.append(td2);

															var td3 = $('<td>');
															td3
																	.addClass('dtomemberid');
															var span3 = $(
																	'<span>')
																	.addClass(
																			'mb-0 text-sm')
																	.html(
																			memberid);
															td3.append(span3);
															$addtr.append(td3);

															var td4 = $('<td>');
															td4
																	.addClass('dtoqbdate');
															var span4 = $(
																	'<span>')
																	.addClass(
																			'mb-0 text-sm')
																	.html(
																			qbdate);
															td4.append(span4);
															$addtr.append(td4);

															var td5 = $('<td>');
															td5
																	.addClass('dtoqbcount');
															var span5 = $(
																	'<span>')
																	.addClass(
																			'mb-0 text-sm')
																	.html(
																			qbcount);
															td5.append(span5);
															$addtr.append(td5);

															var td6 = $('<td>');
															td6
																	.addClass('dtoqbtag');
															var span6 = $(
																	'<span>')
																	.addClass(
																			'mb-0 text-sm')
																	.html(qbtag);
															td6.append(span6);
															$addtr.append(td6);

															$('#mainbody')
																	.append(
																			$addtr);

														}
													},
													error : function(data) {
														alert("QBoard ajax 에러");
													}
												});
										$("#One").attr("class", "page-item");
										$("#Two").attr("class", "page-item");
										$("#Three").attr("class",
												"page-item active");
									}

								}
							});

			//----------------------------------------------------------------------------------------------------------
			//  > 버튼 클릭했을 때의 반응

			$(".pagination")
					.children("li#next")
					.click(
							function() {
								//현재 액티브 위치랑 페이지 길이가 같으면 반응을 없게하겠다
								if ($('.active').children('a.page-link').html() == pagelength) {
									return false;

									//현재 위치가 페이지 길이랑 같지 않다.	
								} else {

									//현재 위치가 #Three 위치가 아니다.
									trdval = $("#Three").children("a").html();
									if ($('.active').children('a.page-link')
											.html() != trdval) {

										//현재 위치와 pagelength와 4차이 이상이 난다.
										//현재페이지 안에는 pagelength가 존재하지 않는다.
										pagelength = parseInt(pagelength);
										if (parseInt($('.active').children(
												'a.page-link').html())
												- pagelength <= -3) {
											var myno = $('.active').children(
													'a.page-link').html();
											myno = parseInt(myno);
											$("#mainbody").children("tr")
													.remove();

											var renewURL = $(location).attr(
													'protocol')
													+ "//"
													+ $(location).attr('host')
													+ ""
													+ $(location).attr(
															'pathname');
											renewURL += '?myno=' + myno;
											history.pushState(null, null,
													renewURL);

											$
													.ajax({
														url : "ajaxQBoard.do?myno="
																+ myno,
														type : "GET",
														dataType : "json",
														success : function(data) {
															var res = data.res;

															for (var i = 0; i < data.dtoss.length; i++) {
																var qbseq = data.dtoss[i]["qbseq"];
																var memberid = data.dtoss[i]["memberid"];
																var title = data.dtoss[i]["title"];
																var qbcount = data.dtoss[i]["qbcount"];
																var qbtag = data.dtoss[i]["qbtag"];
																var qqdate = data.dtoss[i]["qbdate"];

																var date = new Date();
																var dateyear = date
																		.getFullYear(); //year
																var month = (1 + date
																		.getMonth());
																month = month >= 10 ? month
																		: '0'
																				+ month; //month 두자리 저장
																var day = date
																		.getDate();
																day = day >= 10 ? day
																		: '0'
																				+ day; //day 두자리로 저장

																var qdate = new Date(
																		qqdate);
																var qdateyear = qdate
																		.getFullYear(); //year
																var qmonth = (1 + qdate
																		.getMonth());
																qmonth = qmonth >= 10 ? qmonth
																		: '0'
																				+ qmonth; //month 두자리 저장
																var qday = qdate
																		.getDate();
																qday = qday >= 10 ? qday
																		: '0'
																				+ qday; //day 두자리로 저장

																var qhour = qdate
																		.getHours();
																qhour = qhour >= 10 ? qhour
																		: '0'
																				+ qhour;
																var qmin = qdate
																		.getMinutes();
																qmin = qmin >= 10 ? qmin
																		: '0'
																				+ qmin;
																if ((dateyear == qdateyear)
																		&& (month == qmonth)
																		&& (day == qday)) {
																	var qbdate = qhour
																			+ ":"
																			+ qmin;
																} else {
																	var qbdate = qdateyear
																			+ "."
																			+ qmonth
																			+ "."
																			+ qday
																			+ ".";
																}

																var $addtr = $('<tr>');

																var td1 = $('<td>');
																td1
																		.addClass('tdseq');
																var span1 = $(
																		'<span>')
																		.addClass(
																				'mb-0 text-sm')
																		.html(
																				qbseq);
																td1
																		.append(span1);
																$addtr
																		.append(td1);

																var td2 = $('<th>');
																td2
																		.attr(
																				'scope',
																				'row')
																		.addClass(
																				'dtotitle')
																		.attr(
																				'id',
																				'pdtotitle');
																var span2 = $(
																		'<span>')
																		.addClass(
																				'mb-0 text-sm')
																		.attr(
																				'id',
																				'dtotitle')
																		.html(
																				title);
																td2
																		.append(span2);
																$addtr
																		.append(td2);

																var td3 = $('<td>');
																td3
																		.addClass('dtomemberid');
																var span3 = $(
																		'<span>')
																		.addClass(
																				'mb-0 text-sm')
																		.html(
																				memberid);
																td3
																		.append(span3);
																$addtr
																		.append(td3);

																var td4 = $('<td>');
																td4
																		.addClass('dtoqbdate');
																var span4 = $(
																		'<span>')
																		.addClass(
																				'mb-0 text-sm')
																		.html(
																				qbdate);
																td4
																		.append(span4);
																$addtr
																		.append(td4);

																var td5 = $('<td>');
																td5
																		.addClass('dtoqbcount');
																var span5 = $(
																		'<span>')
																		.addClass(
																				'mb-0 text-sm')
																		.html(
																				qbcount);
																td5
																		.append(span5);
																$addtr
																		.append(td5);

																var td6 = $('<td>');
																td6
																		.addClass('dtoqbtag');
																var span6 = $(
																		'<span>')
																		.addClass(
																				'mb-0 text-sm')
																		.html(
																				qbtag);
																td6
																		.append(span6);
																$addtr
																		.append(td6);

																$('#mainbody')
																		.append(
																				$addtr);

															}
														},
														error : function(data) {
															alert("QBoard ajax 에러");
														}
													});

											if ($('.active').children(
													'a.page-link').html() == $(
													"#One").children("a")
													.html()) {
												$("#One").attr("class",
														"page-item");
												$("#Two").attr("class",
														"page-item active");
												$("#Three").attr("class",
														"page-item");
											} else if ($('.active').children(
													'a.page-link').html() == $(
													"#Two").children("a")
													.html()) {
												$("#One").attr("class",
														"page-item");
												$("#Two").attr("class",
														"page-item");
												$("#Three").attr("class",
														"page-item active");
											}

											//현재 위치와 pagelength가 2차이 이하로 난다.(현재페이지에 pagelength가 있다.)	
										} else {
											//pagelength가 3의 배수일때
											pagelength = parseInt(pagelength);
											if (pagelength % 3 == 0) {

												var myno = parseInt($('.active')
														.children('a.page-link')
														.html()) + 1;
												myno = parseInt(myno) - 1;
												$("#mainbody").children("tr")
														.remove();

												var renewURL = $(location)
														.attr('protocol')
														+ "//"
														+ $(location).attr(
																'host')
														+ ""
														+ $(location).attr(
																'pathname');
												renewURL += '?myno=' + myno;
												history.pushState(null, null,
														renewURL);

												$
														.ajax({
															url : "ajaxQBoard.do?myno="
																	+ myno,
															type : "GET",
															dataType : "json",
															success : function(
																	data) {
																var res = data.res;

																for (var i = 0; i < data.dtoss.length; i++) {
																	var qbseq = data.dtoss[i]["qbseq"];
																	var memberid = data.dtoss[i]["memberid"];
																	var title = data.dtoss[i]["title"];
																	var qbcount = data.dtoss[i]["qbcount"];
																	var qbtag = data.dtoss[i]["qbtag"];
																	var qqdate = data.dtoss[i]["qbdate"];

																	var date = new Date();
																	var dateyear = date
																			.getFullYear(); //year
																	var month = (1 + date
																			.getMonth());
																	month = month >= 10 ? month
																			: '0'
																					+ month; //month 두자리 저장
																	var day = date
																			.getDate();
																	day = day >= 10 ? day
																			: '0'
																					+ day; //day 두자리로 저장

																	var qdate = new Date(
																			qqdate);
																	var qdateyear = qdate
																			.getFullYear(); //year
																	var qmonth = (1 + qdate
																			.getMonth());
																	qmonth = qmonth >= 10 ? qmonth
																			: '0'
																					+ qmonth; //month 두자리 저장
																	var qday = qdate
																			.getDate();
																	qday = qday >= 10 ? qday
																			: '0'
																					+ qday; //day 두자리로 저장

																	var qhour = qdate
																			.getHours();
																	qhour = qhour >= 10 ? qhour
																			: '0'
																					+ qhour;
																	var qmin = qdate
																			.getMinutes();
																	qmin = qmin >= 10 ? qmin
																			: '0'
																					+ qmin;
																	if ((dateyear == qdateyear)
																			&& (month == qmonth)
																			&& (day == qday)) {
																		var qbdate = qhour
																				+ ":"
																				+ qmin;
																	} else {
																		var qbdate = qdateyear
																				+ "."
																				+ qmonth
																				+ "."
																				+ qday
																				+ ".";
																	}

																	var $addtr = $('<tr>');

																	var td1 = $('<td>');
																	td1
																			.addClass('tdseq');
																	var span1 = $(
																			'<span>')
																			.addClass(
																					'mb-0 text-sm')
																			.html(
																					qbseq);
																	td1
																			.append(span1);
																	$addtr
																			.append(td1);

																	var td2 = $('<th>');
																	td2
																			.attr(
																					'scope',
																					'row')
																			.addClass(
																					'dtotitle')
																			.attr(
																					'id',
																					'pdtotitle');
																	var span2 = $(
																			'<span>')
																			.addClass(
																					'mb-0 text-sm')
																			.attr(
																					'id',
																					'dtotitle')
																			.html(
																					title);
																	td2
																			.append(span2);
																	$addtr
																			.append(td2);

																	var td3 = $('<td>');
																	td3
																			.addClass('dtomemberid');
																	var span3 = $(
																			'<span>')
																			.addClass(
																					'mb-0 text-sm')
																			.html(
																					memberid);
																	td3
																			.append(span3);
																	$addtr
																			.append(td3);

																	var td4 = $('<td>');
																	td4
																			.addClass('dtoqbdate');
																	var span4 = $(
																			'<span>')
																			.addClass(
																					'mb-0 text-sm')
																			.html(
																					qbdate);
																	td4
																			.append(span4);
																	$addtr
																			.append(td4);

																	var td5 = $('<td>');
																	td5
																			.addClass('dtoqbcount');
																	var span5 = $(
																			'<span>')
																			.addClass(
																					'mb-0 text-sm')
																			.html(
																					qbcount);
																	td5
																			.append(span5);
																	$addtr
																			.append(td5);

																	var td6 = $('<td>');
																	td6
																			.addClass('dtoqbtag');
																	var span6 = $(
																			'<span>')
																			.addClass(
																					'mb-0 text-sm')
																			.html(
																					qbtag);
																	td6
																			.append(span6);
																	$addtr
																			.append(td6);

																	$(
																			'#mainbody')
																			.append(
																					$addtr);

																}
															},
															error : function(
																	data) {
																alert("QBoard ajax 에러");
															}
														});

												if ($('.active').children(
														'a.page-link').html() == $(
														"#One").children("a")
														.html()) {
													$("#One").attr("class",
															"page-item");
													$("#Two").attr("class",
															"page-item active");
													$("#Three").attr("class",
															"page-item");
												} else if ($('.active')
														.children('a.page-link')
														.html() == $("#Two")
														.children("a").html()) {
													$("#One").attr("class",
															"page-item");
													$("#Two").attr("class",
															"page-item");
													$("#Three").attr("class",
															"page-item active");
												}

												//pagelength가 3N+1인 경우	
											} else if (pagelength % 3 == 1) {
												var myno = parseInt($('.active')
														.children('a.page-link')
														.html()) + 1;
												myno = parseInt(myno) - 1;
												$("#mainbody").children("tr")
														.remove();

												var renewURL = $(location)
														.attr('protocol')
														+ "//"
														+ $(location).attr(
																'host')
														+ ""
														+ $(location).attr(
																'pathname');
												renewURL += '?myno=' + myno;
												history.pushState(null, null,
														renewURL);

												$
														.ajax({
															url : "ajaxQBoard.do?myno="
																	+ myno,
															type : "GET",
															dataType : "json",
															success : function(
																	data) {
																var res = data.res;

																for (var i = 0; i < data.dtoss.length; i++) {
																	var qbseq = data.dtoss[i]["qbseq"];
																	var memberid = data.dtoss[i]["memberid"];
																	var title = data.dtoss[i]["title"];
																	var qbcount = data.dtoss[i]["qbcount"];
																	var qbtag = data.dtoss[i]["qbtag"];
																	var qqdate = data.dtoss[i]["qbdate"];

																	var date = new Date();
																	var dateyear = date
																			.getFullYear(); //year
																	var month = (1 + date
																			.getMonth());
																	month = month >= 10 ? month
																			: '0'
																					+ month; //month 두자리 저장
																	var day = date
																			.getDate();
																	day = day >= 10 ? day
																			: '0'
																					+ day; //day 두자리로 저장

																	var qdate = new Date(
																			qqdate);
																	var qdateyear = qdate
																			.getFullYear(); //year
																	var qmonth = (1 + qdate
																			.getMonth());
																	qmonth = qmonth >= 10 ? qmonth
																			: '0'
																					+ qmonth; //month 두자리 저장
																	var qday = qdate
																			.getDate();
																	qday = qday >= 10 ? qday
																			: '0'
																					+ qday; //day 두자리로 저장

																	var qhour = qdate
																			.getHours();
																	qhour = qhour >= 10 ? qhour
																			: '0'
																					+ qhour;
																	var qmin = qdate
																			.getMinutes();
																	qmin = qmin >= 10 ? qmin
																			: '0'
																					+ qmin;
																	if ((dateyear == qdateyear)
																			&& (month == qmonth)
																			&& (day == qday)) {
																		var qbdate = qhour
																				+ ":"
																				+ qmin;
																	} else {
																		var qbdate = qdateyear
																				+ "."
																				+ qmonth
																				+ "."
																				+ qday
																				+ ".";
																	}

																	var $addtr = $('<tr>');

																	var td1 = $('<td>');
																	td1
																			.addClass('tdseq');
																	var span1 = $(
																			'<span>')
																			.addClass(
																					'mb-0 text-sm')
																			.html(
																					qbseq);
																	td1
																			.append(span1);
																	$addtr
																			.append(td1);

																	var td2 = $('<th>');
																	td2
																			.attr(
																					'scope',
																					'row')
																			.addClass(
																					'dtotitle')
																			.attr(
																					'id',
																					'pdtotitle');
																	var span2 = $(
																			'<span>')
																			.addClass(
																					'mb-0 text-sm')
																			.attr(
																					'id',
																					'dtotitle')
																			.html(
																					title);
																	td2
																			.append(span2);
																	$addtr
																			.append(td2);

																	var td3 = $('<td>');
																	td3
																			.addClass('dtomemberid');
																	var span3 = $(
																			'<span>')
																			.addClass(
																					'mb-0 text-sm')
																			.html(
																					memberid);
																	td3
																			.append(span3);
																	$addtr
																			.append(td3);

																	var td4 = $('<td>');
																	td4
																			.addClass('dtoqbdate');
																	var span4 = $(
																			'<span>')
																			.addClass(
																					'mb-0 text-sm')
																			.html(
																					qbdate);
																	td4
																			.append(span4);
																	$addtr
																			.append(td4);

																	var td5 = $('<td>');
																	td5
																			.addClass('dtoqbcount');
																	var span5 = $(
																			'<span>')
																			.addClass(
																					'mb-0 text-sm')
																			.html(
																					qbcount);
																	td5
																			.append(span5);
																	$addtr
																			.append(td5);

																	var td6 = $('<td>');
																	td6
																			.addClass('dtoqbtag');
																	var span6 = $(
																			'<span>')
																			.addClass(
																					'mb-0 text-sm')
																			.html(
																					qbtag);
																	td6
																			.append(span6);
																	$addtr
																			.append(td6);

																	$(
																			'#mainbody')
																			.append(
																					$addtr);

																}
															},
															error : function(
																	data) {
																alert("QBoard ajax 에러");
															}
														});

												if ($('.active').children(
														'a.page-link').html() == $(
														"#One").children("a")
														.html()) {
													$("#One").attr("class",
															"page-item");
													$("#Two").attr("class",
															"page-item active");
													$("#Three").attr("class",
															"page-item");
												} else if ($('.active')
														.children('a.page-link')
														.html() == $("#Two")
														.children("a").html()) {
													$("#One").attr("class",
															"page-item");
													$("#Two").attr("class",
															"page-item");
													$("#Three").attr("class",
															"page-item active");
												}

												//pagelength가 3N+2인 경우	
											} else if (pagelength % 3 == 2) {

												var myno = parseInt($('.active')
														.children('a.page-link')
														.html()) + 1;
												myno = parseInt(myno) - 1;
												$("#mainbody").children("tr")
														.remove();

												var renewURL = $(location)
														.attr('protocol')
														+ "//"
														+ $(location).attr(
																'host')
														+ ""
														+ $(location).attr(
																'pathname');
												renewURL += '?myno=' + myno;
												history.pushState(null, null,
														renewURL);

												$
														.ajax({
															url : "ajaxQBoard.do?myno="
																	+ myno,
															type : "GET",
															dataType : "json",
															success : function(
																	data) {
																var res = data.res;

																for (var i = 0; i < data.dtoss.length; i++) {
																	var qbseq = data.dtoss[i]["qbseq"];
																	var memberid = data.dtoss[i]["memberid"];
																	var title = data.dtoss[i]["title"];
																	var qbcount = data.dtoss[i]["qbcount"];
																	var qbtag = data.dtoss[i]["qbtag"];
																	var qqdate = data.dtoss[i]["qbdate"];

																	var date = new Date();
																	var dateyear = date
																			.getFullYear(); //year
																	var month = (1 + date
																			.getMonth());
																	month = month >= 10 ? month
																			: '0'
																					+ month; //month 두자리 저장
																	var day = date
																			.getDate();
																	day = day >= 10 ? day
																			: '0'
																					+ day; //day 두자리로 저장

																	var qdate = new Date(
																			qqdate);
																	var qdateyear = qdate
																			.getFullYear(); //year
																	var qmonth = (1 + qdate
																			.getMonth());
																	qmonth = qmonth >= 10 ? qmonth
																			: '0'
																					+ qmonth; //month 두자리 저장
																	var qday = qdate
																			.getDate();
																	qday = qday >= 10 ? qday
																			: '0'
																					+ qday; //day 두자리로 저장

																	var qhour = qdate
																			.getHours();
																	qhour = qhour >= 10 ? qhour
																			: '0'
																					+ qhour;
																	var qmin = qdate
																			.getMinutes();
																	qmin = qmin >= 10 ? qmin
																			: '0'
																					+ qmin;
																	if ((dateyear == qdateyear)
																			&& (month == qmonth)
																			&& (day == qday)) {
																		var qbdate = qhour
																				+ ":"
																				+ qmin;
																	} else {
																		var qbdate = qdateyear
																				+ "."
																				+ qmonth
																				+ "."
																				+ qday
																				+ ".";
																	}

																	var $addtr = $('<tr>');

																	var td1 = $('<td>');
																	td1
																			.addClass('tdseq');
																	var span1 = $(
																			'<span>')
																			.addClass(
																					'mb-0 text-sm')
																			.html(
																					qbseq);
																	td1
																			.append(span1);
																	$addtr
																			.append(td1);

																	var td2 = $('<th>');
																	td2
																			.attr(
																					'scope',
																					'row')
																			.addClass(
																					'dtotitle')
																			.attr(
																					'id',
																					'pdtotitle');
																	var span2 = $(
																			'<span>')
																			.addClass(
																					'mb-0 text-sm')
																			.attr(
																					'id',
																					'dtotitle')
																			.html(
																					title);
																	td2
																			.append(span2);
																	$addtr
																			.append(td2);

																	var td3 = $('<td>');
																	td3
																			.addClass('dtomemberid');
																	var span3 = $(
																			'<span>')
																			.addClass(
																					'mb-0 text-sm')
																			.html(
																					memberid);
																	td3
																			.append(span3);
																	$addtr
																			.append(td3);

																	var td4 = $('<td>');
																	td4
																			.addClass('dtoqbdate');
																	var span4 = $('<span>').addClass('mb-0 text-sm').html(qbdate);
																	td4.append(span4);
																	$addtr.append(td4);

																	var td5 = $('<td>');
																	td5.addClass('dtoqbcount');
																	var span5 = $('<span>').addClass('mb-0 text-sm').html(qbcount);
																	td5.append(span5);
																	$addtr.append(td5);

																	var td6 = $('<td>');
																	td6.addClass('dtoqbtag');
																	var span6 = $('<span>').addClass('mb-0 text-sm').html(qbtag);
																	td6.append(span6);
																	$addtr.append(td6);

																	$('#mainbody').append($addtr);

																}
															},
															error : function(
																	data) {
																alert("QBoard ajax 에러");
															}
														});

												$("#One").attr("class",
														"page-item");
												$("#Two").attr("class",
														"page-item active");
												$("#Three").attr("class",
														"page-item");
												if ($("#Two").children("a")
														.html() > pagelength) {
													$("#Two").hide();
												}
												if ($("#Two").children("a")
														.html() > pagelength) {
													$("#Three").hide();
												}
											}
										}

										//현재 위치가 #Three이다.	
									} else {
										//현재 위치와 pagelength와 4차이 이상이 난다.
										pagelength = parseInt(pagelength);
										if (parseInt($('.active').children(
												'a.page-link').html())
												- pagelength <= -4) {
											$("#One").children("a")
													.html(parseInt($('.active').children('a.page-link').html()) + 1);
											$("#Two").children("a").html(parseInt($('.active').children('a.page-link').html()) + 2);
											$("#Three").children("a").html(parseInt($('.active').children('a.page-link').html()) + 3);

											var myno = parseInt($('.active')
													.children('a.page-link')
													.html());
											myno = parseInt(myno) - 3;
											$("#mainbody").children("tr")
													.remove();

											var renewURL = $(location).attr(
													'protocol')
													+ "//"
													+ $(location).attr('host')
													+ ""
													+ $(location).attr(
															'pathname');
											renewURL += '?myno=' + myno;
											history.pushState(null, null,
													renewURL);

											$
													.ajax({
														url : "ajaxQBoard.do?myno="
																+ myno,
														type : "GET",
														dataType : "json",
														success : function(data) {
															var res = data.res;

															for (var i = 0; i < data.dtoss.length; i++) {
																var qbseq = data.dtoss[i]["qbseq"];
																var memberid = data.dtoss[i]["memberid"];
																var title = data.dtoss[i]["title"];
																var qbcount = data.dtoss[i]["qbcount"];
																var qbtag = data.dtoss[i]["qbtag"];
																var qqdate = data.dtoss[i]["qbdate"];

																var date = new Date();
																var dateyear = date
																		.getFullYear(); //year
																var month = (1 + date
																		.getMonth());
																month = month >= 10 ? month
																		: '0'
																				+ month; //month 두자리 저장
																var day = date
																		.getDate();
																day = day >= 10 ? day
																		: '0'
																				+ day; //day 두자리로 저장

																var qdate = new Date(
																		qqdate);
																var qdateyear = qdate
																		.getFullYear(); //year
																var qmonth = (1 + qdate
																		.getMonth());
																qmonth = qmonth >= 10 ? qmonth
																		: '0'
																				+ qmonth; //month 두자리 저장
																var qday = qdate
																		.getDate();
																qday = qday >= 10 ? qday
																		: '0'
																				+ qday; //day 두자리로 저장

																var qhour = qdate
																		.getHours();
																qhour = qhour >= 10 ? qhour
																		: '0'
																				+ qhour;
																var qmin = qdate
																		.getMinutes();
																qmin = qmin >= 10 ? qmin
																		: '0'
																				+ qmin;
																if ((dateyear == qdateyear)
																		&& (month == qmonth)
																		&& (day == qday)) {
																	var qbdate = qhour
																			+ ":"
																			+ qmin;
																} else {
																	var qbdate = qdateyear
																			+ "."
																			+ qmonth
																			+ "."
																			+ qday
																			+ ".";
																}

																var $addtr = $('<tr>');

																var td1 = $('<td>');
																td1
																		.addClass('tdseq');
																var span1 = $(
																		'<span>')
																		.addClass(
																				'mb-0 text-sm')
																		.html(
																				qbseq);
																td1
																		.append(span1);
																$addtr
																		.append(td1);

																var td2 = $('<th>');
																td2
																		.attr(
																				'scope',
																				'row')
																		.addClass(
																				'dtotitle')
																		.attr(
																				'id',
																				'pdtotitle');
																var span2 = $(
																		'<span>')
																		.addClass(
																				'mb-0 text-sm')
																		.attr(
																				'id',
																				'dtotitle')
																		.html(
																				title);
																td2
																		.append(span2);
																$addtr
																		.append(td2);

																var td3 = $('<td>');
																td3
																		.addClass('dtomemberid');
																var span3 = $(
																		'<span>')
																		.addClass(
																				'mb-0 text-sm')
																		.html(
																				memberid);
																td3
																		.append(span3);
																$addtr
																		.append(td3);

																var td4 = $('<td>');
																td4
																		.addClass('dtoqbdate');
																var span4 = $(
																		'<span>')
																		.addClass(
																				'mb-0 text-sm')
																		.html(
																				qbdate);
																td4
																		.append(span4);
																$addtr
																		.append(td4);

																var td5 = $('<td>');
																td5
																		.addClass('dtoqbcount');
																var span5 = $(
																		'<span>')
																		.addClass(
																				'mb-0 text-sm')
																		.html(
																				qbcount);
																td5
																		.append(span5);
																$addtr
																		.append(td5);

																var td6 = $('<td>');
																td6
																		.addClass('dtoqbtag');
																var span6 = $(
																		'<span>')
																		.addClass(
																				'mb-0 text-sm')
																		.html(
																				qbtag);
																td6
																		.append(span6);
																$addtr
																		.append(td6);

																$('#mainbody')
																		.append(
																				$addtr);

															}
														},
														error : function(data) {
															alert("QBoard ajax 에러");
														}
													});
											$("#One").attr("class",
													"page-item active");
											$("#Two")
													.attr("class", "page-item");
											$("#Three").attr("class",
													"page-item");

											//현재 위치와 pagelength가 3차이 이하로 난다.(다음페이지에 pagelength가 있다.)	
										} else {
											//pagelength가 3의 배수일때
											pagelength = parseInt(pagelength);
											if (pagelength % 3 == 0) {
												$("#One").children("a").html(
														pagelength - 2);
												$("#Two").children("a").html(
														pagelength - 1);
												$("#Three").children("a").html(
														pagelength);

												var myno = $("#One").children(
														"a").html();
												myno = parseInt(myno) - 1;
												$("#mainbody").children("tr")
														.remove();

												var renewURL = $(location)
														.attr('protocol')
														+ "//"
														+ $(location).attr(
																'host')
														+ ""
														+ $(location).attr(
																'pathname');
												renewURL += '?myno=' + myno;
												history.pushState(null, null,
														renewURL);

												$
														.ajax({
															url : "ajaxQBoard.do?myno="
																	+ myno,
															type : "GET",
															dataType : "json",
															success : function(
																	data) {
																var res = data.res;

																for (var i = 0; i < data.dtoss.length; i++) {
																	var qbseq = data.dtoss[i]["qbseq"];
																	var memberid = data.dtoss[i]["memberid"];
																	var title = data.dtoss[i]["title"];
																	var qbcount = data.dtoss[i]["qbcount"];
																	var qbtag = data.dtoss[i]["qbtag"];
																	var qqdate = data.dtoss[i]["qbdate"];

																	var date = new Date();
																	var dateyear = date
																			.getFullYear(); //year
																	var month = (1 + date
																			.getMonth());
																	month = month >= 10 ? month
																			: '0'
																					+ month; //month 두자리 저장
																	var day = date
																			.getDate();
																	day = day >= 10 ? day
																			: '0'
																					+ day; //day 두자리로 저장

																	var qdate = new Date(
																			qqdate);
																	var qdateyear = qdate
																			.getFullYear(); //year
																	var qmonth = (1 + qdate
																			.getMonth());
																	qmonth = qmonth >= 10 ? qmonth
																			: '0'
																					+ qmonth; //month 두자리 저장
																	var qday = qdate
																			.getDate();
																	qday = qday >= 10 ? qday
																			: '0'
																					+ qday; //day 두자리로 저장

																	var qhour = qdate
																			.getHours();
																	qhour = qhour >= 10 ? qhour
																			: '0'
																					+ qhour;
																	var qmin = qdate
																			.getMinutes();
																	qmin = qmin >= 10 ? qmin
																			: '0'
																					+ qmin;
																	if ((dateyear == qdateyear)
																			&& (month == qmonth)
																			&& (day == qday)) {
																		var qbdate = qhour
																				+ ":"
																				+ qmin;
																	} else {
																		var qbdate = qdateyear
																				+ "."
																				+ qmonth
																				+ "."
																				+ qday
																				+ ".";
																	}

																	var $addtr = $('<tr>');

																	var td1 = $('<td>');
																	td1
																			.addClass('tdseq');
																	var span1 = $(
																			'<span>')
																			.addClass(
																					'mb-0 text-sm')
																			.html(
																					qbseq);
																	td1
																			.append(span1);
																	$addtr
																			.append(td1);

																	var td2 = $('<th>');
																	td2
																			.attr(
																					'scope',
																					'row')
																			.addClass(
																					'dtotitle')
																			.attr(
																					'id',
																					'pdtotitle');
																	var span2 = $(
																			'<span>')
																			.addClass(
																					'mb-0 text-sm')
																			.attr(
																					'id',
																					'dtotitle')
																			.html(
																					title);
																	td2
																			.append(span2);
																	$addtr
																			.append(td2);

																	var td3 = $('<td>');
																	td3
																			.addClass('dtomemberid');
																	var span3 = $(
																			'<span>')
																			.addClass(
																					'mb-0 text-sm')
																			.html(
																					memberid);
																	td3
																			.append(span3);
																	$addtr
																			.append(td3);

																	var td4 = $('<td>');
																	td4
																			.addClass('dtoqbdate');
																	var span4 = $(
																			'<span>')
																			.addClass(
																					'mb-0 text-sm')
																			.html(
																					qbdate);
																	td4
																			.append(span4);
																	$addtr
																			.append(td4);

																	var td5 = $('<td>');
																	td5
																			.addClass('dtoqbcount');
																	var span5 = $(
																			'<span>')
																			.addClass(
																					'mb-0 text-sm')
																			.html(
																					qbcount);
																	td5
																			.append(span5);
																	$addtr
																			.append(td5);

																	var td6 = $('<td>');
																	td6
																			.addClass('dtoqbtag');
																	var span6 = $(
																			'<span>')
																			.addClass(
																					'mb-0 text-sm')
																			.html(
																					qbtag);
																	td6
																			.append(span6);
																	$addtr
																			.append(td6);

																	$(
																			'#mainbody')
																			.append(
																					$addtr);

																}
															},
															error : function(
																	data) {
																alert("QBoard ajax 에러");
															}
														});

												$("#One").attr("class",
														"page-item active");
												$("#Two").attr("class",
														"page-item");
												$("#Three").attr("class",
														"page-item");

												//pagelength가 3N+1인 경우	
											} else if (pagelength % 3 == 1) {

												$("#One").children("a").html(
														pagelength);
												$("#Two").children("a").html(
														pagelength + 1);
												$("#Three").children("a").html(
														pagelength + 2);

												var myno = $("#One").children(
														"a").html();
												myno = parseInt(myno) - 1;
												$("#mainbody").children("tr")
														.remove();

												var renewURL = $(location)
														.attr('protocol')
														+ "//"
														+ $(location).attr(
																'host')
														+ ""
														+ $(location).attr(
																'pathname');
												renewURL += '?myno=' + myno;
												history.pushState(null, null,
														renewURL);

												$
														.ajax({
															url : "ajaxQBoard.do?myno="
																	+ myno,
															type : "GET",
															dataType : "json",
															success : function(
																	data) {
																var res = data.res;

																for (var i = 0; i < data.dtoss.length; i++) {
																	var qbseq = data.dtoss[i]["qbseq"];
																	var memberid = data.dtoss[i]["memberid"];
																	var title = data.dtoss[i]["title"];
																	var qbcount = data.dtoss[i]["qbcount"];
																	var qbtag = data.dtoss[i]["qbtag"];
																	var qqdate = data.dtoss[i]["qbdate"];

																	var date = new Date();
																	var dateyear = date
																			.getFullYear(); //year
																	var month = (1 + date
																			.getMonth());
																	month = month >= 10 ? month
																			: '0'
																					+ month; //month 두자리 저장
																	var day = date
																			.getDate();
																	day = day >= 10 ? day
																			: '0'
																					+ day; //day 두자리로 저장

																	var qdate = new Date(
																			qqdate);
																	var qdateyear = qdate
																			.getFullYear(); //year
																	var qmonth = (1 + qdate
																			.getMonth());
																	qmonth = qmonth >= 10 ? qmonth
																			: '0'
																					+ qmonth; //month 두자리 저장
																	var qday = qdate
																			.getDate();
																	qday = qday >= 10 ? qday
																			: '0'
																					+ qday; //day 두자리로 저장

																	var qhour = qdate
																			.getHours();
																	qhour = qhour >= 10 ? qhour
																			: '0'
																					+ qhour;
																	var qmin = qdate
																			.getMinutes();
																	qmin = qmin >= 10 ? qmin
																			: '0'
																					+ qmin;
																	if ((dateyear == qdateyear)
																			&& (month == qmonth)
																			&& (day == qday)) {
																		var qbdate = qhour
																				+ ":"
																				+ qmin;
																	} else {
																		var qbdate = qdateyear
																				+ "."
																				+ qmonth
																				+ "."
																				+ qday
																				+ ".";
																	}

																	var $addtr = $('<tr>');

																	var td1 = $('<td>');
																	td1
																			.addClass('tdseq');
																	var span1 = $(
																			'<span>')
																			.addClass(
																					'mb-0 text-sm')
																			.html(
																					qbseq);
																	td1
																			.append(span1);
																	$addtr
																			.append(td1);

																	var td2 = $('<th>');
																	td2
																			.attr(
																					'scope',
																					'row')
																			.addClass(
																					'dtotitle')
																			.attr(
																					'id',
																					'pdtotitle');
																	var span2 = $(
																			'<span>')
																			.addClass(
																					'mb-0 text-sm')
																			.attr(
																					'id',
																					'dtotitle')
																			.html(
																					title);
																	td2
																			.append(span2);
																	$addtr
																			.append(td2);

																	var td3 = $('<td>');
																	td3
																			.addClass('dtomemberid');
																	var span3 = $(
																			'<span>')
																			.addClass(
																					'mb-0 text-sm')
																			.html(
																					memberid);
																	td3
																			.append(span3);
																	$addtr
																			.append(td3);

																	var td4 = $('<td>');
																	td4
																			.addClass('dtoqbdate');
																	var span4 = $(
																			'<span>')
																			.addClass(
																					'mb-0 text-sm')
																			.html(
																					qbdate);
																	td4
																			.append(span4);
																	$addtr
																			.append(td4);

																	var td5 = $('<td>');
																	td5
																			.addClass('dtoqbcount');
																	var span5 = $(
																			'<span>')
																			.addClass(
																					'mb-0 text-sm')
																			.html(
																					qbcount);
																	td5
																			.append(span5);
																	$addtr
																			.append(td5);

																	var td6 = $('<td>');
																	td6
																			.addClass('dtoqbtag');
																	var span6 = $(
																			'<span>')
																			.addClass(
																					'mb-0 text-sm')
																			.html(
																					qbtag);
																	td6
																			.append(span6);
																	$addtr
																			.append(td6);

																	$(
																			'#mainbody')
																			.append(
																					$addtr);

																}
															},
															error : function(
																	data) {
																alert("QBoard ajax 에러");
															}
														});

												$("#One").attr("class",
														"page-item active");
												$("#Two").attr("class",
														"page-item");
												$("#Three").attr("class",
														"page-item");
												$("#Two").hide();
												$("#Three").hide();

												//pagelength가 3N+2인 경우	
											} else if (pagelength % 3 == 2) {

												$("#One").children("a").html(
														pagelength - 1);
												$("#Two").children("a").html(
														pagelength);
												$("#Three").children("a").html(
														pagelength + 1);

												var myno = $("#One").children(
														"a").html();
												myno = parseInt(myno) - 1;
												$("#mainbody").children("tr")
														.remove();

												var renewURL = $(location)
														.attr('protocol')
														+ "//"
														+ $(location).attr(
																'host')
														+ ""
														+ $(location).attr(
																'pathname');
												renewURL += '?myno=' + myno;
												history.pushState(null, null,
														renewURL);

												$
														.ajax({
															url : "ajaxQBoard.do?myno="
																	+ myno,
															type : "GET",
															dataType : "json",
															success : function(
																	data) {
																var res = data.res;

																for (var i = 0; i < data.dtoss.length; i++) {
																	var qbseq = data.dtoss[i]["qbseq"];
																	var memberid = data.dtoss[i]["memberid"];
																	var title = data.dtoss[i]["title"];
																	var qbcount = data.dtoss[i]["qbcount"];
																	var qbtag = data.dtoss[i]["qbtag"];
																	var qqdate = data.dtoss[i]["qbdate"];

																	var date = new Date();
																	var dateyear = date
																			.getFullYear(); //year
																	var month = (1 + date
																			.getMonth());
																	month = month >= 10 ? month
																			: '0'
																					+ month; //month 두자리 저장
																	var day = date
																			.getDate();
																	day = day >= 10 ? day
																			: '0'
																					+ day; //day 두자리로 저장

																	var qdate = new Date(
																			qqdate);
																	var qdateyear = qdate
																			.getFullYear(); //year
																	var qmonth = (1 + qdate
																			.getMonth());
																	qmonth = qmonth >= 10 ? qmonth
																			: '0'
																					+ qmonth; //month 두자리 저장
																	var qday = qdate
																			.getDate();
																	qday = qday >= 10 ? qday
																			: '0'
																					+ qday; //day 두자리로 저장

																	var qhour = qdate
																			.getHours();
																	qhour = qhour >= 10 ? qhour
																			: '0'
																					+ qhour;
																	var qmin = qdate
																			.getMinutes();
																	qmin = qmin >= 10 ? qmin
																			: '0'
																					+ qmin;
																	if ((dateyear == qdateyear)
																			&& (month == qmonth)
																			&& (day == qday)) {
																		var qbdate = qhour
																				+ ":"
																				+ qmin;
																	} else {
																		var qbdate = qdateyear
																				+ "."
																				+ qmonth
																				+ "."
																				+ qday
																				+ ".";
																	}

																	var $addtr = $('<tr>');

																	var td1 = $('<td>');
																	td1
																			.addClass('tdseq');
																	var span1 = $(
																			'<span>')
																			.addClass(
																					'mb-0 text-sm')
																			.html(
																					qbseq);
																	td1
																			.append(span1);
																	$addtr
																			.append(td1);

																	var td2 = $('<th>');
																	td2
																			.attr(
																					'scope',
																					'row')
																			.addClass(
																					'dtotitle')
																			.attr(
																					'id',
																					'pdtotitle');
																	var span2 = $(
																			'<span>')
																			.addClass(
																					'mb-0 text-sm')
																			.attr(
																					'id',
																					'dtotitle')
																			.html(
																					title);
																	td2
																			.append(span2);
																	$addtr
																			.append(td2);

																	var td3 = $('<td>');
																	td3
																			.addClass('dtomemberid');
																	var span3 = $(
																			'<span>')
																			.addClass(
																					'mb-0 text-sm')
																			.html(
																					memberid);
																	td3
																			.append(span3);
																	$addtr
																			.append(td3);

																	var td4 = $('<td>');
																	td4
																			.addClass('dtoqbdate');
																	var span4 = $(
																			'<span>')
																			.addClass(
																					'mb-0 text-sm')
																			.html(
																					qbdate);
																	td4
																			.append(span4);
																	$addtr
																			.append(td4);

																	var td5 = $('<td>');
																	td5
																			.addClass('dtoqbcount');
																	var span5 = $(
																			'<span>')
																			.addClass(
																					'mb-0 text-sm')
																			.html(
																					qbcount);
																	td5
																			.append(span5);
																	$addtr
																			.append(td5);

																	var td6 = $('<td>');
																	td6
																			.addClass('dtoqbtag');
																	var span6 = $(
																			'<span>')
																			.addClass(
																					'mb-0 text-sm')
																			.html(
																					qbtag);
																	td6
																			.append(span6);
																	$addtr
																			.append(td6);

																	$(
																			'#mainbody')
																			.append(
																					$addtr);

																}
															},
															error : function(
																	data) {
																alert("QBoard ajax 에러");
															}
														});

												$("#One").attr("class",
														"page-item active");
												$("#Two").attr("class",
														"page-item");
												$("#Three").attr("class",
														"page-item");
												$("#Three").hide();
											}
										}
									}
								}
							});

			//----------------------------------------------------------------------------------------------------------
			//  >> 버튼 클릭했을 때의 반응

			$(".pagination")
					.children("li#last")
					.click(
							function() {
								if ($('.active').children('a.page-link').html() == pagelength) {
									return false;
								} else {

									//pagelength가 3의 배수일때
									if (pagelength % 3 == 0) {
										$("#One").children("a").html(
												pagelength - 2);
										$("#Two").children("a").html(
												pagelength - 1);
										$("#Three").children("a").html(
												pagelength);

										var myno = $("#Three").children("a")
												.html();
										myno = parseInt(myno) - 1;
										$("#mainbody").children("tr").remove();

										var renewURL = $(location).attr(
												'protocol')
												+ "//"
												+ $(location).attr('host')
												+ ""
												+ $(location).attr('pathname');
										renewURL += '?myno=' + myno;
										history.pushState(null, null, renewURL);

										$
												.ajax({
													url : "ajaxQBoard.do?myno="
															+ myno,
													type : "GET",
													dataType : "json",
													success : function(data) {
														var res = data.res;

														for (var i = 0; i < data.dtoss.length; i++) {
															var qbseq = data.dtoss[i]["qbseq"];
															var memberid = data.dtoss[i]["memberid"];
															var title = data.dtoss[i]["title"];
															var qbcount = data.dtoss[i]["qbcount"];
															var qbtag = data.dtoss[i]["qbtag"];
															var qqdate = data.dtoss[i]["qbdate"];

															var date = new Date();
															var dateyear = date
																	.getFullYear(); //year
															var month = (1 + date
																	.getMonth());
															month = month >= 10 ? month
																	: '0'
																			+ month; //month 두자리 저장
															var day = date
																	.getDate();
															day = day >= 10 ? day
																	: '0' + day; //day 두자리로 저장

															var qdate = new Date(
																	qqdate);
															var qdateyear = qdate
																	.getFullYear(); //year
															var qmonth = (1 + qdate
																	.getMonth());
															qmonth = qmonth >= 10 ? qmonth
																	: '0'
																			+ qmonth; //month 두자리 저장
															var qday = qdate
																	.getDate();
															qday = qday >= 10 ? qday
																	: '0'
																			+ qday; //day 두자리로 저장

															var qhour = qdate
																	.getHours();
															qhour = qhour >= 10 ? qhour
																	: '0'
																			+ qhour;
															var qmin = qdate
																	.getMinutes();
															qmin = qmin >= 10 ? qmin
																	: '0'
																			+ qmin;
															if ((dateyear == qdateyear)
																	&& (month == qmonth)
																	&& (day == qday)) {
																var qbdate = qhour
																		+ ":"
																		+ qmin;
															} else {
																var qbdate = qdateyear
																		+ "."
																		+ qmonth
																		+ "."
																		+ qday
																		+ ".";
															}

															var $addtr = $('<tr>');

															var td1 = $('<td>');
															td1
																	.addClass('tdseq');
															var span1 = $(
																	'<span>')
																	.addClass(
																			'mb-0 text-sm')
																	.html(qbseq);
															td1.append(span1);
															$addtr.append(td1);

															var td2 = $('<th>');
															td2
																	.attr(
																			'scope',
																			'row')
																	.addClass(
																			'dtotitle')
																	.attr('id',
																			'pdtotitle');
															var span2 = $(
																	'<span>')
																	.addClass(
																			'mb-0 text-sm')
																	.attr('id',
																			'dtotitle')
																	.html(title);
															td2.append(span2);
															$addtr.append(td2);

															var td3 = $('<td>');
															td3
																	.addClass('dtomemberid');
															var span3 = $(
																	'<span>')
																	.addClass(
																			'mb-0 text-sm')
																	.html(
																			memberid);
															td3.append(span3);
															$addtr.append(td3);

															var td4 = $('<td>');
															td4
																	.addClass('dtoqbdate');
															var span4 = $(
																	'<span>')
																	.addClass(
																			'mb-0 text-sm')
																	.html(
																			qbdate);
															td4.append(span4);
															$addtr.append(td4);

															var td5 = $('<td>');
															td5
																	.addClass('dtoqbcount');
															var span5 = $(
																	'<span>')
																	.addClass(
																			'mb-0 text-sm')
																	.html(
																			qbcount);
															td5.append(span5);
															$addtr.append(td5);

															var td6 = $('<td>');
															td6
																	.addClass('dtoqbtag');
															var span6 = $(
																	'<span>')
																	.addClass(
																			'mb-0 text-sm')
																	.html(qbtag);
															td6.append(span6);
															$addtr.append(td6);

															$('#mainbody')
																	.append(
																			$addtr);

														}
													},
													error : function(data) {
														alert("QBoard ajax 에러");
													}
												});

										$("#One").attr("class", "page-item");
										$("#Two").attr("class", "page-item");
										$("#Three").attr("class",
												"page-item active");

										//pagelength가 3N+1인 경우	
									} else if (pagelength % 3 == 1) {

										$("#One").children("a")
												.html(pagelength);
										$("#Two").children("a").html(
												pagelength + 1);
										$("#Three").children("a").html(
												pagelength + 2);

										var myno = $("#One").children("a")
												.html();
										myno = parseInt(myno) - 1;
										$("#mainbody").children("tr").remove();

										var renewURL = $(location).attr(
												'protocol')
												+ "//"
												+ $(location).attr('host')
												+ ""
												+ $(location).attr('pathname');
										renewURL += '?myno=' + myno;
										history.pushState(null, null, renewURL);

										$
												.ajax({
													url : "ajaxQBoard.do?myno="
															+ myno,
													type : "GET",
													dataType : "json",
													success : function(data) {
														var res = data.res;

														for (var i = 0; i < data.dtoss.length; i++) {
															var qbseq = data.dtoss[i]["qbseq"];
															var memberid = data.dtoss[i]["memberid"];
															var title = data.dtoss[i]["title"];
															var qbcount = data.dtoss[i]["qbcount"];
															var qbtag = data.dtoss[i]["qbtag"];
															var qqdate = data.dtoss[i]["qbdate"];

															var date = new Date();
															var dateyear = date
																	.getFullYear(); //year
															var month = (1 + date
																	.getMonth());
															month = month >= 10 ? month
																	: '0'
																			+ month; //month 두자리 저장
															var day = date
																	.getDate();
															day = day >= 10 ? day
																	: '0' + day; //day 두자리로 저장

															var qdate = new Date(
																	qqdate);
															var qdateyear = qdate
																	.getFullYear(); //year
															var qmonth = (1 + qdate
																	.getMonth());
															qmonth = qmonth >= 10 ? qmonth
																	: '0'
																			+ qmonth; //month 두자리 저장
															var qday = qdate
																	.getDate();
															qday = qday >= 10 ? qday
																	: '0'
																			+ qday; //day 두자리로 저장

															var qhour = qdate
																	.getHours();
															qhour = qhour >= 10 ? qhour
																	: '0'
																			+ qhour;
															var qmin = qdate
																	.getMinutes();
															qmin = qmin >= 10 ? qmin
																	: '0'
																			+ qmin;
															if ((dateyear == qdateyear)
																	&& (month == qmonth)
																	&& (day == qday)) {
																var qbdate = qhour
																		+ ":"
																		+ qmin;
															} else {
																var qbdate = qdateyear
																		+ "."
																		+ qmonth
																		+ "."
																		+ qday
																		+ ".";
															}

															var $addtr = $('<tr>');

															var td1 = $('<td>');
															td1
																	.addClass('tdseq');
															var span1 = $(
																	'<span>')
																	.addClass(
																			'mb-0 text-sm')
																	.html(qbseq);
															td1.append(span1);
															$addtr.append(td1);

															var td2 = $('<th>');
															td2
																	.attr(
																			'scope',
																			'row')
																	.addClass(
																			'dtotitle')
																	.attr('id',
																			'pdtotitle');
															var span2 = $(
																	'<span>')
																	.addClass(
																			'mb-0 text-sm')
																	.attr('id',
																			'dtotitle')
																	.html(title);
															td2.append(span2);
															$addtr.append(td2);

															var td3 = $('<td>');
															td3
																	.addClass('dtomemberid');
															var span3 = $(
																	'<span>')
																	.addClass(
																			'mb-0 text-sm')
																	.html(
																			memberid);
															td3.append(span3);
															$addtr.append(td3);

															var td4 = $('<td>');
															td4
																	.addClass('dtoqbdate');
															var span4 = $(
																	'<span>')
																	.addClass(
																			'mb-0 text-sm')
																	.html(
																			qbdate);
															td4.append(span4);
															$addtr.append(td4);

															var td5 = $('<td>');
															td5
																	.addClass('dtoqbcount');
															var span5 = $(
																	'<span>')
																	.addClass(
																			'mb-0 text-sm')
																	.html(
																			qbcount);
															td5.append(span5);
															$addtr.append(td5);

															var td6 = $('<td>');
															td6
																	.addClass('dtoqbtag');
															var span6 = $(
																	'<span>')
																	.addClass(
																			'mb-0 text-sm')
																	.html(qbtag);
															td6.append(span6);
															$addtr.append(td6);

															$('#mainbody')
																	.append(
																			$addtr);

														}
													},
													error : function(data) {
														alert("QBoard ajax 에러");
													}
												});

										$("#One").attr("class",
												"page-item active");
										$("#Two").attr("class", "page-item");
										$("#Three").attr("class", "page-item");
										$("#Two").hide();
										$("#Three").hide();

										//pagelength가 3N+2인 경우	
									} else if (pagelength % 3 == 2) {

										$("#One").children("a").html(
												pagelength - 1);
										$("#Two").children("a")
												.html(pagelength);
										$("#Three").children("a").html(
												pagelength + 1);

										var myno = $("#Two").children("a")
												.html();
										myno = parseInt(myno) - 1;
										$("#mainbody").children("tr").remove();

										var renewURL = $(location).attr(
												'protocol')
												+ "//"
												+ $(location).attr('host')
												+ ""
												+ $(location).attr('pathname');
										renewURL += '?myno=' + myno;
										history.pushState(null, null, renewURL);

										$
												.ajax({
													url : "ajaxQBoard.do?myno="
															+ myno,
													type : "GET",
													dataType : "json",
													success : function(data) {
														var res = data.res;

														for (var i = 0; i < data.dtoss.length; i++) {
															var qbseq = data.dtoss[i]["qbseq"];
															var memberid = data.dtoss[i]["memberid"];
															var title = data.dtoss[i]["title"];
															var qbcount = data.dtoss[i]["qbcount"];
															var qbtag = data.dtoss[i]["qbtag"];
															var qqdate = data.dtoss[i]["qbdate"];

															var date = new Date();
															var dateyear = date
																	.getFullYear(); //year
															var month = (1 + date
																	.getMonth());
															month = month >= 10 ? month
																	: '0'
																			+ month; //month 두자리 저장
															var day = date
																	.getDate();
															day = day >= 10 ? day
																	: '0' + day; //day 두자리로 저장

															var qdate = new Date(
																	qqdate);
															var qdateyear = qdate
																	.getFullYear(); //year
															var qmonth = (1 + qdate
																	.getMonth());
															qmonth = qmonth >= 10 ? qmonth
																	: '0'
																			+ qmonth; //month 두자리 저장
															var qday = qdate
																	.getDate();
															qday = qday >= 10 ? qday
																	: '0'
																			+ qday; //day 두자리로 저장

															var qhour = qdate
																	.getHours();
															qhour = qhour >= 10 ? qhour
																	: '0'
																			+ qhour;
															var qmin = qdate
																	.getMinutes();
															qmin = qmin >= 10 ? qmin
																	: '0'
																			+ qmin;
															if ((dateyear == qdateyear)
																	&& (month == qmonth)
																	&& (day == qday)) {
																var qbdate = qhour
																		+ ":"
																		+ qmin;
															} else {
																var qbdate = qdateyear
																		+ "."
																		+ qmonth
																		+ "."
																		+ qday
																		+ ".";
															}

															var $addtr = $('<tr>');

															var td1 = $('<td>');
															td1
																	.addClass('tdseq');
															var span1 = $(
																	'<span>')
																	.addClass(
																			'mb-0 text-sm')
																	.html(qbseq);
															td1.append(span1);
															$addtr.append(td1);

															var td2 = $('<th>');
															td2
																	.attr(
																			'scope',
																			'row')
																	.addClass(
																			'dtotitle')
																	.attr('id',
																			'pdtotitle');
															var span2 = $(
																	'<span>')
																	.addClass(
																			'mb-0 text-sm')
																	.attr('id',
																			'dtotitle')
																	.html(title);
															td2.append(span2);
															$addtr.append(td2);

															var td3 = $('<td>');
															td3
																	.addClass('dtomemberid');
															var span3 = $(
																	'<span>')
																	.addClass(
																			'mb-0 text-sm')
																	.html(
																			memberid);
															td3.append(span3);
															$addtr.append(td3);

															var td4 = $('<td>');
															td4
																	.addClass('dtoqbdate');
															var span4 = $(
																	'<span>')
																	.addClass(
																			'mb-0 text-sm')
																	.html(
																			qbdate);
															td4.append(span4);
															$addtr.append(td4);

															var td5 = $('<td>');
															td5
																	.addClass('dtoqbcount');
															var span5 = $(
																	'<span>')
																	.addClass(
																			'mb-0 text-sm')
																	.html(
																			qbcount);
															td5.append(span5);
															$addtr.append(td5);

															var td6 = $('<td>');
															td6
																	.addClass('dtoqbtag');
															var span6 = $(
																	'<span>')
																	.addClass(
																			'mb-0 text-sm')
																	.html(qbtag);
															td6.append(span6);
															$addtr.append(td6);

															$('#mainbody')
																	.append(
																			$addtr);

														}
													},
													error : function(data) {
														alert("QBoard ajax 에러");
													}
												});

										$("#One").attr("class", "page-item");
										$("#Two").attr("class",
												"page-item active");
										$("#Three").attr("class", "page-item");
										$("#Three").hide();
									}
								}
							});

			//----------------------------------------------------------------------------------------------------------
			//  1번 버튼 클릭했을 때의 반응

			$("#One")
					.click(
							function() {
								var myno = $("#One").children("a").html();
								myno = myno - '1';
								$("#mainbody").children("tr").remove();

								var renewURL = $(location).attr('protocol')
										+ "//" + $(location).attr('host') + ""
										+ $(location).attr('pathname');
								renewURL += '?myno=' + myno;
								history.pushState(null, null, renewURL);

								$
										.ajax({
											url : "ajaxQBoard.do?myno=" + myno,
											type : "GET",
											dataType : "json",
											success : function(data) {
												var res = data.res;

												for (var i = 0; i < data.dtoss.length; i++) {
													var qbseq = data.dtoss[i]["qbseq"];
													var memberid = data.dtoss[i]["memberid"];
													var title = data.dtoss[i]["title"];
													var qbcount = data.dtoss[i]["qbcount"];
													var qbtag = data.dtoss[i]["qbtag"];
													var qqdate = data.dtoss[i]["qbdate"];

													var date = new Date();
													var dateyear = date
															.getFullYear(); //year
													var month = (1 + date
															.getMonth());
													month = month >= 10 ? month
															: '0' + month; //month 두자리 저장
													var day = date.getDate();
													day = day >= 10 ? day : '0'
															+ day; //day 두자리로 저장

													var qdate = new Date(qqdate);
													var qdateyear = qdate
															.getFullYear(); //year
													var qmonth = (1 + qdate
															.getMonth());
													qmonth = qmonth >= 10 ? qmonth
															: '0' + qmonth; //month 두자리 저장
													var qday = qdate.getDate();
													qday = qday >= 10 ? qday
															: '0' + qday; //day 두자리로 저장

													var qhour = qdate
															.getHours();
													qhour = qhour >= 10 ? qhour
															: '0' + qhour;
													var qmin = qdate
															.getMinutes();
													qmin = qmin >= 10 ? qmin
															: '0' + qmin;
													if ((dateyear == qdateyear)
															&& (month == qmonth)
															&& (day == qday)) {
														var qbdate = qhour
																+ ":" + qmin;
													} else {
														var qbdate = qdateyear
																+ "." + qmonth
																+ "." + qday
																+ ".";
													}

													var $addtr = $('<tr>');

													var td1 = $('<td>');
													td1.addClass('tdseq');
													var span1 = $('<span>')
															.addClass(
																	'mb-0 text-sm')
															.html(qbseq);
													td1.append(span1);
													$addtr.append(td1);

													var td2 = $('<th>');
													td2
															.attr('scope',
																	'row')
															.addClass(
																	'dtotitle')
															.attr('id',
																	'pdtotitle');
													var span2 = $('<span>')
															.addClass(
																	'mb-0 text-sm')
															.attr('id',
																	'dtotitle')
															.html(title);
													td2.append(span2);
													$addtr.append(td2);

													var td3 = $('<td>');
													td3.addClass('dtomemberid');
													var span3 = $('<span>')
															.addClass(
																	'mb-0 text-sm')
															.html(memberid);
													td3.append(span3);
													$addtr.append(td3);

													var td4 = $('<td>');
													td4.addClass('dtoqbdate');
													var span4 = $('<span>')
															.addClass(
																	'mb-0 text-sm')
															.html(qbdate);
													td4.append(span4);
													$addtr.append(td4);

													var td5 = $('<td>');
													td5.addClass('dtoqbcount');
													var span5 = $('<span>')
															.addClass(
																	'mb-0 text-sm')
															.html(qbcount);
													td5.append(span5);
													$addtr.append(td5);

													var td6 = $('<td>');
													td6.addClass('dtoqbtag');
													var span6 = $('<span>')
															.addClass(
																	'mb-0 text-sm')
															.html(qbtag);
													td6.append(span6);
													$addtr.append(td6);

													$('#mainbody').append(
															$addtr);

												}
											},
											error : function(data) {
												alert("QBoard ajax 에러");
											}
										});
								$("#One").attr("class", "page-item");
								$("#Two").attr("class", "page-item");
								$("#Three").attr("class", "page-item");
								$("#One").attr("class", "page-item active");
							});

			//----------------------------------------------------------------------------------------------------------
			//  2번 버튼 클릭했을 때의 반응

			$("#Two")
					.click(
							function() {
								var myno = $("#Two").children("a").html();
								myno = myno - '1';
								$("#mainbody").children("tr").remove();

								var renewURL = $(location).attr('protocol')
										+ "//" + $(location).attr('host') + ""
										+ $(location).attr('pathname');
								renewURL += '?myno=' + myno;
								history.pushState(null, null, renewURL);

								$
										.ajax({
											url : "ajaxQBoard.do?myno=" + myno,
											type : "GET",
											dataType : "json",
											success : function(data) {
												var res = data.res;

												for (var i = 0; i < data.dtoss.length; i++) {

													var qbseq = data.dtoss[i]["qbseq"];
													var memberid = data.dtoss[i]["memberid"];
													var title = data.dtoss[i]["title"];
													var qbcount = data.dtoss[i]["qbcount"];
													var qbtag = data.dtoss[i]["qbtag"];
													var qqdate = data.dtoss[i]["qbdate"];

													var date = new Date();
													var dateyear = date
															.getFullYear(); //year
													var month = (1 + date
															.getMonth());
													month = month >= 10 ? month
															: '0' + month; //month 두자리 저장
													var day = date.getDate();
													day = day >= 10 ? day : '0'
															+ day; //day 두자리로 저장

													var qdate = new Date(qqdate);
													var qdateyear = qdate
															.getFullYear(); //year
													var qmonth = (1 + qdate
															.getMonth());
													qmonth = qmonth >= 10 ? qmonth
															: '0' + qmonth; //month 두자리 저장
													var qday = qdate.getDate();
													qday = qday >= 10 ? qday
															: '0' + qday; //day 두자리로 저장

													var qhour = qdate
															.getHours();
													qhour = qhour >= 10 ? qhour
															: '0' + qhour;
													var qmin = qdate
															.getMinutes();
													qmin = qmin >= 10 ? qmin
															: '0' + qmin;

													if ((dateyear == qdateyear)
															&& (month == qmonth)
															&& (day == qday)) {
														var qbdate = qhour
																+ ":" + qmin;
													} else {
														var qbdate = qdateyear
																+ "." + qmonth
																+ "." + qday
																+ ".";
													}

													var $addtr = $('<tr>');

													var td1 = $('<td>');
													td1.addClass('tdseq');
													var span1 = $('<span>')
															.addClass(
																	'mb-0 text-sm')
															.html(qbseq);
													td1.append(span1);
													$addtr.append(td1);

													var td2 = $('<th>');
													td2
															.attr('scope',
																	'row')
															.addClass(
																	'dtotitle')
															.attr('id',
																	'pdtotitle');
													var span2 = $('<span>')
															.addClass(
																	'mb-0 text-sm')
															.attr('id',
																	'dtotitle')
															.html(title);
													td2.append(span2);
													$addtr.append(td2);

													var td3 = $('<td>');
													td3.addClass('dtomemberid');
													var span3 = $('<span>')
															.addClass(
																	'mb-0 text-sm')
															.html(memberid);
													td3.append(span3);
													$addtr.append(td3);

													var td4 = $('<td>');
													td4.addClass('dtoqbdate');
													var span4 = $('<span>')
															.addClass(
																	'mb-0 text-sm')
															.html(qbdate);
													td4.append(span4);
													$addtr.append(td4);

													var td5 = $('<td>');
													td5.addClass('dtoqbcount');
													var span5 = $('<span>')
															.addClass(
																	'mb-0 text-sm')
															.html(qbcount);
													td5.append(span5);
													$addtr.append(td5);

													var td6 = $('<td>');
													td6.addClass('dtoqbtag');
													var span6 = $('<span>')
															.addClass('mb-0 text-sm').html(qbtag);
													td6.append(span6);
													$addtr.append(td6);

													$('#mainbody').append($addtr);

												}
											},
											error : function(data) {
												alert("QBoard ajax 에러");
											}
										});
								$("#One").attr("class", "page-item");
								$("#Two").attr("class", "page-item");
								$("#Three").attr("class", "page-item");
								$("#Two").attr("class", "page-item active");
							});

			//----------------------------------------------------------------------------------------------------------
			//  3번 버튼 클릭했을 때의 반응

			$("#Three")
					.click(
							function() {
								var myno = $("#Three").children("a").html();
								myno = myno - '1';
								$("#mainbody").children("tr").remove();

								var renewURL = $(location).attr('protocol')
										+ "//" + $(location).attr('host') + ""
										+ $(location).attr('pathname');
								renewURL += '?myno=' + myno;
								history.pushState(null, null, renewURL);

								$.ajax({
											url : "ajaxQBoard.do?myno=" + myno,
											type : "GET",
											dataType : "json",
											success : function(data) {
												var res = data.res;

												for (var i = 0; i < data.dtoss.length; i++) {
													var qbseq = data.dtoss[i]["qbseq"];
													var memberid = data.dtoss[i]["memberid"];
													var title = data.dtoss[i]["title"];
													var qbcount = data.dtoss[i]["qbcount"];
													var qbtag = data.dtoss[i]["qbtag"];
													var qqdate = data.dtoss[i]["qbdate"];

													var date = new Date();
													var dateyear = date.getFullYear(); //year
													var month = (1 + date.getMonth());
													month = month >= 10 ? month: '0' + month; //month 두자리 저장
													var day = date.getDate();
													day = day >= 10 ? day : '0'+ day; //day 두자리로 저장

													var qdate = new Date(qqdate);
													var qdateyear = qdate.getFullYear(); //year
													var qmonth = (1 + qdate.getMonth());
													qmonth = qmonth >= 10 ? qmonth: '0' + qmonth; //month 두자리 저장
													var qday = qdate.getDate();
													qday = qday >= 10 ? qday: '0' + qday; //day 두자리로 저장

													var qhour = qdate.getHours();
													qhour = qhour >= 10 ? qhour: '0' + qhour;
													var qmin = qdate.getMinutes();
													qmin = qmin >= 10 ? qmin: '0' + qmin;

													if ((dateyear == qdateyear)&& (month == qmonth)&& (day == qday)) {
														var qbdate = qhour+ ":" + qmin;
													} else {
														var qbdate = qdateyear+ "." + qmonth+ "." + qday+ ".";
													}

													var $addtr = $('<tr>');

													var td1 = $('<td>');
													td1.addClass('tdseq');
													var span1 = $('<span>').addClass('mb-0 text-sm').html(qbseq);
													td1.append(span1);
													$addtr.append(td1);

													var td2 = $('<th>');
													td2.attr('scope','row').addClass('dtotitle').attr('id','pdtotitle');
													var span2 = $('<span>').addClass('mb-0 text-sm').attr('id','dtotitle').html(title);
													td2.append(span2);
													$addtr.append(td2);

													var td3 = $('<td>');
													td3.addClass('dtomemberid');
													var span3 = $('<span>').addClass('mb-0 text-sm').html(memberid);
													td3.append(span3);
													$addtr.append(td3);

													var td4 = $('<td>');
													td4.addClass('dtoqbdate');
													var span4 = $('<span>').addClass('mb-0 text-sm').html(qbdate);
													td4.append(span4);
													$addtr.append(td4);

													var td5 = $('<td>');
													td5.addClass('dtoqbcount');
													var span5 = $('<span>').addClass('mb-0 text-sm').html(qbcount);
													td5.append(span5);
													$addtr.append(td5);

													var td6 = $('<td>');
													td6.addClass('dtoqbtag');
													var span6 = $('<span>').addClass('mb-0 text-sm').html(qbtag);
													td6.append(span6);
													$addtr.append(td6);

													$('#mainbody').append($addtr);
												}

											},
											error : function(data) {
												alert("QBoard ajax 에러");
											}
										});
								$("#One").attr("class", "page-item");
								$("#Two").attr("class", "page-item");
								$("#Three").attr("class", "page-item");
								$("#Three").attr("class", "page-item active");

							});

			$('#writeOne').click(function() {
				location.href = 'qnainsertform.do';
			});

		});
		$(document).on("click","#dtotitle",function() {
							var val = $(this).parent().prev().children("span").text();
							var res = ${res};
							var ress = parseInt(res / 5);
							var pagelength = (parseInt(res) % 5 == 0) ? ress: ress + 1;
							location.href = 'qnadetail.do?qbseq=' + val+ "&pagelength=" + pagelength;
						});
	</script>
</body>
</html>