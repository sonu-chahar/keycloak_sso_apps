<%@ include file="/static-resources/common/taglibs.jsp"%>
<%@page import="com.keycloak.model.UserMaster"%>
<script src="<%=request.getContextPath()%>/resources/js/countries.js"></script>

<title>My Profile</title>

<noscript class="noscript">
	<div id="div100">
		<h1>Please enable javascript in your browser ....</h1>
	</div>
</noscript>

<style>
body {
	position: relative;
}

.noscript {
	width: 100%;
	height: 100%;
	/* will cover the text displayed when javascript is enabled*/
	z-index: 100000; /* higher than other z-index */
	position: absolute;
}

.noscript #div100 {
	display: block;
	height: 100%;
	background-color: white;
	margin-top: -22px;
}
</style>
<%
	UserMaster user = (UserMaster) request.getSession(false).getAttribute("userMaster");

	if (user != null) {
		String imageUrl = "myProfile/getImage/" + user.getMobileNumber() + "/" + user.getImageName() + "/"
				+ user.getFileExtension();
		request.setAttribute("imageUrl", imageUrl);
	}
%>

<div class="main-gap form-horizontal user-portal">
	<form:form modelAttribute="userMasterDTO" method="post"
		onsubmit="return validate(this);"
		action="${ctx}/myProfile/updateProfile" enctype="multipart/form-data"
		id="profileForm">

		<h1 class="heading">
			<i class="fa fa-edit"></i> My Profile
		</h1>
		<form:hidden path="id" />
		<input type="hidden" id="fGenerateOTPFlag" value="false" />
		<input type="hidden" id="fRemoveImageFlag" name="removeImageFlag"
			value="false" />
		<div class="form-group form-group-sm">
			<label class="col-sm-3 control-label label-inn"> <fmt:message
					key="label.personalInformation.firstName" />
			</label>
			<div class="col-sm-3 required">
				<form:input id="fFirstName" path="firstName"
					cssClass="form-control denyNumber" />
				*
				<form:errors path="firstName" cssClass="error" />
			</div>
			<label class="col-sm-2 control-label label-inn"> <fmt:message
					key="label.personalInformation.lastName" />
			</label>
			<div class="col-sm-3 required">
				<form:input id="fLastName" path="lastName"
					cssClass="form-control denyNumber" />
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
					cssClass="form-control denyNumber" />
				*
				<form:errors path="fatherName" cssClass="error" />
			</div>
			<label class="col-sm-2 control-label label-inn"> <fmt:message
					key="label.personalInformation.dateOfBirth" />
			</label>
			<div class="col-sm-3 required">
				<form:input id="dateOfBirth" style="width:120px" path="dateOfBirth"
					type="text" class="form-control" placeholder="DD/MM/YYYY" />
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
			<label class="col-sm-2 control-label label-inn"> <fmt:message
					key="label.personalInformation.country" />
			</label>
			<div class="col-sm-3 required">
				<form:select class="form-control" id="fCountry" path="country">
					<option selected="selected" value="">---- Select
						<fmt:message key="label.personalInformation.country" /> ----
					</option>
					<%-- <form:input id="fCountry" path="country" maxlength="100"
					class="form-control" /> --%>
				</form:select>
				*
				<form:errors path="country" cssClass="error" />
			</div>

		</div>
		<div class="form-group form-group-sm">
			<label class="col-sm-3 control-label label-inn"> <fmt:message
					key="label.personalInformation.state" />
			</label>
			<div class="col-sm-3 required">
				<%-- <form:input id="fState" path="state" maxlength="100"
					class="form-control" /> --%>
				<form:select class="form-control" id="fState" path="state">
					<option selected="selected" value="">---- Select
						<fmt:message key="label.personalInformation.state" /> ----
					</option>
				</form:select>
				*
				<form:errors path="state" cssClass="error" />
			</div>
			<label class="col-sm-2 control-label label-inn"> <fmt:message
					key="label.personalInformation.city" />
			</label>
			<div class="col-sm-3 required">
				<form:input id="fCity" path="city" maxlength="50"
					class="form-control denyNumber" />
				*
				<form:errors path="city" cssClass="error" />
			</div>

		</div>
		<div class="form-group form-group-sm">
			<label class="col-sm-3 control-label label-inn"><fmt:message
					key="label.personalInformation.locality" /></label>
			<div class="col-sm-3 required">
				<form:input id="fLocality" path="locality" cssClass="form-control" />
				*
				<form:errors path="locality" cssClass="error" />
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

		<h2 class="subheading">
			<i class="fa fa-edit"></i> Personal Details
		</h2>
		<div class="form-group form-group-sm">
			<label class="col-sm-3 control-label label-inn"> <fmt:message
					key="label.personalInformation.userType" />
			</label>
			<div class="col-sm-3 required">
				<form:select class="form-control" id="fUserType" path="userType">
					<form:option selected="selected" value="">---- Select <fmt:message
							key="label.personalInformation.userType" /> ----</form:option>
					<%-- <c:forEach items="${userTypeList}" var="userType">
						<option value="${userType.id}">${userType.name}</option>
					</c:forEach> --%>
					<form:option value="Citizen">Citizen</form:option>
					<form:option value="ndmcEmployee">NDMC Employee</form:option>
					<form:option value="nonNdmcUser">Non NDMC User</form:option>
				</form:select>
				*
				<form:errors path="userType" cssClass="error" />
			</div>
			<label class="col-sm-2 control-label label-inn"> <fmt:message
					key="label.personalInformation.adharCardNumber" />
			</label>
			<div class="col-sm-3 required">
				<form:input id="fAdharCardNumber" path="adharCardNumber"
					maxlength="16" cssClass="form-control"
					onkeypress='return isNumberKeyAdharCardNumber(event)' />
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
				<form:input id="fPropertyId" path="propertyId" class="form-control" />
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
		<div class="form-group form-group-sm">
			<label class="col-sm-3 control-label label-inn">Upload Photo:
			</label>

			<div class="col-sm-3">
				<form:input path="imageFile" type="file" id="file" />
				<form:hidden path="imageName" />
				<form:hidden path="fileExtension" />
			</div>

			<label class="col-sm-2 control-label label-inn">&nbsp; </label>
			<div class="col-sm-3">
				<div id="userimg">
					<c:if
						test="${not empty userMaster.id and not empty userMaster.imageName}">
						<div id="imgcontent">
							<img src='<c:url value="${baseURL}/${imageUrl}"/>'
								style="width: 35%; height: 20%;" />
						</div>
					</c:if>
				</div>
			</div>
		</div>
		<!-- <div id="fOtpOverlay" class="manage-otp-popup modal-backdrop fade"></div> -->
		<div id='fOtpPopupDiv' class='manage-otp-popup modal fade'
			tabindex='-1' role='dialog' aria-labelledby='myModalLabel'
			aria-hidden='true'>
			<div class='modal-dialog'>
				<div class='modal-content'>
					<div class='modal-header'>
						<button type='button' class='btn btn-warning close'
							data-dismiss='modal' onclick='return closeOpenPopup();'>&times;</button>
						<h4 class='modal-title'>Verify Phone Number</h4>
					</div>
					<div id='fOtpModelBody' class='modal-body'>
						<div class="form-group form-group-sm" id="fOtpDiv">
							<label class="col-sm-4 control-label label-inn"> Enter
								OTP </label>
							<div class="col-sm-6">
								<input id="fOtp" name="otp" maxlength="6" class="form-control" />
							</div>
						</div>
					</div>
					<div class='modal-footer'>
						<button id="fOtpResentBtn" type='button' class='btn btn-warning'
							onclick="resendOtp()">Resend OTP</button>
						<button type='button' class='btn btn-warning' data-dismiss='modal'
							onclick='return closeOpenPopup();'>Update</button>
					</div>
				</div>
			</div>
		</div>

		<div class="form-group form-group-sm">
			<label class="col-sm-3 control-label label-inn">&nbsp; </label> <input
				type="button" name="RemoveImage" value="Remove Image"
				id="removeImage" class="btn btn-warning" onclick="clearImage()" />&nbsp;&nbsp;
			<input type="submit" name="" value="Update" id="btnSave"
				class="btn btn-warning" /> &nbsp;&nbsp; <input type="reset"
				name="reset" value="RESET" id="btnReset" class="btn btn-warning"
				onclick="window.location.href='${ctx}/myProfile/showProfile'">
			&nbsp;&nbsp;
			<c:if test="${not empty message}">
				<span id="msg" class="message">${message}</span>
			</c:if>
			<input type="button" name="bHiddenBtnForBSModal"
				id="bHiddenBtnForBSModal" data-toggle="modal"
				data-target="#fOtpPopupDiv" />
		</div>

	</form:form>
</div>


<script>
function isValidEmailAddress(emailAddress) {
	var pattern = new RegExp(
			/^((([a-z]|\d|[!#\$%&'\*\+\-\/=\?\^_`{\|}~]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])+(\.([a-z]|\d|[!#\$%&'\*\+\-\/=\?\^_`{\|}~]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])+)*)|((\x22)((((\x20|\x09)*(\x0d\x0a))?(\x20|\x09)+)?(([\x01-\x08\x0b\x0c\x0e-\x1f\x7f]|\x21|[\x23-\x5b]|[\x5d-\x7e]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(\\([\x01-\x09\x0b\x0c\x0d-\x7f]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]))))*(((\x20|\x09)*(\x0d\x0a))?(\x20|\x09)+)?(\x22)))@((([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))\.)+(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))\.?$/i);
	return pattern.test(emailAddress);
};

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
<script>
//for hiding message
function hideMsg(){
	$("#msg").hide("slow");
}

function clearImage(){
	$("#imgcontent").html("");
	$("#imageName").val('');
	$("#fileExtension").val('');
}

//validation script
function validate(){
	if( "${userMaster.mobileNumber}" != $("#fMobileNumber").val()){
		$( "#bHiddenBtnForBSModal" ).trigger( "click" );
	}
	
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
/* 	//for AdharCardNumber
	if ($("#fAdharCardNumber").val() == "") {
		alert("AdharCardNumber is required !");
		$("#fAdharCardNumber").focus();
		return false;
	}*/
	
	//for AdharCardNumber
	if ($("#fAdharCardNumber").val() != ""&& $("#fAdharCardNumber").val().length<12) {
		alert("Please enter a valid AdharCardNumber!");
		$("#fAdharCardNumber").focus();
		return false;
	}
	
	if( $("#fGenerateOTPFlag").val()=="false" && "${userMaster.mobileNumber}" != $("#fMobileNumber").val()){
		let effUrl=getUrlForOtp();
		
		$.get(effUrl, function(data, status,xhr){
			  $("#fGenerateOTPFlag").val("true");
			  $("#fOtpResentBtn").prop('disabled', false);
			  if($("#fOtp").val().length == 6){
				  $("#profileForm").submit();
			  }
		});
		if($("#fGenerateOTPFlag").val()=="false" && $("#fOtp").val().length != 6){
			alert("Please wait otp is being sent to your mobile...");
			return false;
		}
	} 
	if($("#fGenerateOTPFlag").val()=="true" && $("#fOtp").val().length != 6){
		return false;
	}
	
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

	let file=$('#file')[0].files[0];
	if(file!= null){
		file_size=file.size;
		if(file.size>50000) {
			alert("File size should not be greater than 50kb!");
			return false;
		} 
	}
		
}

function isNumberKeyMobileNumber(evt) {
	var charCode = (evt.which) ? evt.which : event.keyCode;
	if (charCode > 31 && (charCode< 48 || charCode >57)) {
		alert("Phone Number must be a number !");
		return false;
	}
	return true;
}

function isNumberKeyOTP(evt) {
	var charCode = (evt.which) ? evt.which : event.keyCode;
	if (charCode > 31 && (charCode< 48 || charCode >57)) {
		alert("OTP must be a number !");
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

function closeOpenPopup(){
	if($(".manage-otp-popup").hasClass("in")){
		if($("#fOtp").val() != "" && $("#fOtp").val().length < 6 ){
			alert("Please enter Valid OTP")
		}
		if($("#fOtp").val() != "" && $("#fOtp").val().length == 6){
			$(".manage-otp-popup").removeClass("in");
			$(".manage-otp-popup").css("display", "none");
			$("#profileForm").submit();
		}
	}else{
		$(".manage-otp-popup").addClass("in");
		$(".manage-otp-popup").css("display", "block");
		$("#fOtp").focus();
	}
}
$(document).ready(function() {
	$(".manage-otp-popup").css("display", "none");
	
	populateCountries("fCountry", "fState");
	if("${userMaster.imageName}"==""){
		alert("Kindly complete your profile to proceed further");
	}
	$("#fOtpPopupDiv").hide();
	$("#fOtpResentBtn").prop('disabled', true);
	
	if(${userMaster ne null} && (${userMaster.isPhoneVerified ne null } && ${userMaster.isPhoneVerified eq true }) || ${userMaster.isPhoneVerified eq null }){
		$("#bGenerateOtp").hide();
	}
	
	if(${userMaster.firstName ne null}){
		$("#fFirstName").val('${userMaster.firstName}');
	}
	if(${userMaster.lastName ne null}){
		$("#fLastName").val('${userMaster.lastName}');
		//$("#fLastName").attr('readonly', true);
	}
	if(${userMaster.fatherName ne null}){
		$("#fFatherName").val('${userMaster.fatherName}');
	}
	if(${userMaster.dateOfBirth ne null}){
		$("#dateOfBirth").val('${userMaster.dateOfBirth}');
	}
	if(${userMaster.emailId ne null}){
		$("#emailId").val('${userMaster.emailId}');
	}
	if(${userMaster.mobileNumber ne null}){
		$("#fMobileNumber").val('${userMaster.mobileNumber}');
	}
	if(${userMaster.gender ne null}){
		$("#fGender").val('${userMaster.gender}');
	}
	if(${userMaster.locality ne null}){
		$("#fLocality").val('${userMaster.locality}');
	}
	if(${userMaster.city ne null}){
		$("#fCity").val('${userMaster.city}');
	}
	 
	if(${userMaster.country ne null}){
		$("#fCountry").val('${userMaster.country}');
		$("#fCountry").trigger("change");
	} 
	if(${userMaster.state ne null}){
		$("#fState").val('${userMaster.state}');
	}
	if(${userMaster.pinCode ne null}){
		$("#fPinCode").val('${userMaster.pinCode}');
	}
	if(${userMaster.userType ne null}){
		$("#fUserType").val('${userMaster.userType}');
	}
	if(${userMaster.adharCardNumber ne null}){
		$("#fAdharCardNumber").val('${userMaster.adharCardNumber}');
	} 
	if(${userMaster.voterIdNumber ne null}){
		$("#fVoterIdNumber").val('${userMaster.voterIdNumber}');
	}
	if(${userMaster.passportNumber ne null}){
		$("#fPassportNumber").val('${userMaster.passportNumber}');
	}
	if(${userMaster.waterConsumerNumber ne null}){
		$("#fWaterConsumerNumber").val('${userMaster.waterConsumerNumber}');
	}
	if(${userMaster.electricityConsumerNumber ne null}){
		$("#fElectricityConsumerNumber").val('${userMaster.electricityConsumerNumber}');
	}
	if(${userMaster.propertyId ne null}){
		$("#fPropertyId").val('${userMaster.propertyId}');
	}
	if(${userMaster.estatePropertyId ne null}){
		$("#fEstatePropertyId").val('${userMaster.estatePropertyId}');
	}
	if(${userMaster.imageName ne null}){
		$("#imageName").val('${userMaster.imageName}');
	}
	if(${userMaster.fileExtension ne null}){
		$("#fileExtension").val('${userMaster.fileExtension}');
	}
}); 

jQuery('.denyNumber').keyup(function () { 
	if(this.value!=="" && !isNaN(this.value)){
    	alert("Name can't be a number!")
    }
    this.value = this.value.replace(/[^a-zA-Z\s]/g,'');
    
});

var otpCounter=1;
function resendOtp(){
	if(otpCounter==4){
		alert("can't send further otp");
		 $("#fOtpResentBtn").prop('disabled', true);
	}else{
		let effUrl=getUrlForOtp();
		$.get(effUrl, function(data, status,xhr){
		  if($("#fOtp").val().length == 6){
			  $("#profileForm").submit();
		  }
		});
	}
	otpCounter++;
}

function getUrlForOtp(){
	let effUrl;
	if("${activeProfile}"=="dev"){
		effUrl="http://192.168.10.215:8080/kc-security-app/myProfile/generateOtp"+"/"+$("#fMobileNumber").val();
	}else{
		effUrl='http://172.16.200.195:8080/ndmc-app/myProfile/generateOtp'+'/'+$("#fMobileNumber").val();
	}
	return effUrl;
}
</script>


