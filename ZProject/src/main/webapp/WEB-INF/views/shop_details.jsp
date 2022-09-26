<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="zxx">

<head>
<meta charset="UTF-8">
<meta name="description" content="Ogani Template">
<meta name="keywords" content="Ogani, unica, creative, html">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>Ogani | 상품상세정보</title>

<!-- Google Font -->
<link
	href="https://fonts.googleapis.com/css2?family=Cairo:wght@200;300;400;600;900&display=swap"
	rel="stylesheet">

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
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script type="text/javascript">
/* 수량 * 가격 하면 총합에 나오는 이벤트 처리 아직 안됨 */
$(function(){
	
 /* 수량 +,- 버튼 활성화. */
 /* 아직 못한거 - 최대값, 최소값 설정해줘야됨 */
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

})
</script>
<script>
	$(function() {
		$(".cart-btn").on("click",function(){
			var d = $(this).serialize();
			$.ajax({
				url:"insertCart",
				type:'POST',
				data:d,
				success:function(d){
					if (d) {
	                    alert('장바구니에 저장되었습니다.')
	                    location.reload();
	                } else {
	                    alert('이미 장바구니에 있습니다.')
	                }
	            },error: function () {
	                alert('ajax 실패');
	            }
				})
			})
	})
	
	$(function() {
		$(".pay-btn").on("click",function(){
			var d = $(this).serialize();
			$.ajax({
				url:"fromDetail",
				type:"POST",
				data:d,
				success:function(d){
					if (d) {
	                    alert('장바구니에 저장되었습니다.')
	                    location.reload();
	                } else {
	                    alert('이미 장바구니에 있습니다.')
	                }
	            },error: function () {
	                alert('ajax 실패');
	            }
				})
			})
	})
/*      function checkMember(){
		var rnum = 0;
		if(${!login}){
		return rnum;
		}else{
		return rnum == 1;
		}
		
    }
    $(function(){
    	$(".primary-btn").on("click",function(){
    		var r = checkMember();
    		var d = $(this).serialize();
    		d = d+"type="+r;
    		$.ajax({
    			url:"insertCart.do",
    			type:"POST",
    			data:d,
    			success:function(r){
    				var result = confirm('결제창으로 넘어가시겠습니까?');
    				if(!result){
    					location.href=url;
    				}
    				else {
    					alert("실패했습니다.");
    				}
    			}
    		});
    	});
    	
    	$(".primary-btn2").on("click",function(){
    		checkMember();
    		var d = $(this).serialize();
    		$.ajax({
    			url:"insertCart.do",
    			type:"POST",
    			data:d,
    			success:function(r){
    				if(r == 1){
    					//true면 확인 취소 컨펌으로 넣기
    				}
    				else {
    					alert("실패했습니다.");
    				}
    			}
    		});
    	});    	
    	
    	
    }) */
    
</script>
   
    
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
    
</head>

<body>
	<jsp:include page="/template/preloader.jsp"></jsp:include>
	<jsp:include page="/template/header.jsp"></jsp:include>
	<jsp:include page="/template/bar.jsp"></jsp:include>

	<!-- Breadcrumb Section Begin -->
	<section class="breadcrumb-section set-bg"
		data-setbg="img/breadcrumb.jpg">
		<div class="container">
			<div class="row">
				<div class="col-lg-12 text-center">
					<div class="breadcrumb__text">
						<h2>${dto.pname }</h2>
						<!-- 상품명 불러오기 -->
						<div class="breadcrumb__option">
							<a href="#">${dto.ctname }</a>
							<!-- 대분류명 불러오기 -->
							<a href="#">${dto.cbname }</a>
							<!-- 소분류명 불러오기 -->
							<span>${dto.pname }</span>
							<!-- 상품명 불러오기 -->
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- Breadcrumb Section End -->

	<!-- Product Details Section Begin -->
	<section class="product-details spad">
		<div class="container">
			<div class="row">
				<div class="col-lg-6 col-md-6">
					<div class="product__details__pic">
						<div class="product__details__pic__item">
							<img class="product__details__pic__item--large"
								src="${dto.image }" alt="">
						</div>
						<div class="product__details__pic__slider owl-carousel">
							<img data-imgbigurl="img/product/details/product-details-2.jpg"
								src="img/product/details/thumb-1.jpg" alt="">
							<img data-imgbigurl="img/product/details/product-details-3.jpg"
								src="img/product/details/thumb-2.jpg" alt="">
							<img data-imgbigurl="img/product/details/product-details-5.jpg"src="img/product/details/thumb-3.jpg" alt=""> <img
								data-imgbigurl="img/product/details/product-details-4.jpg"
								src="img/product/details/thumb-4.jpg" alt="">
						</div>
					</div>
				</div>
			
				<div class="col-lg-6 col-md-6">
					<div class="product__details__text">
						<h3>${dto.pname }</h3>
						<!-- 상품명 불러오기 -->
						<div class="product__details__rating">
							<i class="fa fa-star"></i> <i class="fa fa-star"></i> <i
								class="fa fa-star"></i> <i class="fa fa-star"></i> <i
								class="fa fa-star-half-o"></i> <span>후기 개수</span> <!-- 평점 불러오기 -->
						</div>
						<div class="product__details__price">${dto.price } 원</div> <!-- 상품 가격 불러오기 -->
						<p>${dto.detail }</p> <!-- 상품 내용 불러오기 -->
						
						<!-- form태그 insertCart시작 -->
						<form action="insertCart">
						<input type="hidden" name="pno" value="${dto.pno }">
						<div class="product__details__quantity">
							<div class="quantity">
								<div class="pro-qty">
									<span class="dec qtybtn">-</span>
									<input type="text" value="1" name="ea">
		 	 						<span class="inc qtybtn">+</span>
								</div>
							</div>
						</div>
						<button class="cart-btn">장바구니에 담기</button> 
						<button class="pay-btn">결제하기</button> 
						</form>
						<!-- form 태그 종료 -->
						
						<ul>
							<li><b>제조사</b> <span>${dto.maker }</span></li>
							<!-- 제조사 불러오기 -->
							<li><b>재고</b> <span><samp>${dto.ea }</samp></span></li>
							<li><b>판매자</b> <span>${dto.seller }</span></li>
							<li><b>공유하기</b>
								<div class="share">
									<a href="#"><i class="fa fa-facebook"></i></a> 
									<a href="#"><i class="fa fa-twitter"></i></a> 
									<a href="#"><i class="fa fa-instagram"></i></a> 
									<a href="#"><i class="fa fa-pinterest"></i></a>
								</div></li>
						</ul>
					</div>
				</div>
				<div class="col-lg-12">
					<div class="product__details__tab">
						<ul class="nav nav-tabs" role="tablist">
							<li class="nav-item"><a class="nav-link active"
								data-toggle="tab" href="#tabs-1" role="tab" aria-selected="true">상세정보</a></li>
							<li class="nav-item"><a class="nav-link" data-toggle="tab"
								href="#tabs-3" role="tab" aria-selected="false">후기<span>(후기개수)</span></a>
							</li>
							<li class="nav-item"><a class="nav-link" data-toggle="tab"
								href="#tabs-2" role="tab" aria-selected="false">취소 / 환불 정책</a>
							</li>

						</ul>
						<div class="tab-content">
							<div class="tab-pane active" id="tabs-1" role="tabpanel">
								<div class="product__details__tab__desc">
									<h6>상세정보</h6>
									<p>${dto.detail }</p>
								</div>
							</div>
							<div class="tab-pane" id="tabs-2" role="tabpanel">
								<div class="product__details__tab__desc">
									<h6>취소 / 환불 정책</h6>
									<p>환불 안됩니다.</p>
								</div>
							</div>
							<div class="tab-pane" id="tabs-3" role="tabpanel">
								<div class="product__details__tab__desc">
									<h6>리뷰</h6>
									<p>작성자</p>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- Product Details Section End -->

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