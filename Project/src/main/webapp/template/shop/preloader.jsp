   <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <!-- Page Preloder -->
    <div id="preloder">
        <div class="loader"></div>
    </div>

    <!-- Humberger Begin -->
    <div class="humberger__menu__overlay"></div>
    <div class="humberger__menu__wrapper">
        <div class="humberger__menu__logo">
            <a href="#"><img src="shop/img/logo.png" alt=""></a>
        </div>
        <c:choose>
        	<c:when test="${!login }">
		        <div class="humberger__menu__widget">
		            <div class="header__top__right__auth" style="margin-right: 5px;">
						<a href="login"><i class="fa fa-user"></i>로그인</a>
					</div>
					<div class="header__top__right__auth">
						<a href="register">회원가입</a>
					</div>
		        </div>
        	</c:when>
        	<c:otherwise>
		        <div class="humberger__menu__cart">
			        <div class="header__top__right__language header__top__right__auth">
						<a href="memberInfo"><i class="fa fa-user"></i> ${loginDTO.name }</a>
					</div>
		            <ul>
		                <li><a href="cart"><i class="fa fa-shopping-bag"></i></a></li>
		            </ul>
		        </div>
				<div class="header__top__right__language" style="marign-right:20px;">
				<c:choose>
					<c:when test="${loginDTO.vno == 4 }">
						<div>관리자 페이지</div>
						<span class="arrow_carrot-down"></span>
						<ul>
							<li><a href="admin">관리 Home</a></li>
							<li><a href="memberManage">회원관리</a></li>
							<li><a href="#">주문 관리</a></li>
							<li><a href="#">상품 관리</a></li>
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
							<li><a href="#">문의하기</a></li>
							<li><a href="#">공지사항</a></li>
						</ul>
					</c:otherwise>
				</c:choose>
					
				</div>
				<div class="header__top__right__auth">
					<a href="logout.do"> 로그아웃</a>
				</div>
		        
		        
        	</c:otherwise>
        </c:choose>
        <nav class="humberger__menu__nav mobile-menu">
            <ul>
                <li class="active"><a href="/">Home</a></li>
                <li><a href="productList">Shop</a></li>
                <li><a href="#">Category</a>
					<ul class="header__menu__dropdown">
						<c:forEach var="ca" items="${cateTop }">
							<li><a href="productList?ctno=${ca.ctno }">└ ${ca.ctname }</a></li>
						</c:forEach>
					</ul>
				</li>
				<li><a href="#">Contact</a></li>
            </ul>
        </nav>
        <div id="mobile-menu-wrap"></div>
        <div class="humberger__menu__contact">
            <ul>
                <li><i class="fa fa-envelope"></i> admin@project.com</li>
                <li><a href="https://github.com/Jun-itsc-study/project"><i class="fa fa-github"></i></a></li>
            </ul>
        </div>
    </div>
    <!-- Humberger End -->