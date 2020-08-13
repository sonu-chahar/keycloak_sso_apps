<%@ include file="/static-resources/common/taglibs.jsp"%>


<div class="col-sm-12 col-md-12 col-lg-12">
	<%-- <div>
		<h2>SSO enabled Applications (${userMaster.firstName})</h2>
	</div> --%>
	<div class="row">
		<div class="main-gap keycloak-portal">
			<h1 class="dashbord-heading">
				<spring:message code="label.homePage.dashboard-heading" />
			</h1>
			<div class="row">
				<c:forEach items="${nonNdmcEmployeeApplicationList}" var="application"
					varStatus="counter">
					<div class="col-sm-2">
						<div class="base hvr-float-shadow">
							<div class="circle bg${counter.index%8+1}-circle">
								<a href='<c:url value="${application.applicationUrl}"/>'> <img
									alt="applicationLogo"
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
<script>
	$(document)
			.ready(
					function() {
						const urlParams = new URLSearchParams(
								window.location.search);
						const status = urlParams.get('status');
						if (status == "updateSuccess") {
							if ("${applicationList}" == "") {
								alert("User Updated Successfully.Now please add application first")
							} else {
								alert("User Updated Successfully");
							}
						} else if ("${applicationList}" == "") {
							alert("Please add application first")
						}
					});
</script>
