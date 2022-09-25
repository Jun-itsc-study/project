<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="zxx">
<!-- test -->
<head>
    <meta charset="UTF-8">
    <meta name="description" content="Ogani Template">
    <meta name="keywords" content="Ogani, unica, creative, html">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Ogani | Home</title>
</head>

<body>
    <jsp:include page="/template/shop/header.jsp"></jsp:include>
	<jsp:include page="/template/shop/bar.jsp"></jsp:include>
	<jsp:include page="/template/shop/preloader.jsp"></jsp:include>
	
    <!-- Featured Section Begin -->
    <section class="featured spad" style="padding-top:40px;">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="section-title">
                        <h2>상품 목록</h2>
                    </div>
                    <div class="featured__controls">
                        <ul>
                            <li class="active" data-filter="*">All</li>
                            <c:forEach var="ca" items="${cateTop }">
	                            <li data-filter=".ct_${ca.ctno}">${ca.ctname }</li>
                            </c:forEach>
                        </ul>
                    </div>
                </div>
            </div>
            <div class="row featured__filter">
            <c:forEach var="pro" items="${proList }">
                <div class="col-lg-3 col-md-4 col-sm-6 mix ct_${pro.categoryTop.ctno }">
                    <div class="featured__item">
                        <div class="featured__item__pic set-bg" onclick="location.href='productDetail?pno=${pro.product.pno }'" data-setbg="fileDown.do?fno=${pro.productFile.fno }&pno=${pro.product.pno}"> <!-- ${pro.productDetail.image} or filedown기능 -->
                            <ul class="featured__item__pic__hover">
                                <li><a href="insertCart?pno=${pro.product.pno }" title="장바구니로"><i class="fa fa-cart-plus"></i></a></li>
								<li><a href="pay?pno=${pro.product.pno }" title="바로 구매하기"><i class="fa fa-shopping-cart"></i></a></li>
                            </ul>
                        </div>
                        <div class="featured__item__text">
                            <h6><a href="productDetail?pno=${pro.product.pno }">${pro.product.pname }</a></h6>
                            <h5>￦<fmt:formatNumber value="${pro.productDetail.price}" pattern="#,###"/></h5>
                        </div>
                    </div>
                </div>
            </c:forEach>

            </div>
        </div>
    </section>
    <!-- Featured Section End -->
    
  
	<jsp:include page="/template/shop/footer.jsp"></jsp:include>
	<jsp:include page="/template/shop/js.jsp"></jsp:include>
</body>
</html>