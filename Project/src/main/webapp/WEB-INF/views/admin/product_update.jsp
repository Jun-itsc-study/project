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
			<h1>상품 정보 수정</h1>
			<nav>
				<ol class="breadcrumb">
					<li class="breadcrumb-item"><a href="admin">Home</a></li>
					<li class="breadcrumb-item">상품관리</li>
					<li class="breadcrumb-item active">상품 정보 수정</li>
				</ol>
			</nav>
		</div>
		<!-- End Page Title -->
		<!-- ------------------------------------------------------------------------------------------ -->
		<section class="section">
			<div class="row">
				<div class="col-lg-12">
					<div class="card">
						<div class="card-body">
							<table class="table">
								<tr>
									<th>상품명</th>
									<td>
										<input type="hidden" name="pno" value="${dto.product.pno }">
										<input type="text" name="pname" value="${dto.product.pname }">
									</td>
								</tr>
								<tr>
									<th>상품 이미지</th>
									<td class="img_td">
									<c:forEach var="f" items="${Filelist }">
										<img src="fileDown.do?fno=${f.fno}&pno=${f.pno}" class="pimage">
									</c:forEach>
									</td>

									<td colspan="2" id="file_form">
										<p>
											<input type="file" name="file">
											<button type="button" id="plus">+</button>
											<button type="button" id="minus">-</button>
										</p>
									</td>

									<td><a href="#" id="delete">이미지삭제</a></td>
								</tr>
								<tr>
									<td>* 상품</td>
									<td>
										<select name="ctno" id="ctno">
											<c:forEach var="i" items="${cateTop }">
												<option value="${i.ctno }" <c:if test="${i.ctno == dto.categoryTop.ctno }">selected</c:if>>${i.ctname }</option>
											</c:forEach>
										</select>
									</td>

									<td>
										<select name="cbno" id="cbno">
											<option>----</option>
											<c:forEach var="i" items="${cateBot }">
												<c:if test="${i.cbno == dto.categoryBot.cbno }">
													<option value="${i.ctno }" <c:if test="${i.ctno == dto.categoryTop.ctno }">selected</c:if>>${i.cbname }</option>
												</c:if>
											</c:forEach>
										</select>
									</td>
								</tr>

								<tr>
									<th style="vertical-align: top;">상품디테일</th>
									<td><textarea name="detail" id="ncontent">${dto.productDetail.detail} </textarea></td>
									<th>제조사</th>
									<td><input type="text" name="maker" value="${dto.productDetail.maker }"></td>
								</tr>
								<tr>
									<th>가격</th>
									<td><input type="text" name="price" value="${dto.productDetail.price }"></td>
									<th>수량</th>
									<td><input type="text" name="ea" value="${dto.productDetail.ea }"></td>
								</tr>
								<tr>
									<td style="text-align: right;">
										<button class="btn btnAdd">수정하기</button>
										<a href="javascript:history.back();">뒤로가기</a>
									</td>
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