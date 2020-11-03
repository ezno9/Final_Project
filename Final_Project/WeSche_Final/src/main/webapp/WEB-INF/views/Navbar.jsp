<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script type="text/javascript">
	
</script>

</head>

<body>
	<!-- Navbar -->
	<nav class="navbar navbar-top navbar-expand-md navbar-dark" id="navbar-main">
		<div class="container-fluid">
			<!-- Brand -->
			<a class="h4 mb-0 text-white text-uppercase d-none d-lg-inline-block">작심세달</a>

			<!-- User -->

			<ul class="navbar-nav align-items-center d-none d-md-flex">
				<li class="nav-item dropdown">
					<a class="nav-link pr-0" href="#" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
						<div class="media align-items-center">
							<span class="avatar avatar-sm rounded-circle">
								<img src="./assets/img/profile/${myprofileimg }">
							</span>
							<div class="media-body ml-2 d-none d-lg-block">
								<span class="mb-0 text-sm  font-weight-bold">${login_id }</span>
							</div>
						</div>
					</a>
					<div class="dropdown-menu dropdown-menu-arrow dropdown-menu-right">
						<div class=" dropdown-header noti-title">
							<h6 class="text-overflow m-0">Welcome!</h6>
						</div>
						<a href="mypage.do" class="dropdown-item"> <i class="ni ni-single-02"></i> <span>My profile</span>
						</a> 
						<div class="dropdown-divider"></div>
						<a href="logout.do" class="dropdown-item"> <i class="ni ni-user-run"></i> <span>Logout</span>
						</a>
					</div>
				</li>
			</ul>
		</div>
	</nav>
	<!-- End Navbar -->
</body>
</html>