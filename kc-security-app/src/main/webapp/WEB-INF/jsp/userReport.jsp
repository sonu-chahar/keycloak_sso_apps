<%@ include file="/static-resources/common/taglibs.jsp"%>

<!DOCTYPE html>
<html lang="en">
<head>
<title>User Registration</title>


<link rel="icon" type="image/x-icon"
	href="<%=request.getContextPath()%>/resources/images/favicon.ico" />
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/resources/css/default.css" />
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/resources/css/bootstrap.min.css">

<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/resources/css/font-awesome.min.css">

<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/resources/css/inside-style.css">

<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/resources/css/calendar.css" />
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/resources/css/style-responsive.css">

<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/resources/css/scroll.css">

</head>
<body>
	<div class="main-gap form-horizontal user-portal">
		<form:form modelAttribute="userReportDTO"
			action="${ctx}/userReport/getUsers" method="post"
			onsubmit="return validateForm();">
			<div class="">
				<h1 class="heading">User Report</h1>

				<div class="form-group form-group-sm">
					<label class="col-sm-3 control-label label-inn"> From Date</label>
					<div class="col-sm-3">
						<form:input id="fFromDate" path="fromDate" cssClass="form-control"
							placeholder="DD/MM/YYYY" />
						<form:errors path="fromDate" cssClass="error" />
					</div>
					<label class="col-sm-2 control-label label-inn"> To Date </label>
					<div class="col-sm-3">
						<form:input id="fToDate" path="toDate" class="form-control"
							placeholder="DD/MM/YYYY" />
						<form:errors path="toDate" cssClass="error" />
					</div>
				</div>
				<div class="form-group form-group-sm">
					<label class="col-sm-3 control-label label-inn"> Name/Email
					</label>
					<div class="col-sm-3 required">
						<form:input id="fName" path="name" cssClass="form-control" />
						<form:errors path="name" cssClass="error" />
					</div>
					<label class="col-sm-2 control-label label-inn"> Active
						Users Only </label>
					<div class="col-sm-3">
						<form:checkbox path="isActive" />
					</div>

				</div>

				<div class="form-group form-group-sm">
					<label class="col-sm-3 control-label label-inn">&nbsp;</label>
					<div class="col-sm-7">
						<input type="submit" name="Submit" class="btn btn-warning"
							value="Get Users" id="submitBtnId" /> <input type="reset"
							name="reset" value="RESET" id="btnReset" class="btn btn-warning"
							onclick="window.location.href='${ctx}/userReport/getUsers'">
						<c:if test="${not empty message}">
							<span class="message" style="font-weight: bold; color: #ff0000;">${message}
							</span>
						</c:if>
					</div>
				</div>
				<div class="form-group form-group-sm">
					<label class="col-sm-3 control-label label-inn"> </label>
					<div class="col-sm-7 message"
						style="font-weight: bold; color: #ff0000;">Note: To get All
						Users Please press button get userlist without search criteria..</div>
				</div>
			</div>
			<c:if test="${not empty  userList}">
			
				<div id="div_to_print" class="form-block">
					<div id="print-logo">
						<h3 style="text-align:center;">
							<img alt=""
								src="<%=request.getContextPath()%>/resources/images/logo1.png" />
						</h3>
					</div>
					<h1 class="heading" style="font-size:24px; font-weight:600;">Registered Users for SSO NDMC</h1>
					<div class="form-bg">
						<div class="table-responsive">
							<div style="width: 100%; height: 90%; overflow-y: scroll;">
								<display:table name="userList" class="list grid data-grid"
									id="list" requestURI="" excludedParams="pageId"
									style="width: 100%;"
									decorator="com.keycloak.decorator.UserReportDecorator"
									sort="list" export="false">
									<display:column property="srNo" title="S.No."
										style="width:50px;text-align:center;" />
									<display:column property="username" title="User name"
										escapeXml="true" />
									<display:column property="name" title="Name" escapeXml="true" />
									<display:column property="kcUserId" title="KccUserId"
										escapeXml="true" />
									<display:column property="emailId" title="EmailId"
										escapeXml="true" />
									<display:column property="createdTime" title="Created Time"
										escapeXml="true" />
								</display:table>
							</div>
						</div>
					</div>
				</div>
				<div>
					<input type="button" name="printUser" value="PRINT" id="print_btn"
						class="btn btn-warning">
				</div>
			</c:if>
		</form:form>
	</div>


	<script>
		function validateForm() {
			let fromDate = $("#fFromDate");
			if (checkDateFn(fromDate)) {
				let toDate = $("#fToDate");
				return checkDateFn(toDate)
			} else {
				return false;
			}
			/* var dobval = $("#fFromDate").val();
			var dob11 = dobval.split("/");
			var dobDate = dob11[0];
			var dobMonth = dob11[1];
			var dobYear = dob11[2];
			var dobdate = new Date();
			dobdate.setFullYear(dobYear, dobMonth - 1, dobDate);
			var today = new Date();
			var currentDate_Year = new Date().getFullYear();
			var ageyeardifference = currentDate_Year - dobYear;
			if (dobdate > today) {
				alert("Date can not be greater than the Today's Date !");
				$("#fFromDate").focus();
				return false;
			} */
		}
		function checkDateFn(checkDate) {
			var dobval = checkDate.val();
			var dob11 = dobval.split("/");
			var dobDate = dob11[0];
			var dobMonth = dob11[1];
			var dobYear = dob11[2];
			var dobdate = new Date();
			dobdate.setFullYear(dobYear, dobMonth - 1, dobDate);
			var today = new Date();
			var currentDate_Year = new Date().getFullYear();
			var ageyeardifference = currentDate_Year - dobYear;
			if (dobdate > today) {
				alert("Date can not be greater than the Today's Date !");
				checkDate.focus();
				return false;
			}
			return true;
		}
	</script>
	<script>
		$(document).ready(function() {
			datePick(new Array("fFromDate"));
			datePick(new Array("fToDate"));
			$('#print-logo').hide();
			
		});

		function datePick(elemIds) {
			for (var i = 0; i < elemIds.length; i++) {
				$("#" + elemIds[i]).attr("readonly", true);
				$("#" + elemIds[i]).datepicker(
						{
							yearRange : "-72:+30",
							dateFormat : 'dd/mm/yy',
							showOn : "button",
							changeMonth : true,
							changeYear : true,
							buttonImage : "${appctx}"
									+ "/resources/images/index.jpeg",
							buttonImageOnly : true,
							buttonText : "",
							autoSize : true,
							showButtonPanel : true,
							closeText : 'Clear',
							beforeShow : function(input) {
								setTimeout(function() {
									var clearButton = $(input).datepicker(
											"widget").find(
											".ui-datepicker-close");
									clearButton.unbind("click").bind("click",
											function() {
												$.datepicker._clearDate(input);
											});
								}, 1);
							}
						});
			}
		}
	</script>
	<script type="text/javascript">
		$(document).ready(function(e) {
			$('#print_btn').on('click', function(e) {
				$('#div_to_print').printThis();
			});
		});
	</script>
</body>
</html>
