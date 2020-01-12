<%-- <!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <title>Home | NDMC Portal</title>

    <!-- Style -->
    <link rel="stylesheet" type="text/css" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/style.css" crossorigin="anonymous">

</head>
<body>

<nav class="navbar navbar-expand-md navbar-dark bg-dark fixed-top">
    <a class="navbar-brand" href="#">NDMC Portal</a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarsExampleDefault" aria-controls="navbarsExampleDefault" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>

    <div class="collapse navbar-collapse" id="navbarsExampleDefault">
        <ul class="navbar-nav mr-auto">
            <li class="nav-item active">
                <a class="nav-link" href="/kc-security-app">Home <span class="sr-only">(current)</span></a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="/kc-security-app/books">Citizen</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="/kc-security-app/manager">NDMC Employee</a>
            </li>
        </ul>
    </div>
</nav>

<main role="main" class="container">

    <div class="starter-template">
        <h1>NDMC Portal</h1>
        <p class="lead">Welcome to the public library. You are free to visit this page since it is not protected.</p>
    </div>

</main><!-- /.container -->

<!-- Scripts -->
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>

</body>
</html> --%>

<%@ include file="/static-resources/common/taglibs.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
<meta name="description" content="">
<meta name="author" content="">
<title>Log in with your credentials</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

<style type="text/css">
.login-form {
	width: 340px;
	margin: 50px auto;
}

.login-form form {
	margin-bottom: 15px;
	background: #bcdcba;
	box-shadow: 0px 2px 2px rgba(0, 0, 0, 0.3);
	padding: 30px;
}

.login-form h2 {
	margin: 0 0 15px;
}

.form-control, .btn {
	min-height: 38px;
	border-radius: 2px;
}

.btn {
	font-size: 15px;
	font-weight: bold;
}

/* .classForBackgoundImage {
 background-image: url('/poc/resources/images/Ndmc-e1463470631653.jpg'); 
 background-image: url('/poc/resources/images/bgimage-1.jpg');
 background-size: 100% 100%;
 background-repeat: no-repeat;
} */

body {
	background: #EDF5E1;
	font-size: 12px;
	color: #333;
	font-size: 15px;
}


</style>
<link rel="icon" type="image/x-icon"
	href="<%=request.getContextPath()%>/resources/images/favicon.ico" />
</head>

<!-- <body background="/poc/resources/images/bgimage.jpg"> -->
<body background="${ctx}/resources/images/bgimage.jpg">
	<div class="classForBackgoundImage">
		<div class="container">
			<div class="login-form">
				<%-- <form method="POST" action="${ctx}/login"> --%>
					<h2 class="text-center">NDMC PORTAL</h2>
					<%-- <span>${loginStatus}</span> --%>
					<div class="form-group ${errorMsg != null ? 'has-error' : ''}">
						<%-- <div class="form-group">
							<input name="username" type="text" class="form-control"
								placeholder="Username" required="required">
						</div>
						<div class="form-group">
							<input name="password" type="password" class="form-control"
								placeholder="Password" required="required">
						</div>
						<span>${errorMsg}</span> --%>
						<div class="form-group">
							<a href="${ctx}/viewHomePage"><button type="submit" class="btn btn-primary btn-block">Log
								in / Register New User</button></a>
						</div>
						<!-- <div class="form-group">
							<button type="submit" class="btn btn-primary btn-block">Log
								in</button>
						</div> -->
						<%-- <input type="hidden" name="${_csrf.parameterName}"
							value="${_csrf.token}" />
						<div class="clearfix">
							<label class="pull-left checkbox-inline"><input
								type="checkbox"> Remember me</label> <a href="#"
								class="pull-right">Forgot Password?</a>
						</div> --%>
					</div>
				</form>
				<%-- <p class="text-center">
					<a href="${ctx}/registration/showRegistrationPage">Create an
						Account</a>
				</p> --%>
			</div>
		</div>
	</div>

	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</body>
</html> 
<!-- <%@ include file="/static-resources/common/taglibs.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
<!--  <meta name="description" content="">
<meta name="author" content="">
<title>Home | NDMC Portal</title>
<style type="text/css">
.login-form {
	width: 640px;
	margin: 50px auto;
}

.login-form form {
	margin-bottom: 15px;
	background: #bcdcba;
	box-shadow: 0px 2px 2px rgba(0, 0, 0, 0.3);
	padding: 30px;
}

.login-form h2 {
	margin: 0 0 15px;
}

.form-control, .btn {
	min-height: 38px;
	border-radius: 2px;
}

.btn {
	font-size: 15px;
	font-weight: bold;
}

/* .classForBackgoundImage {
 background-image: url('/poc/resources/images/Ndmc-e1463470631653.jpg'); 
 background-image: url('/poc/resources/images/bgimage-1.jpg');
 background-size: 100% 100%;
 background-repeat: no-repeat;
} */
body {
	background: #EDF5E1;
	font-size: 12px;
	color: #333;
	font-size: 15px;
}
</style>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
</head>
<body>
	<div class="container">
		<div class="login-form">
			<div class="col-sm-9 col-md-9 col-lg-9">
				<div class="row">
					<div class="main-gap keycloak-portal">
						<h1 class="dashbord-heading">Welcome to NDMC Portal</h1>
						<div class="row">
							<div class="col-md-12">
								<div class="row">
									<div class="col-sm-4 col-md-4 col-lg-4">
										<div class="base hvr-float-shadow">
											<a href="${ctx}/viewHomePage"></a>
											<h2>LOGIN</h2>
											<!-- <p>Some text for MyProfile...</p> 
											<div class="base-innar">
												<a class="hvr-icon-wobble-horizontal"
													href="${ctx}/viewHomePage">More Info</a>
											</div>
											<div class="circle bg-circle1">
												<img src="images/icons/my-profile.png">
											</div>
										</div>
									</div>
									<div class="col-sm-4 col-md-4 col-lg-4">
										<div class="base hvr-float-shadow">
											<a href="${ctx}/viewHomePage"></a>
											<h2>Register New User</h2>
											<!-- <p>Some text for MyProfile...</p> 
											<div class="base-innar">
												<a class="hvr-icon-wobble-horizontal"
													href="${ctx}/viewHomePage">More Info</a>
											</div>
											<div class="circle bg-circle1">
												<img src="images/icons/my-profile.png">
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</body>
</html>-->