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

		<div class="module-wrp">
		
			<input type="hidden" id="selectedApplications" />
			<table style="width:100%;cellspacing=0; cellpadding=0;border=0"  >
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
			</table>
		</div>
		<div class="form-group form-group-sm">
			<label class="col-sm-3 control-label label-inn">&nbsp; </label>
			&nbsp;&nbsp; <input type="submit" name="" value="Update" id="btnSave"
				class="btn btn-warning" /> &nbsp;&nbsp; <input type="reset"
				name="reset" value="RESET" id="btnReset" class="btn btn-warning"
				onclick="window.location.href='${ctx}/myProfile/addOrUpdateApplicationMapping'">
			&nbsp;&nbsp;
			<c:if test="${not empty message}">
				<span id="msg" class="message">${message}</span>
			</c:if>
		</div>
	</form:form>
</div>

<script>
	$(document).ready(function() {
		userMasterRemoteService.getApplicationListByUserId("${userMaster.id}",{
			async : false,
			callback : mappedListCallback
		});
	});
	function mappedListCallback(mappedList) {
		for(let i=0;i<mappedList.length;i++){
			$("#app_" + mappedList[i].id).attr( 'checked', true )
			$("#app_" + mappedList[i].id).val(mappedList[i].id);
			$("#hidden_app_" + mappedList[i].id).val("");
		}
	}
	
	function populateSelectedApplicaiton(selectedCheckbox) {
		if (true == selectedCheckbox.checked) {
			$("#app_" + selectedCheckbox.value).val(selectedCheckbox.value);
			$("#hidden_app_" + selectedCheckbox.value).val("");
		} else {
			$("#hidden_app_" + selectedCheckbox.value).val(selectedCheckbox.value);
			$("#app_" + selectedCheckbox.value).prop('checked',false)
		}
	}
	
	function validateForm(){
		if (($("input[name='applicationsMapped']:checked").length)<=0){
			alert("Please select atleast one application..!");
			return false;
		}
	}
</script>