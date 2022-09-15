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
		var address1 = $("#address1").val();

		var tel = $("#tel").val();	
		if(address1.length == 0) {alert("주소는 필수 입력사항입니다.");$("#address1").focus();return false;}
		if(tel.length == 0){alert("연락처는 필수 입력사항입니다.");$("#tel").focus();return false;}
		
    }
    
    $(function(){
    	$(".findA").click(function(){
    		new daum.Postcode({
    	        oncomplete: function(data) {
    	        	$("#postno").val(data.zonecode);
    	        	$("#address1").val(data.address); // 주소 넣기
    	        	$("#address2").val("");
                    $("#address2").focus(); //상세입력 포커싱
    	        }
    	    }).open();
    	}); //주소
    	
    	$("#updatefrm").submit(function(e){
    		e.preventDefault();
    		
    		checkRegi();
    		
    		var d = $(this).serialize();
    		$.ajax({
    			url:"updateMember.do",
    			type:"POST",
    			data:d,
    			success:function(r){
    				if(r == 1){
    					alert("수정 완료");
    					location.reload();
    				}
    				else {
    					alert("수정 실패. 입력란을 다시 확인해주세요");
    				}
    			}
    		});
    	});//폼 submit
    	
    	$("#tel").keyup(function(){
    		//console.log($(this).val().length);
    		var size = $(this).val().length;
    		var d = $(this).val();
    		if(size == 3 || size == 8){
    			$(this).val(d+"-");
    		}
    	}); //전화번호 자동 - 추가
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
                                <li style="background-color:rgb(222,222,222);"><a href="updateMember" style="font-weight:bold;">개인정보 확인/수정</a></li>
                                <li><a href="updatePwd">비밀번호 변경</a></li>
                                <li><a href="#">등급 혜택</a></li>
                                <li><a href="#">문의 내역</a></li>
                            </ul>
                        </div>
                    </div>
                </div>
        	<div class="col-lg-8 col-md-7 order-md-1 order-1">
                    <div class="checkout__form">
                <h4>회원 정보 수정</h4>
                <form id="updatefrm">
                    <div class="row" style="float: none; margin-left:20px;">
                        <div class="col-lg-10 col-md-6" style="float: none;margin-left:20px;">
                            <div class="checkout__input">
                                <p>이름<span>*</span></p>
                                <input type="text" name="name" value="${dto.name }" readonly="readonly">
                            </div>
                            <div class="checkout__input">
                                <p>아이디<span>*</span></p>
                                <input type="text" name="id" maxlength="20" value="${dto.id }" readonly="readonly">
                            </div>
                            <div>
                            <div class="checkout__input">
                                <p>주소<span>*</span></p>
                                <div class="checkout__input form-inline" style="padding-left:0;">
                                <div class="col-lg-4" style="padding-left:0;">
                                	<input type="text" placeholder="우편번호" id="postno" value="${postno }">
                                </div>
                            	<button type="button" class="site-btn findA" style="width:30%;">찾기</button>
                            	</div>
                                <input type="text" placeholder="기본 주소" class="checkout__input__add" id="address1" value="${address1 }">
                                <input type="text" placeholder="상세 주소" id="address2" value="${address2 }">
                            </div>
                            </div>
                            <div class="checkout__input">
                                <p>연락처<span>*</span></p>
                                <input type="text" name="tel" id="tel" value="${dto.tel }" maxlength="13">
                            </div>
                            <div class="checkout__input">
                                <p>생년월일</p>
                                <input type="date" name="birth" id="birth" <c:if test="${dto.birth != null}">value="${dto.birth }"</c:if>>
                                
                            </div>
                            
                            <div class="checkout__input">
	                            <button type="submit" class="site-btn" style="width:100%;">정보 수정</button>
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