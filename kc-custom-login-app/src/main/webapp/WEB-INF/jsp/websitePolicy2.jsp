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
		$('.panel-group').on('hidden.bs.collapse', toggleIcon);
		$('.panel-group').on('shown.bs.collapse', toggleIcon);
	});
	function toggleIcon(e) {
		$(e.target).prev('.panel-heading').find(".more-less").toggleClass(
				'glyphicon-plus glyphicon-minus');
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
						<div class="col-md-12">



							<!------------------STATE SECTION SUBJECT CATEGORY-------------------->
							<div class="container-fluid" id="pending-div">
								<div class="col-md-12 wow slideInLeft graphWrapper"
									data-wow-duration="4s" style="min-height: auto">



									<div class="card card-info">
										<div class="card-header p-0">
											<div class="text-white text-center py-2"
												style="margin-bottom: 20px;">

												<h3 class="m-0" style="margin: 10px; padding: 5px;">Website
													Policies</h3>
											</div>
										</div>
										<div class="row">
											<div class="col-md-12">
												<div class="panel-group" id="accordion" role="tablist"
													aria-multiselectable="true">

													<div class=" panel-default">
														<div class="panel-heading" role="tab" id="headingOne">
															<h3 class="panel-title" style="color: #e03545;">
																<a data-toggle="collapse" data-parent="#accordion"
																	href="#collapseOne" aria-expanded="true"
																	aria-controls="collapseOne" style="margin-right: 85%;">
																	Privacy Policy <i
																	class="more-less glyphicon glyphicon-minus"></i>
																</a>
															</h3>

														</div>
														<div id="collapseOne" class="panel-collapse collapse in"
															role="tabpanel" aria-labelledby="headingOne">
															<div class="panel-body" style="text-align: justify;">
																<ul>
																	<li><p>As a general rule, this website does
																			not collect Personal Information about you when you
																			visit the site. You can generally visit the site
																			without revealing Personal Information, unless you
																			yourself choose to provide such information.</p></li>

																	<li><p>This website records your visits and
																			logs the following information for statistical
																			purposes -your server's address; the name of the
																			top-level domain from which you access the Internet
																			(for example, .gov, .com, .in, etc.); the type of
																			browser you use; the date and time you access the
																			site; the pages you have accessed; the documents
																			downloaded and the previous Internet address from
																			which you linked directly to the site. We will not
																			identify users or their browsing activities, except
																			when a law enforcement agency may exercise a warrant
																			to inspect the service provider's logs..</p></li>
																	<li><p>A cookie is a piece of software code
																			that an internet web site sends to your browser when
																			you access information at the site. This website uses
																			cookies..</p></li>
																	<li><p>Your email address will only be
																			recorded if you choose to send a message. It will
																			only be used for the purpose for which you have
																			provided it and will not be added to a mailing list.
																			Your email address will not be used for any other
																			purpose, and will not be disclosed, without your
																			consent.</p></li>
																	<li><p>If you are asked for any other Personal
																			Information you will be informed how it will be used.
																			If at any time you believe the principles referred to
																			in this privacy statement have not been followed, or
																			have any other comments on these principles, please
																			notify the concerned through the contact us page.</p></li>
																	<li><p>The use of the term "Personal
																			Information" in this privacy statement refers to any
																			information from which your identity is apparent or
																			can be reasonably ascertained..</p></li>
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
																	style="margin-right: 85%;"> Copyright Policy <i
																	class="more-less glyphicon glyphicon-plus"></i>
																</a>
															</h3>

														</div>
														<div id="collapseTwo" class="panel-collapse collapse"
															role="tabpanel" aria-labelledby="headingTwo">
															<div class="panel-body" style="text-align: justify;">Material
																featured on this site may be reproduced free of charge
																in any format or media without requiring specific
																permission. This is subject to the material being
																reproduced accurately and not being used in a derogatory
																manner or in a misleading context. Where the material is
																being published or issued to others, the source must be
																prominently acknowledged. However, the permission to
																reproduce this material does not extend to any other
																material on this site, which is explicitly identified as
																being the copyright of a third party. Authorization to
																reproduce such material must be obtained from the
																department/ copyright holder concerned.</div>


														</div>
													</div>
													<br>
													<div class=" panel-default">
														<div class="panel-heading" role="tab" id="headingThree">
															<h3 class="panel-title" style="color: #e03545;">
																<a class="collapsed" data-toggle="collapse"
																	data-parent="#accordion" href="#collapseThree"
																	aria-expanded="false" aria-controls="collapseThree"
																	style="margin-right: 85%;"> Hyper Linking Policy <i
																	class="more-less glyphicon glyphicon-plus"></i>
																</a>
															</h3>

														</div>
														<div id="collapseThree" class="panel-collapse collapse"
															role="tabpanel" aria-labelledby="headingThree">
															<div class="panel-body" style="text-align: justify;">
																<b> Links to external websites/portals</b>
																<p>At many places in this Portal, you shall find
																	links to other websites/portals. This links have been
																	placed for your convenience. DOIT&amp;C is not
																	responsible for the contents and reliability of the
																	linked websites and does not necessarily endorse the
																	views expressed in them. Mere presence of the link or
																	its listing on this Portal should not be assumed as
																	endorsement of any kind. We can not guarantee that
																	these links will work all the time and we have no
																	control over availability of linked pages.</p>
																<b> Links to SSO Portal by other websites</b>
																<p>We do not object to you linking directly to the
																	information that is hosted on this Portal and no prior
																	permission is required for the same. However, we would
																	like you to inform us about any links provided to this
																	Portal so that you can be informed of any changes or
																	updations therein. Also, we do not permit our pages to
																	be loaded into frames on your site. The pages belonging
																	to this Portal must load into a newly opened browser
																	window of the User.</p>
															</div>
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
