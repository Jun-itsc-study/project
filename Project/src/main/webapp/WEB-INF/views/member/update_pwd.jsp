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
    <title>로그인</title>

    <!-- jquery -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <!-- 주소검색 -->
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    <script>
    function checkRegi(){
    	var pwd = $("#pwd").val();
		var pwd2 = $("#pwd2").val();
		var pwd3 = $("#pwd3").val();
		var num = pwd2.search(/[0-9]/g);
		var eng = pwd2.search(/[a-z]/ig);
		var spe = pwd2.search(/[`~!@@#$%^&*|₩₩₩'₩";:₩/?]/gi);
		
		if(pwd.length == 0){alert("현재 비밀번호는 필수 입력사항입니다.");$("#pwd").focus();return false;}
		else if(pwd2.length == 0){alert("변경할 비밀번호는 필수 입력사항입니다.");$("#pwd2").focus();return false;}
		else if(pwd2 != pwd3){alert("비밀번호가 일치하지않습니다.");$("#pwd3").focus();return false;}
		else if(pwd2.search(/\s/) != -1){alert("비밀번호는 공백 없이 입력해주세요.");$("#pwd2").focus();return false;}
		else if( (num < 0 && eng < 0) || (eng < 0 && spe < 0) || (spe < 0 && num < 0) ){
			alert("영문,숫자, 특수문자 중 2가지 이상을 혼합하여 입력해주세요.");
			$("#pwd2").focus();
			return false;
		}
    }
    
    $(function(){
    	$("#updatefrm").submit(function(e){
    		e.preventDefault();
    		
    		checkRegi();
    		
    		var d = $(this).serialize();
    		$.ajax({
    			url:"updatePwd.do",
    			type:"POST",
    			data:d,
    			success:function(r){
    				if(r == 1){
    					alert("수정 완료");
    					location.reload();
    				}
    				else {
    					alert("수정 실패! 현재 비밀번호를 다시 입력해주세요.");
    					$("#pwd").focus();
    				}
    			}
    		});
    	});//폼 submit
    	
    	$("#pwd2").keyup(function(){
    		var pwd2 = $(this).val();
    		var pwd3 = $("#pwd3").val();
    		if(pwd3.length != 0 && pwd3 != pwd2){
    			$("#pwd3").css('border-color','red');
	   			if($(".diff").length == 0){
	   				$("#pwd3").parent().append("<p class='diff' style='color:red;'>비밀번호가 일치하지 않습니다.</p>");
	   			}
    		}else {
    			$("#pwd3").css('border-color','');
    			$(".diff").remove();
    		}
    		
    	});//비밀번호 실시간 조회
    	
    	$("#pwd3").keyup(function(){
    		var pwd3 = $(this).val();
    		var pwd2 = $("#pwd2").val();
    		if(pwd3 != pwd2){
    			$(this).css('border-color','red');
	   			if($(".diff").length == 0){
	   				$(this).parent().append("<p class='diff' style='color:red;'>비밀번호가 일치하지 않습니다.</p>");
	   			}
    		}else {
    			$(this).css('border-color','');
    			$(".diff").remove();
    		}
    		
    	});//비밀번호 실시간 조회
    })
    </script>
    
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

    <!-- Checkout Section Begin -->
    <section class="blog-details spad">
        <div class="container">
        	<div class="row">
        		<div class="col-lg-4 col-md-5 order-md-1 order-2" style="max-width:25%;">
                    <div class="blog__sidebar">
                        <div class="blog__sidebar__item">
                            <h4>My Info</h4>
                            <ul>
                            	<li><a href="#">장바구니</a></li>
                                <li><a href="#">주문목록/배송조회</a></li>
                                <li><a href="updateMember">개인정보 확인/수정</a></li>
                                <li style="background-color:rgb(222,222,222);"><a href="updatePwd" style="font-weight:bold;">비밀번호 변경</a></li>
                                <li><a href="#">등급 혜택</a></li>
                                <li><a href="#">문의 내역</a></li>
                            </ul>
                        </div>
                    </div>
                </div>
        	<div class="col-lg-8 col-md-7 order-md-1 order-1">
                    <div class="checkout__form">
                <h4>비밀번호 변경</h4>
                <form id="updatefrm">
                    <div class="row" style="float: none; margin-left:20px;">
                        <div class="col-lg-10 col-md-6" style="float: none;margin-left:20px;">
                            <div class="checkout__input">
                                <p>현재 비밀번호<span>*</span></p>
                                <input type="password" name="pwd" id="pwd">
                            </div>
                            <div class="checkout__input">
                                <p>변경할 비밀번호<span>*</span></p>
                                <input type="password" placeholder="비밀번호는 영문/숫자/특수문자를 포함해야합니다." name="pwd2" id="pwd2">
                            </div>
                            <div class="checkout__input">
                                <p>비밀번호 확인<span>*</span></p>
                                <input type="password" placeholder="비밀번호는 영문/숫자/특수문자를 포함해야합니다." id="pwd3">
                            </div>
                            <div class="checkout__input">
	                            <button type="submit" class="site-btn" style="width:100%;">비밀번호 변경</button>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
                </div>
            
            </div>
        </div>
    </section>
    <!-- Checkout Section End -->
	<jsp:include page="/template/shop/footer.jsp"></jsp:include>
	<jsp:include page="/template/shop/js.jsp"></jsp:include>
</body>
</html>