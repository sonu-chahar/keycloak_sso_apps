<%@ include file="/static-resources/common/taglibs.jsp"%>
<%-- 

<div class="col-sm-12 col-md-12 col-lg-12">
	<div>
		<h2>SSO enabled Applications (${userMaster.firstName})</h2>
	</div>
	<div class="row">
		<div class="main-gap keycloak-portal">
			<h1 class="dashbord-heading">Welcome to NDMC Portal</h1>
			<div class="row">
				<div class="col-md-12">
					<div class="row">
						<div class="col-sm-2">
							<div class="base hvr-float-shadow">
								<div class="circle bg-circle1">
									<img src="<%=request.getContextPath()%>/images/icons/my-profile.png">
								</div>
								<h2>
									<a href="http://uat.ndmc.gov.in/yellow"> YELLOW FEVER</a>
								</h2>
							</div>
						</div>
						<div class="col-sm-2">
							<div class="base hvr-float-shadow"> 
								<div class="circle bg8-circle">
									<img src="<%=request.getContextPath()%>/images/icons/certificate-request.png">
								</div>
								<h2>
									<a href="http://uat.ndmc.gov.in/bnd"> Birth Certificate</a>
								</h2> 
							</div>
						</div>
						<div class="col-sm-2">
							<div class="base hvr-float-shadow"> 
								<div class="circle bg-circle">
									<img src="<%=request.getContextPath()%>/images/icons/add-appliaction.png">
								</div>
								<h2>
									<a href="#">Add New Application</a>
								</h2> 
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div> --%>
<%-- 
<div class="container">
	<div class="starter-template">
		<h1>Spring Boot Web JSP Example</h1>
		<h2>Message: ${message}</h2>
	</div>
	<div>
		<input type="button" onclick="getsData()"
			value="click to fetch data using dwr"> <label id="labelId1"></label>
	</div>

</div> --%>

<!-- <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script> -->


<script src='<%=request.getContextPath()%>/dwr/engine.js'></script>
<script src='<%=request.getContextPath()%>/dwr/util.js'></script>
<script
	src='<%=request.getContextPath()%>/dwr/interface/remoteFunctions1.js'></script>
<script>
	function getsData() {
		remoteFunctions1.calculateFoo({
			async : false,
			callback : dummyDataCallBack
		});
	}
	function dummyDataCallBack(data) {
		//alert("data fetched using dwr: " + data);
		$("#labelId1").text(data);
	}
</script>




<title>Application Assigned</title>





<script>

function populateSelectedApplicaiton(selectedCheckbox) {
	if (true == selectedCheckbox.checked) {
		$("#app_" + selectedCheckbox.value).val(selectedCheckbox.value);
		$("#hidden_app_" + selectedCheckbox.value).val("");
	} else {
		$("#hidden_app_" + selectedCheckbox.value).val(selectedCheckbox.value);
		$("#app_" + selectedCheckbox.value).prop('checked',false)
	}
}
</script>
<div class="main-gap form-horizontal user-portal">
	<form:form modelAttribute="applicationMasterDTO" method="post"
		id="addApplicationForm" onsubmit="return validateForm(this);"
		action="${ctx}/myProfile/addOrUpdateApplicationMapping">

		<div class="module-wrp">
		
			<input type="hidden" id="selectedApplications" />
			<table width="100%" border="0" cellspacing="0" cellpadding="0">
				<thead>
					<tr>
						<th colspan="4"><h2>Application Assigned</h2></th>
					</tr>
				</thead>
				<tr>
					<td colspan="2" valign="top">
						<table border="0" cellspacing="4" cellpadding="4" width="735">
							<tr>
								<c:set var="counter" value="1" />
								<c:forEach items="${applicationList}" var="application">
									<c:choose>
										<c:when test="${counter%5 ne 0}">
											<td width="22%" class="mod-img">
												<div class="modulebg">
													<span class="moduleicon"> <a
														href='<c:url value="${application.applicationUrl}"/>'> <img
															src="<%=request.getContextPath()%>/images/icons/${application.logoImageName}.${application.logoImageExtension}"
															id="image${application.id}" width="90" height="90" />
													</a>
													</span>
													<div class="moduletitle">
														<input type='hidden' value='false'
															id='hidden_app_${application.id}'
															name="applicationMappingToBeRemoved" /><input
															type="checkbox" id='app_${application.id}'
															name='applicationsMapped' value='${application.id}'
															onclick="populateSelectedApplicaiton(${application.id})" /><a
															href='<c:url value="${application.applicationUrl}"/>'>
															${application.applicationDisplayName}</a>
													</div>
												</div>
											</td>
										</c:when>
										<c:otherwise>
											<td width="22%" class="mod-img">
												<div class="modulebg">
													<span class="moduleicon"> <a
														href='<c:url value="${application.applicationUrl}"/>'> <img
															src="<%=request.getContextPath()%>/images/icons/${application.logoImageName}.${application.logoImageExtension}"
															id="image${application.id}" width="90" height="90" />
													</a>
													</span>
													<div class="moduletitle">
														<input type="checkbox"
															onclick="selectedApplcation(${application.id})" /><a
															href='<c:url value="${application.applicationUrl}"/>'
															target="_blank"> ${application.applicationDisplayName}</a>
													</div>
												</div>
											</td>
							</tr>
							<tr>
								<c:set var="counter" value="0" />
								</c:otherwise>
								</c:choose>
								<c:set var="counter" value="${counter+1}" />
								</c:forEach>
								<td width="22%" height="110"></td>
							</tr>
						</table>
					</td>
				</tr>
				<!-- <tr>
						<td width="593">&nbsp;</td>
					</tr> -->
			</table>
		</div>
		<div class="form-group form-group-sm">
			<label class="col-sm-3 control-label label-inn">&nbsp; </label>
			&nbsp;&nbsp; <input type="submit" name="" value="Update" id="btnSave"
				class="btn btn-warning" /> &nbsp;&nbsp; <input type="reset"
				name="reset" value="RESET" id="btnReset" class="btn btn-warning"
				onclick="window.location.href='${ctx}/myProfile/showChangePwdPage'">
			&nbsp;&nbsp;
			<c:if test="${not empty message}">
				<span id="msg" class="message">${message}</span>
			</c:if>
		</div>
	</form:form>
</div>

<script>
function validateForm(){
	if (($("input[name='applicationsMapped']:checked").length)<=0){
		alert("Please select atleast one application..!");
		return false;
	}
}

</script>