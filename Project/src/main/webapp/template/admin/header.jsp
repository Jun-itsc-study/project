<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:if test="${!login || loginDTO.vno != 4}">
	<script>
		alert("관리자만 접근 가능합니다.");
		location.href="/";
	</script>
</c:if>
<head>
<!-- Favicons -->
<link href="admin/img/favicon.png" rel="icon">
<link href="admin/img/apple-touch-icon.png" rel="apple-touch-icon">

<!-- Google Fonts -->
<link href="https://fonts.gstatic.com" rel="preconnect">
<link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Nunito:300,300i,400,400i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i" rel="stylesheet">

<!-- Vendor CSS Files -->
<link href="admin/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<link href="admin/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
<link href="admin/vendor/boxicons/css/boxicons.min.css" rel="stylesheet">
<link href="admin/vendor/quill/quill.snow.css" rel="stylesheet">
<link href="admin/vendor/quill/quill.bubble.css" rel="stylesheet">
<link href="admin/vendor/remixicon/remixicon.css" rel="stylesheet">
<link href="admin/vendor/simple-datatables/style.css" rel="stylesheet">

<!-- Template Main CSS File -->
<link href="admin/css/style.css" rel="stylesheet">

<!-- custom -->
<style>
	.toggle-sidebar-btn{
		padding-left:0;
		padding-right:10px;
	}
	.logo{
		width:240px;
	}
	.message-item a{padding-left:10px;}
</style>

<!-- =======================================================
  * Template Name: NiceAdmin - v2.3.1
  * Template URL: https://bootstrapmade.com/nice-admin-bootstrap-admin-html-template/
  * Author: BootstrapMade.com
  * License: https://bootstrapmade.com/license/
  ======================================================== -->
</head>
<body>
	<!-- ======= Header ======= -->
	<header id="header" class="header fixed-top d-flex align-items-center">

		<!-- Logo -->
		<div class="d-flex align-items-center justify-content-between">
			<i class="bi bi-list toggle-sidebar-btn"></i>
			<a href="admin" class="logo d-flex align-items-center"> 
				<img src="admin/img/logo.png" alt=""> 
				<span class="d-none d-lg-block">Admin Main</span>
			</a>
			<a href="/" class="logo d-flex align-items-center"> 
				<img src="shop/img/logo.png" alt=""> 
				<span class="d-none d-lg-block">Shop Main</span>
			</a>
		</div>
		<!-- End Logo -->
		
		<!-- Icons Navigation -->
		<nav class="header-nav ms-auto">
			<ul class="d-flex align-items-center">
				<!-- Notification Nav -->
				<li class="nav-item dropdown">
					<!-- Notification Icon -->
					<a class="nav-link nav-icon" href="#" data-bs-toggle="dropdown"> <i class="bi bi-bell"></i>
						<span class="badge bg-primary badge-number">4</span>
					</a>
					<!-- End Notification Icon -->

					<!-- Notification Dropdown Items -->
					<ul class="dropdown-menu dropdown-menu-end dropdown-menu-arrow notifications">
						<li class="dropdown-header">새로운 주문내역 OO건  
							<a href="#"><span class="badge rounded-pill bg-primary p-2 ms-2">View all</span></a>
						</li>
						
						<li>
							<hr class="dropdown-divider">
						</li>
						
						<c:forEach begin="0" end="3">
							<li class="notification-item">
								<i class="bi bi-plus-circle text-success"></i>
								<div>
									<h4>Lorem Ipsum</h4>
									<p>Quae dolorem earum veritatis oditseno</p>
									<p>30 min. ago</p>
								</div>
							</li>
							
							<li>
								<hr class="dropdown-divider">
							</li>
						</c:forEach>
					</ul>
					<!-- End Notification Dropdown Items -->
				</li>
				<!-- End Notification Nav -->
				
				<!-- Messages Nav -->
				<li class="nav-item dropdown">
					<!-- Messages Icon -->
					<a class="nav-link nav-icon" href="#" data-bs-toggle="dropdown">
						<i class="bi bi-chat-left-text"></i>
						<span class="badge bg-success badge-number">3</span>
					</a>
					<!-- End Messages Icon -->
					
					<!-- Messages Dropdown Items -->
					<ul class="dropdown-menu dropdown-menu-end dropdown-menu-arrow messages">
						<li class="dropdown-header">확인하지 않은 문의내역 OO건 
							<a href="#"><span class="badge rounded-pill bg-primary p-2 ms-2">View all</span></a>
						</li>
						
						<li>
							<hr class="dropdown-divider">
						</li>
						
						<c:forEach begin="0" end="3">
							<li class="message-item">
								<a href="#">
									<div>
										<h4>Maria Hudson</h4>
										<p>Velit asperiores et ducimus soluta repudiandae labore officia est ut...</p>
										<p>4 hrs. ago</p>
									</div>
								</a>
							</li>
							
							<li>
								<hr class="dropdown-divider">
							</li>
						</c:forEach>
					</ul>
					<!-- End Messages Dropdown Items -->
				</li>
				<!-- End Messages Nav -->
					
				<!-- Profile Nav -->
				<li class="nav-item dropdown pe-3">
					<!-- Profile Iamge Icon -->
					<a class="nav-link nav-profile d-flex align-items-center pe-0" href="#" data-bs-toggle="dropdown">
						<img src="admin/img/profile-img.jpg" alt="Profile" class="rounded-circle">
						<span class="d-none d-md-block dropdown-toggle ps-2">${loginDTO.name }</span>
					</a>
					<!-- End Profile Iamge Icon -->
					
					<!-- Profile Dropdown Items -->
					<ul class="dropdown-menu dropdown-menu-end dropdown-menu-arrow profile">
						<li class="dropdown-header">
							<h6>${loginDTO.name }</h6> <span>관리자</span>
						</li>
						<li>
							<hr class="dropdown-divider">
						</li>

						<li>
							<a class="dropdown-item d-flex align-items-center" href="memberManage">
								<i class="bi bi-person"></i> <span>회원관리</span>
							</a>
						</li>
						
						<li>
							<hr class="dropdown-divider">
						</li>

						<li>
							<a class="dropdown-item d-flex align-items-center" href="users-profile.html">
								<i class="bi bi-cart-check"></i> <span>주문 관리</span>
							</a>
						</li>
						
						<li>
							<hr class="dropdown-divider">
						</li>
						<li>
							<a class="dropdown-item d-flex align-items-center" href="users-profile.html">
								<i class="bi bi-cart4"></i> <span>상품 관리</span>
							</a>
						</li>
						
						<li>
							<hr class="dropdown-divider">
						</li>

						<li>
							<a class="dropdown-item d-flex align-items-center" href="qnaMain">
								<i class="bi bi-headset"></i>
								<span>문의내역 관리</span>
							</a>
						</li>
						
						<li>
							<hr class="dropdown-divider">
						</li>

						<li>
							<a class="dropdown-item d-flex align-items-center" href="logout.do">
								<i class="bi bi-box-arrow-right"></i> <span>로그아웃</span>
							</a>
						</li>
					</ul>
					<!-- End Profile Dropdown Items -->
				</li>
				<!-- End Profile Nav -->

			</ul>
		</nav>
		<!-- End Icons Navigation -->

	</header>
	<!-- End Header -->
</body>