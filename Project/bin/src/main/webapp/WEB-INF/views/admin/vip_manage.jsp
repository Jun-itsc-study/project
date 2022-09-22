<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="utf-8">
<meta content="width=device-width, initial-scale=1.0" name="viewport">

<meta content="" name="description">
<meta content="" name="keywords">
<!-- custom css -->
<style type="text/css">
	#main{min-height:82vh;}
	.card-body{padding:20px !important;}
	.tab-pane{padding-top:20px;}
</style>
</head>

<body>
	<jsp:include page="/template/admin/header.jsp" />
	<jsp:include page="/template/admin/sidebar.jsp" />
	<main id="main" class="main">
		<!-- Page Title -->
		<div class="pagetitle">
			<h1>등급 혜택 관리</h1>
			<nav>
				<ol class="breadcrumb">
					<li class="breadcrumb-item"><a href="admin">Home</a></li>
					<li class="breadcrumb-item">회원관리</li>
					<li class="breadcrumb-item active">등급혜택관리</li>
				</ol>
			</nav>
		</div>
		<!-- End Page Title -->

		<section class="section">
			<div class="row">
				<div class="col-lg-6">
					<div class="card">
						<div class="card-body">
							<!-- Bordered Tabs Justified -->
							<ul class="nav nav-tabs nav-tabs-bordered d-flex" id="borderedTabJustified" role="tablist">
								<li class="nav-item flex-fill" role="presentation">
									<button class="nav-link w-100 active" id="normal_tab" data-bs-toggle="tab" data-bs-target="#vip_normal" type="button" role="tab" aria-controls="normal" aria-selected="true">일반</button>
								</li>
								<li class="nav-item flex-fill" role="presentation">
									<button class="nav-link w-100" id="vip_tab" data-bs-toggle="tab" data-bs-target="#vip_vip" type="button" role="tab" aria-controls="vip" aria-selected="false">VIP</button>
								</li>
								<li class="nav-item flex-fill" role="presentation">
									<button class="nav-link w-100" id="vvip_tab" data-bs-toggle="tab" data-bs-target="#vip_vvip" type="button" role="tab" aria-controls="vvip" aria-selected="false">VVIP</button>
								</li>
							</ul>
							<div class="tab-content pt-2" id="borderedTabJustifiedContent">
								<!-- 일반등급 -->
								<div class="tab-pane fade show active" id="vip_normal" role="tabpanel" aria-labelledby="normal_tab">
									<form id="frm_normal">
										<input type="hidden" type="vno" value="0">
										<div class="row mb-3">
											<label for="inputText" class="col-sm-3 col-form-label">등급 기준 금액</label>
											<div class="col-sm-9">
												<input type="number" class="form-control" name="vcondition" value="${list[0].vcondition }">
											</div>
										</div>
										
										<div class="row mb-3">
											<label class="col-sm-3 col-form-label">적립퍼센트</label>
											<div class="col-sm-9">
												<div class="input-group mb-3">
													<input type="text" class="form-control" aria-label="Amount" name="percent" value="${list[0].vpercent }">
													<span class="input-group-text">%</span>
												</div>
											</div>
										</div>
										
										<div class="row mb-3">
											<label class="col-sm-10 col-form-label"></label>
											<div class="col-sm-2">
												<button type="submit" class="btn btn-primary">변경하기</button>
											</div>
										</div>
									</form>
								</div>
								<div class="tab-pane fade" id="vip_vip" role="tabpanel" aria-labelledby="vip_tab">
									<form id="frm_vip">
										<input type="hidden" type="vno" value="1">
										<div class="row mb-3">
											<label for="inputText" class="col-sm-3 col-form-label">등급 기준 금액</label>
											<div class="col-sm-9">
												<input type="number" class="form-control" name="vcondition" value="${list[1].vcondition }">
											</div>
										</div>
										
										<div class="row mb-3">
											<label class="col-sm-3 col-form-label">적립퍼센트</label>
											<div class="col-sm-9">
												<div class="input-group mb-3">
													<input type="text" class="form-control" aria-label="Amount" name="percent" value="${list[1].vpercent }">
													<span class="input-group-text">%</span>
												</div>
											</div>
										</div>
										
										<div class="row mb-3">
											<label class="col-sm-10 col-form-label"></label>
											<div class="col-sm-2">
												<button type="submit" class="btn btn-primary">변경하기</button>
											</div>
										</div>
									</form>
								</div>
								<div class="tab-pane fade" id="vip_vvip" role="tabpanel" aria-labelledby="vvip_tab">
									<form id="frm_vvip">
										<input type="hidden" type="vno" value="2">
										<div class="row mb-3">
											<label for="inputText" class="col-sm-3 col-form-label">등급 기준 금액</label>
											<div class="col-sm-9">
												<input type="number" class="form-control" name="vcondition" value="${list[2].vcondition }">
											</div>
										</div>
										
										<div class="row mb-3">
											<label class="col-sm-3 col-form-label">적립퍼센트</label>
											<div class="col-sm-9">
												<div class="input-group mb-3">
													<input type="text" class="form-control" aria-label="Amount" name="percent" value="${list[2].vpercent }">
													<span class="input-group-text">%</span>
												</div>
											</div>
										</div>
										
										<div class="row mb-3">
											<label class="col-sm-10 col-form-label"></label>
											<div class="col-sm-2">
												<button type="submit" class="btn btn-primary">변경하기</button>
											</div>
										</div>
									</form>
								</div>
							</div>
							<!-- End Bordered Tabs Justified -->



							<!-- General Form Elements -->

							<!-- End General Form Elements -->
						</div>
					</div>
				</div>
			</div>
		</section>

	</main>
	<!-- End #main -->

	<!-- Footer -->
	<jsp:include page="/template/admin/footer.jsp"></jsp:include>

	<a href="#"
		class="back-to-top d-flex align-items-center justify-content-center"><i
		class="bi bi-arrow-up-short"></i></a>

	<jsp:include page="/template/admin/js.jsp"></jsp:include>

</body>

</html>