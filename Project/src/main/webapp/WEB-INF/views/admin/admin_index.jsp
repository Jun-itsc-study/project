<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="utf-8">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">

  <title>Dashboard - NiceAdmin Bootstrap Template</title>
  <meta content="" name="description">
  <meta content="" name="keywords">
  <style type="text/css">
	.pro th:first-child {width:10%;}
	.pro th:last-child {width:8%;}
	
	.mem input{font-size: 14px !important;}
	.mem th:nth-child(6){width:10%;}
	.mem th:nth-last-child(2){width:7%;}
	.mem th:nth-last-child(1),th:nth-last-child(3) {width:6%;}
	.mem th:nth-child(7) {width:7%;}
	.mem th:nth-child(8),th:nth-child(9) {width:10%;}
	.mem input[name='address2']{width:70%;float:left;}
	
	.qna th:nth-child(1) {width:5%;}
	.qna th:nth-child(2) {width:10%;}
	.qna th:nth-child(3) {width:45%;}
	.qna th:nth-child(4) {width:30%;}
	.qna th:nth-child(5) {width:10%;}
</style>
  
</head>

<body>
	<jsp:include page="/template/admin/header.jsp"/>
	<jsp:include page="/template/admin/sidebar.jsp"/>

	<main id="main" class="main">

		<!-- Page Title -->
		<div class="pagetitle">
			<h1>Dashboard</h1>
			<nav>
				<ol class="breadcrumb">
					<li class="breadcrumb-item active">Dashboard</li>
				</ol>
			</nav>
		</div>
		<!-- End Page Title -->

		<section class="section dashboard">
			<div class="row">
				<!-- 상품목록 -->
				<div class="col-lg-12">
					<div class="card">
						<div class="card-body">
							<table class="table pro">
								<tr>
									<th scope="col">글번호</th>
									<th scope="col">상품명</th>
									<th scope="col">대분류</th>
									<th scope="col">소분류</th>
									<th scope="col">메이커</th>
									<th scope="col">수량</th>
									<th scope="col">가격</th>
								</tr>

								<c:forEach var="dto" items="${proList }" begin="0" end="4">
								<tr>
									<td>${dto.product.pno }
										<input id="pno" type="hidden" value="${dto.product.pno }"></td>
									<td>${dto.product.pname }</td>
									<td>${dto.categoryTop.ctname}</td>
									<td>${dto.categoryBot.cbname }</td>
									<td>${dto.productDetail.maker }</td>
									<td>${dto.productDetail.ea }</td>
									<td>${dto.productDetail.price }</td>
								</tr>
								</c:forEach>
								<tr>
									<td colspan="5"></td>
									<td colspan="2"><button class="btnAdd" onclick="location.href='adminProductList'">상품관리 탭으로</button></td>
								</tr>
							</table>
						</div>
					</div>
				</div>
				<!-- 상품목록end -->
				<!-- 회원목록 -->
				<div class="col-lg-12">
					<div class="card">
						<div class="card-body">
							<!-- Default Table -->
							<table class="table mem">
								<thead>
									<tr>
										<th scope="col">#</th>
										<th scope="col">아이디</th>
										<th scope="col">비밀번호</th>
										<th scope="col">이름</th>
										<th scope="col">생년월일</th>
										<th scope="col">전화번호</th>
										<th scope="col">우편번호</th>
										<th scope="col">기본주소</th>
										<th scope="col">상세주소</th>
										<th scope="col">등급번호</th>
										<th scope="col">등급</th>
										<th scope="col">마일리지</th>
									</tr>
								</thead>
								<tbody class="search_result">
								<c:forEach var="obj" items="${memList }" begin="0" end="4">
									<tr>
										<th scope="row"><input type="hidden" name="mno" value="${obj.member.mno }">${obj.member.mno }</th>
										<td><input type="text" class="form-control" name="id" value="${obj.member.id }" readonly="readonly"></td>
										<td><input type="text" class="form-control" name="pwd" value="${obj.member.pwd }"></td>
										<td><input type="text" class="form-control" name="name" value="${obj.member.name }"></td>
										<td><input type="date" class="form-control" name="birth" value="${obj.member.birth }"></td>
										<td><input type="text" class="form-control" name="tel" value="${obj.member.tel }"></td>
										<td><input type="text" class="form-control" name="postno" value="${obj.member.postno }"></td>
										<td><input type="text" class="form-control" name="address1" value="${obj.member.address1 }"></td>
										<td><input type="text" class="form-control" name="address2" value="${obj.member.address2 }"><button class="btn findA"><i class="bi bi-search"></i></button></td>
										<td><input type="text" class="form-control" name="vno" value="${obj.member.vno }"></td>
										<td><input type="text" class="form-control" name="vname" value="${obj.vip.vname }"></td>
										<td><input type="text" class="form-control" name="mileage" value="${obj.member.mileage }"></td>
									</tr>
								</c:forEach>
								<tr>
									<td colspan="10"></td>
									<td colspan="2"><button class="btnAdd" onclick="location.href='memberManage'">회원관리 탭으로</button></td>
								</tr>
								</tbody>
							</table>
							<!-- End Default Table Example -->
						</div>
					</div>
				</div>
				<!-- 회원목록end -->
				<!-- Default Table -->
				<div class="col-lg-12">
					<div class="card">
						<div class="card-body">
							<table class="table qna">
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
									<c:forEach var="dto" items="${qnaList }" begin="0" end="4">
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
									<tr>
									<td colspan="4"></td>
									<td colspan="2"><button class="btnAdd" onclick="location.href='qnaMain'">문의 탭으로</button></td>
								</tr>
								</tbody>
							</table>
							</div></div></div>
							<!-- End Default Table Example -->
			</div>
		</section>

	</main>
	<!-- End #main -->

	<!-- footer -->
<jsp:include page="/template/admin/footer.jsp"></jsp:include>

<a href="#" class="back-to-top d-flex align-items-center justify-content-center"><i class="bi bi-arrow-up-short"></i></a>

<!-- js -->
<jsp:include page="/template/admin/js.jsp"></jsp:include>

</body>

</html>