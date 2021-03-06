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
</head>
<body class="dashboard-page sb-l-o sb-r-c">
	<header
		style="box-shadow: 0 10px 28px 0 rgba(0, 0, 0, 0.2), 0 10px 20px 0 rgba(0, 0, 0, 0.19)">
		<c:choose>
			<c:when test="${currentLocale eq 'en'}">
				<div>
					<img class="header_img" alt="Header Image"
						src="<%=request.getContextPath()%>/resources/chartTheme/SCDG_header_versionInculded.png"
						width="100%" usemap="#HeaderMap">

					<map name="HeaderMap" id="HeaderMap">
						<area shape="rect" id="fArea" style="border: 1px #fff solid;"
							coords="0,0,0,0" alt="Version1.1" data-toggle="modal"
							data-target="#myModal3">
					</map>
				</div>
			</c:when>
			<c:otherwise>
				<div>
					<img class="header_img" alt="Header Image"
						src="<%=request.getContextPath()%>/resources/chartTheme/SCDG_hindi_versionIncluded.png"
						width="100%" usemap="#HeaderMap">

					<map name="HeaderMap" id="HeaderMap" style="cursor: pointer">
						<area shape="rect" id="fArea" coords="0,0,0,0" alt="Version1.1"
							data-toggle="modal" data-target="#myModal3">
					</map>
				</div>
			</c:otherwise>
		</c:choose>
	</header>
	<div class="row"
		style="margin-right: 0px !important; margin-left: 0px !important">
		<div class=" text-right headerlangText">
			<ul id="breadCrumb">
				<li><strong><a href="${appctx}/homePage?lang=en"
						style="color: black" class="lang-en lang-select">English |</a></strong></li>
				<li><strong><a href="${appctx}/homePage?lang=indic"
						style="color: black" class="lang-indic lang-select">Hindi</a></strong></li>

			</ul>
		</div>
	</div>

	<div id="main" style="position: relative;">
		<div style="text-align: center">
			<div id="page-wrapper"
				style="background: -webkit-linear-gradient(-90deg, #f7b174, #88c181 100%); background-image: -webkit-linear-gradient(-90deg, rgb(247, 177, 116), rgb(136, 193, 129) 100%); background-position-x: initial; background-position-y: initial; background-size: initial; background-repeat-x: initial; background-repeat-y: initial; background-attachment: initial; background-origin: initial; background-clip: initial; background-color: initial;">
				<div class="row">
					<div class="col-md-12">
						<div class="card">
							<div class="graphical-dashboard">
								<h2>
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
							<div class="panel pink">
								<em class="fa  fa-users fa-4x" style="cursor: default;"></em>
								<div class="panel-heading">
									<div class="row">
										<div class="col-xs-9 text-left">
											<div>
												<a href="javascript:void(0);" style="text-decoration: none;"><h3
														id="pendingcomplience2">
														${userStats.activeSessions}<span
															class="count_class counter"></span>
													</h3></a>
											</div>
											<div style="margin-top: -32px; margin-left: 90px;" class="text-center">
												<strong><spring:message
														code="label.homePageWithChart.activeUser"
														var="activeUserLabel" />${activeUserLabel}</strong>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="col-lg-3 col-md-6 dataBoxHover">
							<div class="panel red">
								<em class="fa  fa-users fa-4x" style="cursor: default;"></em>
								<div class="panel-heading">
									<div class="row">
										<div id="pendency" class="col-xs-9 text-left">
											<div>
												<a href="javascript:void(0);" style="text-decoration: none;"><h3
														id="total_pending1" data-tag="">
														${userStats.inactiveUsers}<span
															class="count_class counter"></span>
													</h3></a>
											</div>
											<div style="margin-top: -32px; margin-left: 90px;" class="text-center">
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
								<em class="fa  fa-user-plus fa-4x" style="cursor: default;"></em>
								<div class="panel-heading">
									<div class="row">
										<div class="col-xs-9 text-left">
											<div>
												<a href="javascript:void(0);" style="text-decoration: none;"><h3
														id="#">
														${userStats.allUsers}<span class="count_class counter"></span>
													</h3></a>
											</div>
											<div style="margin-top: -32px; margin-left: 90px;" class="text-center">
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
								<em class="fa  fa-android fa-4x" style="cursor: default;"></em>
								<div class="panel-heading">
									<div class="row">
										<div class="col-xs-9 text-left" data-toggle="modal" data-target="#integratedAppModal">
											<div>
												<a href="javascript:void(0);" style="text-decoration: none;"><h3
														id="fInactiveUsers">
														${userStats.integratedApps}<span
															class="count_class counter"> </span>
													</h3></a>
											</div>
											<div style="margin-top: -32px; margin-left: 90px;" class="text-center">
												<strong><spring:message
														code="label.homePageWithChart.integratedApp"
														var="integratedAppLabel" />${integratedAppLabel}</strong>
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
								<div class="col-md-12 col-xl-12 wow slideInLeft graphWrapper"
									data-wow-duration="4s" style="min-height: auto">
									<div class="row popupHeader">
										<div class="col-md-6">
											<div style="text-align: center"></div>
										</div>
										<div class="col-md-6">
											<div style="text-align: center"></div>
										</div>
									</div>
									<div class="col-md-6 col-xl-6">
										<div id="drill" class="requirement "
											style="border: 4px solid #7e7575; padding: 4px 0px; background-size: cover; text-align: center; min-height: 56vh; overflow-x: scroll;">
											<canvas id="myChart" width="544" height="316"></canvas>
										</div>

									</div>
									<div class="col-md-6 col-xl-6">
										<div id="drill" class="requirement "
											style="border: 4px solid #7e7575; padding: 4px 0px; background-size: cover; min-height: 56vh; text-align: center; overflow-x: scroll;">
											<canvas id="myChart1" width="544" height="276"></canvas>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>

			</div>
		</div>
		<div style="position: inherit; bottom: -10px;">
			<footer class="main-footer text-center footer"
				style="text-align: center;">
				<spring:message code="label.homePageWithChart.footer" />

				<p style="margin: 0">
					<a href="#"><span data-toggle="modal" data-target="#myModal4"><spring:message
								code="label.homePageWithChart.helpdesk" /></span></a>&nbsp;&nbsp;|&nbsp; <a
						href="websitePolicy.html"> <span><spring:message
								code="label.homePageWithChart.websitePolicy" /></span></a>&nbsp;&nbsp;|&nbsp;
					<a href="passwordPolicy.html"> <span><spring:message
								code="label.homePageWithChart.passwordPolicy" /></span></a>&nbsp;&nbsp;|&nbsp;
					<a href="sitemap.html"><span> <spring:message
								code="label.homePageWithChart.sitemap" /></span></a>&nbsp;&nbsp;|&nbsp; <span><spring:message
							code="label.homePageWithChart.faq" /></span>&nbsp;&nbsp;|&nbsp;
				</p>
			</footer>
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
						<input id="myInput" type="text" placeholder="${searchLabel}"
							name="search2" style="padding: 3px;" onkeyup="searchData()" />
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
						<tbody id="tBodyTrs">
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
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>

	<!-- Integrated App-->
	<div class="modal fade" id="integratedAppModal" tabindex="-1"
		role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-md">
			<div class="modal-content">
				<div class="modal-header">
					<small class="card-title" style="float: left; color: #ffffff;">Integrated
						App</small>

					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true"
						style="float: right; font-size: 21px; font-weight: 700; line-height: 1; color: #d30b0b; text-shadow: 0 1px 0 #fff; opacity: 0.6;">×</button>
				</div>
				<div class="modal-body">
					<div class="row">
						<div class="col-sm-4">
							<div class="base hvr-float-shadow">
								<div class="circle bg-circle">
									<img alt="application-logo"
										src="<%=request.getContextPath()%>/images/icons/icon-death.png" id="image7" width="90"
										height="90">
								</div>
								<h2>
									<input type="hidden" value="false" id="hidden_app_7"
										name="applicationMappingToBeRemoved"> <a
										href="http://uat.ndmc.gov.in/death"></a> Death Certificate
								</h2>
							</div>
						</div>

						<div class="col-sm-4">
							<div class="base hvr-float-shadow">
								<div class="circle bg-circle">
									<img alt="application-logo"
										src="<%=request.getContextPath()%>/images/icons/icon-still-birth.png" id="image8"
										width="90" height="90">
								</div>
								<h2>
									<input type="hidden" value="false" id="hidden_app_8"
										name="applicationMappingToBeRemoved"> <a
										href="http://uat.ndmc.gov.in/sbirth"></a> Still / Birth /
									Certificate
								</h2>
							</div>
						</div>

						<div class="col-sm-4">
							<div class="base hvr-float-shadow">
								<div class="circle bg-circle">
									<img alt="application-logo"
										src="<%=request.getContextPath()%>/images/icons/icon-name-inclusion.png" id="image9"
										width="90" height="90">
								</div>
								<h2>
									<input type="hidden" value="" id="hidden_app_9"
										name="applicationMappingToBeRemoved"><a
										href="http://uat.ndmc.gov.in/nameinclusion"></a> Name
									Inclusion
								</h2>
							</div>
						</div>

					</div>
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
			datasets : [  {
				label : "${activeUserLabel}",
				backgroundColor : 'rgba(40,167,69,1)',
				data : [ ${userStats.activeSessions} ],
			}, {
				label : "${inactiveUserLabel}",
				backgroundColor : 'rgba(255,0,0)',
				borderColor : 'rgba(255,99,132,1)',
				borderWidth : 1,
				data : [ ${userStats.inactiveUsers}  ],
			},  {
				label : "${registeredUserLabel}",
				backgroundColor : 'rgba(255, 193, 7, 1)',
				data : [ ${userStats.allUsers} ],
			},	{
				label : "${integratedAppLabel}",
				backgroundColor : 'rgba(23, 162, 184, 1)',
				data : [ ${userStats.integratedApps}],
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
			labels : [ "${activeUserLabel}" ,"${inactiveUserLabel}","${registeredUserLabel}",
				"${integratedAppLabel}" ],
			datasets : [ {
				backgroundColor : [  'rgba(40,167,69,1)','rgba(255,0,0)',
						 'rgba(255, 193, 7, 1)', 'rgba(23, 162, 184, 1)'],
				data : [ ${userStats.activeSessions},${userStats.inactiveUsers},${userStats.allUsers},${userStats.integratedApps}  ]
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
 	
	function setIframeSrc(iframeSelectorId){
		
		let iframeSrcUrl="${appctx}/viewHomePage?lang=${currentLocale}";
		$(iframeSelectorId).attr("src", iframeSrcUrl);
	}
	
	function searchData() {
		// Declare variables
		var input, filter, tblTr, tblTd, i, txtValue;
		input = document.getElementById('myInput');
		filter = input.value.toUpperCase();
		// ul = document.getElementById("myUL");
		tblTr = document.getElementById('tBodyTrs').getElementsByTagName("tr");

		// Loop through all list items, and hide those who don't match the search query
		for (i = 0; i < tblTr.length; i++) {
			tblTd = tblTr[i].getElementsByTagName("td")[1];
			txtValue = tblTd.innerText;
			
			if (txtValue.toUpperCase().indexOf(filter) > -1) {
				tblTr[i].style.display = "";
			} else {
				tblTr[i].style.display = "none";
			}
		}
	}
	$(document).ready(function() {
		if ('${currentLocale}' == 'en') {
			$(".lang-en").click(function() {
				return false;
			});
		} else {
			$(".lang-indic").click(function() {
				return false;
			});
		}
	});
	
	window.onload = function () {
		//let requiredFactor= screen.width/1368;
		let requiredFactor= screen.height/768;
		var calculatedCorrds;
		if(screen.height==768){
			if('${currentLocale}' == 'en'){
				calculatedCorrds="768,25,847,45";
			}else{
				calculatedCorrds="756,24,847,47";
			}
		}else if(screen.height==1080){
			
			if('${currentLocale}' == 'en'){
				calculatedCorrds="1100,37,1206,65";
			}else{
				calculatedCorrds="1086,33,1203,65";
			}
		}else{
			let requiredFactor= screen.height/1080;
			if('${currentLocale}' == 'en'){
				calculatedCorrds=""+1100*requiredFactor+","+37*requiredFactor+","+1206*requiredFactor+","+65*requiredFactor;
			}else{
				calculatedCorrds=""+1086*requiredFactor+","+33*requiredFactor+","+1203*requiredFactor+","+65*requiredFactor;
			}
		}
		
		//alert(screen.width+"X"+screen.height+" :: "+calculatedCorrds);
		
		$("#fArea").attr("coords",calculatedCorrds);
		 
		
	    var ImageMap = function (map) {
	            var n,
	                areas = map.getElementsByTagName('area'),
	                len = areas.length,
	                coords = [],
	                previousWidth = document.body.clientWidth;
	            for (n = 0; n < len; n++) {
	                coords[n] = areas[n].coords.split(',');
	            }
	            this.resize = function () {
	                var n, m, clen,
	                    x = document.body.clientWidth / previousWidth;
	                for (n = 0; n < len; n++) {
	                    clen = coords[n].length;
	                    for (m = 0; m < clen; m++) {
	                        coords[n][m] *= x;
	                    }
	                    areas[n].coords = coords[n].join(',');
	                }
	                previousWidth = document.body.clientWidth;
	                return true;
	            };
	            window.onresize = this.resize;
	        },
	        imageMap = new ImageMap(document.getElementById('HeaderMap'));
	    imageMap.resize();
	}
	</script>
</body>
</html>


