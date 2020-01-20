<%@ include file="/static-resources/common/taglibs.jsp"%>


<div class="col-sm-12 col-md-12 col-lg-12">
	<div>
		<h2>SSO enabled Applications (${userMaster.firstName})</h2>
	</div>
	<div class="row">
		<div class="main-gap keycloak-portal">
			<h1 class="dashbord-heading">Welcome to keycloak Portal</h1>
			<div class="row">
				<div class="col-md-12">
					<div class="row">
						<div class="col-sm-4 col-md-4 col-lg-4">
							<div class="base hvr-float-shadow">
								<h2>
									<a href="http://uat.ndmc.gov.in/yellow"> YELLOW FEVER</a>
								</h2>
								<p>Some text for YELLOW FEVER...</p>

								<div class="circle bg-circle1">
									<img src="images/icons/my-profile.png">
								</div>
								<div class="base-innar">
									<a class="hvr-icon-wobble-horizontal"
										href="http://uat.ndmc.gov.in/yellow">More Info</a>
								</div>
							</div>
						</div>
						<div class="col-sm-4 col-md-4 col-lg-4">
							<div class="base hvr-float-shadow">
								<h2>
									<a href="http://uat.ndmc.gov.in/bnd"> Birth Certificate</a>
								</h2>
								<p>Some text for Birth Certificate...</p>
								<div class="circle bg-circle1">
									<img src="images/icons/my-profile.png">
								</div>
								<div class="base-innar">
									<a class="hvr-icon-wobble-horizontal"
										href="http://uat.ndmc.gov.in/bnd">More Info</a>
								</div>
							</div>
						</div>
						<!-- <div class="col-sm-4 col-md-4 col-lg-4">
							<div class="base hvr-float-shadow">
								<a href="http://127.0.0.1:8083/welcome" >
								<h2>JS-App</h2></a>
								 <p>Some text for MyProfile...</p>
								
								<div class="circle bg-circle1">
									<img src="images/icons/my-profile.png">
								</div>
								<div class="base-innar">
									<a class="hvr-icon-wobble-horizontal"
										href="http://127.0.0.1:8083/welcome">More Info</a>
								</div>
							</div>
						</div> -->
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<%-- 
<div class="container">
	<div class="starter-template">
		<h1>Spring Boot Web JSP Example</h1>
		<h2>Message: ${message}</h2>
	</div>
	<div>
		<input type="button" onclick="getsData()"
			value="click to fetch data using dwr"> <label id="labelId1"></label>
	</div>

</div> --%>

<!-- <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script> -->

<%-- 
<script src='<%=request.getContextPath()%>/dwr/engine.js'></script>
<script src='<%=request.getContextPath()%>/dwr/util.js'></script>
<script
	src='<%=request.getContextPath()%>/dwr/interface/remoteFunctions1.js'></script>
<script>
	function getsData() {
		remoteFunctions1.calculateFoo({
			async : false,
			callback : dummyDataCallBack
		});
	}
	function dummyDataCallBack(data) {
		//alert("data fetched using dwr: " + data);
		$("#labelId1").text(data);
	}
</script> --%>