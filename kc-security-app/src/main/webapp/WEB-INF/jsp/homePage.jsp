<%@ include file="/static-resources/common/taglibs.jsp"%>


<div class="col-sm-12 col-md-12 col-lg-12">
	<%-- <div>
		<h2>SSO enabled Applications (${userMaster.firstName})</h2>
	</div> --%>
	<div class="row">
		<div class="main-gap keycloak-portal">
			<h1 class="dashbord-heading">Welcome to NDMC Portal</h1>
			<div class="row">
					<c:forEach items="${applicationList}" var="application"
							varStatus="counter">
							<c:if test="${counter.index == 0}">
								<div class="row">
									<div class="col-md-12">
							</c:if>
							<c:if test="${counter.index != 0  && counter.index%4 eq 0 }">
								</div></div><div class="row"><div class="col-md-12">
							</c:if>
							<div class="col-sm-2">
								<div class="base hvr-float-shadow">
									<c:set var="classCounter" value="{}" />
									<div class="circle bg${counter.index%8+1}-circle">
										<a href='<c:url value="${application.applicationUrl}"/>'>
											<img
											src="<%=request.getContextPath()%>/images/icons/${application.logoImageName}.${application.logoImageExtension}"
											id="image${application.id}" width="90" height="90" />
										</a>
									</div>
									<h2>
										<a
											href='<c:url value="${application.applicationUrl}"/>'>
											${application.applicationDisplayName}</a>
									</h2>
								</div>
							</div>
							<c:if test="${fn:length(applicationList)==(counter.index+1)}"></div></div></c:if>
						</c:forEach>
					</div>
		</div>
	</div>
</div>
<<script>
	$(document).ready(function() {
				if("${applicationList}"=="" ){
					alert("Please add application first")
				}
			});
</script>
