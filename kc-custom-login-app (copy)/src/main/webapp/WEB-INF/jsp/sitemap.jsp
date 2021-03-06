<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<c:set var="appctx" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html;charset=UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta content='IE=edge' http-equiv='X-UA-Compatible' />
<title><spring:message code="label.homePageWithChart.title" /></title>
<link rel="icon" type="image/x-icon"
	href="<%=request.getContextPath()%>/resources/chartTheme/favicon.ico" />
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
<style>
.more-less {
	float: right;
	font-weight: bold !important;
	font-size: 22px;
	padding-right: 12px;
}

#close {
	float: right;
	display: inline-block;
	padding: 2px 5px;
	background: #ccc;
}
</style>
</head>


<body class="dashboard-page sb-l-o sb-r-c">
	<header
		style="box-shadow: 0 10px 28px 0 rgba(0, 0, 0, 0.2), 0 10px 20px 0 rgba(0, 0, 0, 0.19)">
		<c:choose>
			<c:when test="${currentLocale eq 'en'}">
				<div>
					<img class="header_img" alt="Header Image"
						src="<%=request.getContextPath()%>/resources/chartTheme/SCDG_header.png"
						width="100%" usemap="#HeaderMap">

					<map name="HeaderMap" id="HeaderMap">
						<area shape="rect" coords="805,27,907,41" alt="Version1.1"
							data-toggle="modal" data-target="#myModal3">
					</map>
				</div>
			</c:when>
			<c:otherwise>
				<div>
					<img class="header_img" alt="Header Image"
						src="<%=request.getContextPath()%>/resources/chartTheme/SCDG_hindi.png"
						width="100%">
				</div>
			</c:otherwise>
		</c:choose>
	</header>
	<div id="main" style="position: relative;">
		<div style="text-align: center">
			<div id="page-wrapper"
				style="background: -webkit-linear-gradient(-90deg, #f7b174, #88c181 100%); background-image: -webkit-linear-gradient(-90deg, rgb(247, 177, 116), rgb(136, 193, 129) 100%); background-position-x: initial; background-position-y: initial; background-size: initial; background-repeat-x: initial; background-repeat-y: initial; background-attachment: initial; background-origin: initial; background-clip: initial; background-color: initial;">
				<div class="row">
					<a href="#"><p
							style="margin-top: -66px; margin-left: 318px; font-weight: bold; font-size: 16px; color: #000000;">
						</p></a>
				</div>
				<div class="row">
					<a href="#">
						<p
							style="margin-top: -70px; margin-left: 375px; font-weight: bold; font-size: 16px; color: #000000;">
							<sub data-toggle="modal" data-target="#myModal3"> </sub>
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
										code="label.lang.indic" /></label></a></span>
					</div>
				</div>

				<div class="row">
					<div class="col-md-12">
						<div class="card">
							<h2 class="text-center"><spring:message
										code="label.homePageWithChart.sitemap" /></h2>
							<div style="text-align: justify;margin: 15px;font-size: large;padding-bottom: 40px;">
								<ul id="menu">
									<li><a href="<%=request.getContextPath()%>">Home</a></li>
									<li><a href="#" data-toggle="modal"
										data-target="#myModal1"><spring:message
												code="label.homePageWithChart.login-registration" /></a></li>
									<li><a href="#" data-toggle="modal"
										data-target="#myModal1">Forgot Password</a></li>

									<li><a href="#"><span data-toggle="modal"
											data-target="#myModal4"><spring:message
													code="label.homePageWithChart.helpdesk" /></span></a></li>
									<li><a
										href="<%=request.getContextPath()%>/websitePolicy.html"> <span><spring:message
													code="label.homePageWithChart.websitePolicy" /></span></a></li>
									<li><a
										href="<%=request.getContextPath()%>/passwordPolicy.html">
											<span><spring:message
													code="label.homePageWithChart.passwordPolicy" /></span>
									</a></li>
									<li><a href="#"><spring:message code="label.homePageWithChart.faq" /></a></li>
									<li><a href="<%=request.getContextPath()%>/sitemap.html"><spring:message
										code="label.homePageWithChart.sitemap" /></a></li>
								</ul>
							</div>
						</div>
					</div>
				</div>
				<div style="position: fixed; width: 100%; bottom: 1px;">
					<footer class="main-footer text-center footer"
						style="padding: 0px; margin-left: 0px; color: #fff; background-color: #343A40; font-size: medium;">
						<spring:message code="label.homePageWithChart.footer" />
						<p style="margin: 0">
							<a href="#"><span data-toggle="modal" data-target="#myModal4"><spring:message
										code="label.homePageWithChart.helpdesk" /></span></a>&nbsp;&nbsp;|&nbsp;
							<a href="websitePolicy.html"> <span><spring:message
										code="label.homePageWithChart.websitePolicy" /></span></a>&nbsp;&nbsp;|&nbsp;
							<a href="passwordPolicy.html"> <span><spring:message
										code="label.homePageWithChart.passwordPolicy" /></span></a>&nbsp;&nbsp;|&nbsp;
							<a href="sitemap.html"><span> <spring:message
										code="label.homePageWithChart.sitemap" /></span></a>&nbsp;&nbsp;|&nbsp;
							<span><spring:message code="label.homePageWithChart.faq" /></span>&nbsp;&nbsp;|&nbsp;
						</p>
					</footer>
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
													<spring:message
														code="label.homePageWithChart.helpdesk.li-p1" />
												</p></li>
											<li><em class="fa fa-phone mt-4 fa-2x"></em>
												<p>
													<spring:message
														code="label.homePageWithChart.helpdesk.li-p2" />
												</p></li>
											<li><em class="fa fa-phone mt-4 fa-2x"></em>
												<p>
													<spring:message
														code="label.homePageWithChart.helpdesk.li-p3" />
												</p></li>
										</ul>
									</div>
								</form>
							</div>
						</div>
					</div>
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
		$(document).ready(function() {
			$('.panel-group').on('hidden.bs.collapse', toggleIcon);
			$('.panel-group').on('shown.bs.collapse', toggleIcon);
		});
		function toggleIcon(e) {
			$(e.target).prev('.panel-heading').find(".more-less").toggleClass(
					'glyphicon-plus glyphicon-minus');
		}
	</script>
	<script>
		var eventMethod = window.addEventListener ? "addEventListener"
				: "attachEvent";
		var eventer = window[eventMethod];
		var messageEvent = eventMethod == "attachEvent" ? "onmessage"
				: "message";

		eventer(
				messageEvent,
				function(e) {
					if ((typeof e.data === 'string')
							&& (e.data.indexOf('documentHeight') > -1)) {
						var height = e.data.split('documentHeight:')[1], height = parseInt(height) + 50; // add a bit of extra space
						document.getElementById('registrationIframe').height = height
								+ 'px';
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
			if ('${currentLocale}' == 'en') {
				$("#rbtnListLanguage_0").click(function() {
					return false;
				});
			} else {
				$("#rbtnListLanguage_1").click(function() {
					return false;
				});
			}
		});
		$(document).ready(function() {
			setIframeSrc('#registrationIframe');
			$('#registrationIframe').load(function() {
				$('#loader2').hide();
				let iframeUrl = this.contentWindow.location;
				let iframeUrlSplittedArr = (iframeUrl + "").split("/");
				if (iframeUrlSplittedArr[3] != "auth") {
					window.location.replace(this.contentWindow.location);
				}
			});
		});

		function setIframeSrc(iframeSelectorId) {
			let iframeSrcUrl = "${appctx}/viewHomePage?lang=${currentLocale}";
			$(iframeSelectorId).attr("src", iframeSrcUrl);
		}
	</script>
</body>
</html>
