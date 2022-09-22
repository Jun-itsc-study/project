<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="utf-8">
<meta content="width=device-width, initial-scale=1.0" name="viewport">
<meta content="" name="description">
<meta content="" name="keywords">
</head>

<body>
	<jsp:include page="/template/admin/header.jsp" />
	<jsp:include page="/template/admin/sidebar.jsp" />
	<main id="main" class="main">

		<div class="pagetitle">
			<h1>General Tables</h1>
			<nav>
				<ol class="breadcrumb">
					<li class="breadcrumb-item"><a href="/">Home</a></li>
					<li class="breadcrumb-item">회원문의 관리</li>
					<li class="breadcrumb-item active">회원 문의 목록</li>
				</ol>
			</nav>
		</div>
		<!-- End Page Title -->
		<!-- ------------------------------------------------------------------------------------------ -->
		<div class="container-fluid">
			
		</div>
	</main>
	<!-- End #main -->
	<!-- Footer -->
	<jsp:include page="/template/admin/footer.jsp"></jsp:include>
	<a href="#" class="back-to-top d-flex align-items-center justify-content-center"><i class="bi bi-arrow-up-short"></i></a>
	<jsp:include page="/template/admin/js.jsp"></jsp:include>
</body>

</html>