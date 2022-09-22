<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zxx">
<head>
    <meta charset="UTF-8">
    <meta name="description" content="Ogani Template">
    <meta name="keywords" content="Ogani, unica, creative, html">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>로그인</title>

    <!-- custom css -->
    <style type="text/css">
    	.findAcc{color:rgb(155,155,155);border:none;background-color: transparent;}
    	.findAcc:hover{color:rgb(100,100,100);}
    	.log_btn{display:flex;justify-content: space-between;}
    	.log_btn .site-btn{width:45%;}
    	.checkout__form{max-width: 750px;min-width: 550px;}
    	.checkout__form h4{max-width: 550px;min-width: 400px;}
    </style>
    
    <!-- jquery -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    
    <script type="text/javascript">
    	$(function(){
    		$(".findAcc").click(function(){
    			window.open('findAccount', 'window', 'width=450, height=500, left='+(window.screen.width / 2 - 200)+', top='+(window.screen.height / 2 - 200));
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
                        <h2>Checkout</h2>
                        <div class="breadcrumb__option">
                            <a href="index">Home</a>
                            <span>Checkout</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Breadcrumb Section End -->

    <!-- Checkout Section Begin -->
    <section class="checkout spad">
        <div class="container" style="width:40%;">
            <div class="checkout__form">
                <h4>로그인</h4>
                <form action="login.do" method="post">
                    <div class="row" style="float: none; margin:0 auto;">
                        <div class="col-lg-12 col-md-8" style="float: none; margin:0 auto;">
                            <div class="checkout__input">
                                <p>아이디<span>*</span></p>
                                <input type="text" name="id">
                            </div>
                            <div class="checkout__input">
                                <p>비밀번호<span>*</span></p>
                                <input type="password" name="pwd">
                            </div>
                            <div class="checkout__input log_btn">
	                            <button type="submit" class="site-btn">로그인</button>
	                            <button type="button" class="site-btn" onclick="location.href='register'">회원가입</button>
                            </div>
                          	<div class="col-lg-12 col-md-12" style="text-align: right;">
	                            <button class="findAcc" type="button">Did you forget your account?</button>
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