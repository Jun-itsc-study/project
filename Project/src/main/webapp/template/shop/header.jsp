<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- Google Font -->
<link href="https://fonts.googleapis.com/css2?family=Cairo:wght@200;300;400;600;900&display=swap" rel="stylesheet">
  
<!-- Css Styles -->
<link rel="stylesheet" href="shop/css/bootstrap.min.css" type="text/css">
<link rel="stylesheet" href="shop/css/font-awesome.min.css" type="text/css">
<link rel="stylesheet" href="shop/css/elegant-icons.css" type="text/css">
<link rel="stylesheet" href="shop/css/nice-select.css" type="text/css">
<link rel="stylesheet" href="shop/css/jquery-ui.min.css" type="text/css">
<link rel="stylesheet" href="shop/css/owl.carousel.min.css" type="text/css">
<link rel="stylesheet" href="shop/css/slicknav.min.css" type="text/css">
<link rel="stylesheet" href="shop/css/style.css" type="text/css">


<!-- Header Section Begin -->
<header class="header">
	<div class="header__top">
		<div class="container">
			<div class="row">
				<div class="col-lg-6">
					<div class="header__top__left">
						<ul>
							<li><i class="fa fa-envelope"></i> admin@project.com</li>
							<li><a href="https://github.com/Jun-itsc-study/project"><i class="fa fa-github"></i></a></li>
						</ul>
					</div>
				</div>
				<div class="col-lg-6">
					<div class="header__top__right">
					<c:choose>
						<c:when test="${!login }">
							<div class="header__top__right__auth" style="margin-right: 5px;">
								<a href="login">로그인</a>
							</div>
							<div class="header__top__right__auth">
								<a href="register">회원가입</a>
							</div>
						</c:when>
						<c:otherwise>
						<c:if test="${loginDTO.name == null }"><script>alert("다시 로그인해주세요");location.href="logout.do";</script></c:if>
							<div class="header__top__right__language header__top__right__auth">
								<a href="memberInfo"><i class="fa fa-user"></i> ${loginDTO.name }</a>
							</div>
							<div class="header__top__right__language">
							<c:choose>
								<c:when test="${loginDTO.vno == 4 }">
									<div>관리자 페이지</div>
									<span class="arrow_carrot-down"></span>
									<ul>
										<li><a href="admin">관리 Home</a></li>
										<li><a href="memberManage">회원관리</a></li>
										<li><a href="orderManage">주문 관리</a></li>
										<li><a href="adminProductList">상품 관리</a></li>
										<li><a href="qnaMain">문의 관리</a></li>
										<li><a href="noticeList">공지사항</a></li>
									</ul>
								</c:when>
								<c:otherwise>
									<div>My Page</div>
									<span class="arrow_carrot-down"></span>
									<ul>
										<li><a href="memberInfo">마이페이지</a></li>
										<li><a href="#">주문 목록</a></li>
										<li><a href="qnaInsert">문의하기</a></li>
										<li><a href="notice">공지사항</a></li>
									</ul>
								</c:otherwise>
							</c:choose>
								
							</div>
							<div class="header__top__right__auth">
								<a href="logout.do"> 로그아웃</a>
							</div>
						</c:otherwise>
					</c:choose>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="container">
		<div class="row">
			<div class="col-lg-3">
				<div class="header__logo">
					<a href="/"><img src="shop/img/logo.png" alt=""></a>
				</div>
			</div>
			<div class="col-lg-6">
				<nav class="header__menu">
					<ul>
						<li><a href="/">Home</a></li>
						<li class="active"><a href="productList">Shop</a></li>
						<li><a href="#">Category</a>
							<ul class="header__menu__dropdown">
								<c:forEach var="ca" items="${cateTop }">
									<li><a href="productList?ctno=${ca.ctno }">${ca.ctname }</a></li>
								</c:forEach>
							</ul>
						</li>
						<li><a href="#">Contact</a>
							<ul class="header__menu__dropdown">
								<li><a href="qnaInsert">문의하기</a></li>
								<li><a href="notice">공지사항</a></li>
							</ul>
						</li>
					</ul>
				</nav>
			</div>
			<c:if test="${login }">
			<div class="col-lg-3">
				<div class="header__cart">
					<ul>
						<li><a href="cart"><i class="fa fa-shopping-bag"></i></a></li> <!--  <span>3</span> -->
					</ul>
				</div>
			</div>
			</c:if>
		</div>
		<div class="humberger__open">
			<i class="fa fa-bars"></i>
		</div>
	</div>
</header>
<!-- Header Section End -->