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
    <title>Ogani | 결제</title>

    <!-- Google Font -->
    <link href="https://fonts.googleapis.com/css2?family=Cairo:wght@200;300;400;600;900&display=swap" rel="stylesheet">

    <!-- Css Styles -->
    <link rel="stylesheet" href="css/bootstrap.min.css" type="text/css">
    <link rel="stylesheet" href="css/font-awesome.min.css" type="text/css">
    <link rel="stylesheet" href="css/elegant-icons.css" type="text/css">
    <link rel="stylesheet" href="css/nice-select.css" type="text/css">
    <link rel="stylesheet" href="css/jquery-ui.min.css" type="text/css">
    <link rel="stylesheet" href="css/owl.carousel.min.css" type="text/css">
    <link rel="stylesheet" href="css/slicknav.min.css" type="text/css">
    <link rel="stylesheet" href="css/style.css" type="text/css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script type="text/javascript">

</script>
<style type="text/css">
.point{
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

	<jsp:include page="/template/preloader.jsp"></jsp:include>
	<jsp:include page="/template/header.jsp"></jsp:include>

    <!-- Breadcrumb Section Begin -->
    <section class="breadcrumb-section set-bg" data-setbg="img/breadcrumb.jpg">
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
<!--             <div class="row">
            </div> -->
            <div class="checkout__form">
                <h4>주문 정보</h4>
                <form action="#">
                    <!-- 여기서부터 -->
                    		<div class="checkout__input__checkbox1">
                            <label for="diff-acc">
                    		<span>회원정보와 동일</span>
                                    <input type="checkbox" id="diff-acc">
                                    <span class="checkmark"></span>
                                </label>
                            </div>
                     <!-- 여기까지 -->
                    <div class="row">
                        <div class="col-lg-8 col-md-6">
                            <div class="row">
                                <div class="col-lg-6">
                                    <div class="checkout__input">
                                        <p>성함<span>*</span></p>
                                        <input type="text" value="${mdto.name }">
                                    </div>
                                </div>
                            </div>
                            <div class="checkout__input">
                                <p>주소<span>*</span></p>
                                <input type="text" value="${mdto.address }" placeholder="주소를 입력해주세요" class="checkout__input__add">
                                <input type="text" placeholder="상세주소" class="checkout__input__add" style="width: 60%">
                                <input type="text" placeholder="우편번호" class="checkout__input__add" style="width: 39.4%">
                            </div>
                            <div class="row">
                                <div class="col-lg-6">
                                    <div class="checkout__input">
                                        <p>휴대폰 번호<span>*</span></p>
                                        <input type="text" value="${mdto.tel }">
                                    </div>
                                </div>
                                <div class="col-lg-6">
                                    <div class="checkout__input">
                                        <p>Email<span>*</span></p>
                                        <input type="text" value="${mdto.email }">
                                    </div>
                                </div>
                            </div>
                            <div class="checkout__input__checkbox">
                            <label for="acc">
                            	적립금 사용: 
                                <input type="checkbox" id="acc">
                                <span class="checkmark"></span>
                            </label>
                           	<input type="text" class="point" maxlength="6" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');">
                            </div>
                            
                            <div class="checkout__input">
                                <p>기사님께 전달할 내용<span>*</span></p>
                                <input type="text"
                                    placeholder="Notes about your order, e.g. special notes for delivery.">
                            </div>
                        </div>
                        <div class="col-lg-4 col-md-6">
                            <div class="checkout__order">
                                <h4>주문 내역</h4>
                                <div class="checkout__order__products">제품 <span>금액</span></div>
                                <ul>	<!-- 장바구니에 담겨있던 상품 이름과 , totalPrice-->
                                    <li>${dto.pname } <span>${dto.price }</span></li>
                                </ul>
                                <div class="checkout__order__subtotal">부가세 <span>2000원</span>
                                <ul>
                                    <li>배송비 <span>+3000원</span></li>
                                    <li>적립금 <span>-1000원</span></li>
                                </ul>                                
                                </div>
                                <div class="checkout__order__total">총합 <span>$750.99</span></div>
                                <div class="checkout__input__checkbox">
                                    <label for="acc-or">
                                        개인정보수집에 동의 하시겠습니까?
                                        <input type="checkbox" id="acc-or">
                                        <span class="checkmark"></span>
                                    </label>
                                </div>
                                <p>만 14세 이상만 구매가능합니다.<br>
									목적: 주문, 결제 및 배송서비스<br>
									항목: 구매자정보(이름, 연락처, 메일주소), 주문비밀번호, 상품 구매/취소/반품/교환/환불 정보, 수령인정보(이름, 주소, 연락처), 결제번호, 송장정보, 은행계좌정보, 휴대폰번호(휴대폰결제시)<br>
                                <div class="">
	                                    <input type='radio' id="payment" name='payment' value='card'/> 카드결제
										<br>
										<input type='radio' id="payment" name='payment' value='bankbook'/> 무통장입금
										<br>
										<input type='radio' id="payment" name='payment' value='kakaopay'/> 카카오페이
                                </div>
                                <button type="submit" class="site-btn">결제하기</button>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </section>
    <!-- Checkout Section End -->

   <jsp:include page="/template/footer.jsp"></jsp:include>

    <!-- Js Plugins -->
    <script src="js/jquery-3.3.1.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/jquery.nice-select.min.js"></script>
    <script src="js/jquery-ui.min.js"></script>
    <script src="js/jquery.slicknav.js"></script>
    <script src="js/mixitup.min.js"></script>
    <script src="js/owl.carousel.min.js"></script>
    <script src="js/main.js"></script>

 

</body>

</html>