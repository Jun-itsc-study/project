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
<!-- Google Font -->
<link href="https://fonts.googleapis.com/css2?family=Cairo:wght@200;300;400;600;900&display=swap" rel="stylesheet">
<!-- Css Styles -->
<link rel="stylesheet" href="shop/css/bootstrap.min.css" type="text/css">
<link rel="stylesheet" href="shop/css/font-awesome.min.css" type="text/css">
<link rel="stylesheet" href="shop/css/elegant-icons.css" type="text/css">
<link rel="stylesheet" href="shop/css/nice-select.css" type="text/css">
<link rel="stylesheet" href="shop/css/jquery-ui.min.css" type="text/css">
<link rel="stylesheet" href="shop/css/owl.carousel.min.css" type="text/css">
<link rel="stylesheet" href="shop/css/slicknav.min.css" type="text/css">
<link rel="stylesheet" href="shop/css/style.css" type="text/css">


    <!-- jquery -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <!-- 주소검색 -->
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    <script>
    function checkRegi(){
    	var id = $("#id").val();
		var name = $("#name").val();
		var pwd = $("#pwd").val();

		if(name.length == 0){alert("이름은 필수 입력사항입니다.");$("#name").focus();return false;}
		
		if(id.length == 0){alert("아이디는 필수 입력사항입니다.");$("#id").focus();return false;}
		else if(id.length < 8){alert("아이디는 8글자 이상이어야 합니다.");$("#id").focus();return false;}
		
		if(pwd.length == 0){alert("비밀번호는 필수 입력사항입니다.");$("#pwd").focus();return false;}
    }
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
    	
    	$("#regifrm").submit(function(e){
    		e.preventDefault();
    		checkRegi();
    		var d = $(this).serialize();
    		$.ajax({
    			url:"register.do",
    			type:"POST",
    			data:d,
    			success:function(r){
    				if(r == 1){
    					alert("회원등록 성공");
    					window.opener.parent.location.reload();
    					window.close();
    				}
    				else {
    					alert("회원등록에 실패하였습니다.");
    				}
    			}
    		});
    	}); //폼 submit
    	
    	$("#tel").keyup(function(){
    		//console.log($(this).val().length);
    		var size = $(this).val().length;
    		var d = $(this).val();
    		if(size == 3 || size == 8){
    			$(this).val(d+"-");
    		}
    	}); //전화번호 자동 - 추가
    	
    	//아이디 중복체크
    	$("#id").change(function(){
    		var d = "id="+$(this).val();
	    	$.ajax({
	    		url:"idCheck",
	    		data:d,
	    		type:"post",
	    		success:function(r){
	    			if(r != '0'){
	    				$("#id").css('border-color','red');
	    				$("#id").parent().append("<p class='duple' style='color:red;'>존재하는 아이디입니다.</p>");
	    				$("#id").focus();
	    			}else{
	    				$("#id").css('border-color','');
	    				$(".duple").remove();
	    			}
	    		}
	    	});
    	});
    })
    </script>
</head>

<body>
    <!-- Checkout Section Begin -->
        <div class="container" style="width:100%;margin-top:30px;">
            <div class="checkout__form">
                <h4>회원 등록</h4>
                <form id="regifrm">
                    <div class="row" style="float: none; margin:0 auto;">
                        <div class="col-lg-10 col-md-6" style="float: none; margin:0 auto;">
                            <div class="checkout__input">
                                <p>이름<span>*</span></p>
                                <input type="text" name="name" id="name">
                            </div>
                            <div class="checkout__input">
                                <p>아이디<span>*</span></p>
                                <input type="text" name="id" id="id" maxlength="20" placeholder="아이디는 8자 이상이여야 됩니다.">
                            </div>
                            <div class="checkout__input">
                                <p>비밀번호<span>*</span></p>
                                <input type="password" name="pwd" id="pwd">
                            </div>
                            <div>
                            <div class="checkout__input">
                                <p>주소<span>*</span></p>
                                <div class="checkout__input form-inline" style="padding-left:0;">
                                <div class="col-lg-4" style="padding-left:0;">
                                	<input type="text" placeholder="우편번호" name="postno" id="postno">
                                </div>
                            	<button type="button" class="site-btn findA" style="width:30%;">찾기</button>
                            	</div>
                                <input type="text" placeholder="기본 주소" class="checkout__input__add" name="address1" id="address1">
                                <input type="text" placeholder="상세 주소" name="address2" id="address2">
                            </div>
                            </div>
                            <div class="checkout__input">
                                <p>연락처<span>*</span></p>
                                <input type="text" placeholder="010-0000-0000" name="tel" id="tel" maxlength="13">
                            </div>
                            <div class="checkout__input">
                                <p>생년월일</p>
                                <input type="date" name="birth" id="birth">
                            </div>
                            <div class="checkout__input">
                                <p>추천인</p>
                                <input type="text" name="recommender" id="recommender" maxlength="20">
                            </div>
                            <div class="checkout__input">
	                            <button type="submit" class="site-btn" style="width:100%;">회원가입</button>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    <!-- Checkout Section End -->
    
</body>
</html>