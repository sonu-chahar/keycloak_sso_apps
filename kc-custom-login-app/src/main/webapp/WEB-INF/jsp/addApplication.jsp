<%@ include file="/static-resources/common/taglibs.jsp"%>
<script src='<%=request.getContextPath()%>/dwr/engine.js'></script>
<script src='<%=request.getContextPath()%>/dwr/util.js'></script>
<script src="<%=request.getContextPath()%>/resources/js/list.js"></script>

<script
	src='<%=request.getContextPath()%>/dwr/interface/userMasterRemoteService.js'></script>

<title>Application Assigned</title>

<div class="main-gap form-horizontal user-portal">
	<form:form modelAttribute="applicationMasterDTO" method="post"
		id="addApplicationForm" onsubmit="return validateForm(this);"
		action="${ctx}/myProfile/addOrUpdateApplicationMapping">
		<div class="col-sm-12 col-md-12 col-lg-12">
			<div id="fApplicationList">
				<div class="row">
					<div class="main-gap keycloak-portal">
						<h1 class="dashbord-heading">Welcome to NDMC SSO Portal</h1>
						<div class="form-group form-group-sm">
							<div class="col-sm-3">
								<input id="search" placeholder="Search Application" />
							</div>
						</div>
						<div class="form-group form-group-sm">
							<c:forEach items="${applicationList}" var="application"
								varStatus="counter">
								<div class="col-sm-2">
									<div class="base hvr-float-shadow">
										<div class="circle bg${counter.index%8+1}-circle">
											<img alt="application-logo"
												src="<%=request.getContextPath()%>/images/icons/${application.logoImageName}.${application.logoImageExtension}"
												id="image${application.id}" width="90" height="90" />
										</div>
										<h2>
											<input type='hidden' value='false'
												id='hidden_app_${application.id}'
												name="applicationMappingToBeRemoved" /><input
												type="checkbox" id='app_${application.id}'
												name='applicationsMapped' value='${application.id}'
												onclick="populateSelectedApplicaiton(${application.id})"
												class="applicationNameSearch" /> <a
												href='<c:url value="${application.applicationUrl}"/>'></a> <span
												class="description">${application.applicationDisplayName}</span>
										</h2>
									</div>
								</div>
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
						<div class="form-group form-group-sm">
							<label class="col-sm-3 control-label label-inn">Note:</label> <label
								class="control-label label-inn">Only selected
								application will be shown at home page</label>
						</div>
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
		if (mappedList != null) {
			for (let i = 0; i < mappedList.length; i++) {
				$("#app_" + mappedList[i].id).attr('checked', true)
				$("#app_" + mappedList[i].id).val(mappedList[i].id);
				$("#hidden_app_" + mappedList[i].id).val("");
			}
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

	var $rows = $("input[name='applicationsMapped']");
	$('#search').keyup(function() {
	    //alert('abcc')
	    var val = '^(?=.*\\b' + $.trim($(this).val()).split(/\s+/).join('\\b)(?=.*\\b') + ').*$',
	        reg = RegExp(val, 'i'),
	        text;
	    $(".base").css("display", "block").filter(function() {
	        text = $(this).text().replace(/\s+/g, ' ');
	        return !reg.test(text);
	    }).css("display", "none");
	}); 
</script>
<%-- <script src="<%=request.getContextPath()%>/resources/js/list.js"></script>
<script>
	$(document).ready(function() {
		var options = {
			valueNames : [ 'fApplicationNameSearch' ]
		};
		var featureList = new List('fApplicationList', options);
	});
</script> --%>