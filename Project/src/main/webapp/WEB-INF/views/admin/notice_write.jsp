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
<!-- custom css -->
<style type="text/css">
	.card-body{padding:20px !important;}
	label{font-weight: bold;}
	.col-sm-10{padding-top:7px;}
	textarea{height: 300px;resize: none;}
</style>
</head>

<body>
	<jsp:include page="/template/admin/header.jsp"/>
	<jsp:include page="/template/admin/sidebar.jsp"/>

	<main id="main" class="main">

		<div class="pagetitle">
			<h1>공지사항 작성</h1>
			<nav>
				<ol class="breadcrumb">
					<li class="breadcrumb-item"><a href="/">Home</a></li>
					<li class="breadcrumb-item"><a href="noticeList">공지사항 관리</a></li>
					<li class="breadcrumb-item active">공지사항 작성</li>
				</ol>
			</nav>
		</div>
		<!-- End Page Title -->
		<!-- ------------------------------------------------------------------------------------------ -->
		<div class="container-fluid">
			<div class="row">
				<div class="col-lg-8">
					<div class="card">
						<div class="card-body">
							<!-- General Form Elements -->
							<form class="frmNotice">
								<div class="row mb-3">
									<label class="col-sm-2 col-form-label">제목</label>
									<div class="col-sm-10">
										<input type="text" class="form-control" name="nname">
									</div>
								</div>
								<div class="row mb-3">
									<label class="col-sm-2 col-form-label">내용</label>
									<div class="col-sm-10" style="min-height: 100px;">
										<textarea class="form-control" name="ncontent"></textarea>
									</div>
								</div>
								<div class="row mb-3">
									<label class="col-sm-10 col-form-label"></label>
									<div class="col-sm-2">
										<button type="submit" class="btn btn-primary">등록</button>
										<button type="button" class="btn btn-dark" onclick="location.href='noticeList'">목록</button>
									</div>
								</div>

							</form>
							<!-- End General Form Elements -->

						</div>
					</div>

				</div>
			</div>
		</div>
	</main>
	<!-- End #main -->
	<jsp:include page="/template/admin/footer.jsp"></jsp:include>
	<a href="#" class="back-to-top d-flex align-items-center justify-content-center"><i class="bi bi-arrow-up-short"></i></a>
	<jsp:include page="/template/admin/js.jsp"></jsp:include>
</body>

</html>