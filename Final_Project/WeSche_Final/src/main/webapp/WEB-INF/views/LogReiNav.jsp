<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import = "javax.servlet.http.HttpSession" %>	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- Navbar -->
	<nav
		class="navbar navbar-top navbar-horizontal navbar-expand-md navbar-dark">
		<div class="container px-4">
			<a class="navbar-brand" onclick="window.location.reload();" href="#"> <img
				src="./assets/img/brand/wesche_white.png" />
			</a>
			<button class="navbar-toggler" type="button" data-toggle="collapse"
				data-target="#navbar-collapse-main"
				aria-controls="navbarSupportedContent" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbar-collapse-main">
				<!-- Collapse header -->
				<div class="navbar-collapse-header d-md-none">
					<div class="row">
						<div class="col-6 collapse-brand">
							<a href="index.do" id="board"> <img src="./assets/img/brand/wesche_blue.png">
							</a>
						</div>
						<div class="col-6 collapse-close">
							<button type="button" class="navbar-toggler"
								data-toggle="collapse" data-target="#navbar-collapse-main"
								aria-controls="sidenav-main" aria-expanded="false"
								aria-label="Toggle sidenav">
							</button>
						</div>
					</div>
				</div>
				<!-- Navbar items -->
				<ul class="navbar-nav ml-auto">
					<li class="nav-item"><a class="nav-link nav-link-icon"
						href="register.do"> <i class="ni ni-circle-08"></i> <span
							class="nav-link-inner--text">Register</span>
					</a></li>
					
					<li class="nav-item"><a class="nav-link nav-link-icon"
						href="login.do"> <i class="ni ni-key-25"></i> <span
							class="nav-link-inner--text" id="login">Login</span>
					</a></li>
				</ul>
			</div>
		</div>
	</nav>
</body>


</html>