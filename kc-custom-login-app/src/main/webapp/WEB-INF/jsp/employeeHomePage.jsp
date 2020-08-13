<%@ include file="/static-resources/common/taglibs.jsp"%>

<style>
.nav-tabs>li>a {
	border-radius: 0;
	box-shadow: inset 0 -8px 7px -9px rgba(0, 0, 0, .4), -2px -2px 5px -2px
		rgba(0, 0, 0, .4);
}

a[aria-expanded="true"]::before {
	content: none;
}

a[aria-expanded="false"]::before, a[aria-expanded="true"]::before {
	content: none;
}

.nav-tabs>li.active>a, .nav-tabs>li.active>a:hover {
	background: #F5F5F5;
	box-shadow: inset 0 0 0 0 rgba(0, 0, 0, .4), -2px -3px 5px -2px
		rgba(0, 0, 0, .4);
}

.container {
	padding-right: 58px;
	padding-left: 0px;
	margin-right: auto;
	margin-left: auto;
}

.ul-dashboard-heading {
	margin: 0 0 10px 0;
	font-size: 14px;
	font-weight: 600;
	color: #ff8a00;
	border-bottom: solid 1px #ff8a00;
	padding-bottom: 8px;
}
</style>
<div class="main-gap form-horizontal user-portal">
	<h1 class="heading">
		<spring:message code="label.homePage.dashboard-heading" />
	</h1>
	<div class="container">
		<ul class="nav nav-tabs ul-dashboard-heading" role="tablist">
			<li class="active"><a href="#ndmcEmployee" role="tab"
				data-toggle="tab"> <spring:message
						code="label.homePage.ul-employee-heading" />
			</a></li>
			<li><a href="#nonNdmcEmployee" role="tab" data-toggle="tab">
					<spring:message code="label.homePage.ul-nonEmployee-heading" />
			</a></li>
		</ul>

		<!-- Tab panes -->
		<div class="tab-content">
			<div class="tab-pane fade active in" id="ndmcEmployee">
				<div class="col-sm-12 col-md-12 col-lg-12">
					<div class="row">
						<div class="main-gap keycloak-portal">

							<div class="form-group form-group-sm">
								<c:forEach items="${ndmcEmployeeApplicationList}"
									var="application" varStatus="counter">
									<div class="col-sm-2">
										<div class="base hvr-float-shadow">
											<div class="circle bg${counter.index%8+1}-circle">
												<a href='<c:url value="${application.applicationUrl}"/>'>
													<img alt="applicationLogo"
													src="<%=request.getContextPath()%>/images/icons/${application.logoImageName}.${application.logoImageExtension}"
													width="90" height="90" />
												</a>
											</div>
											<h2>
												<a href='<c:url value="${application.applicationUrl}"/>'>
													${application.applicationDisplayName}</a>
											</h2>
										</div>
									</div>
								</c:forEach>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="tab-pane fade" id="nonNdmcEmployee">
				<div class="col-sm-12 col-md-12 col-lg-12">
					<div class="row">
						<div class="main-gap keycloak-portal">
							<div class="form-group form-group-sm">
								<c:forEach items="${nonNdmcEmployeeApplicationList}"
									var="application" varStatus="counter">
									<div class="col-sm-2">
										<div class="base hvr-float-shadow">
											<div class="circle bg${counter.index%8+1}-circle">
												<a href='<c:url value="${application.applicationUrl}"/>'>
													<img alt="applicationLogo"
													src="<%=request.getContextPath()%>/images/icons/${application.logoImageName}.${application.logoImageExtension}"
													width="90" height="90" />
												</a>
											</div>
											<h2>
												<a href='<c:url value="${application.applicationUrl}"/>'>
													${application.applicationDisplayName}</a>
											</h2>
										</div>
									</div>
								</c:forEach>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>