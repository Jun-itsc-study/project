<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="zxx">

<head>
    <meta charset="UTF-8">
    <meta name="description" content="Ogani Template">
    <meta name="keywords" content="Ogani, unica, creative, html">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>상품 목록</title>
    <!-- Vendor CSS Files -->
<link href="admin/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<link href="admin/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">

<!-- Template Main CSS File -->
<link href="admin/css/style.css" rel="stylesheet">
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
</head>

<body>
	<jsp:include page="/template/shop/header.jsp"></jsp:include>
	<jsp:include page="/template/shop/bar.jsp"></jsp:include>
	<jsp:include page="/template/shop/preloader.jsp"></jsp:include>
    <!-- Breadcrumb Section Begin -->
    <section class="breadcrumb-section set-bg" data-setbg="shop/img/breadcrumb.jpg">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <div class="breadcrumb__text">
                        <h2>공지사항</h2>
                        <div class="breadcrumb__option">
                            <a href="/">Home</a>
                            <span>Notice</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Breadcrumb Section End -->

    <!-- Product Section Begin -->
    <section class="product spad">
        <div class="container">
            <div class="row">
                <!-- 공지목록 Div -->
				<div class="col-lg-12">
					<div class="card">
						<div class="card-body">
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
											<button type="button" class="btnUpdate btn" onclick="location.href='updateNotice?nno=${obj.nno}'"><i class="ri-edit-line"></i></button>
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
    </section>
    <!-- Product Section End -->
	<jsp:include page="/template/shop/footer.jsp"></jsp:include>
	<jsp:include page="/template/shop/js.jsp"></jsp:include>
	
	<!-- Vendor JS Files -->
<!-- Vendor JS Files -->
<script src="admin/vendor/apexcharts/apexcharts.min.js"></script>
<script src="admin/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
<script src="admin/vendor/chart.js/chart.min.js"></script>
<script src="admin/vendor/echarts/echarts.min.js"></script>
<script src="admin/vendor/quill/quill.min.js"></script>
<script src="admin/vendor/simple-datatables/simple-datatables.js"></script>
<script src="admin/vendor/tinymce/tinymce.min.js"></script>
<script src="admin/vendor/php-email-form/validate.js"></script>

<!-- Template Main JS File -->
<script src="admin/js/main.js"></script>
</body>
</html>