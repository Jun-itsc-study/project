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
<title>Ogani | 결제</title>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<!-- 주소검색 -->
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript">
$(function(){
	$(".findA").click(function(){
		new daum.Postcode({
	        oncomplete: function(data) {
	        	$("#postno").val(data.zonecode);
	        	$("#address1").val(data.address); // 주소 넣기
                $("#address2").focus(); //상세입력 포커싱
	        }
	    }).open();
	});//주소
	
	$("#add").change(function(){
		if($(this).prop("checked") == true){
			$("#postno").val($("#temp_postno").val());
        	$("#address1").val($("#temp_address1").val()); // 주소 넣기
            $("#address2").val($("#temp_address2").val()); //상세입력 포커싱
		}else {
			$("#postno").val("");
        	$("#address1").val(""); // 주소 넣기
            $("#address2").val(""); //상세입력 포커싱
			
		}
	})
	
	$("#mileage").change(function(){
		var use = $(this).val();
		$(".useMile").text(use);
		var price = $("#oldTotal").val() - use;
		var d = price+"원";
		$(".total").text(d);
	})
})
</script>
<style type="text/css">
.point {
	width: 157px;
	height: 35px;
	border: 1px solid #ebebeb;
	padding-left: 20px;
	font-size: 16px;
	color: #b2b2b2;
	border-radius: 4px;
}
</style>
</head>

<body>
	<jsp:include page="/template/shop/header.jsp"></jsp:include>
	<jsp:include page="/template/shop/bar.jsp"></jsp:include>
	<jsp:include page="/template/shop/preloader.jsp"></jsp:include>

	<!-- Breadcrumb Section Begin -->
	<section class="breadcrumb-section set-bg"
		data-setbg="shop/img/breadcrumb.jpg">
		<div class="container">
			<div class="row">
				<div class="col-lg-12 text-center">
					<div class="breadcrumb__text">
						<h2>주문</h2>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- Breadcrumb Section End -->

	<!-- Checkout Section Begin -->
	<section class="checkout spad">
		<div class="container">
			<div class="checkout__form">
				<h4>주문 내역</h4>
				<form action="order.do">
					<div class="row">
						<div class="col-lg-8 col-md-6">
						<div class="shoping__cart__table">
                        <table>
                            <thead>
                                <tr>
                                    <!-- <th>선택</th> -->
                                    <th class="shoping__product">상품</th>
                                    <th>가격</th>
                                    <th>개수</th>
                                    <th>합계</th>
                                </tr>
                            </thead>
                            <tbody>
                            <!-- 상품 정보 반복문 -->
                            <c:choose>
                            	<c:when test="${type.equals('cart') }">
		                            <c:forEach var="cart" items="${cartList }" varStatus="idx">
		                                <tr>
		                                    <td class="shoping__cart__item">
		                                        <img src="${file[0].path }" alt="${file[0].path }">
		                                        <h5>${product[idx.index].product.pname }</h5>
		                                    </td>
		                                    <td class="shoping__cart__price">
		                                        <span class="price" id="pprice">${product[idx.index].productDetail.price } 원</span>
		                                    </td>
		                                    <td class="shoping__cart__price">
		                                    	<span  id="pcount">${cart.cea }</span>
		                                    </td>
		                                    <td class="shoping__cart__total">
		                                        <span class="totalPrice" id="ptotalPrice">
		                                        ${cart.cea * product[idx.index].productDetail.price } 원
		                                        </span><!-- 총합가격 물건값 x 개수 -->
		                                        <c:set value="${total + (cart.cea * product[idx.index].productDetail.price) }" var="total"/>
		                                    </td>
		                                </tr>
		                            </c:forEach>
                            	</c:when>
                            	<c:otherwise>
                           			<tr>
	                                    <td class="shoping__cart__item">
	                                    <c:set value="1" var="idx"/>
	                                        <img src="${file[0].path }" alt="${file[0].path }">
	                                        <h5>${product.product.pname }</h5>
	                                    </td>
	                                    <td class="shoping__cart__price">
	                                        <span class="price" id="pprice">${product.productDetail.price } 원</span>
	                                    </td>
	                                    <td class="shoping__cart__price">
	                                    	<span  id="pcount">${ea }</span>
	                                    </td>
	                                    <td class="shoping__cart__total">
	                                        <span class="totalPrice" id="ptotalPrice">
	                                        ${product.productDetail.price * ea } 원
	                                        </span><!-- 총합가격 물건값 x 개수 -->
	                                        <c:set value="${product.productDetail.price * ea }" var="total"/>
	                                    </td>
	                                </tr>
                            	</c:otherwise>
                            </c:choose>
                            <!-- 반복문 끝 지점 -->
                            </tbody>
                        </table>
                    </div>
						</div>
						<div class="col-lg-4 col-md-6">
							<div class="checkout__order">
								<h4>주문 정보</h4>
								<div class="row">
									<div class="col-lg-6">
										<div class="checkout__input">
											<p>이름</p>
											<input type="text" value="${dto.name }">
										</div>
									</div>
								</div>
								<div class="checkout__input">
									<div class="checkout__input__checkbox">
										<p style="width:60%;display:inline-block;">주소<span>*</span></p>
										<label for="add"> 회원정보와 동일
											<input type="checkbox" id="add"> <span class="checkmark"></span>
										</label>
									</div>
									<input type="text" placeholder="우편번호" class="checkout__input__add" name="postno" id="postno" style="width: 60%">
									<button type="button" class="findA" style="width:30%;border:none;background-color:inherit;"><i class="fa fa-search"></i></button>
									<input type="text" placeholder="주소를 입력해주세요" class="checkout__input__add" name="address1" id="address1">
									<input type="text" placeholder="상세주소" class="checkout__input__add" name="address2" id="address2">

									<input type="hidden" id="temp_postno" value="${dto.postno }">
									<input type="hidden" id="temp_address1" value="${dto.address1 }">
									<input type="hidden" id="temp_address2" value="${dto.address2 }">
								</div>
								<div class="checkout__input">
									마일리지 사용 (보유 마일리지 : ${dto.mileage }) 
								</div>
								<div class="checkout__input">
									<input type="text" class="mileage checkout__input__add" placeholder="사용 마일리지" id="mileage" name="mileage">
								</div>
								
								<div class="checkout__order__subtotal">
									사용마일리지 <span class="useMile">0</span>
									<input type="hidden" value="${total }" id="oldTotal">
								</div>
								<div class="checkout__order__total">
									총합 <span class="total">${total}원</span>
								</div>
								<div class="checkout__input__checkbox">
									<label for="acc-or"> 개인정보수집에 동의 하시겠습니까? <input
										type="checkbox" id="acc-or"> <span class="checkmark"></span>
									</label>
								</div>
								<p>
									만 14세 이상만 구매가능합니다.<br> 목적: 주문, 결제 및 배송서비스<br> 항목:
									구매자정보(이름, 연락처, 메일주소), 주문비밀번호, 상품 구매/취소/반품/교환/환불 정보, 수령인정보(이름,
									주소, 연락처), 결제번호, 송장정보, 은행계좌정보, 휴대폰번호(휴대폰결제시)<br>
									<button type="submit" class="site-btn">결제하기</button>
							</div>
						</div>
					</div>
				</form>
			</div>
		</div>
	</section>
	<!-- Checkout Section End -->
	<jsp:include page="/template/shop/footer.jsp"></jsp:include>
	<jsp:include page="/template/shop/js.jsp"></jsp:include>
</body>

</html>