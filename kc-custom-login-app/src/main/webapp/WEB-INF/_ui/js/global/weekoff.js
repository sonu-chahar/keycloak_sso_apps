var week1 = '';
var week2 = '';
var week3 = '';
var week4 = '';
var week5 = '';
function populateWeekOff() {
	var sun = $("#sun").val();
	if (sun != null && sun != "")
		populateWeeks(sun, "sun");
	var mon = $("#mon").val();
	if (mon != null && mon != "")
		populateWeeks(mon, "mon");
	var tue = $("#tue").val();
	if (tue != null && tue != "")
		populateWeeks(tue, "tue");
	var wed = $("#wed").val();
	if (wed != null && wed != "")
		populateWeeks(wed, "wed");
	var thur = $("#thur").val();
	if (thur != null && thur != "")
		populateWeeks(thur, "thur");
	var fri = $("#fri").val();
	if (fri != null && fri != "")
		populateWeeks(fri, "fri");
	var sat = $("#sat").val();
	if (sat != null && sat != "")
		populateWeeks(sat, "sat");
}

function populateWeeks(fieldValue, id) {
	for ( var i = 0; i < fieldValue.length; i++) {
		if (i == 0)
			week1 = fieldValue.charAt(i);
		if (i == 1)
			week2 = fieldValue.charAt(i);
		if (i == 2)
			week3 = fieldValue.charAt(i);
		if (i == 3)
			week4 = fieldValue.charAt(i);
		if (i == 4)
			week5 = fieldValue.charAt(i);
	}

	var chkBoxArr = document.getElementsByName(id + "ckbox");
	for ( var ckbox in chkBoxArr) {
		
		if (chkBoxArr[ckbox].id == id + "ckbox1" && week1 == '1')
			chkBoxArr[ckbox].checked = true;
		if (chkBoxArr[ckbox].id == id + "ckbox2" && week2 == '1')
			chkBoxArr[ckbox].checked = true;
		if (chkBoxArr[ckbox].id == id + "ckbox3" && week3 == '1')
			chkBoxArr[ckbox].checked = true;
		if (chkBoxArr[ckbox].id == id + "ckbox4" && week4 == '1')
			chkBoxArr[ckbox].checked = true;
		if (chkBoxArr[ckbox].id == id + "ckbox5" && week5 == '1'){
			chkBoxArr[ckbox].checked = true;	
		}
			
	}
}

function updateDayVal(day) {
	switch (day) {
	case 'sun':
		document.getElementById("sun").value = updateFieldVal(day);
		break;
	case 'mon':
		document.getElementById("mon").value = updateFieldVal(day);
		break;
	case 'tue':
		document.getElementById("tue").value = updateFieldVal(day);
		break;
	case 'wed':
		document.getElementById("wed").value = updateFieldVal(day);
		break;
	case 'thur':
		document.getElementById("thur").value = updateFieldVal(day);
		break;
	case 'fri':
		document.getElementById("fri").value = updateFieldVal(day);
		break;
	case 'sat':
		document.getElementById("sat").value = updateFieldVal(day);
		break;
	}
}

function updateFieldVal(day) {
	var chkBoxArr = document.getElementsByName(day + "ckbox");
	var week1 = "0";
	var week2 = "0";
	var week3 = "0";
	var week4 = "0";
	var week5 = "0";

	for ( var ckbox in chkBoxArr) {
		if (chkBoxArr[ckbox].checked) {
			if (chkBoxArr[ckbox].id == day + "ckbox1")
				week1 = "1";
			if (chkBoxArr[ckbox].id == day + "ckbox2")
				week2 = "1";
			if (chkBoxArr[ckbox].id == day + "ckbox3")
				week3 = "1";
			if (chkBoxArr[ckbox].id == day + "ckbox4")
				week4 = "1";
			if (chkBoxArr[ckbox].id == day + "ckbox5")
				week5 = "1";
		}
	}
	return week1 + week2 + week3 + week4 + week5;
}