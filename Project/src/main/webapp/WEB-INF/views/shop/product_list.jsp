<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="zxx">

<head>
    <meta charset="UTF-8">
    <meta name="description" content="Ogani Template">
    <meta name="keywords" content="Ogani, unica, creative, html">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>상품 목록</title>
    <!-- jquery -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script type="text/javascript">
    	$(function(){
    		var type = "<c:out value="${type}"></c:out>"
   			var ctno = "<c:out value="${ctno}"></c:out>"
   			var cbno = "<c:out value="${cbno}"></c:out>"

   			$("#sorted option:selected").attr("selected", false);
    		$("#sorted option:eq("+type+")").attr("selected",true);
    		$(".current").text($("#sorted option:eq("+type+")").text());

   			var param = "";
    		if(ctno == -1 && cbno == -1){
				param = "?";
			}else if(ctno != -1){
				param = "?ctno="+ctno+"&";
			}else if(cbno != -1){
				param = "?cbno="+cbno+"&";
			}
    		console.log(param);
    		$("#sorted").change(function(){
    			var val = $("#sorted option:selected").val();
   				param = param + "type="+val;
    			location.href="productList"+param
    		});//sorted
    		
    		$(".prevPage").click(function(){
    			var page = "<c:out value="${paging.startPageOfPageGroup - 1 }"></c:out>"
	    		if(type!=null) param = param + "type=" + type+"&";
    			param = param + "pageNo="+page;
    			location.href="productList"+param
    		});
    		$(".nextPage").click(function(){
    			var page = "<c:out value="${paging.endPageOfPageGroup + 1 }"></c:out>"
    			if(type!=null) param = param + "type=" + type+"&";
    			param = param + "pageNo="+page;
    			location.href="productList"+param
    		});
    		$(".page").click(function(){
    			if(type!=null) param = param + "type=" + type+"&";
    			param = param + "pageNo="+$(this).text();
    			location.href="productList"+param;
    		});
    	})
    </script>
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
                        <h2>상품 목록</h2>
                        <div class="breadcrumb__option">
                            <a href="/">Home</a>
                            <span>Shop</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Breadcrumb Section End -->

    <!-- Product Section Begin -->
    <section class="product spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-3 col-md-5">
                    <div class="sidebar">
                        <div class="sidebar__item">
                            <h4 onclick="location.href='productList'">전체 품목</h4>
                            <ul>
                            	<!-- 분류 불러오기 --> 
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
                </div>
                <div class="col-lg-9 col-md-7">
                    <div class="filter__item">
                        <div class="row">
                            <div class="col-lg-4 col-md-5">
                                <div class="filter__sort">
                                    <span>Sort By</span>
                                    <select id="sorted">
                                        <option value="0" selected>기본</option>
                                        <option value="1">가격 ↓</option>
                                        <option value="2">가격 ↑</option>
                                    </select>
                                </div>
                            </div>
                            <div class="col-lg-4 col-md-4">
                                <div class="filter__found">
                                    <h6><span>${list.size() }</span> Products found</h6>
                                </div>
                            </div>
                            <div class="col-lg-4 col-md-3">
                            </div>
                        </div>
                    </div>
                    <div class="row" style="min-height: 600px;">
                   	<c:forEach var="pro" items="${list }">
						<div class="col-lg-4 col-md-6 col-sm-6">
							<div class="product__item">
								<div class="product__item__pic set-bg" onclick="location.href='productDetail?pno=${pro.product.pno }'" data-setbg="shop/img/featured/feature-1.jpg">
									<!-- ${pro.productDetail.image} or filedown기능 -->
									<ul class="product__item__pic__hover">
										<li><a href="#" title="장바구니로"><i class="fa fa-cart-plus"></i></a></li>
										<li><a href="#" title="바로 구매하기"><i class="fa fa-shopping-cart"></i></a></li>
									</ul>
								</div>
								<div class="product__item__text">
									<h6>
										<a href="productDetail?pno=${pro.product.pno }">${pro.product.pname }</a>
									</h6>
									<h5>
										￦<fmt:formatNumber value="${pro.productDetail.price}" pattern="#,###" />
									</h5>
								</div>
							</div>
						</div>
					</c:forEach>
                    </div>
                    <div class="product__pagination">
                    <c:if test="${paging.previousPageGroup }">
                    	<a href="#" class="prevPage"><i class="fa fa-long-arrow-left"></i></a>
                    </c:if>
                    <c:forEach var="i" begin="${paging.startPageOfPageGroup}" end="${paging.endPageOfPageGroup}">
							<a href="#" class="page">${ i}</a>
					</c:forEach>
                    <c:if test="${paging.nextPageGroup  }">
                    	<a href="#" class="nextPage"><i class="fa fa-long-arrow-right"></i></a>
                    </c:if>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Product Section End -->
	<jsp:include page="/template/shop/footer.jsp"></jsp:include>
	<jsp:include page="/template/shop/js.jsp"></jsp:include>
</body>
</html>