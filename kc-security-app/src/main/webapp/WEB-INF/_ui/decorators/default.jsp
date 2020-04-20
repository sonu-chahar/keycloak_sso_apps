<!DOCTYPE html>
<%@ include file="/static-resources/common/taglibs.jsp"%>
<html style="overflow-x: hidden;">
<head>
<meta http-equiv="Content-Type" content="text/html;charset=UTF-8" />
<title><decorator:title /> | NDMC-Base-App</title>

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
	var appctx = '${appctx}';
	var globalctx = '${globalctx}';
	var globalctx2 = '${globalctx2}';
	var globalctx3 = '${globalctx3}';
	var globalctx4 = '${globalctx4}';
</script>

<script>
	var needConfirm = false;
	//window.onbeforeunload = confirmExit;
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

<body
	<decorator:getProperty property="body.id" writeEntireProperty="true"/>
	<decorator:getProperty property="body.class" writeEntireProperty="true"/>>
	<div class="wrapper">
		<!-- Sidebar Holder -->
		<nav id="sidebar">
			<div class="sidebar-header">
				<h3><img alt="" src="<%=request.getContextPath()%>/resources/images/logo1.png" /></h3>
			</div>
			<ul class="list-unstyled components">
				<p class="centered user_image">
					<a href="#"> <c:choose>
							<c:when
								test="${userMaster.imageName ne null and userMaster.imageName ne '' and  userMaster.fileExtension ne null and userMaster.fileExtension ne ''}">
								<img border="0" width="65px"
									src="${baseURL}/myProfile/getImage/${userMaster.mobileNumber}/${userMaster.imageName}/${userMaster.fileExtension}" />
								<%-- <img border="0" class="img-circle" width="100" height="100"
									src="<%=request.getContextPath()%>/images/default-image.jpg" /> --%>
							</c:when>
							<c:otherwise>
								<img border="0" class="img-circle" width="100" height="100"
									src="<%=request.getContextPath()%>/resources/images/default-image.jpg" />
							</c:otherwise>
						</c:choose>
					</a>
				</p>
				<h5 class="centered user_name">Welcome -
					${userMaster.firstName}</h5>
				<h5 class="centered user_name">${userMaster.emailId}</h5>
				<h5 class="centered logout_btn " style="font-weight: bold">
					<a href='<c:url value="/sso/logout"/>'> <i class="fa fa-sign-out"></i>
						Log Out
					</a>
				</h5>
				<p class="nav-head">Main Naviagtion</p>

				<li class="active"><a
					href="<%=request.getContextPath()%>/viewHomePage"
					class="hvr-shutter-in-vertical"><i class="fa fa-fw fa-home"></i>
						Home </a></li>

				<li><a
					href="<%=request.getContextPath()%>/myProfile/showProfile"
					class="hvr-shutter-in-vertical"><i class="fa fa-fw fa-user"></i>
						My Profile </a></li>
				<li><a
					href="<%=request.getContextPath()%>/myProfile/showChangePwdPage"
					class="hvr-shutter-in-vertical"><i class="fa fa-fw fa-key"></i>
						Change Password </a></li>
				<li><a href="<%=request.getContextPath()%>/myProfile/addOrUpdateApplicationMapping" class="hvr-shutter-in-vertical"><i
						class="fa fa-fw fa-cog"></i> Add application </a></li>
				<li><a href="#" class="hvr-shutter-in-vertical"><i
						class="fa fa-fw fa-cog"></i> Account Setting </a></li>

						<c:if test="${not empty isAuthorizedForViewUsers}">
							<li><a href="<%=request.getContextPath()%>/userReport/showUserReportPage"
					class="hvr-shutter-in-vertical"><i class="fa fa-fw fa-book"></i>
						Get User List</a></li>
						</c:if>
				
			<%-- 	<li><a
					href="<%=request.getContextPath()%>/subjectCardMaster/showSubjectCardMaster"
					class="hvr-shutter-in-vertical"><i class="fa fa-fw fa-list"></i>
						Subject Card</a></li> --%>

				<%-- <li><a
					href="<%=request.getContextPath()%>/myProfile/showReportGeneration"
					class="hvr-shutter-in-vertical"><i
						class="fa fa-fw fa-file-text"></i> Report Generation</a></li>
				<li><a
					href="<%=request.getContextPath()%>/myProfile/showChallanFormForHostelFee"
					class="hvr-shutter-in-vertical"><i
						class="fa fa-fw fa-credit-card"></i> Hostel Fee Payment</a></li>
				<li><a
					href="<%=request.getContextPath()%>/myProfile/showChallanForm"
					class="hvr-shutter-in-vertical"><i
						class="fa fa-fw fa-credit-card"></i> Fee Payment</a></li>
				<c:if test="${not empty isFeedBackOpen and isFeedBackOpen}">
					<li class="top"><a
						href="<%=request.getContextPath()%>/subjectWiseTeacherFeedBack/showSubjectWiseTeacherFeedBack"
						class="top_link"><i class="fa fa-fw fa-comment-o"></i> Subject
							Teacher FeedBack</a></li>
				</c:if>
				<li><a
					href="<%=request.getContextPath()%>/attendance/showAattendance"
					class="hvr-shutter-in-vertical"><i
						class="fa fa-fw fa-file-text"></i> Attendance Report</a></li>
				<c:if test="${not empty isResultOpen and isResultOpen}">
					<li><a
						href="<%=request.getContextPath()%>/markSheetGenerationReport/showMarkSheetReport"
						class="hvr-shutter-in-vertical"><i
							class="fa fa-fw fa-television"></i> Result</a></li>
				</c:if> --%>



				<!-- <li class="active"><a class="hvr-shutter-in-vertical"
					href="/smp/mainPage.html"><i class="fa fa-fw fa-home"></i> Home</a></li>

				<li class="active"><a href="#homeSubmenu"
					data-toggle="collapse" aria-expanded="false">Home</a>
					<ul class="collapse list-unstyled" id="homeSubmenu">
						<li><a href="#">Home 1</a></li>
						<li><a href="#">Home 2</a></li>
						<li><a href="#">Home 3</a></li>
					</ul></li>
				<li><a href="#pageSubmenu" data-toggle="collapse"
					aria-expanded="false">Pages</a>
					<ul class="collapse list-unstyled" id="pageSubmenu">
						<li><a href="#">Page1</a></li>
						<li><a href="#">Page2</a></li>
						<li><a href="#">Page3</a></li>
					</ul></li>
				<li><a class="hvr-shutter-in-vertical"
					href="employe-detail-page.html"><i class="fa fa-fw fa-users"></i>
						HRMS</a></li>
				<li><a class="hvr-shutter-in-vertical"
					href="employe-detail-page.html"><i class="fa fa-fw fa-user"></i>
						My Profile</a></li>
				<li><a class="hvr-shutter-in-vertical"
					href="employe-detail-page.html"><i
						class="fa fa-fw fa-cloud-download"></i> Download Salary slip</a></li>
				<li><a class="hvr-shutter-in-vertical"
					href="employe-detail-page.html"><i class="fa fa-fw fa-book"></i>
						Download Service Book</a></li>
				<li><a class="hvr-shutter-in-vertical"
					href="employe-detail-page.html"><i class="fa fa-fw fa-calendar"></i>
						Leave Request</a></li>
				<li><a class="hvr-shutter-in-vertical"
					href="employe-detail-page.html"><i class="fa fa-fw fa-calendar"></i>
						Leave Adjustment Request</a></li>
				<li><a class="hvr-shutter-in-vertical"
					href="employe-detail-page.html"><i class="fa fa-fw fa-calendar"></i>
						Leave Adjustment Approval</a></li> -->
			</ul>
		</nav>
		<!-- Page Content Holder -->
		<div id="content">
			<nav class="navbar navbar-default">

				<div class="container-fluid">
					<div class="navbar-header">
						<button type="button" id="sidebarCollapse"
							class="btn btn-info navbar-btn">
							<i class="glyphicon glyphicon-align-left"></i> <span></span>
						</button>
					</div>
					

					<button class="right-menu btn btn-info navbar-btn">
						<i class="fa fa-fw fa-bars"></i>
					</button>

					<div class="collapse navbar-collapse navbar-right-main"
						id="bs-example-navbar-collapse-1">
						<ul class="nav navbar-nav navbar-right">
							<li class="btn-custom"><a
								href="<%=request.getContextPath()%>/myProfile/showChangePwdPage"><i
									class="fa fa-fw fa-key"></i> Change Password</a></li>
							<li class="btn-custom"><a href="${ctx}/sso/logout"><i class="fa fa-fw fa-sign-out"></i>Logout</a></li>
						</ul>
					</div>
				</div>
			</nav>

			<div class="content-wrapper">
				<decorator:body />
			</div>
		</div>
	</div>


	<div class="footer">
		<div class="col-lg-12 col-md-7 col-sm-7 col-xs-12 copyrightContainer">
          <p style="margin: 0">
            © 2020 NDMC, [All Rights Reserved] Designed, Developed &amp; Maintained by: Information Technology Deptt., NDMC, New Delhi
          </p>
          <p style="margin: 0">
            Any suggestions/queries, please contact at NDMC IT Department
          </p>
          <div class="sso-visitors hidden-xs" style="display: none">
            <div id="visitor_count" class="odometer odometer-auto-theme"><div class="odometer-inside"><span class="odometer-digit"><span class="odometer-digit-spacer">8</span><span class="odometer-digit-inner"><span class="odometer-ribbon"><span class="odometer-ribbon-inner"><span class="odometer-value">0</span></span></span></span></span></div></div>
          </div>
        </div>
	</div>




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

	<script type="text/javascript">
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

</body>
</html>