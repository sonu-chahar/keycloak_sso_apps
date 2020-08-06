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
				<form method="POST" action="${ctx}/login">
					<h2 class="text-center">Log in</h2>
					<span>${loginStatus}</span>
					<div class="form-group ${errorMsg != null ? 'has-error' : ''}">
						<div class="form-group">
							<input name="username" type="text" class="form-control"
								placeholder="Username" required="required">
						</div>
						<div class="form-group">
							<input name="password" type="password" class="form-control"
								placeholder="Password" required="required">
						</div>
						<span>${errorMsg}</span>
						<div class="form-group">
							<button type="submit" class="btn btn-primary btn-block">Log
								in</button>
						</div>
						<input type="hidden" name="${_csrf.parameterName}"
							value="${_csrf.token}" />
						<div class="clearfix">
							<label class="pull-left checkbox-inline"><input
								type="checkbox"> Remember me</label> <a href="#"
								class="pull-right">Forgot Password?</a>
						</div>
					</div>
				</form>
				<p class="text-center">
					<a href="${ctx}/registration/showRegistrationPage">Create an
						Account</a>
				</p>
			</div>
		</div>
	</div>

	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</body>
</html>