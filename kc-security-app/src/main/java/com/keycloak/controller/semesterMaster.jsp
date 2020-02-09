<%@ include file="/static-resources/common/taglibs.jsp"%>
<script type="text/javascript">
	//validation script
	function isNumberKey(evt){
      var charCode = (evt.which) ? evt.which : event.keyCode;
        if (charCode != 46 && charCode > 31  && (charCode < 48 || charCode > 57)){
	    alert("Semester Order must be a number !");
        return false;
     }
      return true;
    }
	function validateForm() {
		//for Semester Name
		if ($.trim($("#name").val()) == "") {
			alert("Semester Name is required !");
			$("#name").focus();
			return false;
		}
		$("#name").val($.trim($("#name").val()));
		//for Semester Roman
		if ($.trim($("#romanName").val()) == "") {
			alert("Semester Roman is required!");
			$("#romanName").focus();
			return false;
		}
		$("#romanName").val($.trim($("#romanName").val()));
		// for Semester Short
		if ($("#shortName").val()  == "" ) {
			 alert("Semester Short is required !");
				$("#shortName").focus();
				return false;
		} 
		$("#shortName").val($.trim($("#shortName").val()));
		
	
		 
		//for semester order
		 if ($.trim($("#order").val())  == "" ) {
				alert("Semester Order is required !");
				$("#order").focus();
				return false;
		} 
		 $("#order").val($.trim($("#order").val()));

		 if ($.trim($("#order").val())  == 0 ) {
				alert("Semester Order can't be zero  !");
				$("#order").focus();
				return false;
		} 
	}
</script>
<%
	String saveUrl = "/iums/v1/level1/newSemesterMaster/saveNewSemester";
	request.setAttribute("saveUrl", saveUrl);
%>
<title>Semester Master</title>

<div class="form-block">

	<div class="form-horizontal">
		 <form:form modelAttribute="semesterMaster" action="${saveUrl}"
			method="post" onsubmit="return validateForm()">
			<form:hidden path="id" id="mainFormId" />
			<input type="hidden" name="pageId" id="pageid" value="1204"> 

			<div class="">
				<h1 class="heading">
					<i class="fa fa-edit"></i> Semester Master
				</h1>
				<div class="form-bg">
					 <div class="form-group form-group-sm">
						<label class="col-sm-3 control-label label-inn">Full
							Semester Name</label>
						<div class="col-sm-3 required">
							<form:input path="name" maxlength="50" cssClass="form-control"
								id="name" />
							*
							<form:errors path="name" />
						</div>
						<label class="col-sm-2 control-label label-inn">Semester
							Name (In Roman)</label>
						<div class="col-sm-3 required">
							<form:input path="romanName" maxlength="6"
								cssClass="form-control" id="romanName" />
							*
							<form:errors path="romanName" />
						</div>
					</div> 
					<div class="form-group form-group-sm">
						<label class="col-sm-3 control-label label-inn">Semester
							Name (Short)</label>
						<div class="col-sm-3 required">
							<form:input path="shortName" maxlength="10"
								cssClass="form-control" id="shortName" />
							*
							<form:errors path="shortName" />
						</div>
						<label class="col-sm-2 control-label label-inn">isActive </label>
						<div class="col-sm-3 required">
							<form:checkbox path="isActive" id="active" />
						</div>
					</div>
					<div class="form-group form-group-sm">
						<label class="col-sm-3 control-label label-inn">Semester
							Order</label>
						<div class="col-sm-3 required">
							<form:input path="order" maxlength="2" cssClass="form-control"
								id="order" onkeypress="return isNumberKey(event)" />
							*
							<form:errors path="order" />
						</div>
					</div>

					<!-- <div class="clearfix"></div> -->
					<div class="form-group form-group-sm">
						<div class="col-sm-9 col-sm-offset-3">
							<input type="submit" name="" value="SAVE" id="btnSave"
								class="btn btn-warning" /> &nbsp;&nbsp;<input type="reset"
								name="reset" value="RESET" id="btnReset" class="btn btn-warning"
								onclick="window.location =${appctx}/level1/newSemesterMaster/showNewSemester" />
							&nbsp;&nbsp;
							<c:if test="${not empty message}">
								<span class="message" style="font-weight: bold; color: #ff0000;">${message}
								</span>
							</c:if>
							<span class="message"><c:out value="${disDupList}"></c:out></span>
							<div>
								<c:out value="${deleteObject}" />
							</div>
						</div>
					</div>
				</div>
			</div>
		</form:form> 
	</div>
</div>

<br />
<c:if test="${not empty  SemesterList}">
	<div class="form-block">
		<h1 class="heading">
			<i class="fa fa-edit"></i> List of Semester
		</h1>
		<div class="form-bg">
			<div class="table-responsive">
				<div style="width: 100%; height: 400px; overflow-y: scroll;">
					<display:table name="SemesterList" class="list grid data-grid"
						id="list" requestURI="" excludedParams="pageId"
						style="width: 100%;"
						decorator="net.expedien.decorator.academicsdecorator.SemesterMasterDecorator"
						sort="list" export="false">
						<display:column property="srNo" title="S.No."
							style="width:50px;text-align:center;" />
						<display:column property="name" title="Semester Name"
							escapeXml="true" />
						<display:column property="romanName" title="Semster Roman"
							escapeXml="true" />
						<display:column property="shortName" title="Semester Short"
							escapeXml="true" />
						<display:column property="order" title="Semester Order"
							escapeXml="true" />
						<display:column property="actionLink" title="EDIT/DELETE"
							media="html" style="width:100px;text-align:center;" />
					</display:table>
				</div>
			</div>
		</div>
	</div>
</c:if>

