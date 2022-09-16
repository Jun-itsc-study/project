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
	.accordion-body:nth-child(1){border-bottom:1px rgb(230,230,230) solid;}
	.accordion-body:nth-child(2){min-height: 25vh;}
	.accordion-body:nth-child(3){text-align: right;}
	.card{min-height: 65vh;}
	.write{text-align: right;margin-bottom:5px;}
	.btnWrite i{vertical-align: middle;}
</style>
<!-- jqeury -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script type="text/javascript">
		$(function(){
			
		})
	</script>
</head>

<body>
	<jsp:include page="/template/admin/header.jsp" />
	<jsp:include page="/template/admin/sidebar.jsp" />

	<main id="main" class="main">

		<div class="pagetitle">
			<h1>공지사항 전체목록</h1>
			<nav>
				<ol class="breadcrumb">
					<li class="breadcrumb-item"><a href="/">Home</a></li>
					<li class="breadcrumb-item">공지사항 관리</li>
					<li class="breadcrumb-item active">공지사항 전체목록</li>
				</ol>
			</nav>
		</div>
		<!-- End Page Title -->
		<!-- ------------------------------------------------------------------------------------------ -->
		<div class="container-fluid">
			<div class="row">
			<!-- 공지목록 Div -->
				<div class="col-lg-12">
					<div class="card">
						<div class="card-body">
							<div class="row">
								<div class="write">
									<button type="button" class="btn btnWrite" onclick="location.href='noticeWrite'"><span>공지사항 작성하기</span><i class="ri-edit-line"></i></button>
								</div>
							</div>
						<!-- Default Accordion -->
							<div class="accordion" id="noticeAccordion">
							<c:forEach var="obj" items="${list }">
								<div class="accordion-item">
									<h2 class="accordion-header" id="${obj.nno }">
										<button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#notice-${obj.nno }" aria-expanded="false" aria-controls="notice-${obj.nno }">
											${obj.nname }
										</button>
									</h2>
									<div id="notice-${obj.nno }" class="accordion-collapse collapse" aria-labelledby="${obj.nno }" data-bs-parent="#noticeAccordion">
										<div class="accordion-body">
											${obj.ndate }
										</div>
										<div class="accordion-body">
											${obj.ncontent }
										</div>
										<div class="accordion-body">
											<input type="hidden" name="nno" value="${obj.nno }">
											<button type="button" class="btnUpdate btn"><i class="ri-edit-line"></i></button>
											<button type="button" class="btnDelete btn" onclick="location.href='deleteNotice.do?nno=${obj.nno}'"><i class="ri-delete-bin-2-line"></i></button>
										</div>
									</div>
								</div>
							</c:forEach>
							</div>
							<!-- End Default Accordion Example -->
						</div>
					</div>
				</div>
				<!-- End 공지목록 Div -->
			</div>
		</div>
	</main>
	<!-- End #main -->
	<!-- Footer -->
	<jsp:include page="/template/admin/footer.jsp"></jsp:include>
	<a href="#" class="back-to-top d-flex align-items-center justify-content-center"><i class="bi bi-arrow-up-short"></i></a>
	<jsp:include page="/template/admin/js.jsp"></jsp:include>
</body>

</html>