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
					<div class="checkout__form">
						<h4>문의하기</h4>
						<form action="qnaInsert.do" method="post">
							<div class="row" style="float: none; margin-left: 20px;">
								<div class="col-lg-10 col-md-6" style="float: none; margin-left: 20px;">
									<div class="checkout__input">
										<p>
											이름
										</p>
										<input type="text" value="${loginDTO.name }" readonly="readonly">
										<input type="hidden" name="mno" value="${loginDTO.mno }">
									</div>
									<div class="checkout__input">
										<p>
											문의제목
										</p>
										<input type="text" name="qtitle">
									</div>
									<div class="checkout__input">
										<p>
											문의내용
										</p>
										<textarea rows="20" cols="80" name="qcontent"></textarea>
									</div>
									<div class="checkout__input">
										<button type="submit" class="site-btn" style="width: 100%;">문의하기</button>
									</div>
								</div>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- Checkout Section End -->
	<jsp:include page="/template/shop/footer.jsp"></jsp:include>
	<jsp:include page="/template/shop/js.jsp"></jsp:include>
</body>
</html>