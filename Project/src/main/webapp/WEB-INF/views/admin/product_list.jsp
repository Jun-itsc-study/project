<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="utf-8">
<meta content="width=device-width, initial-scale=1.0" name="viewport">

<title>Forms / Elements - NiceAdmin Bootstrap Template</title>
<meta content="" name="description">
<meta content="" name="keywords">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>

</script>
<style type="text/css">
	.btnList{border:none; background-color:inherit;padding-left:0px;padding-top:6px;}
	.btnAdd{border:none; background-color:rgb(222,222,222);padding:7px;}
	th:first-child {width:10%;}
	th:last-child {width:8%;}
</style>
</head>

<body>
	<jsp:include page="/template/admin/header.jsp" />
	<jsp:include page="/template/admin/sidebar.jsp" />
	<main id="main" class="main">

		<div class="pagetitle">
			<h1>상품 전체 목록</h1>
			<nav>
				<ol class="breadcrumb">
					<li class="breadcrumb-item"><a href="admin">Home</a></li>
					<li class="breadcrumb-item">상품관리</li>
					<li class="breadcrumb-item active">상품 전체 목록</li>
				</ol>
			</nav>
		</div>
		<!-- End Page Title -->
		<section class="section">
			<div class="row">
				<div class="col-lg-12">
					<div class="card">
						<div class="card-body">
							<table class="table">
								<tr>
									<th scope="col">글번호</th>
									<th scope="col">상품명</th>
									<th scope="col">대분류</th>
									<th scope="col">소분류</th>
									<th scope="col">메이커</th>
									<th scope="col">수량</th>
									<th scope="col">가격</th>
									<th scope="col"></th>
								</tr>

								<c:forEach var="dto" items="${list }">
								<tr>
									<td>${dto.product.pno }
										<input id="pno" type="hidden" value="${dto.product.pno }"></td>
									<td>${dto.product.pname }</td>
									<td>${dto.categoryTop.ctname}</td>
									<td>${dto.categoryBot.cbname }</td>
									<td>${dto.productDetail.maker }</td>
									<td>${dto.productDetail.ea }</td>
									<td>${dto.productDetail.price }</td>
									<td>
										<button type="button" class="btnUpdate btnList" onclick="location.href='updateProduct?pno=${dto.product.pno}'"><i class="ri-edit-line"></i></button>
										<button type="button" class="btnDelete btnList" onclick="location.href='deleteProduct?pno=${dto.product.pno}'"><i class="ri-delete-bin-2-line"></i></button>
									</td>
								</tr>
								</c:forEach>
								<tr>
									<td colspan="7"></td>
									<td><button class="btnAdd" onclick="location.href='productInsert'">상품 등록</button></td>
								</tr>
							</table>
						</div>
					</div>
				</div>
			</div>
		</section>
	</main>
	<!-- End #main -->

	<!-- Footer -->
	<jsp:include page="/template/admin/footer.jsp"></jsp:include>
	<a href="#" class="back-to-top d-flex align-items-center justify-content-center"><i class="bi bi-arrow-up-short"></i></a>
	<jsp:include page="/template/admin/js.jsp"></jsp:include>
</body>

</html>