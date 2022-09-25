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
					<c:forEach var="i" items="${cateTop }">
						<li><a href="productList?ctno=${i.ctno }" style="font-weight: bold;">${i.ctname }</a></li>
						<c:forEach var="j" items="${cateBot }">
							<c:if test="${i.ctno == j.ctno }">
								<li><a href="productList?cbno=${j.cbno }">└ ${j.cbname }</a></li>
							</c:if>
						</c:forEach>
					</c:forEach>
				</ul>
			</div>
		</div>
		<div class="col-lg-9">
			<div class="hero__search">
				<div class="hero__search__form">
					<form>
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
						<span>신제품</span>
						<h2>
							LG UltraWide <br />599,000원 
						</h2>
						<p></p>
						<a href="productList" class="primary-btn">지금 보러가기</a>
					</div>
				</div>
			</c:if>

		</div>
	</div>
</div>
</section>
<!-- Hero Section End -->