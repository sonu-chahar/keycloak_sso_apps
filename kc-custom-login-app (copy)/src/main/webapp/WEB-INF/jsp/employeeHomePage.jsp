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
	margin: 0 0px 10px 0;
	font-size: 14px;
	font-weight: 600;
	color: #ff8a00;
	border-bottom: solid 1px #ff8a00;
	padding-bottom: 8px;
}
</style>
<style>
#myInput {
	background-position: 10px 12px; /* Position the search icon */
	background-repeat: no-repeat; /* Do not repeat the icon image */
	width: 100%; /* Full-width */
	font-size: 10px; /* Increase font-size */
	padding: 6px 20px 6px 20px; /* Add some padding */
	border: 1px solid #ddd; /* Add a grey border */
	margin-left: 15px;
}

#myUL {
	/* Remove default list styling */
	list-style-type: none;
	padding: 0;
	margin: 0;
}
</style>
<div class="main-gap form-horizontal user-portal">
	<h1 class="heading">
		<spring:message code="label.homePage.dashboard-heading" />
	</h1>
	<div class="container-fluid">
		<ul class="nav nav-tabs ul-dashboard-heading" role="tablist">
			<li class="active"><a href="#ndmcEmployee" role="tab"
				data-toggle="tab"> <spring:message
						code="label.homePage.ul-employee-heading" />
			</a></li>
			<li><a href="#nonNdmcEmployee" role="tab" data-toggle="tab">
					<spring:message code="label.homePage.ul-nonEmployee-heading" />
			</a></li>
		</ul>
		<div class="row">
			<div class="col-sm-3">
				<input type="text" id="myInput" onkeyup="myFunction()"
					placeholder="<spring:message code='label.integratedApp.search-application' />">
			</div>
		</div>

		<!-- Tab panes -->
		<div class="tab-content">
			<div class="tab-pane fade active in" id="ndmcEmployee">
				<div class="col-sm-12 col-md-12 col-lg-12">
					<div class="row">
						<div>
							<div class="row">
								<c:forEach items="${ndmcEmployeeApplicationList}"
									var="application" varStatus="counter">
									<c:if test="${counter.index == 0}">
										<div class="row">
											<div class="col-md-12">
									</c:if>
									<c:if test="${counter.index != 0  && counter.index%5 eq 0 }">
							</div>
						</div>
						<div class="row">
							<div class="col-md-12">
								</c:if>
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
												<spring:message code="label.integratedApp.${application.logoImageName}" /></a>
										</h2>
									</div>
								</div>
								<c:if test="${fn:length(ndmcEmployeeApplicationList)==(counter.index+1)}">
							</div>
						</div>
						</c:if>
						</c:forEach>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="tab-pane fade" id="nonNdmcEmployee">
		<div class="col-sm-12 col-md-12 col-lg-12">
			<div class="row">
				<div>
					<div class="row">
						<c:forEach items="${nonNdmcEmployeeApplicationList}"
							var="application" varStatus="counter">
							<c:if test="${counter.index == 0}">
								<div class="row">
									<div class="col-md-12">
							</c:if>
							<c:if test="${counter.index != 0  && counter.index%5 eq 0 }">
					</div>
				</div>
				<div class="row">
					<div class="col-md-12">
						</c:if>
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
										<spring:message code="label.integratedApp.${application.logoImageName}" /></a>
								</h2>
							</div>
						</div>
						<c:if test="${fn:length(nonNdmcEmployeeApplicationList)==(counter.index+1)}">
					</div>
				</div>
				</c:if>
				</c:forEach>
			</div>
		</div>
	</div>
</div>
</div>
</div>
</div>
</div>

<script>
	function myFunction() {
		// Declare variables
		var input, filter, ul, li, a, i, txtValue;
		input = document.getElementById('myInput');
		filter = input.value.toUpperCase();
		// ul = document.getElementById("myUL");
		li = document.getElementsByClassName('col-sm-2');

		// Loop through all list items, and hide those who don't match the search query
		for (i = 0; i < li.length; i++) {
			a = li[i].getElementsByTagName("a")[1];
			txtValue = a.textContent || a.innerText;
			if (txtValue.toUpperCase().indexOf(filter) > -1) {
				li[i].style.display = "";
			} else {
				li[i].style.display = "none";
			}
		}
	}
</script>