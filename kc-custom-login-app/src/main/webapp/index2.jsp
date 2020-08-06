<!DOCTYPE html>
<html>

<meta http-equiv="content-type" content="text/html;charset=UTF-8" />
<head>
<meta charset="utf-8">
<title>NDMC</title>
<link rel="shortcut icon" href="favicon.ico">
<meta name="keywords" content="" />
<meta name="description" content="">
<meta name="author" content="">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<link
	href="<%=request.getContextPath()%>/resources/chartTheme/css_nn/bootstrap.css"
	rel="stylesheet" type="text/css" media="all">
<link
	href="<%=request.getContextPath()%>/resources/chartTheme/css_nn/style.css"
	rel="stylesheet" type="text/css" media="all" />
<!---njdg-->
<link
	href="<%=request.getContextPath()%>/resources/chartTheme/css/style.css"
	rel="stylesheet">
<link
	href="<%=request.getContextPath()%>/resources/chartTheme/css/bootstrap.min.css"
	rel="stylesheet">
<link
	href="<%=request.getContextPath()%>/resources/chartTheme/css/font-awesome.min.css"
	rel="stylesheet" type="text/css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/chartTheme/css/dashboard-style.css">
<!---sclsc-->
<link
	href="<%=request.getContextPath()%>/resources/chartTheme/css-new/pgallery.css"
	rel="stylesheet">
<link
	href="<%=request.getContextPath()%>/resources/chartTheme/css-new/style.html"
	rel="stylesheet">

<script
	src="<%=request.getContextPath()%>/resources/chartTheme/js/jquery-3.3.1.js"></script>
<script
	src="<%=request.getContextPath()%>/resources/chartTheme/js/jquery.min.js"></script>
<script
	src="<%=request.getContextPath()%>/resources/chartTheme/js/bootstrap.min.js"></script>
<script type="text/javascript"
	src="<%=request.getContextPath()%>/resources/chartTheme/js/fusioncharts.js"></script>
<script type="text/javascript"
	src="<%=request.getContextPath()%>/resources/chartTheme/js/barr.js"></script>
<script type="text/javascript"
	src="<%=request.getContextPath()%>/resources/chartTheme/js/highcharts.js"></script>
<script type="text/javascript"
	src="<%=request.getContextPath()%>/resources/chartTheme/js/drilldown.js"></script>
<script type="text/javascript"
	src="<%=request.getContextPath()%>/resources/chartTheme/js/themes/fusioncharts.theme.fint.js"></script>
<!-- jQuery -->
<script
	src="<%=request.getContextPath()%>/resources/chartTheme/js/jquery-1.11.1.min.js"></script>
<script
	src="<%=request.getContextPath()%>/resources/chartTheme/js/jquery-ui.min.js"></script>
<!-- Theme Javascript -->
<script
	src="<%=request.getContextPath()%>/resources/chartTheme/js/utility.js"></script>
<script
	src="<%=request.getContextPath()%>/resources/chartTheme/js/demo.js"></script>
<script
	src="<%=request.getContextPath()%>/resources/chartTheme/js/main.js"></script>
<script
	src="<%=request.getContextPath()%>/resources/chartTheme/js/amcharts.js"></script>
<script
	src="<%=request.getContextPath()%>/resources/chartTheme/js/pie.js"></script>
<script
	src="<%=request.getContextPath()%>/resources/chartTheme/js/light.js"></script>
<script
	src="<%=request.getContextPath()%>/resources/chartTheme/js/serial.js"></script>
<script
	src="<%=request.getContextPath()%>/resources/chartTheme/js/dark.js"></script>
<script
	src="<%=request.getContextPath()%>/resources/chartTheme/js/highcharts.js"></script>
<script
	src="<%=request.getContextPath()%>/resources/chartTheme/js/highcharts-3d.js"></script>

<script
	src="<%=request.getContextPath()%>/resources/chartTheme/js/data.js"></script>
<script
	src="<%=request.getContextPath()%>/resources/chartTheme/js/drilldown.js"></script>
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/chartTheme/css-new/jquery.dataTables.min.css">
<script
	src="<%=request.getContextPath()%>/resources/chartTheme/js/jquery.dataTables.min.js"></script>


<!---pdf-->

<script src="js/jspdf.debug.js"></script>

<!---refresh json-->
<style type="text/css">
g[class^='raphael-group-'][class$='-creditgroup'] {
	display: none !important;
}
</style>

<style>
@media screen and (min-device-width:768px) and (max-device-width:
	1366px) {
	#myChart {
		height: 317px !important;
	}
}

@media screen and (min-device-width:800px) and (max-device-width:
	1280px) {
	#myChart {
		height: 346px !important;
	}
}

.fade.in {
	background: rgba(0, 0, 0, 0.3);
}

.modal.in .modal-dialog {
	z-index: 1050;
}

.modal-header .close {
	margin-top: 0;
	width: 35px;
	height: 35px;
	position: absolute;
	right: 0px;
	top: -2px;
}

.lds-ring {
	display: inline-block;
	position: relative;
	width: 80px;
	height: 80px;
}

.lds-ring div {
	box-sizing: border-box;
	display: block;
	position: absolute;
	width: 64px;
	height: 64px;
	margin: 8px;
	border: 8px solid #fff;
	border-radius: 50%;
	animation: lds-ring 1.2s cubic-bezier(0.5, 0, 0.5, 1) infinite;
	border-color: #fff transparent transparent transparent;
}

.lds-ring div:nth-child(1) {
	animation-delay: -0.45s;
}

.lds-ring div:nth-child(2) {
	animation-delay: -0.3s;
}

.lds-ring div:nth-child(3) {
	animation-delay: -0.15s;
}

s
 @keyframes lds-ring { 0% {
	transform: rotate(0deg);
}

100%
{
transform
:
 
rotate
(360deg);

  
}
}
.nav-tabs {
	margin-bottom: 15px;
}

.sign-with {
	margin-top: 25px;
	padding: 20px;
}

div#OR {
	height: 30px;
	width: 30px;
	border: 1px solid #C2C2C2;
	border-radius: 50%;
	font-weight: bold;
	line-height: 28px;
	text-align: center;
	font-size: 12px;
	float: right;
	position: absolute;
	right: -16px;
	top: 40%;
	z-index: 1;
	background: #DFDFDF;
}
</style>
<script>
	$(document)
			.ready(
					function($) {

						"use strict";
						Demo.init();

						var ur = 'ajaxfile1cfc2.html?str=1', state_name = "State", str = '1';
						$
								.ajax({
									url : ur,
									type : 'POST',
									contentType : 'application/json; charset=utf-8',
									dataType : 'json',
									beforeSend : function() {
										showloader();
									},
									success : function(response) {
										debugger;
										hideloader();
										var new1 = [], new2 = [], new3 = [];
										var ct1 = '<table class="table">';

										ct1 = ct1 + "<tr>";
										ct1 = ct1
												+ "<td align='right' width='75%'>"
												+ state_name + "</td>";
										ct1 = ct1
												+ "<td align='right' width='25%'> Total</td>";
										ct1 = ct1 + "</tr>";
										var len = response.length;
										for (var i = 0; i < len; i++) {
											var data = {};
											data["y"] = parseInt(response[i].pending);
											data["label"] = response[i].username;

											ct1 = ct1 + "<tr>";
											ct1 = ct1 + "<td>"
													+ response[i].username
													+ "</td>";
											ct1 = ct1 + "<td>"
													+ response[i].pending
													+ "</td>";

											if (str == 1)
												data["color"] = "#239a93";
											else if (str == 2)
												data["color"] = "#f45b00";
											else if (str == 3)
												data["color"] = "#8a56e8";
											else if (str == 4)
												data["color"] = "#c39022";

											new1[i] = data;
											ct1 = ct1 + "</tr>";
										}

										ct1 = ct1 + "</table>";
										var chart = new CanvasJS.Chart("cc1", {
											animationEnabled : true,
											theme : "light2", // "light1", "light2", "dark1", "dark2"
											title : {
											// text: "Top Oil Reserves"
											},
											axisX : {
												labelAngle : -30,
												labelMaxWidth : 100,
												labelWrap : true,
												labelAngle : 125,
												labelFontSize : 10,
												margin : 50,
												interval : 1,
											},
											axisY : {
											// title: "Reserves(MMbbl)"
											},
											width : 1480,
											data : [ {
												type : "column",
												click : viewDetails,
												//showInLegend: true, 
												//legendMarkerColor: "grey",
												//legendText: "MMbbl = one million barrels",
												dataPoints : new1
											} ]
										});
										chart.render();

										function viewDetails(e) {
											var ministryName = '';
											ministryName = e.dataPoint.label;
											$('#minsName').text(
													ministryName.toUpperCase());
											$('#departmentDiv').removeClass(
													'hide');

											$
													.ajax({
														url : 'departmentDetails.php',
														type : 'post',
														data : {
															'ministryName' : ministryName,
															'action' : 'departmentWise'
														},
														//contentType : 'application/json; charset=utf-8',
														dataType : 'json',
														beforeSend : function() {
															showloader();
														},
														success : function(
																response) {
															var new1 = [], j = 1, len = response.length;

															for (var i = 0; i < len; i++) {
																var b = {};
																j = j + 1;
																b["value"] = response[i].id;
																b["label"] = response[i].username;

																if (i == 0) {
																	b["color"] = "#0feb34";
																	b["isSliced"] = "1";
																} else if (i == 1) {
																	b["color"] = "#f45b00";
																	b["isSliced"] = "0";
																}
																new1[i] = b;
															}
															FusionCharts
																	.ready(function() {
																		var revenueChart = new FusionCharts(
																				{
																					type : 'doughnut2d',
																					renderAt : 'departmentChart',
																					width : '360',
																					height : '480',
																					dataFormat : 'json',
																					dataSource : {
																						chart : {
																							"caption" : "Department Wise Cases",
																							"startingAngle" : "310",
																							"defaultCenterLabel" : "Total",
																							"centerLabelBold" : "1",
																							"showTooltip" : "1",
																							"theme" : "fint",
																							"showValues" : "1",
																							"showTooltip" : "1",
																							"formatNumberScale" : "0",
																							"exportEnabled" : "1",
																							"plottooltext" : "$percentValue",
																							"showLegend" : "1",
																							"placeValuesInside" : "1"
																						},
																						data : new1
																					},
																					events : {
																						"dataPlotClick" : function(
																								eventObj,
																								data) {
																							deptCaseDetails(data.categoryLabel);
																						}
																					}
																				});
																		revenueChart
																				.render();
																	});
														},
														error : function(e) {
															alert("last chart ajax error");
															hideloader();
														},
														complete : function() {
															hideloader();
														}
													});

										}
									},

								});

						$
								.ajax({
									url : 'pen_breakup.php?flag=P',
									type : 'POST',
									contentType : 'application/json; charset=utf-8',
									dataType : 'json',
									beforeSend : function() {
										showloader();
									},
									success : function(response) {
										var len = response.length, category = [], data1 = [], data2 = [], cap = "Total Pendency Statistics";
										for (var i = 0; i < len; i++) {
											var yr = response[i].yr, cnt = response[i].cnt, label = {};
											label["label"] = yr;
											label["value"] = cnt;
											data1[i] = label;
										}
										pending(category, data1, cap);
									},

								});

						$
								.ajax({
									url : 'ajaxfile.php',
									type : 'POST',
									contentType : 'application/json; charset=utf-8',
									dataType : 'json',
									beforeSend : function() {
										showloader();
									},
									success : function(response) {
										debugger;
										if (response.error == '0') {
											var len = response.data.length;
											for (var i = 0; i < len; i++) {
												if (response.data[i].status_type == 'total_pending')
													$("#total_pending")
															.html(
																	response.data[i].count);
												/*if(response.data[i].status_type=='total_disposed')    
												  $("#total_disposed").html(response.data[i].count);*/
												if (response.data[i].status_type == 'pendingcomplience')
													$("#pendingcomplience")
															.html(
																	response.data[i].count);
												if (response.data[i].status_type == 'important')
													$("#important")
															.html(
																	response.data[i].count);
												if (response.data[i].status_type == 'contemptcases')
													$("#contemptcases")
															.html(
																	response.data[i].count);
											}
										} else {
											$("#total_pending").html('0'), $(
													"#total_disposed")
													.html('0'), $(
													"#pendingcomplience").html(
													'0'), $("#important").html(
													'0'), $("#contemptcases")
													.html('0');
										}
									},

									complete : function() {
										hideloader();
									}
								});

						$('#pending-home, #disposed_cases').click(function(e) {
							showloader();
							$('.dropdown').removeClass('active');
							$(this).closest(".dropdown").addClass("active");

							var chart_name = '';
							chart_name = $(this).attr("chart-data");
							$('#' + chart_name).removeClass('hide');
							hideloader();
						});

						$(".custom_table tr").on("click", function() {
							$('.custom_table tr').removeClass('active');
							$(this).addClass('active');
						});

						$('#myModal').css('overflow-y', 'scroll');

						$(
								"#total_pending, #total_disposed, #pendingcomplience, #contemptcases, #important, #pending-home")
								.click(
										function() {
											var clickId_val = '', flag = '';
											clickId_val = $(this).attr("id");
											$(
													'#pending-div,#ministry-div,#disposed_cases_div,#departmentDiv')
													.addClass('hide');
											$('#pending-div,#ministry-div')
													.removeClass('hide');

											if (clickId_val == ''
													|| clickId_val == null)
												flag = "P";
											switch (clickId_val) {
											case 'total_pending':
												flag = 'P';
												break;
											case 'total_disposed':
												flag = 'D';
												break;
											case 'pendingcomplience':
												flag = 'PC';
												break;
											case 'contemptcases':
												flag = 'CC';
												break;
											case 'important':
												flag = 'I';
												break;
											default:
												flag = 'P';
												break;
											}

											showloader();
											$
													.ajax({
														url : 'pen_breakup.php?flag='
																+ flag,
														type : 'POST',
														contentType : 'application/json; charset=utf-8',
														dataType : 'json',
														success : function(
																response) {
															var len = response.length, category = [], data1 = [], data2 = [], cap = "Total Pendency Statistics";
															for (var i = 0; i < len; i++) {
																var yr = response[i].yr, cnt = response[i].cnt, label = {};
																label["label"] = yr;
																label["value"] = cnt;

																if (flag == 'P')
																	label["color"] = "#8A2BE2";
																else if (flag == 'CC')
																	label["color"] = "#8A2BE2";
																else if (flag == 'I')
																	label["color"] = "#8A2BE2";
																else if (flag == 'PC')
																	label["color"] = "#800080";
																else if (flag == 'D')
																	label["color"] = "#800080";
																else
																	label["color"] = "#FF6347";
																data1[i] = label;

																if (flag == 'D')
																	cap = "Total Disposed Statistics";
																if (flag == 'PC')
																	cap = "Total Pending Compliance Statistics";
																if (flag == 'CC')
																	cap = "Total Contempt Cases Statistics";
																if (flag == 'I')
																	cap = "Total Important Statistics";
															}

															pending(category,
																	data1, cap);
															hideloader();
														},

													});
										});

						/******** Disposed Of Cases Click Function Start ***********/

						$('#disposed_cases,#sub')
								.click(
										function() {

											showloader();
											$(
													'#pending-div,#ministry-div,#departmentDiv')
													.addClass('hide');

											var d1 = new Date(), d = new Date(), n = d
													.getMonth(), fmonth = '', fyear = '', tyear = '', tmonth = '', clickId = $(
													this).attr('id');

													fmonth = d.getMonth()
															.toString().length,
													tmonth = d1.getMonth()
															.toString().length,
													fyear = (d.getFullYear() - 1),
													tyear = d1.getFullYear();

											if (fmonth == 1)
												fmonth = "0"
														+ d.getMonth()
																.toString();
											else
												fmonth = d.getMonth()
														.toString();
											if (tmonth == 1)
												tmonth = "0"
														+ d1.getMonth()
																.toString();
											else
												tmonth = d1.getMonth()
														.toString();
											if (fmonth == "00")
												fmonth = "01";
											if (tmonth == "00")
												tmonth = "01";

											if (clickId == 'disposed_cases') {

												$('.dropdown').removeClass(
														'active');
												$(this).closest(".dropdown")
														.addClass("active");
												$('#disposed_cases_div')
														.removeClass('hide');
												$('select#fyear')
														.find('option')
														.each(
																function() {
																	if ($(this)
																			.val() == fyear)
																		$(this)
																				.attr(
																						'selected',
																						true);
																});
											}

											else if (clickId == 'sub') {
												fmonth = $('#fmonth').val(),
														fyear = $('#fyear')
																.val(),
														tmonth = $('#tmonth')
																.val(),
														tyear = $('#tyear')
																.val();
											}

											$
													.ajax({
														url : 'pending_disposed.php',
														type : 'post',
														data : {
															'fmonth' : fmonth,
															'fyear' : fyear,
															'tmonth' : tmonth,
															'tyear' : tyear
														},
														dataType : 'json',
														success : function(
																response) {
															var new1 = [], new2 = [], new3 = [], az = '';
															az = '<table class="table1">';
															az = az + "<tr>";
															az = az
																	+ "<td>Year</td>";
															az = az
																	+ "<td>Pending</td>";
															az = az
																	+ "<td>Disposed</td>";
															az = az + "</tr>";

															var len = response.length;
															for (var i = 0; i < len; i++) {
																var label = {};
																label["label"] = response[i].id;

																az = az
																		+ "<tr>";
																az = az
																		+ "<td>"
																		+ response[i].id
																		+ "</td>";
																new1[i] = label;

																var data = {};
																data["value"] = response[i].username;
																data["color"] = "#669900";

																az = az
																		+ "<td>"
																		+ response[i].username
																		+ "</td>";
																new2[i] = data;

																data = {};
																data["value"] = response[i].dob;
																az = az
																		+ "<td>"
																		+ response[i].dob
																		+ "</td>";
																az = az
																		+ "</tr>";
																new3[i] = data
															}
															az = az
																	+ "</table>";
															$("#gfd").html(az);

															FusionCharts
																	.ready(function() {
																		var revenueChart = new FusionCharts(
																				{
																					type : 'scrollcombidy2d',
																					renderAt : 'fd',
																					width : '1180',
																					height : '420',
																					dataFormat : 'json',
																					dataSource : {
																						"chart" : {
																							"theme" : "fusion",
																							"caption" : "Pending Vs Disposed Cases",
																							// "subCaption": "Harry's SuperMart - Last Year",
																							"xAxisname" : "Year",
																							"captionFontSize" : "14",
																							"subcaptionFontSize" : "14",
																							"subcaptionFontBold" : "0",
																							//"xAxisname": "Month",
																							//"pYAxisName": "Amount (In USD)",
																							"sYAxisName" : "Percentage %",
																							// "numberPrefix": "$",
																							"sNumberSuffix" : "%",
																							"sYAxisMaxValue" : "50",
																							"paletteColors" : "#1aaf5d,#f2c500",
																							"showAlternateHGridColor" : "0",
																							"showPlotBorder" : "0",
																							"usePlotGradientColor" : "0",
																							"baseFontColor" : "#333333",
																							"baseFont" : "Helvetica Neue,Arial",
																							"showBorder" : "0",
																							"bgColor" : "#ffffff",
																							"showShadow" : "0",
																							"canvasBgColor" : "#ffffff",
																							"showCanvasBorder" : "0",
																							"legendBorderAlpha" : "0",
																							"legendShadow" : "0",
																							"showValues" : "1",
																							"showTooltip" : "1",
																							"formatNumberScale" : "0",
																							"divlineAlpha" : "100",
																							"divlineColor" : "#999999",
																							"divlineThickness" : "1",
																							"divLineIsDashed" : "1",
																							"divLineDashLen" : "1",
																							"divLineGapLen" : "1",
																							"numVisiblePlot" : "ick ",
																							"flatScrollBars" : "1",
																							"scrollheight" : "10",
																							"exportEnabled" : "1"
																						},
																						"categories" : [ {
																							"category" : new1
																						} ],
																						"dataset" : [
																								{
																									"seriesName" : "Pending",
																									"data" : new2
																								},
																								{
																									"seriesName" : "Disposal",
																									"data" : new3
																								} ]
																					},
																					events : {
																						'beforeRender' : function(
																								evt,
																								arg) {
																							var controllers = document
																									.createElement('div');
																							controllers
																									.setAttribute(
																											'id',
																											'dispContent');
																							controllers.innerHTML = "<div id='msgBox' style='border: 1px solid #666666;background-color:#0075c2;font-size: 12px;color:#fff;width:250px;margin-left:150px;height:20px; text-align: center;padding-top: 5px;overflow-y:auto;display:none;'></div>";
																							//Display container div and write table
																							arg.container.parentNode
																									.insertBefore(
																											controllers,
																											arg.container.nextSibling);
																						},
																						'scrollStart' : function(
																								evt,
																								arg) {
																							var displayContent = document
																									.getElementById("msgBox"), str = "Scroll Right to see more data >>";
																							//Showing the message box
																							displayContent.style.display = "block";
																							//Adding html string in the div container
																							displayContent.innerHTML = str;
																						},
																						'scrollEnd' : function(
																								evt,
																								arg) {
																							var displayContent = document
																									.getElementById("msgBox"), str = "";
																							//Showing the message box
																							displayContent.style.display = "block";
																							(arg.scrollPosition >= 1) ? (str = "End of Chart. Scroll left to go back <<")
																									: (str = "Scroll Right to see more data >>");
																							//Adding html string in the div container
																							displayContent.innerHTML = str;
																						}
																					}
																				});
																		revenueChart
																				.render();
																		hideloader();

																		function export_chart() {
																			var format = document
																					.getElementById("format").value;
																			revenueChart
																					.exportChart({
																						"exportFormat" : format
																					});
																		}
																		document
																				.getElementById(
																						"export")
																				.addEventListener(
																						"click",
																						export_chart);
																	});
														},

													});
										});

						$("#btnExportd")
								.click(
										function(e) {
											var dt = new Date();
											var day = dt.getDate();
											var month = dt.getMonth() + 1;
											var year = dt.getFullYear();
											var hour = dt.getHours();
											var mins = dt.getMinutes();
											var postfix = day + "." + month
													+ "." + year + "_" + hour
													+ "." + mins;
											var a = document.createElement('a');
											var data_type = 'data:application/vnd.ms-excel;charset=utf-8';

											var table_html = $('#gfd')[0].outerHTML;
											table_html = table_html.replace(
													/<tfoot[\s\S.]*tfoot>/gmi,
													'');

											var css_html = '<style>td {border: 0.5pt solid #c0c0c0} .tRight { text-align:right} .tLeft { text-align:left} </style>';
											a.href = data_type
													+ ','
													+ encodeURIComponent('<html><head>'
															+ css_html
															+ '</' + 'head><body>'
															+ table_html
															+ '</body></html>');
											a.download = 'exported_table_'
													+ postfix + '.xls';
											a.click();
											e.preventDefault();
										});
						/******** Disposed of Cases Click Function End ************/
					});

	function deptCaseDetails(nameOfDepartment) {
		var selectedDept = '', action = 'departmentCases';
		selectedDept = nameOfDepartment;
		$('#departmentChart').removeClass('col-md-12').addClass('col-md-4');
		$('#deptCD-Div').empty().removeClass('hide').text(selectedDept);
		$
				.ajax({
					type : 'post',
					url : 'departmentDetails.php',
					data : {
						'ministryName' : selectedDept,
						'action' : action
					},
					dataType : 'json',
					beforeSend : function() {
						showloader();
					},
					success : function(resp) {
						var deptName = '';
						deptName = selectedDept.toUpperCase();
						/*var data='';
						data='<div class="text-success text-center">'+selectedDept.toUpperCase()+'</div><table id="minDataTable" class="table table-striped table-bordered" style="width:100%"><thead><tr><th>#</th><th>Caseno</th><th>Pititioner</th><th>Respondent</th><th>Advocate Name</th><th>Listing Date</th></tr></thead><tbody>'+resp+'</tbody><!--<tfoot><tr><th>#</th><th>Caseno</th><th>Pititioner</th><th>Respondent</th><th>Advocate Name</th><th>Listing Date</th></tr></tfoot>--></table>';
						$("#deptCD-Div").html(data); 
						$('#minDataTable').DataTable();*/

						/*var chart = new CanvasJS.Chart("deptCD-Div", {
						    animationEnabled: true,
						    theme: "light2",
						    title: {
						      text: "Monthly Sales Data"
						    },
						    axisX: {
						      valueFormatString: "MMM"
						    },
						    axisY: {
						      prefix: "$",
						      labelFormatter: addSymbols
						    },
						    toolTip: {
						      shared: true
						    },
						    legend: {
						      cursor: "pointer",
						      itemclick: toggleDataSeries
						    },
						    data: [
						      {
						        type: "column",
						        name: "Actual Sales",
						        showInLegend: true,
						        xValueFormatString: "MMMM YYYY",
						        yValueFormatString: "$#,##0",
						        dataPoints: [
						          { x: new Date(2017, 0), y: 20000 },
						          { x: new Date(2017, 1), y: 25000 },
						          { x: new Date(2017, 2), y: 30000 },
						          { x: new Date(2017, 3), y: 70000, indexLabel: "High Renewals" },
						          { x: new Date(2017, 4), y: 40000 },
						          { x: new Date(2017, 5), y: 60000 },
						          { x: new Date(2017, 6), y: 55000 },
						          { x: new Date(2017, 7), y: 33000 },
						          { x: new Date(2017, 8), y: 45000 },
						          { x: new Date(2017, 9), y: 30000 },
						          { x: new Date(2017, 10), y: 50000 },
						          { x: new Date(2017, 11), y: 35000 }
						        ]
						      },
						      {
						        type: "line",
						        name: "Expected Sales",
						        showInLegend: true,
						        yValueFormatString: "$#,##0",
						        dataPoints: [
						          { x: new Date(2017, 0), y: 32000 },
						          { x: new Date(2017, 1), y: 37000 },
						          { x: new Date(2017, 2), y: 40000 },
						          { x: new Date(2017, 3), y: 52000 },
						          { x: new Date(2017, 4), y: 45000 },
						          { x: new Date(2017, 5), y: 47000 },
						          { x: new Date(2017, 6), y: 42000 },
						          { x: new Date(2017, 7), y: 43000 },
						          { x: new Date(2017, 8), y: 41000 },
						          { x: new Date(2017, 9), y: 42000 },
						          { x: new Date(2017, 10), y: 50000 },
						          { x: new Date(2017, 11), y: 45000 }
						        ]
						      },
						      {
						        type: "area",
						        name: "Profit",
						        markerBorderColor: "white",
						        markerBorderThickness: 2,
						        showInLegend: true,
						        yValueFormatString: "$#,##0",
						        dataPoints: [
						          { x: new Date(2017, 0), y: 4000 },
						          { x: new Date(2017, 1), y: 7000 },
						          { x: new Date(2017, 2), y: 12000 },
						          { x: new Date(2017, 3), y: 40000 },
						          { x: new Date(2017, 4), y: 20000 },
						          { x: new Date(2017, 5), y: 35000 },
						          { x: new Date(2017, 6), y: 33000 },
						          { x: new Date(2017, 7), y: 20000 },
						          { x: new Date(2017, 8), y: 25000 },
						          { x: new Date(2017, 9), y: 16000 },
						          { x: new Date(2017, 10), y: 29000 },
						          { x: new Date(2017, 11), y: 20000 }
						        ]
						      }]
						});
						chart.render();
						function addSymbols(e) {
						  var suffixes = ["", "K", "M", "B"];
						  var order = Math.max(Math.floor(Math.log(e.value) / Math.log(1000)), 0);

						  if (order > suffixes.length - 1)
						    order = suffixes.length - 1;

						  var suffix = suffixes[order];
						  return CanvasJS.formatNumber(e.value / Math.pow(1000, order)) + suffix;
						}

						function toggleDataSeries(e) {
						  if (typeof (e.dataSeries.visible) === "undefined" || e.dataSeries.visible) {
						    e.dataSeries.visible = false;
						  } else {
						    e.dataSeries.visible = true;
						  }
						  e.chart.render();
						}*/

						var array_len = resp.length, year_array = [], pend_array = [], disp_array = [], pc_array = [], cp_array = [], imp_array = [];
						for (var i = 0; i < array_len; i++) {
							var label = {}, pend = {}, disp = {}, pc = {}, cp = {}, imp = {};
							label['label'] = resp[i].year,
									pend['value'] = resp[i].pending,
									disp['value'] = resp[i].disposed,
									pc['value'] = resp[i].pendingcomplience,
									cp['value'] = resp[i].contemptcases,
									imp['value'] = resp[i].important;

							year_array[i] = label, pend_array[i] = pend,
									disp_array[i] = disp, pc_array[i] = pc,
									cp_array[i] = cp, imp_array[i] = imp;
						}

						debugger;
						year_array;

						FusionCharts
								.ready(function() {
									var revenueChart = new FusionCharts(
											{
												type : "mscolumn2d",
												width : "98%",
												height : "94%",
												renderAt : "deptCD-Div",
												dataFormat : "json",
												dataSource : {
													chart : {
														caption : deptName,
														subcaption : "This Statistics of last five years",
														xaxisname : "Years",
														yaxisname : "Total number of cases",
														formatnumberscale : "0",
														plottooltext : "<b>$dataValue</b> apps were available on <b>$seriesName</b> in $label",
														theme : "fint",
														showTooltip : "1",
														exportEnabled : "1",
														labelPosition : "inside",
														showLegend : "1",
														showValues : "1",
													},
													categories : [ {
														category : year_array
													} ],
													dataset : [
															{
																seriesname : "Disposed",
																data : disp_array
															},
															{
																seriesname : "Pending",
																data : pend_array
															},
															{
																seriesname : "Pending Compliance",
																data : pc_array
															},
															{
																seriesname : "Contempt",
																data : cp_array
															},
															{
																seriesname : "Important",
																data : imp_array
															} ]
												},
												"events" : {
													"dataPlotRollOver" : function(
															eventObj, data) {
														alert('kkk');
													},
												}
											});
									revenueChart.render();
								});
					},
					error : function() {
						alert('Error in line no 634');
						hideloader();
					},
					complete : function() {
						hideloader();
					}
				});
	}

	function pending(category, data1, cap) {
		FusionCharts
				.ready(function() {
					var revenueChart = new FusionCharts(
							{
								type : 'column2d',
								renderAt : "drill",
								width : '1160',
								height : '380',
								dataFormat : 'json',
								dataSource : {
									"chart" : {
										"caption" : cap,
										"xAxisName" : "Year",
										"theme" : "fusion",
										"sYAxisName" : "Percentage %",
										// "numberPrefix": "$",
										"sNumberSuffix" : "%",
										"sYAxisMaxValue" : "50",
										"paletteColors" : "#0075c2,#1aaf5d,#f2c500",
										"showAlternateHGridColor" : "0",
										"showPlotBorder" : "0",
										"usePlotGradientColor" : "0",
										"baseFontColor" : "#333333",
										"baseFont" : "Helvetica Neue,Arial",
										"showBorder" : "0",
										"bgColor" : "#ffffff",
										"showShadow" : "0",
										"canvasBgColor" : "#ffffff",
										"showCanvasBorder" : "0",
										"legendBorderAlpha" : "0",
										"legendShadow" : "0",
										"showValues" : "1",
										"formatNumberScale" : "0",
										"divlineAlpha" : "100",
										"divlineColor" : "#999999",
										"divlineThickness" : "1",
										"divLineIsDashed" : "1",
										"divLineDashLen" : "1",
										"divLineGapLen" : "1",
										"numVisiblePlot" : "ick ",
										"flatScrollBars" : "1",
										"scrollheight" : "10",
										"exportEnabled" : "1",
										"showToolTip" : "1",
										"plottooltext" : "Year:$label<br> <br>Total : $value</b> "
									},

									"data" : data1
								}
							});
					revenueChart.render();
				});
	}

	function showloader() {
		$('.loading_progress').fadeIn(300);
	}

	function hideloader() {
		$('.loading_progress').fadeOut(300);
	}
	//call(1);

	function demoFromHTML2020(str) {

		document.getElementById("zero").style.display = "block";
		if (str.value == 'Excel') {
			var dt = new Date();
			var day = dt.getDate();
			var month = dt.getMonth() + 1;
			var year = dt.getFullYear();
			var hour = dt.getHours();
			var mins = dt.getMinutes();
			var postfix = day + "." + month + "." + year + "_" + hour + "."
					+ mins;
			var a = document.createElement('a');
			var data_type = 'data:application/vnd.ms-excel;charset=utf-8';

			var table_html = $('#idd')[0].outerHTML;
			table_html = table_html.replace(/<tfoot[\s\S.]*tfoot>/gmi, '');
			var css_html = '<style>td {border: 0.5pt solid #c0c0c0} .tRight { text-align:right} .tLeft { text-align:left} </style>';

			a.href = data_type
					+ ','
					+ encodeURIComponent('<html><head>' + css_html
							+ '</' + 'head><body>' + table_html
							+ '</body></html>');
			a.download = 'exported_table_' + postfix + '.xls';
			a.click();
			e.preventDefault();
			return;
		}
		document.getElementById("zero").style.display = "block";
		var pdf = new jsPDF('p', 'pt', 'letter');
		source = $('#idd')[0];
		specialElementHandlers = {
			'#bypassme' : function(element, renderer) {
				return true
			}
		};
		margins = {
			top : 50,
			bottom : 20,
			left : 100
		};

		pdf.fromHTML(source, margins.left, margins.top, {
			'width' : margins.width,
			'elementHandlers' : specialElementHandlers
		}, function(dispose) {
			pdf.save('Institution_Vs_disposal.html');
		}, margins);
		document.getElementById("zero").style.display = "none";
	}
</script>

</head>


<body class="dashboard-page sb-l-o sb-r-c">

	<div id="main">


		<!--<div class="container-fluid head" style="height: 40px;background-color: #f6bb42;">-->
		<div class="container no-padding">
			<div class="row wow fadeInDown animated animated"
				data-wow-duration="2s"></div>
		</div>
	</div>


	<header
		style="box-shadow: 0 10px 28px 0 rgba(0, 0, 0, 0.2), 0 10px 20px 0 rgba(0, 0, 0, 0.19)">
		<img class="header_img" src="SCDG_header.png" width="100%">

	</header>

	<!--<nav class="navbar navbar-inverse no-padding" role="navigation" style="background: #ef702be0 !important;
    border: none !important;color: #FFF !important; height:15px;"></nav>-->
	<style>
table.dataTable tbody td {
	padding: 4px 4px !important;
	font-size: 12px;
	text-transform: capitalize;
}

table.dataTable thead th {
	padding: 4px 4px !important;
	font-size: 12px !important;
	vertical-align: top;
}

.dropdown a {
	color: #fa8564;
	font-weight: 600;
	font-size: 15px;
	text-decoration: none;
}

.active a {
	color: #ffffff;
}

.grid figcaption {
	position: absolute;
	top: 0;
	left: 0;
	padding: 5px;
	background: #f6bb427d;
	color: #ff0000;
}

h4 {
	font-size: 83%;
	line-height: 24px;
	margin-top: 115px;
	text-align: center;
	background: #00477F;
	color: white;
	display: inline-block;
	padding: 12px;
	font-weight: 100%;
}

.panel {
	height: 65px;
	border: 2px solid rgba(255, 255, 255, 0.92);
	box-shadow: 0px 0px 5px rgba(0, 0, 0, 0.26);
	cursor: pointer;
	border-radius: 16px;
}

.panel i {
	position: absolute;
	right: 40px;
	top: 10px;
	font-size: 42px;
	color: #fff !important;
}

.panel b {
	font-weight: bold;
	font-size: 13px;
	background: rgba(0, 0, 0, 0.17);
	padding: 3px 10px;
	border-radius: 15px;
}

.panel-heading h3 {
	margin-top: 10px;
	font-weight: bold;
	color: #fff;
}

.dataBoxHover:hover .dataBox {
	display: block;
	opacity: 1;
	cursor: pointer;
}

.dataBox {
	width: 92%;
	background-color: #fff;
	position: absolute;
	top: 100px;
	right: 0;
	z-index: 9;
	box-shadow: 0px 5px 10px rgba(0, 0, 0, 0.25);
	border: 1px solid #ccc;
	margin-right: 4%;
	transition: all 0.3s;
	display: none;
	opacity: 0;
	cursor: pointer;
}

.dataBoxRow {
	overflow: hidden;
	padding: 10px;
	border-bottom: 1px solid #ccc;
	cursor: pointer;
}

.dataBoxRow:hover {
	background: #f3f3f3;
}

.RowLabel {
	float: left;
	font-size: 14px;
	font-weight: bold;
	color: #525252;
}

.RowValue {
	float: right;
	text-align: right;
	background: #4CAF50;
	padding: 0 5px;
	color: #fff;
	border-radius: 4px;
}

#indicatorDiv {
	font-family: 'Arial', 'Helvetica';
	font-size: 13px;
}

#format {
	height: 25px;
	font-size: 12px;
}

#export {
	height: 25px;
	font-size: 13px;
}

#export6 {
	height: 25px;
	font-size: 13px;
}

#indicatorDiv2 {
	width: 500px;
	font-family: 'Arial', 'Helvetica';
	font-size: 13px;
}

#indicatorDiv3 {
	width: 500px;
	font-family: 'Arial', 'Helvetica';
	font-size: 13px;
}

#format2 {
	height: 25px;
	font-size: 12px;
}

#export2 {
	height: 25px;
	font-size: 13px;
}

#export3 {
	height: 25px;
	font-size: 13px;
}

#export4 {
	height: 25px;
	font-size: 13px;
}

#export7 {
	height: 25px;
	font-size: 13px;
}

#export8 {
	height: 25px;
	font-size: 13px;
}

.popupHeader {
	margin-bottom: 10px !important;
}

.popupHeader img {
	margin-top: 10px;
	margin-left: 10px;
	width: 42px;
	cursor: pointer;
}

.popupHeader h2 {
	font-size: 20px;
}

.popupHeader h2 span {
	font-size: 20px;
	background: #000026;
	color: #fff;
	padding: 5px 8px;
	margin-right: 10px;
	font-weight: bold;
	font-family: Georgia, serif;
	border-radius: 6px;
}

.graphWrapper {
	background: #fff;
	border-radius: 4px;
	border: 1px solid #efefef;
	padding-bottom: 30px;
	margin-bottom: 30px;
	box-shadow: 1px 5px 10px rgba(0, 0, 0, 0.10);
}

.tab-content {
	background: #343a40;
	<!--
	#05316
	d;
	#672067
	-->
}

.blackRow {
	background-color: #000;
}

.blackRow th {
	background-color: #3c3c3c !important;
	font-weight: bold;
}

.footer {
	text-align: center;
	color: #fff;
	padding: 15px;
	border-radius: 8px;
	background: rgb(41, 41, 41);
	background: -moz-linear-gradient(0deg, rgba(41, 41, 41, 1) 0%,
		rgba(110, 110, 110, 1) 100%);
	background: -webkit-linear-gradient(0deg, rgba(41, 41, 41, 1) 0%,
		rgba(110, 110, 110, 1) 100%);
	background: linear-gradient(0deg, rgba(41, 41, 41, 1) 0%,
		rgba(110, 110, 110, 1) 100%);
	filter: progid:DXImageTransform.Microsoft.gradient(startColorstr="#292929",
		endColorstr="#6e6e6e", GradientType=1);
	font-family: Times New Roman ", Times, serif;
}

.custom_table {
	font-family: arial;
	margin-bottom: 10px;
}

.custom_table>tbody>tr>th {
	background: #313131;
	color: #fff;
	font-weight: bold;
	padding: 6px 8px;
}

.custom_table>tbody>tr>th:last-child {
	text-align: center;
}

.custom_table>tbody>tr>td {
	padding: 10px 8px !important;
	text-align: left;
}

.custom_table>tbody>tr>td:last-child {
	text-align: center;
}

.custom_table>tbody>tr:hover {
	background-color: rgba(3, 169, 244, 0.15);
}

.custom_table>tbody>tr.active {
	background-color: rgba(3, 169, 244, 0.15);
}

.custom_table>tbody>tr.active>td {
	background-color: rgba(3, 169, 244, 0.15);
}

.tbleVal {
	background-color: #ffffff;
	display: inline-block;
	padding: 3px 8px;
	color: #000;
	font-weight: bold;
	border-radius: 3px;
}

.whitelink a {
	color: #fff !important;
}

.rdo_group {
	text-align: center;
	margin: 5px 0 5px 0;
}

.rdo_group label {
	margin-left: 20px;
	font-size: 14px;
	font-family: "Helvetica Neue", Helvetica, Arial, sans-serif;
}

.rdo_group label input {
	margin-right: 2px;
	vertical-align: top;
}

.rdo_group_inner {
	margin: 0 auto 10px auto;
	display: inline-block;
	border: 1px solid #636363;
	padding: 4px 26px 0px 0px;
	border-radius: 5px;
	background: #7e7575;
	color: #fff7f7;
	box-shadow: 0px 3px 5px rgba(0, 0, 0, 0.09);
}

.nav-tabs>li.active>a, .nav-tabs>li.active>a:focus, .nav-tabs>li.active>a:hover
	{
	color: #1688bb !important;
	font-weight: bold;
}

.nav-tabs>li.active>a::after, .nav-tabs>li:hover>a::after {
	background: none;
}

.user_nav {
	font-size: 13px;
	position: absolute;
	right: 25px;
	top: 25px;
	border: 1px solid #eab846;
	padding: 3px 12px;
	border-radius: 23px;
	background: #fff;
}

.user_nav i {
	font-size: 15px;
	margin-right: 5px;
	color: #0b5a98;
}

.action-tab div.dropdown {
	display: inline-block;
	padding: 12px;
	border-radius: 6px; <!--
	border-top-right-radius: 6px; -->
	margin-right: 4px;
	box-shadow: 0 8px 16px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0
		rgba(0, 0, 0, 0.19);
}

.action-tab div.dropdown span:after {
	content: '▼';
}

.action-tab .active {
	background: #fff;
}

.dropdown-menu a {
	display: block;
	padding: 4px;
	border-bottom: 1px solid #ddd;
}

.dropdown-menu a:last-child {
	border: 0px none;
}

.btnn {
	float: right;
	box-shadow: 0 8px 16px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0
		rgba(0, 0, 0, 0.19);
	cursor: pointer;
}

.btnn a {
	font-size: 18px;
	background-color: #000026;
	font-family: Georgia, serif;
}

.btnn a:hover {
	transition: 0.5s;
	font-size: 18px;
	background-color: #9b0e38;
	color: white;
}
</style>

	<style>
form.example input[type=text] {
	padding: 10px;
	font-size: 17px;
	border: 1px solid grey;
	float: left;
	width: 80%;
	background: #f1f1f1;
}

form.example button {
	float: left;
	width: 20%;
	padding: 10px;
	background: #2196F3;
	color: white;
	font-size: 17px;
	border: 1px solid grey;
	border-left: none;
	cursor: pointer;
}

form.example button:hover {
	background: #0b7dda;
}

form.example::after {
	content: "";
	clear: both;
	display: table;
}

.languageButton-header {
	text-align: right;
	padding-top: 4px;
	margin-right: 5px;
}

.languageButton-header input[type="radio"]#rbtnListLanguage_0:checked+label,
	.languageButton-header input[type="radio"]#rbtnListLanguage_1:checked+label
	{
	color: #dc3545;
}

.languageButton-header input[type="radio"] {
	display: none;
}

.languageButton-header .radio-list label:last-child {
	font-size: 15px;
	padding-left: 5px;
	background-image: url(img-dvider.jpg);
	background-repeat: no-repeat;
	background-repeat: no-repeat;
	background-position: 2px 3px;
	padding: 0px 0px 0px 7px;
}
</style>
	<center>
		<div id="page-wrapper"
			style="background: -webkit-linear-gradient(-90deg, #f7b174, #88c181 100%); background-image: -webkit-linear-gradient(-90deg, rgb(247, 177, 116), rgb(136, 193, 129) 100%); background-position-x: initial; background-position-y: initial; background-size: initial; background-repeat-x: initial; background-repeat-y: initial; background-attachment: initial; background-origin: initial; background-clip: initial; background-color: initial;">
			<div class="row">

				<a href="#"><p
						style="margin-top: -66px; margin-left: 318px; font-weight: bold; font-size: 16px; color: #000000;">
						<sub data-toggle="modal" data-target="#myModal3"> Version
							1.1</sub>
					</p></a>
				<div class="languageButton-header"
					style="margin-top: 0px; margin-right: 5px;">
					<span id="rbtnListLanguage" class="radio-list"><input
						id="rbtnListLanguage_0" type="radio" name="ctl00$rbtnListLanguage"
						value="en-US" checked="checked"><label
						for="rbtnListLanguage_0">English</label><input
						id="rbtnListLanguage_1" type="radio" name="ctl00$rbtnListLanguage"
						value="hi-IN"
						onclick="javascript:setTimeout('__doPostBack(\'ctl00$rbtnListLanguage$1\',\'\')', 0)"><label
						for="rbtnListLanguage_1">हिन्दी</label></span>
				</div>
			</div>
			<!-- <div id="google_translate_element"></div>

<script type="text/javascript">
function googleTranslateElementInit() {
  new google.translate.TranslateElement({pageLanguage: 'en'}, 'google_translate_element');
}
</script>

<script type="text/javascript" src="//translate.google.com/translate_a/element.js?cb=googleTranslateElementInit"></script> -->



			<div class="row">
				<div class="col-md-12">
					<div class="card">

						<div class="btnn">
							<a href="Javascript:void(0)" class="btn" data-toggle="modal"
								data-target="#myModal">Login</a> <a href="Javascript:void(0)"
								class="btn" data-toggle="modal" data-target="#myModal1">Registration</a>

							<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
								aria-labelledby="myLargeModalLabel" aria-hidden="true">
								<div class="modal-dialog modal-md">
									<div class="modal-content">
										<div class="modal-header">
											<button type="button" class="close" data-dismiss="modal"
												aria-hidden="true">×</button>

										</div>
										<div class="modal-body">
											<div class="row">
												<div class="col-md-12">
													<!-- Nav tabs -->
													<ul class="nav nav-tabs">
														<li class="active"><a href="#Login" data-toggle="tab">Login</a></li>

													</ul>
													<!-- Tab panes -->
													<div class="tab-content"
														style="background: #ffffff; border: 1px;">
														<div class="tab-pane active" id="Login">
															<form role="form" class="form-horizontal">
																<div class="form-group">
																	<label for="email" class="col-sm-2 control-label">
																		Email</label>
																	<div class="col-sm-10">
																		<input type="email" class="form-control" id="email1"
																			placeholder="Email" />
																	</div>
																</div>
																<div class="form-group">
																	<label for="exampleInputPassword1"
																		class="col-sm-2 control-label"> Password</label>
																	<div class="col-sm-10">
																		<input type="email" class="form-control"
																			id="exampleInputPassword1" placeholder="Password" />
																	</div>
																</div>
																<div class="row">
																	<div class="col-md-6">

																		<label class="checkbox"> <input
																			type="checkbox" value="remember-me"> Remember
																			me
																		</label>
																	</div>
																	<div class="col-md-6">
																		</dir>
																		<span class="pull-right"> <a
																			data-toggle="modal" data-target="#myModal2" href="#"
																			style="background: #ffffff; color: #000;"> Forgot
																				Password?</a>

																		</span>
																	</div>

																	</label>

																	<div class="col-md-12">
																		<button type="submit" class="btn btn-primary btn-md"
																			style="padding: 0px 80px 0px 30px;">LogIn</button>

																	</div>
																</div>



															</form>
														</div>

													</div>

												</div>

											</div>
										</div>
									</div>
								</div>
							</div>


							<div class="modal fade" id="myModal1" tabindex="-1" role="dialog"
								aria-labelledby="myLargeModalLabel" aria-hidden="true">
								<div class="modal-dialog modal-md">
									<div class="modal-content">
										<div class="modal-header">
											<button type="button" class="close" data-dismiss="modal"
												aria-hidden="true">×</button>

										</div>
										<div class="modal-body">
											<div class="row">
												<div class="col-md-12">
													<!-- Nav tabs -->
													<ul class="nav nav-tabs">

														<li class="active"><a href="#Registration"
															data-toggle="tab">Registration</a></li>
													</ul>
													<!-- Tab panes -->

													<div class="tab-pane" id="Registration">
														<form role="form" class="form-horizontal">
															<div class="form-group">
																<label for="email" class="col-sm-2 control-label">
																	Name</label>
																<div class="col-sm-10">
																	<div class="row">
																		<div class="col-md-3">
																			<select class="form-control">
																				<option>Mr.</option>
																				<option>Ms.</option>
																				<option>Mrs.</option>
																			</select>
																		</div>
																		<div class="col-md-9">
																			<input type="text" class="form-control"
																				placeholder="Full Name" />
																		</div>
																	</div>
																</div>
															</div>
															<div class="form-group">
																<label for="email" class="col-sm-2 control-label">
																	Email</label>
																<div class="col-sm-10">
																	<input type="email" class="form-control" id="email"
																		placeholder="Email" />
																</div>
															</div>
															<div class="form-group">
																<label for="password" class="col-sm-2 control-label">
																	Password</label>
																<div class="col-sm-10">
																	<input type="password" class="form-control"
																		id="password" placeholder="Password" />
																</div>
															</div>
															<div class="form-group">
																<label for="password" class="col-sm-2 control-label">
																	Confirm Password</label>
																<div class="col-sm-10">
																	<input type="password" class="form-control"
																		id="password" placeholder="Confirm Password" />
																</div>
															</div>
															<div class="row">
																<div class="col-sm-2"></div>
																<div class="col-sm-10">
																	<button type="button" class="btn btn-primary btn-sm"
																		style="padding: 0px 80px 0px 30px;">Register</button>

																</div>
															</div>
														</form>
													</div>


												</div>

											</div>

										</div>
									</div>
								</div>
							</div>

							<!-- forgot password -->
							<div class="modal fade" id="myModal2" tabindex="-1" role="dialog"
								aria-labelledby="myLargeModalLabel" aria-hidden="true">
								<div class="modal-dialog modal-md">
									<div class="modal-content">
										<div class="modal-header">
											<button type="button" class="close" data-dismiss="modal"
												aria-hidden="true">×</button>

										</div>
										<div class="modal-body">
											<div class="row">
												<div class="col-md-12">
													<!-- Nav tabs -->
													<ul class="nav nav-tabs">

														<li class="active"><a href="#Registration"
															data-toggle="tab">Forgot Password</a></li>
													</ul>
													<!-- Tab panes -->

													<div class="tab-pane" id="Registration"
														style="padding: 31px 0;">
														<form role="form" class="form-horizontal">

															<div class="form-group">
																<label for="email" class="col-sm-2 control-label"
																	style="color: #1688bb; font-weight: bold; text-align: left;">
																	Registered Email</label>
																<div class="col-sm-10">
																	<input type="email" class="form-control" id="email"
																		placeholder="" />
																</div>
															</div>
															<div class="form-group">
																<label for="password" class="col-sm-2 control-label"
																	style="color: #1688bb; font-weight: bold; text-align: left;">
																	Registered Mobile No</label>
																<div class="col-sm-10">
																	<input type="mobile" class="form-control" id="mobile"
																		placeholder="" />
																</div>
															</div>

															<div class="row">
																<div class="col-sm-2"></div>
																<div class="col-sm-10">
																	<button type="button" class="btn btn-primary btn-sm"
																		style="padding: 0px 100px 0px 30px;">Forgot
																		Password</button>

																</div>
															</div>
														</form>
													</div>
												</div>

											</div>

										</div>
									</div>
								</div>
							</div>
							<!-- forgot password -->


							<!-- version 1.1 -->
							<div class="modal fade" id="myModal3" tabindex="-1" role="dialog"
								aria-labelledby="myLargeModalLabel" aria-hidden="true">
								<div class="modal-dialog modal-md">
									<div class="modal-content">
										<div class="modal-header" style="background: #005394;">
											<small class="card-title"
												style="float: left; color: #ffffff;">Release Notes</small>

											<button type="button" class="close" data-dismiss="modal"
												aria-hidden="true">×</button>

										</div>
										<div class="modal-body">
											<form class="example" action="/action_page.php"
												style="margin: auto; max-width: 300px; padding: 0px; float: right; border: 0px; margin-bottom: 5px; margin-top: -11px;">
												<input type="text" placeholder="Search.." name="search2"
													style="padding: 3px;">
												<button type="submit">
													<i class="fa fa-search"></i>
												</button>
											</form>
											<table id="example"
												class="table table-striped table-bordered"
												style="width: 100%">
												<thead>
													<tr>
														<th>S.No.</th>
														<th>Version</th>
														<th>Release Date</th>
														<th>Release Date</th>

													</tr>
												</thead>
												<tbody>
													<tr>
														<td>1</td>
														<td>version 1.1</td>
														<td>15-06-2020</td>
														<td>SJMS MIS application added.</td>

													</tr>
													<tr>
														<td>2</td>
														<td>version 1.1</td>
														<td>15-06-2020</td>
														<td>SJMS MIS application added.</td>

													</tr>
													<tr>
														<td>3</td>
														<td>version 1.1</td>
														<td>15-06-2020</td>
														<td>SJMS MIS application added.</td>

													</tr>
													<tr>
														<td>4</td>
														<td>version 1.1</td>
														<td>15-06-2020</td>
														<td>SJMS MIS application added.</td>

													</tr>
													<tr>
														<td>5</td>
														<td>Accountant</td>
														<td>15-06-2020</td>
														<td>SJMS MIS application added.</td>

													</tr>
													<tr>
														<td>6</td>
														<td>version 1.1</td>
														<td>15-06-2020</td>
														<td>SJMS MIS application added.</td>

													</tr>
													<tr>
														<td>7</td>
														<td>version 1.1</td>
														<td>15-06-2020</td>
														<td>SJMS MIS application added.</td>

													</tr>
													<tr>
														<td>8</td>
														<td>version 1.1</td>
														<td>15-06-2020</td>
														<td>SJMS MIS application added.</td>

													</tr>
													<tr>
														<td>9</td>
														<td>version 1.1</td>
														<td>15-06-2020</td>
														<td>SJMS MIS application added.</td>

													</tr>
													<tr>
														<td>10</td>
														<td>version 1.1</td>
														<td>15-06-2020</td>
														<td>SJMS MIS application added.</td>

													</tr>
													<tr>
														<td>11</td>
														<td>version 1.1</td>
														<td>15-06-2020</td>
														<td>SJMS MIS application added.</td>

													</tr>
													<tr>
														<td>12</td>
														<td>version 1.1</td>
														<td>15-06-2020</td>
														<td>SJMS MIS application added.</td>

													</tr>




												</tbody>

											</table>

										</div>
									</div>
								</div>
							</div>
							<!-- version 1.1 -->


							<!-- helpdesk -->
							<div class="modal fade" id="myModal4" tabindex="-1" role="dialog"
								aria-labelledby="myLargeModalLabel" aria-hidden="true">
								<div class="modal-dialog modal-md">
									<div class="modal-content">
										<div class="modal-header" style="background: #005394;">
											<small class="card-title"
												style="float: left; color: #ffffff;">Helpdesk
												Details</small>

											<button type="button" class="close" data-dismiss="modal"
												aria-hidden="true">×</button>

										</div>
										<div class="modal-body">
											<form class="example" action="">
												<!--Grid column-->
												<div class="col-md-12 text-center">
													<h3>NEW DELHI MUNICIPAL COUNCIL</h3>
													<ul class="list-unstyled mb-0">
														<li><i class="fa fa-map-marker-alt fa-2x"></i>
															<p>
																(NDMC Head Office)<br>Palika Kendra Parliament
																Street, New Delhi-110001
															</p></li>

														<li><i class="fa fa-phone mt-4 fa-2x"></i>
															<p>24/7 Helpline (Toll Free) : 1533</p></li>

														<li><i class="fa fa-phone mt-4 fa-2x"></i>
															<p>Exchange No. PABX : 41501354 - 60</p></li>
													</ul>
												</div>
												<!--Grid column-->

											</form>


										</div>
									</div>
								</div>
							</div>
							<!-- helpdesk -->
						</div>
					</div>
					</br>
					<center>
						<h2
							style="font-weight: 800; font-size: 23px; font-family: Montserrat, sans-serif; -webkit-font-smoothing: antialiased; text-rendering: optimizeLegibility; color: #000; margin-top: -30px; margin-left: 285px;">GRAPHICAL
							DASHBOARD</h2>
					</center>
					</br>

					<div class="row">
						<div class="row wow fadeInDown" data-wow-duration="2s"
							id="mainCount">
							<div class="col-lg-3 col-md-6 dataBoxHover">
								<div class="panel orange">
									<i class="fa  fa-android fa-4x"></i>
									<div class="panel-heading">
										<div class="row">
											<div id="pendency" class="col-xs-9 text-left">
												<div>
													<a href="javascript:void(0);"
														style="text-decoration: none;"><h3 id="total_pending1"
															data-tag="">
															104<span class="count_class counter"></span>
														</h3></a>
												</div>
												<div style="margin-top: -32px; margin-left: 50px;">
													<b>Integrated App</b>
												</div>
											</div>

										</div>
									</div>
								</div>

							</div>
							<div class="col-lg-3 col-md-6 dataBoxHover">
								<div class="panel pink">
									<i class="fa  fa-users fa-4x"></i>
									<div class="panel-heading">
										<div class="row">
											<div class="col-xs-9 text-left">
												<div>
													<a href="javascript:void(0);"
														style="text-decoration: none;"><h3
															id="pendingcomplience2">
															88<span class="count_class counter"></span>
														</h3></a>
												</div>
												<div style="margin-top: -32px; margin-left: 50px;">
													<b>Active User</b>
												</div>
											</div>
										</div>
									</div>
								</div>

							</div>
							<div class="col-lg-3 col-md-6 dataBoxHover">
								<div class="panel tar">
									<i class="fa  fa-user fa-4x"></i>
									<div class="panel-heading">
										<div class="row">
											<div class="col-xs-9 text-left">
												<div>
													<a href="javascript:void(0);"
														style="text-decoration: none;"><h3 id="contemptcases3">
															77<span class="count_class counter"> </span>
														</h3></a>
												</div>
												<div style="margin-top: -32px; margin-left: 50px;">
													<b>Inactive User</b>
												</div>
											</div>
										</div>
									</div>
								</div>

							</div>
							<div class="col-lg-3 col-md-6">
								<div class="panel yellow">
									<i class="fa  fa-calendar fa-4x"></i>
									<div class="panel-heading">
										<div class="row">
											<div class="col-xs-9 text-left">
												<div>
													<a href="javascript:void(0);"
														style="text-decoration: none;"><h3 id="#">
															66<span class="count_class counter"></span>
														</h3></a>
												</div>
												<div style="margin-top: -32px; margin-left: 50px;">
													<b>Sessions</b>
												</div>
											</div>
											<!--<div class="col-xs-3">
                                        <i class="fa  fa-calendar fa-4x"></i>
                                    </div>-->
										</div>
									</div>
								</div>
							</div>
						</div>

						<div class="tab-content"
							style="border-radius: 10px; margin: 10px, 20px, 10px, 20px !important;">

							<div role="tabpanel" class="tab-pane active" id="home">

								<!-- <div class="action-tab" style="padding-left: 36px; text-align:center;">
                <div class="dropdown active">
                  <a href="javascript: void(0);" id="pending-home" data-tag="main-head">Pendency of Cases</a>
                 
                </div>


                <div class="dropdown">
                    <a href="javascript:void(0)" id="disposed_cases">Pending Vs Disposed Cases</a>
                </div>
        

              </div> -->
								</br>
								<script
									src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.7.2/Chart.bundle.js">
									
								</script>
								<!---STATE SECTION SUBJECT CATEGORY-->
								<div class="container-fluid" id="pending-div">
									<div class="col-md-12 wow slideInLeft graphWrapper"
										data-wow-duration="4s" style="min-height: auto">
										<div class="row popupHeader">
											<div class="col-md-6">
												<center>
													<h2>
														<span>Bar Chart Graphical Data</span>
													</h2>
												</center>
											</div>
											<div class="col-md-6">
												<center>
													<h2>
														<span>Application Graphical Data</span>
													</h2>
												</center>
											</div>
										</div>
										<div class="col-md-6">
											<div id="drill" class="requirement "
												style="border: 4px solid #7e7575; padding: 4px 0px; background-size: cover; text-align: center; height: 350px; overflow-x: scroll;">
												<canvas id="myChart" width="544" height="312"></canvas>
											</div>

										</div>
										<div class="col-md-6">
											<div id="drill" class="requirement "
												style="border: 4px solid #7e7575; padding: 4px 0px; background-size: cover; text-align: center; height: 350px; overflow-x: scroll;">
												<canvas id="myChart1"></canvas>



											</div>

										</div>
									</div>
								</div>

								<!-- <div class="container-fluid" id="ministry-div">
  <div class="col-md-12 wow slideInLeft graphWrapper" data-wow-duration="4s">

    <div class="row popupHeader">
      <div class="col-md-12">
        <center> <h2><span>Application Graphical Data</span></h2></center> 
      </div>
    </div>

    <div id="cc1sssssss" style="border: 4px solid #7e7575; padding:8px 20px;background-size:cover; min-height: 413px; text-align: center; overflow-x: scroll;" ><img src="images/pie.jpg"></div>
  </div>
</div> -->

								<!----------  Disposed of Cases Div Start------------>
								<div class="container-fluid hide" id="disposed_cases_div">
									<div class="row">
										<div class="col-md-12 wow slideInLeft graphWrapper"
											data-wow-duration="4s" style="min-height: 600px;">

											<div class="row popupHeader">
												<div class="col-md-12">
													<center>
														<h2>
															<span>Pending Vs Disposed Cases</span>
														</h2>
													</center>
												</div>
												<div class="col-md-6 text-right " style="width: 98%;">
													<span id="exportd"
														onclick="javascript:demoFromHTML2020(this);"><img
														src="ic_pdf.png"></span> <span id="btnExportd"
														onclick="javascript:demoFromHTML200();"><img
														src="ic_excel.png"></span>
												</div>
											</div>

											<center>
												<b>From</b> <select id="fmonth"><option value="01">Jan</option>
													<option value="02">Feb</option>
													<option value="03">Mar</option>
													<option value="04">April</option>
													<option value="05">May</option>
													<option value="06">June</option>
													<option value="07">July</option>
													<option value="08">Aug</option>
													<option value="09">Sep</option>
													<option value="10">Oct</option>
													<option value="11">Nov</option>
													<option value="12">Dec</option></select> <select id="fyear"><option
														value="2020">2020</option>
													<option value="2019">2019</option>
													<option value="2018">2018</option>
													<option value="2017">2017</option>
													<option value="2016">2016</option>
													<option value="2015">2015</option>
													<option value="2014">2014</option>
													<option value="2013">2013</option>
													<option value="2012">2012</option>
													<option value="2011">2011</option></select>&nbsp;&nbsp;&nbsp;&nbsp;<b>To</b><select
													id="tmonth"><option value="01">Jan</option>
													<option value="02">Feb</option>
													<option value="03">Mar</option>
													<option value="04">April</option>
													<option value="05">May</option>
													<option value="06">June</option>
													<option value="07">July</option>
													<option value="08">Aug</option>
													<option value="09">Sep</option>
													<option value="10">Oct</option>
													<option value="11">Nov</option>
													<option value="12">Dec</option></select> <select id="tyear"><option
														value="2020">2020</option>
													<option value="2019">2019</option>
													<option value="2018">2018</option>
													<option value="2017">2017</option>
													<option value="2016">2016</option>
													<option value="2015">2015</option>
													<option value="2014">2014</option>
													<option value="2013">2013</option>
													<option value="2012">2012</option>
													<option value="2011">2011</option></select> <a><input
													type="submit" value="Submit" name="sub" id="sub"
													style="background-color: #1d87bb; color: #fff; border: none; padding: 3px 10px; border-radius: 4px;" />
												</a>
											</center>
											</br>
											<div class="col-md-12" style="padding: 0 3px 0 0;">
												<div id="fd"
													style="border: 4px solid #7e7575; background: #ffffff; text-align: center; padding: 8px 0px; min-height: 460px; overflow-x: scroll;">
												</div>
											</div>
										</div>
									</div>
								</div>

								<div class="container-fluid hide" id="departmentDiv">
									<div class="row wow slideInLeft graphWrapper"
										data-wow-duration="4s"
										style="padding: 10px 15px; margin-bottom: 20px;">
										<div class="col-md-12 popupHeader">
											<h2>
												<span>Department Wise Statistics </span>[<font id="minsName"></font>]
											</h2>
										</div>
										<div class="col-md-12" id="departmentChart"
											style="border: 4px solid #7e7575; padding: 8px 0px; background-size: cover; min-height: 520px; text-align: center;">Chart
											Loading........</div>
										<div class="col-md-8 table-responsive hide" id="deptCD-Div"
											style="border: 4px solid #7e7575; border-left: 0 none; padding: 8px 6px; background-size: cover; min-height: 520px; text-align: center;">
										</div>
									</div>
								</div>

								<div id="zero" style="display: none;">
									<div id="idd"
										style="display: block; background: #FFFFFF; height: 0px">
										<div id="t01">
											<h1>
												<font color="red">Pending Vs Disposal Data </font>
											</h1>
										</div>
										<div class="table-responsive" id="gfd"
											style="margin-top: -56px;">
											<table class="table">
											</table>
										</div>
									</div>
								</div>

								<!----------  Disposed of Cases Div End------------>

								<style>
#indicatorDiv {
	font-family: 'Arial', 'Helvetica';
	font-size: 13px;
}

#format {
	height: 25px;
	font-size: 12px;
}

#export {
	height: 25px;
	font-size: 13px;
}

#export333 {
	height: 25px;
	font-size: 13px;
}

#indicatorDiv1 {
	font-family: 'Arial', 'Helvetica';
	font-size: 13px;
}

#format1 {
	height: 25px;
	font-size: 12px;
}

#export1 {
	height: 25px;
	font-size: 13px;
}

#btnExport {
	float: right;
}

#exporti {
	height: 25px;
	font-size: 13px;
}

#btnExporti {
	float: right;
}

#btnExport1 {
	float: right;
}

#btnExport3 {
	float: right;
}

#btnExport4 {
	float: right;
}

#btnExport5 {
	float: right;
}

#btnExport6 {
	float: right;
}

#btnExport11 {
	float: right;
}

#btnExport333 {
	float: right;
}
</style>





								<div class="loading_progress">
									<div class="flipper">
										<img src="sci_logo.png">
									</div>
								</div>


								<div class="modal fade" id="minDetails" tabindex="-1"
									role="dialog" aria-labelledby="minModal" aria-hidden="true">
									<div class="modal-dialog" role="document" style="width: 92%;">
										<div class="modal-content" style="margin-top: 70px;">
											<div class="modal-header">
												<h5 class="modal-title" id="minModal">Loading...</h5>
												<button type="button" class="close" data-dismiss="modal"
													aria-label="Close">
													<span aria-hidden="true">&times;</span>
												</button>
											</div>
											<div class="table-responsive modal-body" id="minDetailsDiv">
												Loading.....</div>
											<div class="modal-footer">
												<button type="button" class="btn btn-secondary"
													data-dismiss="modal">Close</button>
											</div>
										</div>
									</div>
								</div>


								<footer class="main-footer text-center"
									style="padding: 0px; margin-left: 0px; color: #fff; background-color: #343A40; font-size: 12px;">

									© 2020 NDMC, [All Rights Reserved] Designed, Developed &
									Maintained by: Information Technology Dept. For any
									suggestions/queries, please contact with IT Department of NDMC.

									<p style="margin: 0">

										<a href="#"><span data-toggle="modal"
											data-target="#myModal4">Helpdesk Details</span></a>&nbsp;&nbsp;|&nbsp;
										<a href="WebsitePolicy.html"> <span>Website
												Policies</span></a>&nbsp;&nbsp;|&nbsp; <a href="PasswordPolicy.html">
											<span>Password Policy</span>
										</a>&nbsp;&nbsp;|&nbsp; <span>FAQ</span>&nbsp;&nbsp;|&nbsp; <span>Sitemap</span>
									</p>

								</footer>
</body>


</html>

<style>
@import "http://fonts.googleapis.com/css?family=Raleway";
/*----------------------------------------------
CSS settings for HTML div Exact Center
------------------------------------------------*/
#map {
	height: 400px; /* The height is 400 pixels */
	width: 100%; /* The width is the width of the web page */
}

#abc {
	width: 100%;
	height: 100%;
	top: 0;
	left: 0;
	display: none;
	position: fixed;
	background-color: rgba(0, 0, 0, 0.85);
	overflow: auto
}

img#close {
	position: absolute;
	top: 15px;
	right: 15px;
	cursor: pointer;
}

div#popupContact {
	position: absolute;
	left: 0;
	right: 0;
	top: 50px;
	font-family: 'Raleway', sans-serif;
	max-width: 800px;
	width: 100%;
	margin: 0 auto;
}

form {
	padding: 10px 20px;
	border: 2px solid #0071bd;
	border-radius: 10px;
	font-family: raleway;
	background-color: #fff;
}

#submit {
	text-decoration: none;
	width: 100%;
	text-align: center;
	display: block;
	background-color: #FFBC00;
	color: #fff;
	border: 1px solid #FFCB00;
	padding: 10px 0;
	font-size: 20px;
	cursor: pointer;
	border-radius: 5px
}

button {
	width: 12%;
	height: 33px;
	color: #5d5454;
	font-size: 12px;
	cursor: pointer
}

.tableDataWrap {
	overflow: scroll;
	height: 500px;
	border: 1px solid #f1f1f1;
}

.table tr th {
	background-color: #ececec;
}
</style>

<style>
@import "http://fonts.googleapis.com/css?family=Montserrat:300,400,700";

.rwd-table {
	margin: 1em 0;
	min-width: 500px;
}

.rwd-table tr {
	border-top: 1px solid #ddd;
	border-bottom: 1px solid #ddd;
}

.rwd-table th {
	display: none;
}

.rwd-table td {
	display: block;
}

.rwd-table td:first-child {
	padding-top: .5em;
}

.rwd-table td:last-child {
	padding-bottom: .5em;
}

.rwd-table td:before {
	content: attr(data-th) ": ";
	font-weight: bold;
	width: 6.5em;
	display: inline-block;
}

@media ( min-width : 480px) {
	.rwd-table td:before {
		display: none;
	}
}

.rwd-table th, .rwd-table td {
	text-align: left;
}

@media ( min-width : 480px) {
	.rwd-table th, .rwd-table td {
		display: table-cell;
		padding: .25em .5em;
	}
	.rwd-table th:first-child, .rwd-table td:first-child {
		padding-left: 0;
	}
	.rwd-table th:last-child, .rwd-table td:last-child {
		padding-right: 0;
	}
}

body {
	font-family: Montserrat, sans-serif;
	-webkit-font-smoothing: antialiased;
	text-rendering: optimizeLegibility;
	color: #444;
	background: #eee;
}

h3 {
	font-weight: normal;
	letter-spacing: -1px;
}

.rwd-table {
	background: #34495E;
	color: #fff;
	border-radius: .4em;
	overflow: hidden;
}

.rwd-table tr {
	border-color: #46627f;
}

.rwd-table th, .rwd-table td {
	margin: .5em 1em;
}

@media ( min-width : 480px) {
	.rwd-table th, .rwd-table td {
		padding: 1em !important;
	}
}

.rwd-table th, .rwd-table td:before {
	color: #dd5;
}
</style>




<style>
div.ex1 {
	height: 269px;
	overflow-y: scroll;
	border: 4px solid #7e7575;
	padding: 10px;
}

.table-row, .table-rowc, .table-rowi, .table-rowr, .table-rowrr,
	.table-rowrnr {
	cursor: pointer;
}

.table-rowm {
	cursor: pointer;
}

#myChart {
	margin-top: -30px !important;
}
</style>

<script type="text/javascript" src="js/canvasjs.min.js">
	$(document).ready(function() {
		$('#example').DataTable();
	});
</script>

<script type="text/javascript">
	var ctx = document.getElementById("myChart1").getContext('2d');
	var myChart = new Chart(ctx, {
		type : 'pie',
		data : {
			labels : [ "Integrated App", "Active User", "Inactive User",
					"Sessions" ],
			datasets : [ {
				backgroundColor : [ 'rgba(255,0,0)', 'rgba(40,167,69,1)',
						'rgba(23, 162, 184, 1)', 'rgba(255, 193, 7, 1)', ],
				data : [ 104, 88, 77, 66 ]
			} ]
		}
	});
</script>

<script type="text/javascript">
	var ctx = new Chart(document.getElementById("myChart"), {

		type : "bar",
		data : {
			/*labels: ["Stock"],*/

			datasets : [ {
				label : "Integrated App",
				backgroundColor : 'rgba(255,0,0)',
				borderColor : 'rgba(255,99,132,1)',
				borderWidth : 1,

				data : [ 104 ],
			}, {
				label : "Active User",
				backgroundColor : 'rgba(40,167,69,1)',
				data : [ 88 ],
			}, {
				label : "Inactive User",
				backgroundColor : 'rgba(23, 162, 184, 1)',
				data : [ 77 ],
			}, {
				label : "Sessions",
				backgroundColor : 'rgba(255, 193, 7, 1)',
				data : [ 66 ],
			} ]
		},
		options : {

			legend : {
				position : 'top'
			},
			title : {
				display : true,
			},

		}

	});
</script>