<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<meta http-equiv="content-type" content="text/html;charset=UTF-8" />
<head>
<meta charset="utf-8">
<title>NDMC</title>
<link rel="shortcut icon"
	href="<%=request.getContextPath()%>/resources/chartTheme/favicon.ico">
<meta name="keywords" content="" />
<meta name="description" content="">
<meta name="author" content="">
<meta name="viewport" content="width=device-width, initial-scale=1.0">


<%-- <link href="<%=request.getContextPath()%>/resources/chartTheme/css_nn/bootstrap.css" rel="stylesheet" type="text/css" media="all"> --%>
<link
	href="<%=request.getContextPath()%>/resources/chartTheme/css_nn/style.css"
	rel="stylesheet" type="text/css" media="all" />
<link
	href="<%=request.getContextPath()%>/resources/chartTheme/css/style.css"
	rel="stylesheet">
<link
	href="<%=request.getContextPath()%>/resources/chartTheme/css/bootstrap.min.css"
	rel="stylesheet">
<link
	href="<%=request.getContextPath()%>/resources/chartTheme/css/font-awesome.min.css"
	rel="stylesheet" type="text/css">
<link
	href="<%=request.getContextPath()%>/resources/chartTheme/css/dashboard-style.css"
	rel="stylesheet">
<link
	href="<%=request.getContextPath()%>/resources/chartTheme/css-new/pgallery.css"
	rel="stylesheet">
<link
	href="<%=request.getContextPath()%>/resources/chartTheme/css/homePageWithChart.css"
	rel="stylesheet">
<!-- jQuery -->

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

<!-- Theme Javascript -->
<%-- <script src="<%=request.getContextPath()%>/resources/chartTheme/js/utility.js"></script>
<script src="<%=request.getContextPath()%>/resources/chartTheme/js/demo.js"></script>
<script src="<%=request.getContextPath()%>/resources/chartTheme/js/main.js"></script>
<script src="<%=request.getContextPath()%>/resources/chartTheme/js/amcharts.js"></script>
<script src="<%=request.getContextPath()%>/resources/chartTheme/js/pie.js"></script>
<script src="<%=request.getContextPath()%>/resources/chartTheme/js/light.js"></script>
<script src="<%=request.getContextPath()%>/resources/chartTheme/js/serial.js"></script>
<script src="<%=request.getContextPath()%>/resources/chartTheme/js/dark.js"></script> --%>

<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/chartTheme/css-new/jquery.dataTables.min.css">
<script
	src="<%=request.getContextPath()%>/resources/chartTheme/js/jquery.dataTables.min.js"></script>
<script
	src="<%=request.getContextPath()%>/resources/chartTheme/js/demo.js"></script>
	
	
<style>
.more-less {
    float: right;
    font-weight: bold !important;
    font-size: 22px;
    padding-right: 12px;
    }
</style>	
<script>
$(document).ready(function() {
	$('.panel-group').on('hidden.bs.collapse',toggleIcon);
	$('.panel-group').on('shown.bs.collapse', toggleIcon); 	
});
function toggleIcon(e) { $(e.target)
	.prev('.panel-heading')
	.find(".more-less") 
	.toggleClass('glyphicon-plus glyphicon-minus'); 
}

</script>
</head>


<body class="dashboard-page sb-l-o sb-r-c">
	<div id="google_translate_element"></div>
	<div id="main">
		<div class="container no-padding">
			<div class="row wow fadeInDown animated animated"
				data-wow-duration="2s"></div>
		</div>
	</div>


	<header
		style="box-shadow: 0 10px 28px 0 rgba(0, 0, 0, 0.2), 0 10px 20px 0 rgba(0, 0, 0, 0.19)">
		<img class="header_img" alt="Header Image"
			src="<%=request.getContextPath()%>/resources/chartTheme/SCDG_header.png"
			width="100%">
	</header>

	<center>
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
						id="rbtnListLanguage_0" href="#googtrans(en|en)"
						class="lang-en lang-select" data-lang="en" style="color: #333">
							<label for="rbtnListLanguage_0" style="background-image: none;">English</label>
					</a> <a id="rbtnListLanguage_1" href="#googtrans(en|hi)"
						class="lang-en lang-select" data-lang="hi" style="color: #333">
							<label for="rbtnListLanguage_1">हिन्दी</label>
					</a>
					</span>
				</div>
			</div>

			<div class="row">
				<div class="col-md-12">
					<div class="card">

						<!-- helpdesk -->
						<div class="modal fade" id="myModal4" tabindex="-1" role="dialog"
							aria-labelledby="myLargeModalLabel" aria-hidden="true">
							<div class="modal-dialog modal-md">
								<div class="modal-content">
									<div class="modal-header" style="background: #005394;">
										<small class="card-title" style="float: left; color: #ffffff;">Helpdesk
											Details</small>
										<button type="button" class="close" data-dismiss="modal"
											aria-hidden="true">×</button>

									</div>
									<div class="modal-body">
										<form class="example" action="">
											<!--Grid column-->
											<div class="col-md-12 text-center">
												<h3>NEW DELHI MUNICIPAL COUNCIL</h3>
												<ul class="list-unstyled mb-0">
													<li><i class="fa fa-map-marker-alt fa-2x"></i>
														<p>
															(NDMC Head Office)<br>Palika Kendra Parliament
															Street, New Delhi-110001
														</p></li>
													<li><i class="fa fa-phone mt-4 fa-2x"></i>
														<p>24/7 Helpline (Toll Free) : 1533</p></li>
													<li><i class="fa fa-phone mt-4 fa-2x"></i>
														<p>Exchange No. PABX : 41501354 - 60</p></li>
												</ul>
											</div>
											<!--Grid column-->
										</form>
									</div>
								</div>
							</div>
						</div>
						<!-- helpdesk -->
					</div>
				</div>
			</div>
			</br>
			<div class="row">
				<div class="col-md-12">
					<!------------------PASSWORD POLICY-------------------->
					<div class="container-fluid" id="pending-div">
						<div class="col-md-12 wow slideInLeft graphWrapper"
							data-wow-duration="4s" style="min-height: auto">

							<div class="card card-info">
								<div class="card-header p-0" style="background-color: #17a2b8;">
									<div class="text-white text-center py-2"
										style="margin-bottom: 20px;">
										<h3 class="m-0" style="margin: 10px; padding: 5px;">Password
											Policy</h3>
									</div>
								</div>
								<div class="row">
									<div class="col-md-12">
										<div class="panel-group" id="accordion" role="tablist"
											aria-multiselectable="true">

											<div class="panel-default">
												<div class="panel-heading" role="tab" id="headingOne">
													<h3 class="panel-title" style="color: #e03545;">
														<a data-toggle="collapse" data-parent="#accordion"
															href="#collapseOne" aria-expanded="true"
															aria-controls="collapseOne" style="margin-right: 90%;">
															<i class="more-less glyphicon glyphicon-minus"></i>
															Policy </a>
													</h3>

												</div>
												<div id="collapseOne" class="panel-collapse collapse in"
													role="tabpanel" aria-labelledby="headingOne">
													<div class="panel-body" style="text-align: justify;">
														<ul>
															<b>Password Creation</b>
															<li><p>All user and admin passwords must be at
																	least [8] characters in length. Longer passwords and
																	passphrases are strongly encouraged.</p></li>

															<li><p>Where possible, password dictionaries
																	should be utilized to prevent the use of common and
																	easily cracked passwords.</p></li>
															<li><p>Contain both upper and lower case
																	characters (e.g., a-z, A-Z) & numbers (e.g., 0-9).</p></li>
															<li><p>Passwords must be completely unique, and
																	not used for any other system, application, or personal
																	account.</p></li>
															<li><p>Default registration passwords must be
																	changed immediately after registration is complete.</p></li>
															<li><p>Previously used passwords may not be
																	reused.</p></li>
															<li><p>Try to create passwords that can be
																	easily remembered.</p></li>
															<b>Password Aging</b>

															<li><p>All system-level passwords (e.g. root,
																	enable, NT admin, application administration accounts,
																	etc.) must be changed on at least a quarterly basis.</p></li>
															<li><p>All user-level passwords (e.g. email,
																	web, desktop computer, etc.) must be changed at least
																	every six months. The recommended change interval is
																	every three months.</p></li>

															<b>Password Protection</b>

															<li><p>Passwords must not be shared with anyone
																	(including coworkers and supervisors), and must not be
																	revealed or sent electronically.</p></li>
															<li><p>Passwords shall not be written down or
																	physically stored anywhere in the office or online. Do
																	not store passwords in a file on ANY computer system
																	(including Palm Pilots or similar devices) without
																	encryption.</p></li>
															<li><p>When configuring password “hints” do not
																	hint at the format of your password (e.g., “name +
																	12345”).</p></li>
															<li><p>User IDs and passwords must not be stored
																	in an unencrypted format.</p></li>
															<li><p>User IDs and passwords must not be
																	scripted to enable automatic login.</p></li>
															<li><p>“Remember Password” feature on websites
																	and applications should not be used.</p></li>
															<li><p>All mobile devices that connect to the
																	company network must be secured with a password and/or
																	biometric authentication and must be configured to lock
																	after 3 minutes of inactivity.</p></li>

														</ul>
													</div>
												</div>
											</div>
											<br>
											<div class="panel-default">
												<div class="panel-heading" role="tab" id="headingTwo">
													<h3 class="panel-title" style="color: #e03545;">
														<a class="collapsed" data-toggle="collapse"
															data-parent="#accordion" href="#collapseTwo"
															aria-expanded="false" aria-controls="collapseTwo"
															style="margin-right: 90%;">
															Purpose <i class="more-less glyphicon glyphicon-plus"></i> </a>
													</h3>

												</div>
												<div id="collapseTwo" class="panel-collapse collapse"
													role="tabpanel" aria-labelledby="headingTwo">
													<div class="panel-body" style="text-align: justify;">The
														purpose of this policy is to establish a standard for
														creation of strong passwords, the protection of those
														passwords, and the frequency of change.</div>


												</div>
											</div>
											<br>
											<div class=" panel-default">
												<div class="panel-heading" role="tab" id="headingThree">
													<h3 class="panel-title" style="color: #e03545;">
														<a class="collapsed" data-toggle="collapse"
															data-parent="#accordion" href="#collapseThree"
															aria-expanded="false" aria-controls="collapseThree"
															style="margin-right: 90%;"> Scope <i class="more-less glyphicon glyphicon-plus"></i>  </a>
													</h3>

												</div>
												<div id="collapseThree" class="panel-collapse collapse"
													role="tabpanel" aria-labelledby="headingThree">
													<div class="panel-body" style="text-align: justify;">The
														scope of this policy includes all personnel who have or
														are responsible for an account (or any form of access that
														supports or requires a password) on any system that
														resides at any RajSSO application, has access to the
														RajSSO portal.</div>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
							<!-- /.col -->
						</div>
						<!-- /.row -->
					</div>
					<!--/. container-fluid -->
				</div>
			</div>
		</div>
		<div class="row">
			<div class="row wow fadeInDown" data-wow-duration="2s" id="mainCount"></div>

			<div class="tab-content"
				style="border-radius: 10px; margin: 10px, 20px, 10px, 20px !important;">

				<div role="tabpanel" class="tab-pane active" id="home">

					<footer class="main-footer text-center"
						style="padding: 0px; margin-left: 0px; color: #fff; background-color: #343A40; font-size: 12px;">
						© 2020 NDMC, [All Rights Reserved] Designed, Developed &
						Maintained by: Information Technology Dept. For any
						suggestions/queries, please contact with IT Department of NDMC.

						<p style="margin: 0">

							<a href="#"><span data-toggle="modal" data-target="#myModal4">Helpdesk
									Details</span></a>&nbsp;&nbsp;|&nbsp; <a href="websitePolicy.html#googtrans(en|en)"> <span>Website
									Policies</span></a>&nbsp;&nbsp;|&nbsp; <a href="passwordPolicy.html#googtrans(en|en)">
								<span>Password Policy</span>
							</a>&nbsp;&nbsp;|&nbsp; <span>FAQ</span>&nbsp;&nbsp;|&nbsp; <span>Sitemap</span>
						</p>
					</footer>
					
				
					<script>
						//for locale google translate
						function googleTranslateElementInit() {
							new google.translate.TranslateElement(
									{
										pageLanguage : 'en',
										layout : google.translate.TranslateElement.FloatPosition.TOP_LEFT
									}, 'google_translate_element');
						}
					</script>
					<script
						src="https://translate.google.com/translate_a/element.js?cb=googleTranslateElementInit"></script>
					<script>
						$(document).ready(function() {
							$('#google_translate_element').hide();
						});

						$('.lang-select').click(function() {
							var theLang = jQuery(this).attr('data-lang');
							$('.goog-te-combo').val(theLang);
							window.location = jQuery(this).attr('href');
							location.reload();
						});

						$("body:first")
								.bind(
										'DOMSubtreeModified',
										function(event) {
											$(".skiptranslate:first-child")
													.attr("style",
															"visibility: hidden");
											$("body:first")
													.attr("style",
															"position: absolute; min-height: 100%; top: 0px;");
										});
					</script>
</body>


</html>
