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
		<form:form modelAttribute="userMasterDTO"
			action="${ctx}/registration/registerNewUser" method="post"
			onsubmit="return validateForm();">
			<div class="">
				<h1 class="heading">User Registration</h1>
				<fieldset class="scheduler-border">
					<legend class="scheduler-border">
						<h3 class="subheading">
							<i class="fa fa-edit"></i>Basic Details
						</h3>
					</legend>
					<div class="form-group form-group-sm">
						<label class="col-sm-3 control-label label-inn"> <fmt:message
								key="label.personalInformation.firstName" />
						</label>
						<div class="col-sm-3 required">
							<form:input id="fFirstName" path="firstName"
								cssClass="form-control" />
							*
							<form:errors path="firstName" cssClass="error" />
						</div>
						<label class="col-sm-2 control-label label-inn"> <fmt:message
								key="label.personalInformation.lastName" />
						</label>
						<div class="col-sm-3 required">
							<form:input id="fLastName" path="lastName"
								cssClass="form-control" />
							*
							<form:errors path="lastName" cssClass="error" />
						</div>

					</div>
					<div class="form-group form-group-sm">
						<label class="col-sm-3 control-label label-inn"> <fmt:message
								key="label.personalInformation.fatherName" />
						</label>
						<div class="col-sm-3 required">
							<form:input id="fFatherName" path="fatherName"
								cssClass="form-control" />
							*
							<form:errors path="fatherName" cssClass="error" />
						</div>
						<label class="col-sm-2 control-label label-inn"> <fmt:message
								key="label.personalInformation.dateOfBirth" />
						</label>
						<div class="col-sm-3 required">
							<form:input id="dateOfBirth" path="dateOfBirth" type="text"
								class="form-control" placeholder="DD/MM/YYYY" />
							*
							<form:errors path="dateOfBirth" cssClass="error" />
						</div>
					</div>
					<div class="form-group form-group-sm">
						<label class="col-sm-3 control-label label-inn"> <fmt:message
								key="label.personalInformation.emailId" />
						</label>
						<div class="col-sm-3 required">
							<form:input id="emailId" path="emailId" cssClass="form-control"
								maxlength="50" />
							*
							<form:errors path="emailId" cssClass="error" />
						</div>
						<label class="col-sm-2 control-label label-inn"> <fmt:message
								key="label.personalInformation.mobileNumber" />
						</label>
						<div class="col-sm-3 required">
							<form:input id="fMobileNumber" path="mobileNumber" maxlength="10"
								cssClass="form-control"
								onkeypress='return isNumberKeyMobileNumber(event)' />
							*
							<form:errors path="mobileNumber" cssClass="error" />
						</div>
					</div>
					<div class="form-group form-group-sm">
						<label class="col-sm-3 control-label label-inn"> <fmt:message
								key="label.personalInformation.gender" />
						</label>
						<div class="col-sm-3 required">
							<form:select class="form-control" id="fGender" path="gender">
								<form:option selected="selected" value="">---- Select <fmt:message
										key="label.personalInformation.gender" /> ----</form:option>
								<form:option value="m">Male</form:option>
								<form:option value="f">Female</form:option>
							</form:select>
							*
							<form:errors path="gender" cssClass="error" />
						</div>
						<label class="col-sm-2 control-label label-inn"><fmt:message
								key="label.personalInformation.locality" /></label>
						<div class="col-sm-3 required">
							<form:input id="fLocality" path="locality"
								cssClass="form-control" />
							*
							<form:errors path="locality" cssClass="error" />
						</div>
					</div>
					<div class="form-group form-group-sm">
						<label class="col-sm-3 control-label label-inn"> <fmt:message
								key="label.personalInformation.city" />
						</label>
						<div class="col-sm-3 required">
							<form:input id="fCity" path="city" maxlength="50"
								class="form-control" />
							*
							<form:errors path="city" cssClass="error" />
						</div>
						<label class="col-sm-2 control-label label-inn"> <fmt:message
								key="label.personalInformation.state" />
						</label>
						<div class="col-sm-3 required">
							<form:input id="fState" path="state" maxlength="100"
								class="form-control" />
							*
							<form:errors path="state" cssClass="error" />
						</div>
					</div>
					<div class="form-group form-group-sm">
						<label class="col-sm-3 control-label label-inn"> <fmt:message
								key="label.personalInformation.country" />
						</label>
						<div class="col-sm-3 required">
							<form:input id="fCountry" path="country" maxlength="100"
								class="form-control" />
							*
							<form:errors path="country" cssClass="error" />
						</div>
						<label class="col-sm-2 control-label label-inn"> <fmt:message
								key="label.personalInformation.pinCode" />
						</label>
						<div class="col-sm-3 required">
							<form:input id="fPinCode" path="pinCode" maxlength="6"
								cssClass="form-control"
								onkeypress='return isNumberKeyCPincode(event)' />
							*
							<form:errors path="pinCode" cssClass="error" />
						</div>
					</div>

					<h3 class="subheading">
						<i class="fa fa-edit"></i> Personal Details
					</h3>
					<div class="form-group form-group-sm">
						<label class="col-sm-3 control-label label-inn"> <fmt:message
								key="label.personalInformation.userType" />
						</label>
						<div class="col-sm-3 required">
							<form:select class="form-control" id="fUserType"
								path="userType.id">
								<form:option selected="selected" value="">---- Select <fmt:message
										key="label.personalInformation.userType" /> ----</form:option>
								<c:forEach items="${userTypeList}" var="userType">
									<option value="${userType.id}">${userType.name}</option>
								</c:forEach>
							</form:select>
							*
							<form:errors path="userType.id" cssClass="error" />
						</div>
						<label class="col-sm-2 control-label label-inn"> <fmt:message
								key="label.personalInformation.adharCardNumber" />
						</label>
						<div class="col-sm-3 required">
							<form:input id="fAdharCardNumber" path="adharCardNumber"
								maxlength="16" cssClass="form-control"
								onkeypress='return isNumberKeyAdharCardNumber(event)' />
							*
							<form:errors path="adharCardNumber" cssClass="error" />
						</div>
					</div>
					<div class="form-group form-group-sm">
						<label class="col-sm-3 control-label label-inn"> <fmt:message
								key="label.personalInformation.voterIdNumber" />
						</label>
						<div class="col-sm-3">
							<form:input id="fVoterIdNumber" path="voterIdNumber"
								class="form-control" />
							<form:errors path="voterIdNumber" cssClass="error" />
						</div>
						<label class="col-sm-2 control-label label-inn"> <fmt:message
								key="label.personalInformation.passportNumber" />
						</label>
						<div class="col-sm-3">
							<form:input id="fPassportNumber" path="passportNumber"
								class="form-control" />
							<form:errors path="passportNumber" cssClass="error" />
						</div>
					</div>
					<div class="form-group form-group-sm">
						<label class="col-sm-3 control-label label-inn"> <fmt:message
								key="label.personalInformation.waterConsumerNumber" />
						</label>
						<div class="col-sm-3">
							<form:input id="fWaterConsumerNumber" path="waterConsumerNumber"
								class="form-control" />
							<form:errors path="waterConsumerNumber" cssClass="error" />
						</div>
						<label class="col-sm-2 control-label label-inn"> <fmt:message
								key="label.personalInformation.electricityConsumerNumber" />
						</label>
						<div class="col-sm-3">
							<form:input id="fElectricityConsumerNumber"
								path="electricityConsumerNumber" class="form-control" />
							<form:errors path="electricityConsumerNumber" cssClass="error" />
						</div>
					</div>

					<div class="form-group form-group-sm">
						<label class="col-sm-3 control-label label-inn"> <fmt:message
								key="label.personalInformation.propertyId" />
						</label>
						<div class="col-sm-3">
							<form:input id="fPropertyId" path="propertyId"
								class="form-control" />
							<form:errors path="propertyId" cssClass="error" />
						</div>
						<label class="col-sm-2 control-label label-inn"> <fmt:message
								key="label.personalInformation.estatePropertyId" />
						</label>
						<div class="col-sm-3">
							<form:input id="fEstatePropertyId" path="estatePropertyId"
								class="form-control" />
							<form:errors path="estatePropertyId" cssClass="error" />
						</div>
					</div>

					<h2 class="subheading">
						<i class="fa fa-edit"></i> Login Details
					</h2>
					<div class="form-group form-group-sm">

						<label class="col-sm-3 control-label label-inn"> Username
						</label>
						<div class="col-sm-3 required ${status.error ? 'has-error' : ''}">
							<form:input id="fUsername" path="username" class="form-control" />
							*
							<form:errors path="username" cssClass="error" />
						</div>

					</div>

					<div class="form-group form-group-sm">
						<label class="col-sm-3 control-label label-inn"> Password
						</label>
						<div class="col-sm-3 required ${status.error ? 'has-error' : ''}">
							<form:input type="password" id="fPassword" path="password"
								class="form-control" />
							*
							<form:errors path="password" cssClass="error" />
						</div>
						<label class="col-sm-2 control-label label-inn"> Confirm
							Password </label>
						<div class="col-sm-3 required ${status.error ? 'has-error' : ''}">
							<form:input type="password" id="fConfirmPassword"
								path="confirmPassword" class="form-control" />
							*
							<form:errors path="password" cssClass="error" />
						</div>
					</div>

				</fieldset>
				<div class="form-group form-group-sm">
					<label class="col-sm-4 control-label label-inn">&nbsp;</label>
					<div class="col-sm-7">
						<input type="submit" name="Submit" class="btn btn-warning"
							value="SAVE" id="submitBtnId" /> <input type="reset"
							name="reset" value="RESET" id="btnReset" class="btn btn-warning"
							onclick="window.location.href='${ctx}/registration/showRegistrationPage'">
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
		function isValidEmailAddress(emailAddress) {
			var pattern = new RegExp(
					/^((([a-z]|\d|[!#\$%&'\*\+\-\/=\?\^_`{\|}~]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])+(\.([a-z]|\d|[!#\$%&'\*\+\-\/=\?\^_`{\|}~]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])+)*)|((\x22)((((\x20|\x09)*(\x0d\x0a))?(\x20|\x09)+)?(([\x01-\x08\x0b\x0c\x0e-\x1f\x7f]|\x21|[\x23-\x5b]|[\x5d-\x7e]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(\\([\x01-\x09\x0b\x0c\x0d-\x7f]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]))))*(((\x20|\x09)*(\x0d\x0a))?(\x20|\x09)+)?(\x22)))@((([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))\.)+(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))\.?$/i);
			return pattern.test(emailAddress);
		};

		function validateForm() {

			//$("#fAdharCardNumber").val(parseInt($("#fAdharCardNumber").trim()));
			//for First Name
			if ($("#fFirstName").val() == "") {
				alert("First Name is required !");
				$("#fFirstName").focus();
				return false;
			}

			//for Last Name
			if ($("#fLastName").val() == "") {
				alert("Last Name is required !");
				$("#fLastName").focus();
				return false;
			}

			//for Father Name
			if ($("#fFatherName").val() == "") {
				alert("Father Name is required !");
				$("#fFatherName").focus();
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
				alert("Date of Birth can not be greater than the Today's Date !");
				$("#dateOfBirth").focus();
				return false;
			}

			//for emailId
			if ($("#emailId").val() == "") {
				alert("Email id is required !");
				$("#emailId").focus();
				return false;
			}
			//for checkung emailaddress
			var emailaddress = $("#emailId").val();
			if (emailaddress != "") {
				if (!isValidEmailAddress(emailaddress)) {
					alert("Please enter a valid Email Id !");
					$("#emailId").focus();
					$("#emailId").select();
					return false;
				}
			}

			//for MobileNumber
			if ($("#fMobileNumber").val() == "") {
				alert("Mobile Number is required !");
				$("#fMobileNumber").focus();
				return false;
			}

			if ($("#fMobileNumber").val().length != 10) {
				alert("Please enter a valid Mobile Number !");
				$("#fMobileNumber").focus();
				return false;
			}
			//	$("#fMobileNumber").val($("#fMobileNumber").trim());

			//for Geneder
			if ($("#fGender").val() == "") {
				alert("Geneder is required !");
				$("#fGender").focus();
				return false;
			}
			//for Geneder
			if ($("#fLocality").val() == "") {
				alert("Locality is required !");
				$("#fLocality").focus();
				return false;
			}

			//for City
			if ($("#fCity").val() == "") {
				alert("City is required !");
				$("#fCity").focus();
				return false;
			}
			//for State
			if ($("#fState").val() == "") {
				alert("State is required !");
				$("#fState").focus();
				return false;
			}

			//for corresMobileNo
			if ($("#fCountry").val() == "") {
				alert("Country is required !");
				$("#fCountry").focus();
				return false;
			}
			//for gender 
			if ($("#fPinCode").val() == "") {
				alert("PinCode is required !");
				$("#fPinCode").focus();
				return false;
			}
			//for gender
			if ($("#fPinCode").val().length != 6) {
				alert("Please enter a valid PinCode!");
				$("#fPinCode").focus();
				return false;
			}
			//for UserType
			if ($("#fUserType").val() == "") {
				alert("UserType is required !");
				$("#fUserType").focus();
				return false;
			}
			//for AdharCardNumber
			if ($("#fAdharCardNumber").val() == "") {
				alert("AdharCardNumber is required !");
				$("#fAdharCardNumber").focus();
				return false;
			}

			//for AdharCardNumber
			if ($("#fAdharCardNumber").val().length < 12) {
				alert("Please enter a valid AdharCardNumber!");
				$("#fAdharCardNumber").focus();
				return false;
			}
			//	$("#fAdharCardNumber").val($("#fAdharCardNumber").trim());

			//for VoterIdNumber
			/* 	if ($("#fVoterIdNumber").val() == "") {
					alert("VoterIdNumber is required !");
					$("#fVoterIdNumber").focus();
					return false;
				} */
			//for PassportNumber
			/* 	if ($("#fPassportNumber").val() == "") {
					alert("PassportNumber is required !");
					$("#fPassportNumber").focus();
					return false;
				} */
			//for WaterConsumerNumber
			/* 	if ($("#fWaterConsumerNumber").val() == "") {
					alert("WaterConsumerNumber is required !");
					$("#fWaterConsumerNumber").focus();
					return false;
				} */
			//for ElectricityConsumerNumber
			/* if ($("#fElectricityConsumerNumber").val() == "") {
				alert("ElectricityConsumerNumber is required !");
				$("#fElectricityConsumerNumber").focus();
				return false;
			} */
			//for PropertyId
			/* if ($("#fPropertyId").val() == "") {
				alert("PropertyId is required !");
				$("#fPropertyId").focus();
				return false;
			} */

			//for EstatePropertyId
			/* if ($("#fEstatePropertyId").val() == "") {
				alert("EstatePropertyId is required !");
				$("#fEstatePropertyId").focus();
				return false;
			} */
			//for Username
			if ($("#fUsername").val() == "") {
				alert("Username is required !");
				$("#fUsername").focus();
				return false;
			}
			//for Password
			if ($("#fPassword").val() == "") {
				alert("Password is required !");
				$("#fPassword").focus();
				return false;
			}
			//for ConfirmPassword
			if ($("#fConfirmPassword").val() == "") {
				alert("ConfirmPassword is required !");
				$("#ConfirmPassword").focus();
				return false;
			}

			if ($("#fPassword").val() != $("#fConfirmPassword").val()) {
				alert("Password doesn't match !");
				$("#fUsername").focus();
				return false;
			}

			//alert("asdfsdaf")

			//alert($("#fMobileNumber").val())
		}

		function isNumberKeyMobileNumber(evt) {
			var charCode = (evt.which) ? evt.which : event.keyCode;
			if (charCode > 31 && (charCode< 48 || charCode >57)) {
				alert("Mobile Number must be a number !");
				return false;
			}
			return true;
		}

		function isNumberKeyCPincode(evt) {
			var charCode = (evt.which) ? evt.which : event.keyCode;
			if (charCode > 31 && (charCode< 48 || charCode >57)) {
				alert("Pincode must be a number !");
				return false;
			}
			return true;
		}

		function isNumberKeyAdharCardNumber(evt) {
			var charCode = (evt.which) ? evt.which : event.keyCode;
			if (charCode > 31 && (charCode< 48 || charCode >57)) {
				alert("AdharCardNumber must be a number !");
				return false;
			}
			return true;
		}
	</script>
	<script>
		$(document).ready(function() {
			datePick(new Array("dateOfBirth"));
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
