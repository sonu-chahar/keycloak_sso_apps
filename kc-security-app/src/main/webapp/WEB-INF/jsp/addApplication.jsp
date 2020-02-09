<%@ include file="/static-resources/common/taglibs.jsp"%>
<script src='<%=request.getContextPath()%>/dwr/engine.js'></script>
<script src='<%=request.getContextPath()%>/dwr/util.js'></script>
<script
	src='<%=request.getContextPath()%>/dwr/interface/userMasterRemoteService.js'></script>

<title>Application Assigned</title>

<div class="main-gap form-horizontal user-portal">
	<form:form modelAttribute="applicationMasterDTO" method="post"
		id="addApplicationForm" onsubmit="return validateForm(this);"
		action="${ctx}/myProfile/addOrUpdateApplicationMapping">
		<div class="col-sm-12 col-md-12 col-lg-12">
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
							<c:if test="${counter.index != 0  && counter.index%5 eq 0 }">
								</div></div><div class="row"><div class="col-md-12">
							</c:if>
							<div class="col-sm-2">
								<div class="base hvr-float-shadow">
									<div class="circle bg${counter.index%8+1}-circle">
										<a href='<c:url value="${application.applicationUrl}"/>'>
											<img
											src="<%=request.getContextPath()%>/images/icons/${application.logoImageName}.${application.logoImageExtension}"
											id="image${application.id}" width="90" height="90" />
										</a>
									</div>
									<h2>
										<input type='hidden' value='false'
											id='hidden_app_${application.id}'
											name="applicationMappingToBeRemoved" /><input
											type="checkbox" id='app_${application.id}'
											name='applicationsMapped' value='${application.id}'
											onclick="populateSelectedApplicaiton(${application.id})" /><a
											href='<c:url value="${application.applicationUrl}"/>'>
											${application.applicationDisplayName}</a>
									</h2>
								</div>
							</div>
							<c:if test="${fn:length(applicationList)==(counter.index+1)}"></div></div></c:if>
						</c:forEach>
					</div>
					<div class="form-group form-group-sm">
						<label class="col-sm-3 control-label label-inn">&nbsp; </label>
						&nbsp;&nbsp; <input type="submit" name="" value="Update"
							id="btnSave" class="btn btn-warning" /> &nbsp;&nbsp; <input
							type="reset" name="reset" value="RESET" id="btnReset"
							class="btn btn-warning"
							onclick="window.location.href='${ctx}/myProfile/addOrUpdateApplicationMapping'">
						&nbsp;&nbsp;
						<c:if test="${not empty message}">
							<span id="msg" class="message">${message}</span>
						</c:if>
					</div>
				</div>
			</div>
		</div>
	</form:form>
</div>

<script>
	$(document).ready(
			function() {
				userMasterRemoteService.getApplicationListByUserId(
						"${userMaster.id}", {
							async : false,
							callback : mappedListCallback
						});
			});
	function mappedListCallback(mappedList) {
		for (let i = 0; i < mappedList.length; i++) {
			$("#app_" + mappedList[i].id).attr('checked', true)
			$("#app_" + mappedList[i].id).val(mappedList[i].id);
			$("#hidden_app_" + mappedList[i].id).val("");
		}
	}

	function populateSelectedApplicaiton(selectedCheckbox) {
		if (true == selectedCheckbox.checked) {
			$("#app_" + selectedCheckbox.value).val(selectedCheckbox.value);
			$("#hidden_app_" + selectedCheckbox.value).val("");
		} else {
			$("#hidden_app_" + selectedCheckbox.value).val(
					selectedCheckbox.value);
			$("#app_" + selectedCheckbox.value).prop('checked', false)
		}
	}

	function validateForm() {
		if (($("input[name='applicationsMapped']:checked").length) <= 0) {
			alert("Please select atleast one application..!");
			return false;
		}
	}
</script>