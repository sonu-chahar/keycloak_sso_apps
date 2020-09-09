<%@ include file="/static-resources/common/taglibs.jsp"%>
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
	list-style-type: none;
	padding: 0;
	margin: 0;
}
</style>
<script src='<%=request.getContextPath()%>/dwr/engine.js'></script>
<script src='<%=request.getContextPath()%>/dwr/util.js'></script>
<script src="<%=request.getContextPath()%>/resources/js/list.js"></script>
<spring:message code="label.btn.update" var="btnUpdate" />
<spring:message code="label.btn.reset" var="btnReset" />

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
					<div class="form-group form-group-sm">
						<div class="col-sm-3">
							<input type="text" id="myInput" onkeyup="myFunction()"
								placeholder="<spring:message code='label.integratedApp.search-application' />">
						</div>
					</div>
					<div class="main-gap keycloak-portal">
						<h3 class="dashbord-heading-add-application">
							<spring:message code="label.homePage.ul-employee-heading" />
						</h3>
						<div class="row">
							<c:forEach items="${ndmcEmployeeApplicationList}"
								var="application" varStatus="counter">
								<c:if test="${counter.index == 0}">
									<div class="row">
										<div class="col-md-12">
								</c:if>
								<c:if test="${counter.index != 0  && counter.index%6 eq 0 }">
						</div>
					</div>
					<div class="row">
						<div class="col-sm-12">
							</c:if>
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
											href='<c:url value="${application.applicationUrl}"/>'></a> 
											<spring:message code="label.integratedApp.${application.logoImageName}" />
									</h2>
								</div>
							</div>
							<c:if
								test="${fn:length(ndmcEmployeeApplicationList)==(counter.index+1)}">
						</div>
					</div>
					</c:if>
					</c:forEach>
				</div>
				<div class="row">
					<div class="main-gap keycloak-portal">
						<h3 class="dashbord-heading-add-application">
							<spring:message code="label.homePage.ul-nonEmployee-heading" />
						</h3>
						<div class="row">
							<c:forEach items="${nonNdmcEmployeeApplicationList}"
								var="application" varStatus="counter">
								<c:if test="${counter.index == 0}">
									<div class="row">
										<div class="col-md-12">
								</c:if>
								<c:if test="${counter.index != 0  && counter.index%6 eq 0 }">
						</div>
					</div>
					<div class="row">
						<div class="col-sm-12">
							</c:if>
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
											href='<c:url value="${application.applicationUrl}"/>'></a> <spring:message code="label.integratedApp.${application.logoImageName}" />
									</h2>
								</div>
							</div>
							<c:if
								test="${fn:length(nonNdmcEmployeeApplicationList)==(counter.index+1)}">
						</div>
					</div>
					</c:if>
					</c:forEach>
				</div>
				<div class="form-group form-group-sm">
					<label class="col-sm-3 control-label label-inn">&nbsp; </label>
					&nbsp;&nbsp; <input type="submit" name="" value="${btnUpdate}"
						class="btn btn-warning" /> &nbsp;&nbsp; <input type="reset"
						name="reset" value="${btnReset}" id="btnReset"
						class="btn btn-warning"
						onclick="window.location.href='${ctx}/myProfile/addOrUpdateApplicationMapping'">
					&nbsp;&nbsp;
					<c:if test="${not empty message}">
						<span id="msg" class="message">${message}</span>
					</c:if>
				</div>
				<div class="form-group form-group-sm">
					<label class="col-sm-3 control-label label-inn"><spring:message
							code="label.addApplicationPage.note" /></label> <label
						class="control-label label-inn"><spring:message
							code="label.addApplicationPage.noteMessage" /></label>
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
						}
				);
				
				let userType="${userMaster.userType}";
				
				<c:forEach items = "${applicationList}" var="appMst">
		           if(userType !='ndmcEmployee' && ${appMst.isNdmcEmployee}){
		        	   $("#app_" + ${appMst.id}).attr('disabled',true);
		           }
		        </c:forEach>
			}
	);
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

	/* var $rows = $("input[name='applicationsMapped']");
	$('#search').keyup(function() {
	    //alert('abcc')
	    var val = '^(?=.*\\b' + $.trim($(this).val()).split(/\s+/).join('\\b)(?=.*\\b') + ').*$',
	        reg = RegExp(val, 'i'),
	        text;
	    $(".base").css("display", "block").filter(function() {
	        text = $(this).text().replace(/\s+/g, ' ');
	        return !reg.test(text);
	    }).css("display", "none");
	});  */
	
</script>
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
			a = li[i].getElementsByTagName("span")[0];
			txtValue = a.textContent || a.innerText;
			if (txtValue.toUpperCase().indexOf(filter) > -1) {
				li[i].style.display = "";
			} else {
				li[i].style.display = "none";
			}
		}
	}
</script>