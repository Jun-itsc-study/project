<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- Hero Section Begin -->
<!-- index 일때  hero -->
<c:choose>
	<c:when test="${index.equals('index') }">
		<section class="hero">
	</c:when>
	<c:otherwise>
		<section class="hero hero-normal">
	</c:otherwise>
</c:choose>

<div class="container">
	<div class="row">
		<div class="col-lg-3">
			<div class="hero__categories">
				<div class="hero__categories__all">
					<i class="fa fa-bars"></i> <span>All Products</span>
				</div>
				<ul>
					<li><a href="#">컴퓨터</a></li>
					<li><a href="#">└본체</a></li>
					<li><a href="#">└마우스</a></li>
					<li><a href="#">└키보드</a></li>
					<li><a href="#">└스피커</a></li>
					<li><a href="#">핸드폰</a></li>
					<li><a href="#">└기기</a></li>
					<li><a href="#">└케이블(충전기)</a></li>
					<li><a href="#">└케이스/액정필름</a></li>
					<li><a href="#">게임기기</a></li>
					<li><a href="#">└기기</a></li>
					<li><a href="#">└부속품</a></li>
				</ul>
			</div>
		</div>
		<div class="col-lg-9">
			<div class="hero__search">
				<div class="hero__search__form">
					<form>
						<!-- <div class="hero__search__categories">
							검색 <span class="arrow_carrot-down"></span>
						</div> -->
						<input type="text" placeholder="검색어를 입력해주세요">
						<button type="submit" class="site-btn">SEARCH</button>
					</form>
				</div>
				<div class="hero__search__phone">
					<div class="hero__search__phone__icon">
						<i class="fa fa-phone"></i>
					</div>
					<div class="hero__search__phone__text">
						<h5>010.1233.1233</h5>
						<span>응답시간 09:00 ~ 18:00</span>
					</div>
				</div>
			</div>
			<c:if test="${index.equals('index') }">
				<!-- index일때 -->
				<div class="hero__item set-bg" data-setbg="shop/img/hero/banner.jpg">
					<div class="hero__text">
						<span>FRUIT FRESH</span>
						<h2>
							Vegetable <br />100% Organic
						</h2>
						<p>Free Pickup and Delivery Available</p>
						<a href="#" class="primary-btn">SHOP NOW</a>
					</div>
				</div>

			</c:if>

		</div>
	</div>
</div>
</section>
<!-- Hero Section End -->