<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<c:set var="appctx" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<title><spring:message code="label.homePageWithChart.title" /></title>
<link rel="icon" type="image/x-icon"
	href="<%=request.getContextPath()%>/resources/chartTheme/favicon.ico" />
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/resources/chartTheme/css_nn/style.css" />
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/resources/chartTheme/css/style.css" />
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/resources/chartTheme/css/bootstrap.min.css" />
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/resources/chartTheme/css/font-awesome.min.css" />
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/resources/chartTheme/css/dashboard-style.css" />
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/resources/chartTheme/css-new/pgallery.css" />
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/resources/chartTheme/css/homePageWithChart.css" />
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/resources/chartTheme/css-new/jquery.dataTables.min.css" />
</head>
<body class="dashboard-page sb-l-o sb-r-c">
	<header
		style="box-shadow: 0 10px 28px 0 rgba(0, 0, 0, 0.2), 0 10px 20px 0 rgba(0, 0, 0, 0.19)">
		<img class="header_img" alt="Header Image"
			src="<%=request.getContextPath()%>/resources/chartTheme/SCDG_header.png"
			width="100%">
	</header>
	<div id="main">
		<div style="text-align: center">
			<div id="page-wrapper"
				style="background: -webkit-linear-gradient(-90deg, #f7b174, #88c181 100%); background-image: -webkit-linear-gradient(-90deg, rgb(247, 177, 116), rgb(136, 193, 129) 100%); background-position-x: initial; background-position-y: initial; background-size: initial; background-repeat-x: initial; background-repeat-y: initial; background-attachment: initial; background-origin: initial; background-clip: initial; background-color: initial;">
				<div class="row">
					<a href="#">
						<p
							style="margin-top: -70px; margin-left: 318px; font-weight: bold; font-size: 16px; color: #000000;">
							<sub data-toggle="modal" data-target="#myModal3"> <spring:message
									code="label.homePageWithChart.appVersion" /></sub>
						</p>
					</a>
					<div class="languageButton-header"
						style="margin-top: 0px; margin-right: 5px;">
						<span id="rbtnListLanguage" class="radio-list"> <a
							id="rbtnListLanguage_0" href="?lang=en"
							class="lang-en lang-select" style="color: #333"> <label
								for="rbtnListLanguage_0" style="background-image: none;"><spring:message
										code="label.lang.en" /></label>
						</a> <a id="rbtnListLanguage_1" href="?lang=indic"
							class="lang-en lang-select" style="color: #333"> <label
								for="rbtnListLanguage_1"><spring:message
										code="label.lang.indic" /></label></span>
					</div>
				</div>

				<div class="row">
					<div class="col-md-12">
						<div class="card">
							<div style="text-align: center">
								<h2
									style="font-weight: 800; font-size: 23px; font-family: Montserrat, sans-serif; -webkit-font-smoothing: antialiased; text-rendering: optimizeLegibility; color: #000;">
									<spring:message code="label.homePageWithChart.dashBoardHeading" />
								</h2>
							</div>
							<div class="btnn">
								<a href="#" class="btn"
									onclick="setIframeSrc('#registrationIframe')"
									data-toggle="modal" data-target="#myModal1"><spring:message
										code="label.homePageWithChart.login-registration" /></a>
							</div>
						</div>
					</div>
				</div>

				<div class="row" style="margin-top: -20px;">
					<div class="row wow fadeInDown" data-wow-duration="2s"
						id="mainCount">
						<div class="col-lg-3 col-md-6 dataBoxHover">
							<div class="panel orange">
								<em class="fa  fa-android fa-4x"></em>
								<div class="panel-heading">
									<div class="row">
										<div id="pendency" class="col-xs-9 text-left">
											<div>
												<a href="javascript:void(0);" style="text-decoration: none;"><h3
														id="total_pending1" data-tag="">
														${userStats.integratedApps}<span
															class="count_class counter"></span>
													</h3></a>
											</div>
											<div style="margin-top: -32px; margin-left: 50px;">
												<strong><spring:message
														code="label.homePageWithChart.integratedApp"
														var="integratedAppLabel" />${integratedAppLabel}</strong>
											</div>
										</div>
									</div>
								</div>
							</div>

						</div>
						<div class="col-lg-3 col-md-6 dataBoxHover">
							<div class="panel pink">
								<em class="fa  fa-users fa-4x"></em>
								<div class="panel-heading">
									<div class="row">
										<div class="col-xs-9 text-left">
											<div>
												<a href="javascript:void(0);" style="text-decoration: none;"><h3
														id="pendingcomplience2">
														${userStats.activeUsers}<span class="count_class counter"></span>
													</h3></a>
											</div>
											<div style="margin-top: -32px; margin-left: 50px;">
												<strong><spring:message
														code="label.homePageWithChart.registeredUser"
														var="registeredUserLabel" />${registeredUserLabel}</strong>
											</div>
										</div>
									</div>
								</div>
							</div>

						</div>
						<div class="col-lg-3 col-md-6 dataBoxHover">
							<div class="panel tar">
								<em class="fa  fa-user fa-4x"></em>
								<div class="panel-heading">
									<div class="row">
										<div class="col-xs-9 text-left">
											<div>
												<a href="javascript:void(0);" style="text-decoration: none;"><h3
														id="fInactiveUsers">
														${userStats.inactiveUsers}<span
															class="count_class counter"> </span>
													</h3></a>
											</div>
											<div style="margin-top: -32px; margin-left: 50px;">
												<strong><spring:message
														code="label.homePageWithChart.inactiveUser"
														var="inactiveUserLabel" />${inactiveUserLabel}</strong>
											</div>
										</div>
									</div>
								</div>
							</div>

						</div>
						<div class="col-lg-3 col-md-6">
							<div class="panel yellow">
								<em class="fa  fa-calendar fa-4x"></em>
								<div class="panel-heading">
									<div class="row">
										<div class="col-xs-9 text-left">
											<div>
												<a href="javascript:void(0);" style="text-decoration: none;"><h3
														id="#">
														${userStats.activeSessions}<span
															class="count_class counter"></span>
													</h3></a>
											</div>
											<div style="margin-top: -32px; margin-left: 50px;">
												<strong><spring:message
														code="label.homePageWithChart.activeUser"
														var="activeUserLabel" />${activeUserLabel}</strong>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>

					<div class="tab-content"
						style="border-radius: 10px; margin: 10px, 20px, 10px, 20px !important;">
						<div role="tabpanel" class="tab-pane active" id="home">
							<div class="container-fluid" id="pending-div">
								<div class="col-md-12 wow slideInLeft graphWrapper"
									data-wow-duration="4s" style="min-height: auto">
									<div class="row popupHeader">
										<div class="col-md-6">
											<div style="text-align: center"></div>
										</div>
										<div class="col-md-6">
											<div style="text-align: center"></div>
										</div>
									</div>
									<div class="col-md-6">
										<div id="drill" class="requirement "
											style="border: 4px solid #7e7575; padding: 4px 0px; background-size: cover; text-align: center; height: 350px; overflow-x: scroll;">
											<canvas id="myChart" width="544" height="298"></canvas>
										</div>

									</div>
									<div class="col-md-6">
										<div id="drill" class="requirement "
											style="border: 4px solid #7e7575; padding: 4px 0px; background-size: cover; text-align: center; height: 350px; overflow-x: scroll;">
											<canvas id="myChart1" width="544" height="252"></canvas>
										</div>
									</div>
								</div>
							</div>
						</div>

						<footer class="main-footer text-center"
							style="border-radius: 10px; margin: 10px, 20px, 10px, 20px !important; padding: 0px; margin-left: 0px; color: #fff; background-color: #343A40; font-size: 12px;">
							<spring:message code="label.homePageWithChart.footer" />

							<p style="margin: 0">
								<a href="#"><span data-toggle="modal"
									data-target="#myModal4"><spring:message
											code="label.homePageWithChart.helpdesk" /></span></a>&nbsp;&nbsp;|&nbsp;
								<a href="websitePolicy.html"> <span><spring:message
											code="label.homePageWithChart.websitePolicy" /></span></a>&nbsp;&nbsp;|&nbsp;
								<a href="passwordPolicy.html"> <span><spring:message
											code="label.homePageWithChart.passwordPolicy" /></span></a>&nbsp;&nbsp;|&nbsp;
								<span><spring:message code="label.homePageWithChart.faq" /></span>&nbsp;&nbsp;|&nbsp;
								<span><spring:message
										code="label.homePageWithChart.sitemap" /></span>
							</p>
						</footer>
					</div>
				</div>

			</div>
		</div>
	</div>
	<div class="modal fade" id="myModal1" tabindex="-1" role="dialog"
		aria-labelledby="myLargeModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-md">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">×</button>

				</div>
				<div class="modal-body">
					<img id="loader2"
						src="<%=request.getContextPath()%>/resources/chartTheme/images/iframeLoading.gif"
						width="36" height="36" alt="loading gif" />
					<iframe id="registrationIframe" title="registrationPage"
						style="width: 100%; overflow: hidden; border: 0;" src="#"></iframe>
				</div>
			</div>
		</div>
	</div>

	<!-- version 1.1 -->
	<div class="modal fade" id="myModal3" tabindex="-1" role="dialog"
		aria-labelledby="myLargeModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-md">
			<div class="modal-content">
				<div class="modal-header">
					<small class="card-title" style="float: left; color: #ffffff;"><spring:message
							code="label.homePageWithChart.releaseNoteHeading" /></small>

					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true"
						style="float: right; font-size: 21px; font-weight: 700; line-height: 1; color: #d30b0b; text-shadow: 0 1px 0 #fff; opacity: 0.6;">×</button>
				</div>
				<div class="modal-body">
					<spring:message code="label.homePageWithChart.search"
						var="searchLabel" />
					<form class="example" action="#"
						style="margin: auto; max-width: 300px; padding: 0px; float: right; border: 0px; margin-bottom: 5px; margin-top: -11px;">
						<input type="text" placeholder="${searchLabel}" name="search2"
							style="padding: 3px;">
						<button type="submit" disabled>
							<em class="fa fa-search"></em>
						</button>
					</form>
					<table id="example" class="table table-striped table-bordered"
						style="width: 100%">
						<caption></caption>
						<thead>
							<tr>
								<th scope="col"><spring:message
										code="label.homePageWithChart.srno" /></th>
								<th scope="col"><spring:message
										code="label.homePageWithChart.version" /></th>
								<th scope="col"><spring:message
										code="label.homePageWithChart.releaseDate" /></th>
								<th scope="col"><spring:message
										code="label.homePageWithChart.releaseDate" /></th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td>1</td>
								<td><spring:message
										code="label.homePageWithChart.appVersion"
										var="appVersionLabel" />${appVersionLabel}</td>
								<td>15-06-2020</td>
								<td><spring:message
										code="label.homePageWithChart.releaseCommentContent"
										var="releaseCommentContentLabel" />${releaseCommentContentLabel}</td>
							</tr>
							<tr>
								<td>2</td>
								<td>${appVersionLabel}</td>
								<td>15-06-2020</td>
								<td>${releaseCommentContentLabel}</td>
							</tr>
							<tr>
								<td>3</td>
								<td>${appVersionLabel}</td>
								<td>15-06-2020</td>
								<td>${releaseCommentContentLabel}</td>
							</tr>
							<tr>
								<td>4</td>
								<td>${appVersionLabel}</td>
								<td>15-06-2020</td>
								<td>${releaseCommentContentLabel}</td>
							</tr>
							<tr>
								<td>5</td>
								<td><spring:message
										code="label.homePageWithChart.version-accountant" /></td>
								<td>15-06-2020</td>
								<td>${releaseCommentContentLabel}</td>
							</tr>
							<tr>
								<td>6</td>
								<td>${appVersionLabel}</td>
								<td>15-06-2020</td>
								<td>${releaseCommentContentLabel}</td>
							</tr>
							<tr>
								<td>7</td>
								<td>${appVersionLabel}</td>
								<td>15-06-2020</td>
								<td>${releaseCommentContentLabel}</td>
							</tr>
							<tr>
								<td>8</td>
								<td>${appVersionLabel}</td>
								<td>15-06-2020</td>
								<td>${releaseCommentContentLabel}</td>
							</tr>
							<tr>
								<td>9</td>
								<td>${appVersionLabel}</td>
								<td>15-06-2020</td>
								<td>${releaseCommentContentLabel}</td>
							</tr>
							<tr>
								<td>10</td>
								<td>${appVersionLabel}</td>
								<td>15-06-2020</td>
								<td>${releaseCommentContentLabel}</td>
							</tr>
							<tr>
								<td>11</td>
								<td>${appVersionLabel}</td>
								<td>15-06-2020</td>
								<td>${releaseCommentContentLabel}</td>
							</tr>
							<tr>
								<td>12</td>
								<td>${appVersionLabel}</td>
								<td>15-06-2020</td>
								<td>${releaseCommentContentLabel}</td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>

	<!-- helpdesk -->
	<div class="modal fade" id="myModal4" tabindex="-1" role="dialog"
		aria-labelledby="myLargeModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-md">
			<div class="modal-content">
				<div class="modal-header">
					<small class="card-title" style="float: left; color: #ffffff;"><spring:message
							code="label.homePageWithChart.helpdeskHeading" /></small>

					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">×</button>

				</div>
				<div class="modal-body">
					<form class="example" action="">
						<!--Grid column-->
						<div class="col-md-12 text-center">
							<h3>
								<spring:message
									code="label.homePageWithChart.helpdeskModelHeading" />
							</h3>
							<ul class="list-unstyled mb-0">
								<li><em class="fa fa-map-marker-alt fa-2x"></em>
									<p>
										<spring:message code="label.homePageWithChart.helpdesk.li-p1" />
									</p></li>
								<li><em class="fa fa-phone mt-4 fa-2x"></em>
									<p>
										<spring:message code="label.homePageWithChart.helpdesk.li-p2" />
									</p></li>
								<li><em class="fa fa-phone mt-4 fa-2x"></em>
									<p>
										<spring:message code="label.homePageWithChart.helpdesk.li-p3" />
									</p></li>
							</ul>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
	<script
		src="<%=request.getContextPath()%>/resources/chartTheme/js/jquery-1.11.1.js"></script>
	<script
		src="<%=request.getContextPath()%>/resources/chartTheme/js/jquery-ui.min.js"></script>
	<script
		src="<%=request.getContextPath()%>/resources/chartTheme/js/bootstrap.min.js"></script>
	<script
		src="<%=request.getContextPath()%>/resources/chartTheme/js/fusioncharts.js"></script>
	<script
		src="<%=request.getContextPath()%>/resources/chartTheme/js/themes/fusioncharts.theme.fint.js"></script>
	<script
		src="<%=request.getContextPath()%>/resources/chartTheme/js/jquery.dataTables.min.js"></script>
	<script
		src="<%=request.getContextPath()%>/resources/chartTheme/js/Chart.bundle.js"></script>
	<script>
	// Bar Chart
	var ctx = new Chart(document.getElementById("myChart"), {
		type : "bar",
		data : {
			datasets : [ {
				label : "${integratedAppLabel}",
				backgroundColor : 'rgba(255,0,0)',
				borderColor : 'rgba(255,99,132,1)',
				borderWidth : 1,
				data : [ ${userStats.integratedApps} ],
			}, {
				label : "${registeredUserLabel}",
				backgroundColor : 'rgba(40,167,69,1)',
				data : [ ${userStats.activeUsers} ],
			}, {
				label : "${inactiveUserLabel}",
				backgroundColor : 'rgba(23, 162, 184, 1)',
				data : [ ${userStats.inactiveUsers} ],
			}, {
				label : "${activeUserLabel}",
				backgroundColor : 'rgba(255, 193, 7, 1)',
				data : [ ${userStats.activeSessions} ],
			} ]
		},
		options : {
			legend : {
				position : 'top'
			},
			title : {
				display : true,
			},
		}
	});
	// Application Chart
	var ctx = document.getElementById("myChart1").getContext('2d');
	var myChart = new Chart(ctx, {
		type : 'pie',
		data : {
			labels : [ "${integratedAppLabel}", "${registeredUserLabel}", "${inactiveUserLabel}",
					"${activeUserLabel}" ],
			datasets : [ {
				backgroundColor : [ 'rgba(255,0,0)', 'rgba(40,167,69,1)',
						'rgba(23, 162, 184, 1)', 'rgba(255, 193, 7, 1)', ],
				data : [ ${userStats.integratedApps},${userStats.activeUsers},${userStats.inactiveUsers}, ${userStats.activeSessions} ]
			} ]
		}
	});
	</script>
	<script>
	var eventMethod = window.addEventListener ? "addEventListener"
			: "attachEvent";
	var eventer = window[eventMethod];
	var messageEvent = eventMethod == "attachEvent" ? "onmessage" : "message";

	eventer(
			messageEvent,
			function(e) {
				if ((typeof e.data === 'string')
						&& (e.data.indexOf('documentHeight') > -1)) {
					var height = e.data.split('documentHeight:')[1], height = parseInt(height) + 50; // add a bit of extra space
					document.getElementById('registrationIframe').height = height + 'px';
				}
				if ((typeof e.data === 'string')
						&& e.data == 'showIframeLoadingGIF') {
					$('#loader1').show();
				} else if ((typeof e.data === 'string')
						&& e.data == 'hideIframeLoadingGIF') {
					$('#loader1').hide();
				}
			}, false);


 	$(document).ready(function() {
 		debugger;
	   // $('#fInactiveUsers').text(${userStats.inactiveUsers}));
	    setIframeSrc('#registrationIframe');
	    $('#registrationIframe').load(function() {
			$('#loader2').hide();
			let iframeUrl=this.contentWindow.location;
			let iframeUrlSplittedArr=(iframeUrl+"").split("/");
			if(iframeUrlSplittedArr[3]!="auth"){
				window.location.replace(this.contentWindow.location);
			}
		});
	});
 	
 	var urlParams = new URLSearchParams(window.location.search);
	function setIframeSrc(iframeSelectorId){
		let iframeSrcUrl="${appctx}/viewHomePage?lang=";
		if (urlParams.has('lang')) {
			if (urlParams.get('lang') == 'en') {
				$(iframeSelectorId).attr("src", iframeSrcUrl+"en");
				$("#rbtnListLanguage_0").click(function () {return false;});
			} else {
				$(iframeSelectorId).attr("src", iframeSrcUrl+"indic");
				$("#rbtnListLanguage_1").click(function () {return false;});
			}
		}else{
			$(iframeSelectorId).attr("src", iframeSrcUrl+"en");
			$("#rbtnListLanguage_0").click(function () {return false;});
		}
		//$(iframeSelectorId).attr("src", "${appctx}/viewHomePage?kc_locale=en");
	}
	
	</script>

</body>
</html>


