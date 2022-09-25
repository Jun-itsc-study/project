<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:if test="${!login }">
	<script>
		alert("회원만 이용 가능합니다.");
		location.href="login";
	</script>
</c:if>
<!DOCTYPE html>
<html lang="zxx">
<head>
<meta charset="UTF-8">
<meta name="description" content="Ogani Template">
<meta name="keywords" content="Ogani, unica, creative, html">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>회원정보 수정</title>
    <!-- Vendor CSS Files -->
<link href="admin/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<link href="admin/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">

<!-- Template Main CSS File -->
<link href="admin/css/style.css" rel="stylesheet">
<!-- jquery -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script>
    $(function(){

    </script>

<style type="text/css">
.blog__sidebar__item h4, .blog__sidebar__item ul li {
	padding-left: 10px;
}
</style>
</head>

<body>


	<jsp:include page="/template/shop/header.jsp"></jsp:include>
	<jsp:include page="/template/shop/bar.jsp"></jsp:include>
	<jsp:include page="/template/shop/preloader.jsp"></jsp:include>
	<jsp:include page="/template/member/submenu.jsp"></jsp:include>

	<!-- Checkout Section Begin -->
	<section class="blog-details spad">
		<div class="container">
			<div class="row">
				<jsp:include page="/template/member/sidebar.jsp"></jsp:include>
				<div class="col-lg-8 col-md-7 order-md-1 order-1">
					<div class="card">
						<div class="card-body">
						<!-- Default Accordion -->
							<div class="accordion" id="qnaAccordion">
							<c:forEach var="obj" items="${list }">
								<div class="accordion-item">
									<h2 class="accordion-header" id="${obj.qno }">
										<button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#qna-${obj.qno }" aria-expanded="false" aria-controls="qna-${obj.qno }">
											${obj.qtitle }
											<c:choose>
												<c:when test="${obj.qstatus == 0}">[읽지않음]</c:when>
												<c:when test="${obj.qstatus == 1}">[답변대기중]</c:when>
												<c:when test="${obj.qstatus == 2}">[답변완료]</c:when>
												<c:otherwise>[관리자에 의해 삭제]</c:otherwise>
											</c:choose>
										</button>
									</h2>
									<div id="qna-${obj.qno }" class="accordion-collapse collapse" aria-labelledby="${obj.qno }" data-bs-parent="#qnaAccordion">
										<div class="accordion-body">
											${obj.qdate }
										</div>
										<div class="accordion-body">
											${obj.qcontent }
										</div>
										<div class="accordion-body">
											<input type="hidden" name="qno" value="${obj.qno }">
											<button type="button" class="btnDelete btn" onclick="location.href='deleteQna.do?qno=${obj.qno}'"><i class="ri-delete-bin-2-line"></i></button>
										</div>
										<hr>
										<c:choose>
											<c:when test="${obj.qanswer != null }">
												<div class="accordion-body">
													${obj.qadate }
												</div>
												<div class="accordion-body">
													${obj.qanswer }
												</div>
											</c:when>
											<c:otherwise>
												<div class="accordion-body">
													<p>아직 답변이 달리지 않았습니다.</p>
												</div>
											</c:otherwise>
										</c:choose>
									</div>
								</div>
							</c:forEach>
							<div><a href="qnaInsert">문의글 등록</a></div>
							</div>
							<!-- End Default Accordion Example -->
						</div>
					</div>
				</div>
				<!-- End 문의 Div -->
				</div>
			</div>
		</div>
	</section>
	<!-- Checkout Section End -->
	<jsp:include page="/template/shop/footer.jsp"></jsp:include>
	<jsp:include page="/template/shop/js.jsp"></jsp:include>
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