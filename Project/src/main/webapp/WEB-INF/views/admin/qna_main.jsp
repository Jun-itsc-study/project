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
	th:nth-child(1) {width:5%;}
	th:nth-child(2) {width:10%;}
	th:nth-child(3) {width:45%;}
	th:nth-child(4) {width:30%;}
	th:nth-child(5) {width:10%;}
</style>

</head>

<body>
	<jsp:include page="/template/admin/header.jsp"/>
	<jsp:include page="/template/admin/sidebar.jsp"/>

	<main id="main" class="main">

		<div class="pagetitle">
			<h1>회원 문의 목록</h1>
			<nav>
				<ol class="breadcrumb">
					<li class="breadcrumb-item"><a href="/">Home</a></li>
					<li class="breadcrumb-item">문의내역 관리</li>
					<li class="breadcrumb-item active">회원 문의 목록</li>
				</ol>
			</nav>
		</div>
		<!-- End Page Title -->

		<div class="container-fluid">
			<div class="row">
				<div class="col-lg-10">
					<div class="card">
						<div class="card-body">
							<!-- Default Table -->
							<table class="table">
								<thead>
									<tr>
										<th scope="col">#</th>
										<th scope="col">ID</th>
										<th scope="col">문의제목</th>
										<th scope="col">문의 작성일</th>
										<th scope="col">상태</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach var="dto" items="${list }">
										<tr>
											<th scope="row">${dto.qna.qno }</th>
											<td>${dto.member.id}</td>
											<td><a href="qnaDetail?qno=${dto.qna.qno }">${dto.qna.qtitle }</a></td>
											<td>${dto.qna.qdate }</td>

											<c:choose>
												<c:when test="${dto.qna.qstatus == 0 }">
													<td>읽지 않음</td>
												</c:when>
												<c:when test="${dto.qna.qstatus == 1 }">
													<td>읽음</td>
												</c:when>
												<c:when test="${dto.qna.qstatus == 2 }">
													<td>답변 완료</td>
												</c:when>
												<c:otherwise>
													<td>관리자삭제</td>
												</c:otherwise>
											</c:choose>
										</tr>
									</c:forEach>
								</tbody>
							</table>
							<!-- End Default Table Example -->
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