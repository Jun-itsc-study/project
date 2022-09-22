<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="zxx">

<head>
    <meta charset="UTF-8">
    <meta name="description" content="Ogani Template">
    <meta name="keywords" content="Ogani, unica, creative, html">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Ogani | 장바구니</title>

   <style type="text/css">
   		.pro-qty{
   			-webkit-touch-callout: none;
   			-webkit-user-select: none;
   			-khtml-user-select: none;
   			-moz-user-select: none;
   			-ms-user-select: none;
   			user-select: none;
   		
   		}
   
   </style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script type="text/javascript">
/* 수량 * 가격 하면 총합에 나오는 이벤트 처리 아직 안됨 */
$(function(){
	
// 수량 +,- 버튼 활성화.
  var proQty = $('.pro-qty');
  proQty.on('click', '.qtybtn', function () {
      var $button = $(this);
      var oldValue = $button.parent().find('input').val();
      if ($button.hasClass('inc')) {
          var newVal = parseFloat(oldValue) + 1;
      } else {
          if (oldValue > 0) {
              var newVal = parseFloat(oldValue) - 1;
          } else {
              newVal = 0;
          }
      }
      $button.parent().find('input').val(newVal);
  });
  
	$(".qtybtn").click(function(){
		var ea = $(".qty").val();
		//alert(ea);
	})
	$(".qty").change(function() {
		//alert("dd")
 		var ea = $(".qty").val();
		var price = $(".price").val();
		$(".totalPrice").val(ea * price); 
		console.log(ea);

	});
	
	$(".pay").click(function(){
		var pprice = $("#pprice").text();
		var pcount = $("#pcount").val();
		var ptotalprice = $("#ptotalprice").text();
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
                        <h2>장바구니</h2>
                        <div class="breadcrumb__option">
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Breadcrumb Section End -->

    <!-- Shoping Cart Section Begin -->
    <section class="shoping-cart spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="shoping__cart__table">
                        <table>
                            <thead>
                                <tr>
                                    <!-- <th>선택</th> -->
                                    <th class="shoping__product">상품</th>
                                    <th>가격</th>
                                    <th>개수</th>
                                    <th>합계</th>
                                    <th>삭제</th>
                                </tr>
                            </thead>
                            <tbody>
                            <!-- 상품 정보 반복문 -->
                                <tr>
                                	<!-- <td>
                                		<input type="checkbox">
                                	</td> -->
                                    <td class="shoping__cart__item">
                                        <img src="${dto.image }" alt="${dto.image }">
                                        <h5>${dto.pname }</h5>
                                    </td>
                                    <td class="shoping__cart__price">
                                        <span class="price" id="pprice">${dto.price } 원</span>
                                    </td>
                                    <td class="shoping__cart__quantity">
                                        <div class="quantity">
                                            <div class="pro-qty"> 
                                             	<span class="dec qtybtn">-</span>
                                                <input type="text" value="${ea }" id="pcount" class="qty">
		 	 									<span class="inc qtybtn">+</span>
                                            </div>
                                        </div>
                                    </td>
                                    <td class="shoping__cart__total">
                                        <span class="totalPrice" id="ptotalPrice"></span> 원<!-- 총합가격 물건값 x 개수 -->
                                    </td>
                                    <td class="shoping__cart__item__close">
                                        <span class="icon_close"></span>
                                    </td>
                                </tr>
                            <!-- 반복문 끝 지점 -->
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-12">
                    <div class="shoping__cart__btns">
                        <a href="#" class="primary-btn cart-btn cart-btn-right">전체삭제하기</a>
                    </div>
                </div>
                <div class="col-lg-6"></div>
                <div class="col-lg-6">
                    <div class="shoping__checkout">
                        <h5>장바구니 총합</h5>
                        <ul>
                            <li>부가금액 <span>
                            <ul>
  							<li>택배비 : +3000원 </li>
							</ul>
							</span></li>
                            <li>총액 <span id="totalprice">$454.98</span></li>
                        </ul>
                        <a href="#" class="primary-btn pay">결제하기</a>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Shoping Cart Section End -->
	<jsp:include page="/template/shop/footer.jsp"></jsp:include>
	<jsp:include page="/template/shop/js.jsp"></jsp:include>
</body>

</html>