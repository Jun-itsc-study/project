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
    <link rel="stylesheet" href="css/bootstrap.min.css" type="text/css">
    <link rel="stylesheet" href="css/font-awesome.min.css" type="text/css">
    <link rel="stylesheet" href="css/elegant-icons.css" type="text/css">
    <link rel="stylesheet" href="css/nice-select.css" type="text/css">
    <link rel="stylesheet" href="css/jquery-ui.min.css" type="text/css">
    <link rel="stylesheet" href="css/owl.carousel.min.css" type="text/css">
    <link rel="stylesheet" href="css/slicknav.min.css" type="text/css">
    <link rel="stylesheet" href="css/style.css" type="text/css">
    
    <!-- jquery -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <!-- 주소검색 -->
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    <script>
    function checkRegi(){
    	var id = $("#id").val();
		var name = $("#name").val();
		
		var pwd = $("#pwd").val();
		var pwd2 = $("#pwd2").val();
		var num = pwd.search(/[0-9]/g);
		var eng = pwd.search(/[a-z]/ig);
		var spe = pwd.search(/[`~!@@#$%^&*|₩₩₩'₩";:₩/?]/gi);

		var postno = $("#postno").val();
		var address1 = $("#address1").val();
		var address2 = $("#address2").val();

		var tel = $("#tel").val();
		var acc = $("#acc").prop("checked");
		
		if(name.length == 0){alert("이름은 필수 입력사항입니다.");$("#name").focus();return false;}
		
		if(id.length == 0){alert("아이디는 필수 입력사항입니다.");$("#id").focus();return false;}
		else if(id.length < 8){alert("아이디는 8글자 이상이어야 합니다.");$("#id").focus();return false;}
		
		else if(pwd.length == 0){alert("비밀번호는 필수 입력사항입니다.");$("#pwd").focus();return false;}
		else if(pwd2.length == 0){alert("비밀번호는 필수 입력사항입니다.");$("#pwd2").focus();return false;}
		else if(pwd != pwd2){alert("비밀번호가 일치하지않습니다.");$("#pwd2").focus();return false;}
		else if(pwd.search(/\s/) != -1){alert("비밀번호는 공백 없이 입력해주세요.");$("#pwd").focus();return false;}
		else if( (num < 0 && eng < 0) || (eng < 0 && spe < 0) || (spe < 0 && num < 0) ){
			alert("영문,숫자, 특수문자 중 2가지 이상을 혼합하여 입력해주세요.");
			$("#pwd").focus();
			return false;
		}
		
		if(address1.length == 0) {alert("주소는 필수 입력사항입니다.");$("#address1").focus();return false;}
		if(tel.length == 0){alert("연락처는 필수 입력사항입니다.");$("#tel").focus();return false;}
		if(acc == false){alert("약관에 동의해주세요");return false;}
		
		var address = postno+"&&"+address1+"&&"+address2;
		$("#address").val(address);
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
    		
    		//$(this)[0].submit();
    		var d = $(this).serialize();
    		$.ajax({
    			url:"register.do",
    			type:"POST",
    			data:d,
    			success:function(r){
    				if(r == 1){
    					location.href="login";
    				}
    				else {
    					alert("회원가입에 실패하였습니다.");
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
</head>

<body>


<jsp:include page="/template/header.jsp"></jsp:include>
<jsp:include page="/template/bar.jsp"></jsp:include>

    <!-- Breadcrumb Section Begin -->
    <section class="breadcrumb-section set-bg" data-setbg="img/breadcrumb.jpg">
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
                                <input type="text" name="id" id="id" maxlength="20">
                            </div>
                            <div class="checkout__input">
                                <p>비밀번호<span>*</span></p>
                                <input type="password" placeholder="비밀번호는 영문/숫자/특수문자를 포함해야합니다." name="pwd" id="pwd">
                            </div>
                            <div class="checkout__input">
                                <p>비밀번호 확인<span>*</span></p>
                                <input type="password" id="pwd2">
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
                                <input type="hidden" name="address" id="address"> 
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
                            <div class="checkout__input__checkbox">
                                <label for="acc">
                                    개인정보 이용 동의
                                    <a href="#">자세히</a>
                                    <input type="checkbox" id="acc">
                                    <span class="checkmark"></span>
                                </label>
                            </div>
                            <div class="checkout__input">
	                            <button type="submit" class="site-btn" style="width:100%;">회원가입</button>
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