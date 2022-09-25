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
	<jsp:include page="/template/member/submenu.jsp"></jsp:include>
    
    <!-- Blog Details Section Begin -->
    <section class="blog-details spad">
        <div class="container">
            <div class="row">
                <jsp:include page="/template/member/sidebar.jsp"></jsp:include>
                
                <div class="col-lg-8 col-md-7 order-md-1 order-1" style="width:60%;float:none;">
					<div class="col-lg-12 col-md-12 col-sm-12">
						<div class="blog__item">
							<div class="blog__item__text">
								<h5><a href="vipInfo"><script>document.write(new Date().getFullYear());</script>년도 등급 [${vip}]</a></h5>
								<p>혜택</p>
								<p>마일리지 적립 : %</p>
							</div>
						</div>
					</div>
					<div class="col-lg-6 col-md-6 col-sm-6">
						<div class="blog__item">
							<div class="blog__item__text">
								<h5><a href="#">장바구니</a></h5>
								<c:choose>
									<c:when test="${cartList.size() == 0}">
										<ul>
											<li>장바구니에 담긴 상품이 없습니다.</li>		
										</ul>
									</c:when>
									<c:otherwise>
										<c:forEach var="cart" items="${cartList }" begin="0" end="4" varStatus="idx">
											<ul>
												<li>${product[idx.index].product.pname }</li>		
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
									<c:when test="${orderList.size() == 0}">
										<ul>
											<li>주문내역이 없습니다.</li>		
										</ul>
									</c:when>
									<c:otherwise>
										<c:forEach var="order" items="${orderList }" begin="0" end="4">
											<ul>
												<li>주문번호-${order.ordered.ono }-
													<c:choose>
														<c:when test="${order.ordered.dno == 0 }">상품준비중</c:when>
														<c:when test="${order.ordered.dno == 1 }">배송준비</c:when>
														<c:when test="${order.ordered.dno == 2 }">배송중</c:when>
														<c:otherwise>배송완료</c:otherwise>
													</c:choose>
												</li>		
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
									<c:when test="${qnaList.size() == 0}">
										<ul>
											<li>문의내역이 없습니다.</li>		
										</ul>
									</c:when>
									<c:otherwise>
										<c:forEach var="qna" items="${qnaList }" begin="0" end="4">
											<ul>
												<li>${qna.qtitle }</li>		
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