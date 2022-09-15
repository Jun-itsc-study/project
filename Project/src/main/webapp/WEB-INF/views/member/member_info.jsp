<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
    <title>Ogani | Template</title>

        <style type="text/css">
    	.blog__sidebar__item h4, .blog__sidebar__item ul li{
    		padding-left:10px;
    	}
    </style>
</head>

<body>
	<jsp:include page="/template/shop/header.jsp"></jsp:include>
	<jsp:include page="/template/shop/bar.jsp"></jsp:include>
	<jsp:include page="/template/shop/preloader.jsp"></jsp:include>
	
    <!-- Breadcrumb Section Begin -->
    <section class="breadcrumb-section set-bg" data-setbg="shop/img/breadcrumb.jpg">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <div class="breadcrumb__text">
                        <h2><a href="memberInfo" style="color:white;">My Page</a></h2>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Breadcrumb Section End -->
    
    <!-- Blog Details Section Begin -->
    <section class="blog-details spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-4 col-md-5">
                    <div class="blog__sidebar">
                        <div class="blog__sidebar__item">
                            <h4>My Info</h4>
                            <ul>
                            	<li><a href="#">장바구니</a></li>
                                <li><a href="#">주문목록/배송조회</a></li>
                                <li><a href="updateMember">개인정보 확인/수정</a></li>
                                <li><a href="updatePwd">비밀번호 변경</a></li>
                                <li><a href="#">등급 혜택</a></li>
                                <li><a href="#">문의 내역</a></li>
                            </ul>
                        </div>
                    </div>
                </div>
                
                <div class="row" style="width:60%;">
					<div class="col-lg-12 col-md-12 col-sm-12" style="height:">
						<div class="blog__item">
							<div class="blog__item__text">
								<h5><a href="#">${year }년도 등급 [${vip}]</a></h5>
								<p>혜택</p>
								<p>짜자잔</p>
							</div>
						</div>
					</div>
					<div class="col-lg-6 col-md-6 col-sm-6">
						<div class="blog__item">
							<div class="blog__item__text">
								<h5><a href="#">장바구니</a></h5>
								<c:choose>
									<c:when test="${cartList == null}">
										<ul>
											<li>장바구니에 담긴 상품이 없습니다.</li>		
										</ul>
									</c:when>
									<c:otherwise>
										<c:forEach var="cart" items="${cartList }" begin="0" end="4">
											<ul>
												<li><a href="">테스트</a></li>		
											</ul>
										</c:forEach>
										<a href="#" class="blog__btn">더 보기 <span class="arrow_right"></span></a>
									</c:otherwise>
								</c:choose>
							</div>
						</div>
					</div>
					<div class="col-lg-6 col-md-6 col-sm-6">
						<div class="blog__item">
							<div class="blog__item__text">
								<h5><a href="#">주문/배송</a></h5>
								<c:choose>
									<c:when test="${orderList == null}">
										<ul>
											<li>주문내역이 없습니다.</li>		
										</ul>
									</c:when>
									<c:otherwise>
										<c:forEach var="order" items="${orderList }" begin="0" end="4">
											<ul>
												<li><a href="">테스트</a></li>		
											</ul>
										</c:forEach>
										<a href="#" class="blog__btn">더 보기 <span class="arrow_right"></span></a>
									</c:otherwise>
								</c:choose>
							</div>
						</div>
					</div>
					<div class="col-lg-8 col-md-8 col-sm-8">
						<div class="blog__item">
							<div class="blog__item__text">
								<h5><a href="#">내 문의내역</a></h5>
								<c:choose>
									<c:when test="${qnaList == null}">
										<ul>
											<li>문의내역이 없습니다.</li>		
										</ul>
									</c:when>
									<c:otherwise>
										<c:forEach var="qna" items="${qnaList }" begin="0" end="4">
											<ul>
												<li><a href="">테스트</a></li>		
											</ul>
										</c:forEach>
										<a href="#" class="blog__btn">더 보기 <span class="arrow_right"></span></a>
									</c:otherwise>
								</c:choose>
							</div>
						</div>
					</div>
                </div><!-- row60 -->
            </div>
        </div>
    </section>
    <!-- Blog Details Section End -->
	<jsp:include page="/template/shop/footer.jsp"></jsp:include>
	<jsp:include page="/template/shop/js.jsp"></jsp:include>
</body>
</html>