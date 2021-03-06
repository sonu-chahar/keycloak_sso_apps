<!DOCTYPE html>
<%@ include file="/static-resources/common/taglibs.jsp"%>
<html style="overflow-x: hidden;">
<head>
<title><decorator:title /> | NDMC</title>
<meta http-equiv="Content-Type" content="text/html;charset=UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta content='IE=edge' http-equiv='X-UA-Compatible' />

<link rel="icon" type="image/x-icon"
	href="<%=request.getContextPath()%>/resources/images/favicon.ico" />

<script
	src="<%=request.getContextPath()%>/resources/js/jquery-1.12.4.js"></script>
<script src='<%=request.getContextPath()%>/dwr/engine.js'></script>

<script
	src="<%=request.getContextPath()%>/resources/js/jquery-ui-1.12.1.js"></script>
<script
	src="<%=request.getContextPath()%>/resources/js/bootstrap.min.js"></script>
<script src="<%=request.getContextPath()%>/resources/js/multiselect.js"></script>
<script
	src="<%=request.getContextPath()%>/resources/js/jquery.scrollbar.js"></script>
<script
	src="<%=request.getContextPath()%>/resources/js/globalmasters/common.js"></script>
<script
	src="<%=request.getContextPath()%>/resources/js/jquery.printThis.js"></script>

<script>
	var needConfirm = false;
	function confirmExit(aEvent) {
		if (needConfirm) {
			var http;
			if (window.XMLHttpRequest) {
				http = new XMLHttpRequest();
			} else if (window.ActiveXObject) {
				http = new ActiveXObject("Microsoft.XMLHTTP");
			}
			http.open('GET', '<c:url value="/sso/logout.jsp"/>', true);
			http.send(null);
		}
	}
</script>



<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/resources/css/default.css" />
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/resources/css/bootstrap.min.css" />
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/resources/css/font-awesome.min.css">
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/resources/css/inside-style.css" />
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/resources/css/calendar.css" />
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/resources/css/scroll.css">
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/resources/css/weather.css">
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/resources/css/style-responsive.css" />
<decorator:head />
</head>

<body>
	<div class="wrapper">
		<!-- Sidebar Holder -->
		<nav id="sidebar">
			<div class="sidebar-header">
				<c:choose>
					<c:when test="${currentLocale eq 'en'}">
						<h3>
							<img alt="Header Image"
								src="<%=request.getContextPath()%>/resources/images/logo1.png" />
						</h3>
					</c:when>
					<c:otherwise>
						<h3>
							<img alt="Header Image"
								src="<%=request.getContextPath()%>/resources/images/logo.jpeg">
						</h3>
					</c:otherwise>
				</c:choose>
			</div>
			<ul class="list-unstyled components">
				<p class="centered user_image">
					<a href="#"> <c:choose>
							<c:when
								test="${userMaster.imageName ne null and userMaster.imageName ne '' and  userMaster.fileExtension ne null and userMaster.fileExtension ne ''}">
								<img border="0" width="65px"
									src="${baseURL}/myProfile/getImage/${userMaster.mobileNumber}/${userMaster.imageName}/${userMaster.fileExtension}"
									alt="Profile Image" />
								<%-- <img border="0" class="img-circle" width="100" height="100"
									src="<%=request.getContextPath()%>/images/default-image.jpg" /> --%>
							</c:when>
							<c:otherwise>
								<img border="0" class="img-circle" width="100" height="100"
									src="<%=request.getContextPath()%>/resources/images/default-image.jpg"
									alt="Profile Image" />
							</c:otherwise>
						</c:choose>
					</a>
				</p>
				<h5 class="centered user_name">
					<spring:message code="label.homePage.nav.welcome" />
					${userMaster.firstName}
				</h5>
				<h5 class="centered user_name">${userMaster.emailId}</h5>
				<h5 class="centered logout_btn " style="font-weight: bold">
					<a href='<c:url value="/sso/logout"/>'> <em
						class="fa fa-sign-out"></em> <spring:message
							code="label.homePage.nav.logout" />
					</a>
				</h5>
				<p class="nav-head">
					<spring:message code="label.homePage.nav.heading" />
				</p>

				<li><a href="<%=request.getContextPath()%>/viewHomePage"
					class="hvr-shutter-in-vertical"><em class="fa fa-fw fa-home"></em>
						<spring:message code="label.homePage.nav.home" /> </a></li>

				<li><a
					href="<%=request.getContextPath()%>/myProfile/showProfile"
					class="hvr-shutter-in-vertical"><em class="fa fa-fw fa-user"></em>
						<spring:message code="label.homePage.nav.profile" /> </a></li>
				<li><a
					href="<%=request.getContextPath()%>/myProfile/showChangePwdPage"
					class="hvr-shutter-in-vertical"><em class="fa fa-fw fa-key"></em>
						<spring:message code="label.homePage.nav.changePassword" /> </a></li>
				<li><a
					href="<%=request.getContextPath()%>/myProfile/addOrUpdateApplicationMapping"
					class="hvr-shutter-in-vertical"><em class="fa fa-fw fa-cog"></em>
						<spring:message code="label.homePage.nav.addApplication" /></a></li>
				<li><a href="<%=request.getContextPath()%>/loginHistory.html"
					class="hvr-shutter-in-vertical"><em class="fa fa-fw fa-cog"></em>
						<spring:message code="label.homePage.nav.loginHistory" /> </a></li>

				<c:if test="${not empty isAuthorizedForViewUsers}">
					<li><a
						href="<%=request.getContextPath()%>/userReport/showUserReportPage"
						class="hvr-shutter-in-vertical"><em class="fa fa-fw fa-book"></em>
							<spring:message code="label.homePage.nav.userList" />Get User
							List</a></li>
				</c:if>
			</ul>
		</nav>
		<!-- Page Content Holder -->
		<content id="content">
			<nav class="navbar navbar-default">
				<div class="container-fluid">
					<div class="navbar-header">
						<button type="button" id="sidebarCollapse"
							class="btn btn-info navbar-btn">
							<em class="glyphicon glyphicon-align-left"></em> <span></span>
						</button>
					</div>


					<button class="right-menu btn btn-info navbar-btn">
						<em class="fa fa-fw fa-bars"></em>
					</button>

					<div class="collapse navbar-collapse navbar-right-main"
						id="bs-example-navbar-collapse-1">
						<ul class="nav navbar-nav navbar-right">
							<li><a style="background: none !important; padding: 0 10px;"
								href="JavaScript:void(0);"><img alt="swatchBharatLogo"
									style="width: 115px; border: 0;" class="img-responsive"
									src="<%=request.getContextPath()%>/resources/images/swatch-bharat.png" /></a></li>
							<li id="enLi" class="btn-custom"><a href="?lang=en"><em
									class="fa fa-fw fa-language"></em> <spring:message
										code="label.lang.en" /></a></li>
							<li id="indicLi" class="btn-custom"><a href="?lang=indic"><em
									class="fa fa-fw fa-language"></em> <spring:message
										code="label.lang.indic" /></a></li>
							<li class="btn-custom"><a
								href="<%=request.getContextPath()%>/myProfile/showChangePwdPage"><em
									class="fa fa-fw fa-key"></em> <spring:message
										code="label.homePage.nav.changePassword" /></a></li>
							<li class="btn-custom"><a href="${ctx}/sso/logout"><em
									class="fa fa-fw fa-sign-out"></em> <spring:message
										code="label.homePage.nav.logout" /></a></li>
						</ul>
					</div>
				</div>
			</nav>

			<div class="content-wrapper">
				<decorator:body />
			</div>
		</content>
	</div>


	<footer class="footer">
		<div class="col-lg-12 col-md-7 col-sm-7 col-xs-12 copyrightContainer">
			<p style="margin: 0">
				<spring:message code="label.homePage.footer-p1" />
			</p>
			<p style="margin: 0">
				<spring:message code="label.homePage.footer-p2" />
			</p>
			<!-- <div class="sso-visitors hidden-xs" style="display: none">
				<div id="visitor_count" class="odometer odometer-auto-theme">
					<div class="odometer-inside">
						<span class="odometer-digit"><span
							class="odometer-digit-spacer">8</span><span
							class="odometer-digit-inner"><span class="odometer-ribbon"><span
									class="odometer-ribbon-inner"><span
										class="odometer-value">0</span></span></span></span></span>
					</div>
				</div>
			</div> -->
		</div>
	</footer>




	<script>
		$(document).ready(function() {
			if ($("#mainFormId").val() != "") {
				$("#cancel").show();
				$("#btnSave").val("UPDATE");
			} else {
				$("#cancel").hide();
				/* $("#btnSave").val("SAVE"); */
			}
		});
	</script>

	<script>
		$(document).ready(function() {
			$('#sidebarCollapse').on('click', function() {
				$('#sidebar').toggleClass('active');
			});
		});
	</script>
	<script>
		jQuery(document).ready(function() {
			jQuery('.scrollbar-macosx').scrollbar();
		});
	</script>

	<script>
		$(document).ready(function() {
			$('.right-menu').click(function() {
				$('.navbar-right-main').slideToggle();
			});
		});
	</script>
	<script>
		$(document).ready(function() {
			if ('${currentLocale}' == 'en') {
				$("#enLi a").click(function() {
					return false;
				});
			} else {
				$("#indicLi a").click(function() {
					return false;
				});
			}
			
			// alert(screen.height);
			// $(".user-portal").height(screen.height-100)
		
		});
		
		
	</script>



</body>
</html>