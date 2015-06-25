<%@ taglib prefix="authz"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<c:url value="/" var="base" />
<link type="text/css" rel="stylesheet"
	href="${base}webjars/bootstrap/3.0.3/css/bootstrap.min.css" />
<script type="text/javascript"
	src="${base}webjars/jquery/1.9.0/jquery.min.js"></script>
<script type="text/javascript"
	src="${base}webjars/bootstrap/3.0.3/js/bootstrap.min.js"></script>
<title>Smartrecruiters OAuth Demo</title>
</head>
<body>
	<div id="navbar" class="navbar navbar-default" role="navigation">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle" data-toggle="collapse"
				data-target=".navbar-collapse">
				<span class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>
			<a class="navbar-brand"
				href="https://dev.smartrecruiters.com">
				Smartrecruiters</a>
		</div>
		<div class="navbar-collapse collapse">
			<ul class="nav navbar-nav">
				<li><a href="${base}index.jsp" class="selected">home</a></li>
				<authz:authorize ifNotGranted="ROLE_USER">
					<li><a href="${base}login.jsp">login</a></li>
				</authz:authorize>
				<li><a href="${base}smartrecruiters/jobs">jobs</a></li>
			</ul>
		</div>
	</div>

	<div class="container">

		<h1>Welcome to Smartrecruiters Demo!</h1>

		<p>
			This is a website that will allow you to print jobs that
			you've create at <a href="https://www.smartrecruiters.com/">Smartrecruiters</a>!
			And since this site uses <a href="http://oauth.net">OAuth</a> to
			access your jobs, we will never ask you for your Smartrecruiters
			credentials.
		</p>

        <p>This app has only one user: "susan". The password
            for "susan" is password is "brak".</p>

		<authz:authorize ifNotGranted="ROLE_USER">
			<p>
				<a href="<c:url value="login.jsp"/>">Login to Demo App</a>
			</p>
		</authz:authorize>
		<authz:authorize ifAllGranted="ROLE_USER">
			<p>
				<a href="<c:url value="/logout.do"/>">Logout</a>
			</p>
		</authz:authorize>

	</div>
</body>
</html>