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
	<div class="form-horizontal">
		<form:form modelAttribute="userReportDTO"
			action="${ctx}/userReport/getUsers" method="post"
			onsubmit="return validateForm();">
			<div class="">
				<h1 class="heading">User Report</h1>
				<fieldset class="scheduler-border">
					<legend class="scheduler-border">
						<h3 class="subheading">
							<i class="fa fa-edit"></i>User Report
						</h3>
					</legend>
					<div class="form-group form-group-sm">
						<label class="col-sm-3 control-label label-inn"> Name
						</label>
						<div class="col-sm-3 required">
							<form:input id="fName" path="name"
								cssClass="form-control" />
							*
							<form:errors path="name" cssClass="error" />
						</div>
						<label class="col-sm-2 control-label label-inn"> isActive
						</label>
						<div class="col-sm-3 required">
							<form:input id="fIsActive" path="isActive"
								cssClass="form-control" />
							*
							<form:errors path="isActive" cssClass="error" />
						</div>

					</div>
					<div class="form-group form-group-sm">
						<label class="col-sm-3 control-label label-inn"> From Date</label>
						<div class="col-sm-3 required">
							<form:input id="fFromDate" path="fromDate"
								cssClass="form-control" />
							*
							<form:errors path="fatherName" cssClass="error" />
						</div>
						<label class="col-sm-2 control-label label-inn"> To Date
						</label>
						<div class="col-sm-3 required">
							<form:input id="fToDate" path="toDate" type="text"
								class="form-control" placeholder="DD/MM/YYYY" />
							*
							<form:errors path="toDate" cssClass="error" />
						</div>
					</div>
				</fieldset>
				<div class="form-group form-group-sm">
					<label class="col-sm-4 control-label label-inn">&nbsp;</label>
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
			</div>
		</form:form>
	</div>
	<script src="${ctx}/resources/js/jquery-1.12.4.js"></script>
	<script src="${ctx}/resources/js/jquery-ui-1.12.1.js"></script>
	<script src="${ctx}/resources/js/bootstrap.min.js"></script>
	<script src="${ctx}/resources/js/json.min.js"></script>
	<script src="${ctx}/resources/js/multiselect.js"></script>

	<script>
		

		function validateForm() {

			//for First Name
			if ($("#fName").val() == "" ||$("#isActive").val() == "") {
				alert("First Name is required !");
				$("#fFirstName").focus();
				return false;
			}

			//for dob
			if ($("#dateOfBirth").val() == "") {
				alert("Date of Birth is required !");
				$("#dateOfBirth").focus();
				return false;
			}

			var dobval = $("#dateOfBirth").val();
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
				$("#dateOfBirth").focus();
				return false;
			}

			
		}
	</script>
	<script>
		$(document).ready(function() {
			datePick(new Array("fromDate"));
			datePick(new Array("toDate"));
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
</body>
</html>
