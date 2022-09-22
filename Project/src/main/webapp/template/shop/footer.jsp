<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- Footer Section Begin -->
<footer class="footer spad">
	<div class="container">
		<div class="row">
			<div class="col-lg-3 col-md-6 col-sm-6">
				<div class="footer__about">
					<div class="footer__about__logo">
						<a href="/"><img src="shop/img/logo.png" alt=""></a>
					</div>
					<ul>
						<li>Address: 서울특별시</li>
						<li>Phone: 010.1233.1233</li>
						<li>Email: admin@project.com</li>
					</ul>
				</div>
			</div>
			<div class="col-lg-8 col-md-6 col-sm-6 offset-lg-1">
				<div class="footer__widget">
					<h6>사이트맵</h6>
					<ul>
						<li><a href="#">전체 상품</a></li>
						<li><a href="#">컴퓨터</a></li>
						<li><a href="#">핸드폰</a></li>
						<li><a href="#">게임기기</a></li>
						<hr>
						<li><a href="cart">장바구니</a></li>
						<li><a href="#">주문내역</a></li>
					</ul>
					<c:if test="${login }">
						<ul>
							<li><a href="memberInfo">마이페이지</a></li>
							<li><a href="#">1:1 문의하기</a></li>
							<li><a href="#">내 문의글 보기</a></li>
							<li><a href="#">공지사항</a></li>
						</ul>
					</c:if>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="col-lg-12">
				<div class="footer__copyright">
					<div class="footer__copyright__text">
						<p>
							<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
							Copyright &copy;
							<script>
								document.write(new Date().getFullYear());
							</script>
							All rights reserved | This template is made with 
							<i class="fa fa-heart" aria-hidden="true"></i> by 
							<a href="https://colorlib.com" target="_blank">Colorlib</a>
							<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
						</p>
					</div>
					<!-- <div class="footer__copyright__payment">
						<img src="img/payment-item.png" alt="">
					</div> -->
				</div>
			</div>
		</div>
	</div>
</footer>
<!-- Footer Section End -->
