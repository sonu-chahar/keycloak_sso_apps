function createTable() {
$("#btnSavee").val("SAVE");
	// validation script
	if (document.myForm.natureType.selectedIndex == 0) {
		alert("Nature Type is required !");
		document.myForm.natureType.focus();
		return false;
	}
	var maxPerYear = document.forms["myForm"]["maxPerYear"].value;
	if (maxPerYear == null || maxPerYear == "") {
		alert("Max Leave Per Year is required !");
		$("#maxPerYear").focus();
		return false;
	}
	if ($("#formulaid").val() != "" && $("#amount").val() != "" ) {
		alert("Enter either Formula or Amount!");
		$("#amount").focus();
		return false;
	}
	var maxleave = $("#maxPerYear").val();
	if(maxleave > 365 ){
		alert("Leave per year cannot be more than 365 !");
		$("#maxPerYear").focus();
		return false;
	}
	if(maxleave ==0){
		alert("Max Leave canot be zero!");
		$("#maxPerYear").focus();
		return false;
	}
	
	if (isNaN(maxPerYear)) {
		alert("Please enter a number in Max Leave Per Year !");
		$("#maxPerYear").focus();
		return false;
	}
	if (document.myForm.carryForward.checked) {
		var totalLeaveLimit = document.forms["myForm"]["totalLeaveLimit"].value;
		if (totalLeaveLimit == null || totalLeaveLimit == "") {
			alert("Carry Forward Limit is required !");
			$("#totalLeaveLimit").focus();
			return false;
		}

		if (isNaN(totalLeaveLimit)) {
			alert("Please enter a number in Carry Forward Limit !");
			$("#totalLeaveLimit").focus();
			return false;
		}
	}
	var leaveLimitPerInst = document.forms["myForm"]["leaveLimitPerInst"].value;
	if (leaveLimitPerInst == null || leaveLimitPerInst == "") {
		alert("Leave Limit Per Instance is required !");
		$("#leaveLimitPerInst").focus();
		return false;
	}

	if (isNaN(leaveLimitPerInst)) {
		alert("Please enter a number in Leave Limit Per Instance !");
		$("#leaveLimitPerInst").focus();
		return false;
	}



	if (document.myForm.fixedTimeIssue.checked) {
		var totalTimeIssue = document.forms["myForm"]["totalTimeIssue"].value;
		if (totalTimeIssue == null || totalTimeIssue == "") {
			alert("Total Time Issue is required !");
			$("#totalTimeIssue").focus();
			return false;
		}

		if (isNaN(totalTimeIssue)) {
			alert("Please enter a number in Total Time Issue !");
			$("#totalTimeIssue").focus();
			return false;
		}
	}

	if (document.myForm.cashable.checked) {
		var maxCashable = document.forms["myForm"]["maxCashable"].value;
		if (maxCashable == null || maxCashable == "") {
			alert("Max Cashable is required !");
			$("#maxCashable").focus();
			return false;
		}
		
		  var amount = document.forms["myForm"]["amount"].value;
		  /*if (amount == null || amount == "") { 
			  alert("Amount is required !");
		  $("#amount").focus(); return false; }*/
		 
		if (isNaN(amount) && $("#amount").val()!= "") {
			alert("Please enter a number in Amount !");
			$("#amount").focus();
			return false;
		}


		if (isNaN(maxCashable)) {
			alert("Please enter a number in Max Cashable !");
			$("#maxCashable").focus();
			return false;
		}
	}
/*	if (document.myForm.formulaid.selectedIndex == 0) {
		alert("Formula is required !");
		document.myForm.formulaid.focus();
		return false;
	}*/
	$("#btnSave").show();
	$("#btnReset").show();
	$("#tableDiv").show();
	var natureType = $("#natureType").val();
	var valueStr = "nature:" + natureType + ",maxleaveperyear:"
			+ $("#maxPerYear").val() + ",carryforward:"
			+ $("#carryforward").is(":checked") + ",totalleavelimit:"
			+ $("#totalLeaveLimit").val() + ",leavelimitperInst:"
			+ $("#leavelimitperInst").val() + ",fixedtimeissue:"
			+ $("#fixedTimeIssue").is(":checked") + ",totalTimeIssue:"
			+ $("#totalTimeIssue").val() + ",cashable:"
			+ $("#cashable").is(":checked") + ",maxCashable:"
			+ $("#maxCashable").val() + ",formulaid:" + $("#formulaid").val()
			+ ",amount:" + $("#amount").val() + "";

	// if save is clicked after edit link is clicked
	if ($("#rowid").val()) {
		removeRow("row" + $("#rowid").val());
	}

	createDynaTable(valueStr);
	$("#natureType option[value='"+natureType+"']").remove();
	resetLeaveDeatilsAfterAdd();
}

function resetLeaveDeatilsAfterAdd() {
	$("#natureType").val("");
	$("#maxPerYear").val("");
	$("#carryforward").removeAttr("checked");
	$("#totalLeaveLimit").val("");
	$("#leavelimitperInst").val("");
	$("#fixedTimeIssue").removeAttr("checked");
	$("#totalTimeIssue").val("");
	$("#fixedTimeIssue").removeAttr("checked");
	$("#cashable").removeAttr("checked");
	$("#maxCashable").val("");
	$("#formulaid").val("");
	$("#amount").val("");
}

function createDynaTable(valueStr) {
	var tableDiv = $("#tableDiv");
	var table = null;
	if ($("#leaveDetailsTbl").attr("id") == null) {
		table = $("<table style='width:100%' class='grid' id='leaveDetailsTbl' class='list grid'/>");
		table.appendTo(tableDiv);
		$("<th/>").html('S.No').appendTo(table);
		$("<th/>").html('Nature Type').appendTo(table);
		$("<th/>").html('Max Leave Per Year').appendTo(table);
		$("<th/>").html('Carry Forward').appendTo(table);
		$("<th/>").html('Carry Forward Limit').appendTo(table);
		$("<th/>").html('Fixed Times Issue').appendTo(table);
		$("<th/>").html('Cashable').appendTo(table);
		$("<th/>").html('EDIT/DELETE').appendTo(table);
	} else {
		table = $("#leaveDetailsTbl");
	}
	var rowCount = $('#leaveDetailsTbl >tbody >tr').length;
	var rowId = rowCount + 1;
	var rowClass = "alternate-row";
	if ((rowCount + 1) % 2 == 0)
		rowClass = "nrow";
	var tr = $("<tr class='" + rowClass + "' id='row" + rowCount + "'/>");
	tr.appendTo(table);
	var tdSrNo = $("<td id='srNo" + rowCount
			+ "'  style='width:50px;text-align:center'/>");
	var tdNature = $("<td/>");
	var tdMaxPerYear = $("<td style='text-align:center'/>");
	var tdCarryFwd = $("<td style='text-align:center' />");
	var tdLeave = $("<td style='text-align:center'/>");
	var tdFixed = $("<td/>");
	var tdCash = $("<td/>");
	var tdAction = $("<td style='text-align:center'/>");
	tdSrNo.appendTo(tr);
	tdNature.appendTo(tr);
	tdMaxPerYear.appendTo(tr);
	tdCarryFwd.appendTo(tr);
	tdLeave.appendTo(tr);
	tdFixed.appendTo(tr);
	tdCash.appendTo(tr);
	tdAction.appendTo(tr);
	tdSrNo.html(rowCount + 1);
	var hiddenValueArr = valueStr.split(",");
	for ( var i = 0; i < hiddenValueArr.length; i++) {
		var valueArray = hiddenValueArr[i].split(":");
		if (valueArray[1] != "")
			if (valueArray[0] == "nature") {
				$("#natureType option").each(function() {
					if ($(this).val() == valueArray[1]){
						tdNature.html($(this).text());
						$(this).remove();
					}	
				});
			} else if (valueArray[0] == "maxleaveperyear") {
				tdMaxPerYear.html(valueArray[1]);
			} else if (valueArray[0] == "carryforward") {
				if (valueArray[1] == "true")
					tdCarryFwd.html('Yes');
				else
					tdCarryFwd.html('No');
			} else if (valueArray[0] == "totalleavelimit") {
				tdLeave.html(valueArray[1]);
			} 
			/*else if (valueArray[0] == "leavelimitperInst") {
				$("#leavelimitperInst").val(valueArray[1]);
			}*/ 
			else if (valueArray[0] == "fixedtimeissue") {
				if (valueArray[1] == "true")
					tdFixed.html('Yes');
				else
					tdFixed.html('No');
			} else if (valueArray[0] == "cashable") {
				if (valueArray[1] == "true")
					tdCash.html("Yes");
				else
					tdCash.html("No");
			}
	}
	tdAction
			.html("<a href='#' id='"+rowCount+"' onclick='populateLeaveDetailsForEdit($(\"#rowhidden"
					+ rowId
					+ "\").val(),\""
					+ rowCount
					+ "\", \""+rowId+"\")'><img src='"
					+ appctx
					+ "/images/Edit.gif'></a> /  <a href='#' class='deleteSub' id='delete"+rowId+"' onclick='deleteconfirm(\"row"
					+ rowCount
					+ "\")'><img src='"
					+ appctx
					+ "/images/Delete.gif'></a><input type='hidden' id='rowhidden"
					+ rowId
					+ "' name='hidden"
					+ (rowId)
					+ "' value='"
					+ valueStr + "'>");
	$('#counter').val($('#leaveDetailsTbl >tbody >tr').length);
	$('#trLength').val($('#leaveDetailsTbl >tbody >tr').length);
}

function disableTotalLeaveLimit() {
	if (document.myForm.carryForward.checked) {
		document.myForm.totalLeaveLimit.disabled = false;
	} else {
		document.myForm.totalLeaveLimit.disabled = true;
		$("#totalLeaveLimit").val("");
	}

	if (document.myForm.fixedTimeIssue.checked) {
		document.myForm.totalTimeIssue.disabled = false;
	} else {
		document.myForm.totalTimeIssue.disabled = true;
		$("#fixedTimeIssue").val("");
	}

	if (document.myForm.cashable.checked) {
		document.myForm.maxCashable.disabled = false;
		document.myForm.amount.disabled = false;
		$("#formulaid").attr('disabled', false);
		
	} else {
		document.myForm.maxCashable.disabled = true;
		$("#maxCashable").val("");
		document.myForm.amount.disabled = true;
		$("#formulaid").attr('disabled', true);
		$("#formulaid").val("");
	}
}

function populateLeaveDetailsForEdit(hiddenValueStr, rowCount, rowId) {
	//$("tr#row"+rowCount).children("td").css("background-color", '#ccc'); 
	highlightDynamicTableRows(rowCount);
	$(".deleteSub").html("<img src='"+ appctx + "/images/Delete.gif'>");
	$("#delete"+rowId).html("<img width='15px' height='15px' src='"+ appctx + "/images/Block_Icon.png'>").attr("href", "javascript:void(0)").attr("onclick", "");
	$("#rowid").val(rowCount);
	$("#btnSavee").val("UPDATE");
	resetLeaveDeatilsAfterAdd();
	var hiddenValueArr = hiddenValueStr.split(",");
	for ( var i = 0; i < hiddenValueArr.length; i++) {
		var valueArray = hiddenValueArr[i].split(":");
		if (valueArray[1] != "")
			if (valueArray[0] == "nature") {
				$("#natureType").val(valueArray[1]);
			} else if (valueArray[0] == "maxleaveperyear") {
				$("#maxPerYear").val(valueArray[1]);
			} else if (valueArray[0] == "carryforward") {
				if (valueArray[1] == "true")
					$("#carryforward").attr("checked", "checked");
			} else if (valueArray[0] == "totalleavelimit") {
				$("#totalLeaveLimit").val(valueArray[1]);
			} else if (valueArray[0] == "leavelimitperInst") {
				$("#leavelimitperInst").val(valueArray[1]);
			} else if (valueArray[0] == "fixedtimeissue") {
				if (valueArray[1] == "true")
					$("#fixedTimeIssue").attr("checked", "checked");
			} else if (valueArray[0] == "totalTimeIssue") {
				$("#totalTimeIssue").val(valueArray[1]);
			} else if (valueArray[0] == "cashable") {
				if (valueArray[1] == "true")
					$("#cashable").attr("checked", "checked");
			} else if (valueArray[0] == "maxCashable") {
				$("#maxCashable").val(valueArray[1]);
			} else if (valueArray[0] == "formulaid") {
				$("#formulaid").val(valueArray[1]);
			} else if (valueArray[0] == "amount") {
				$("#amount").val(valueArray[1]);
			}
	}
	disableTotalLeaveLimit();

}

function removeRow(rowId) {	
	var tr = $("#" + rowId);
	//highlightDynamicTableRows(tr);
	var rowCount = $('#leaveDetailsTbl >tbody >tr').length;
	if (rowCount == 0) {
		$("#tableDiv").html("");
		$("#btnSave").hide();
		$("#btnReset").hide();
	}
	tr.remove();
	var table = $("#leaveDetailsTbl");
	var rowCount = 0;
	$('#leaveDetailsTbl tr').each(
			function() {
				$(this).attr("id", "row" + rowCount);
				if ((rowCount + 1) % 2 == 0)
					$(this).attr("class", "nrow");
				else
					$(this).attr("class", "alternate-row");
				$(this).find("td").eq(0).attr("id", "srNo" + rowCount).html(
						rowCount + 1);
				var rowId = rowCount + 1;
				$(this).find("input:hidden").eq(0).attr("id",
						"rowhidden" + rowId);
				$(this).find("input:hidden").attr("name", "hidden" + rowId);
				$(this).find("a").eq(0).attr(
						"onclick",
						"populateLeaveDetailsForEdit($(\"#rowhidden" + rowId
								+ "\").val(), \"" + rowCount + "\", \""+rowId+"\")"); // foredit
				// link
				// onclick
				// even
				// change
			//	$(this).find("a").eq(0).attr("onclick","deleteconfirm('row" + rowCount + "')" 
				//); // for Delete
				// link onclick
				// even change
				rowCount++;
				
			});
	// alert($('#leaveDetailsTbl >tbody >tr').length);
	$('#counter').val($('#leaveDetailsTbl >tbody >tr').length);
}
function emptyHeadsTable() {
	$("#tableDiv").hide("slow").html("");
	$("#tableDiv2").hide("slow").html("");
	$("#btnSave").hide("slow");
	$("#btnReset").hide("slow");
	$("#btnReset").hide("slow");
}
function calculateDate() {
	var date1 = $("#date1").val();
	var date2 = $("#date2").val();
	var one_day = 1000 * 60 * 60 * 24;

	// Here we need to split the inputed dates to convert them into standard
	// format for furter execution
	var x = date1.split("/");
	var y = date2.split("/");

	// date format(Fullyear,month,date)
	var date1 = new Date(x[2], (x[1] - 1), x[0]);
	var date2 = new Date(y[2], (y[1] - 1), y[0]);
	var month1 = x[1] - 1;
	var month2 = y[1] - 1;

	// Calculate difference between the two dates, and convert to days
	dateDiff = Math.ceil((date2.getTime() - date1.getTime()) / (one_day));
	var d = 1 + parseInt(dateDiff.value);
	document.getElementById('leaveId').value = d;
}
function deleteconfirm(rowId){
	
	var agree = confirm("Are you sure you want to delete this record ?");
	if (agree == true) {
	} else {
		return false;
	}
	
	removeRow(rowId);
}