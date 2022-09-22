<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="description" content="Ogani Template">
    <meta name="keywords" content="Ogani, unica, creative, html">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>아이디/비밀번호 찾기</title>
<!-- Css Styles -->
<link rel="stylesheet" href="css/bootstrap.min.css" type="text/css">
<link rel="stylesheet" href="css/font-awesome.min.css" type="text/css">
<link rel="stylesheet" href="css/elegant-icons.css" type="text/css">
<link rel="stylesheet" href="css/nice-select.css" type="text/css">
<link rel="stylesheet" href="css/jquery-ui.min.css" type="text/css">
<link rel="stylesheet" href="css/owl.carousel.min.css" type="text/css">
<link rel="stylesheet" href="css/slicknav.min.css" type="text/css">
<link rel="stylesheet" href="css/style.css" type="text/css">
    <style type="text/css">
		.find, .idresult, .pwdresult{
			width:100%;
			margin:20px 10px;
		}
		.site-btn{width:100%;}
		.checkout__input{margin-bottom:10px;}
		.btm{margin-bottom:30px;}
		h4{margin-bottom:10px !important;}
		input[type=radio]{width:15px;position: relative;top: -10px;}
		/* .find{position: relative;top: 0px;} */
		.fradio{width:60%;height:30px;display: flex; justify-content: space-around;}
		/* .idresult, .pwdresult{display:none;} */
		.log_btn{display:flex;justify-content: space-between;}
    	.idresult .site-btn{width:45%;}
    </style>
    <!-- jquery -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    
    <script>
	    function checkInfo(status){
	    	var id = $("#id").val();
	    	var name = $("#name").val();
	    	var tel = $("#tel").val();
	    	
	    	if(name.length == 0){alert("이름은 필수 입력사항입니다.");$("#name").focus();return false;}
	    	else if(tel.length == 0){alert("전화번호는 필수 입력사항입니다.");$("#tel").focus();return false;}
	    	
	    	if(status == 1){
				if(id.length == 0){alert("아이디는 필수 입력사항입니다.");$("#id").focus();return false;}
	    	}
	    }//찾기 정보 체크
	    
		function checkPwd(){
			var pwd = $("#pwd").val();
			var pwd2 = $("#pwd2").val();
			var num = pwd.search(/[0-9]/g);
			var eng = pwd.search(/[a-z]/ig);
			var spe = pwd.search(/[`~!@@#$%^&*|₩₩₩'₩";:₩/?]/gi);
			
			if(pwd.length == 0){alert("비밀번호는 필수 입력사항입니다.");$("#pwd").focus();return false;}
			else if(pwd.length < 10){alert("비밀번호는 10자리 이상 입력해야 됩니다.");$("#pwd").focus();return false;}
			else if(pwd2.length == 0){alert("비밀번호는 필수 입력사항입니다.");$("#pwd2").focus();return false;}
			else if(pwd != pwd2){alert("비밀번호가 일치하지않습니다.");$("#pwd2").focus();return false;}
			else if(pwd.search(/\s/) != -1){alert("비밀번호는 공백 없이 입력해주세요.");$("#pwd").focus();return false;}
			else if( (num < 0 && eng < 0) || (eng < 0 && spe < 0) || (spe < 0 && num < 0) ){
				alert("영문,숫자, 특수문자 중 2가지 이상을 혼합하여 입력해주세요.");
				$("#pwd").focus();
				return false;
			}
		}//비밀번호 체크
		
    	$(function(){
    		$(".idresult").hide();
    		$(".pwdresult").hide();
    		$("input[type=radio]").change(function(){
    			var status = $("#fid").prop("checked") ? 0 : 1;
    			
    			if(status == 0){
    				if($(".div_id").length > 0){
    					$(".div_id").remove();
    				};
    			}else{
    				if($(".div_id").length == 0){
    					$("#name").parent().prepend("<div class='checkout__input div_id'><label for='id'>아이디</label><input type='text' name='id' id='id'></div>");
    				};
    			}
    		});//id찾기 / 비밀번호찾기 에 따른 tag 추가/삭제
    		
    		$(".findfrm").submit(function(e){
    			e.preventDefault();
    			var status = $("#fid").prop("checked") ? 0 : 1;
    			
    			var r = checkInfo(status); //찾기 전 빈칸 체크
    			if(r == false) return false;
    			
    			var d = $(this).serialize();
    			d = d + "&status=" + status;
    			$.ajax({
    				url:"findAccount.do",
    				data:d,
    				type:"POST",
    				dataType:"json",
    				success:function(r){
    					if(r.result == 0){alert("일치하는 계정이 없습니다.");}
    					else{
    						$(".find").hide();
    						if(status == 0){
    							$(".idtext").html("<p>아이디는 ["+r.dto.id+"] 입니다.</p>");
    							$(".idresult").show();
    						}else{
    							$("#id2").val(r.dto.id);
    							$("#mno").val(r.dto.mno);
    							$(".pwdresult").show();
    						}//elseif
    					}//else
    			
    				}//func
    			});//ajax
    		});//찾기 폼 submit
    		
	    	//pwd 변경 ajax >> alert 이후 닫기
    		$(".findPwdChange").submit(function(e){
    			e.preventDefault();
    			
    			var r = checkPwd();
    			if(r == false) return false;
    			
    			console.log($("#id").val());
    			var d = $(this).serialize();
    			$.ajax({
    				url:"findChangePwd.do",
    				data:d,
    				type:"POST",
    				success:function(r){
    					if(r == 0){
    						alert("비밀번호 변경에 실패하였습니다. 다시 입력해주세요.");
    						$("#pwd").focus();
    					}else{
    						alert("비밀번호 변경에 성공하였습니다.");
    						window.close();
    					}
    				}
    			});
    		})//비밀번호 변경
    		
	    	$(".back").click(function(){
	    			$(".idresult").hide();
	    			$(".pwdresult").hide();
	    			$(".find").show();
	    	});//이전으로
    		
    		$(".cls").click(function(){
    			window.close();
    		});//닫기
    		
    	})//jquery
    	
    </script>
</head>
<body>
<div class="container">
	<div class="row">
		<div class="checkout__form find">
        	<h4>아이디/비밀번호 찾기</h4>
        	<div class="checkout__input fradio">
				<input type="radio" id="fid" name="find" checked="checked">
				<label for="fid">아이디 찾기</label>
				
				<input type="radio" id="fpwd" name="find">
				<label for="fpwd">비밀번호 찾기</label>
			</div>
            <form class="findfrm">
            	<div class="row" style="float: none; margin:0 auto;">
                	<div class="col-lg-10 col-md-6" style="float: none; margin:0 auto;">
                        <div class="checkout__input">
                            <label for="name">이름</label>
                        	<input type="text" name="name" id="name">
                        </div>
                        <div class="checkout__input btm">
                        	<label for="tel">연락처</label>
                        	<input type="text" name="tel" id="tel">
                        </div>
                        <div class="checkout__input">
	                    	<button type="submit" class="site-btn">찾기</button>
                        </div>
                	</div>
            	</div>
        	</form>
    	</div>
    	
    	<div class="checkout__form idresult">
        	<h4>아이디/비밀번호 찾기</h4>
            <div class="row" style="float: none; margin:0 auto;">
            	<div class="col-lg-10 col-md-6" style="float: none; margin:0 auto;">
                    <div class="checkout__input idtext">
                       	
                    </div>
                    <div class="checkout__input">
	                  	<button type="button" class="site-btn back">이전으로</button>
	                  	<button type="button" class="site-btn cls">닫기</button>
	                </div>
               	</div>
           	</div>
    	</div>
    	
    	<div class="checkout__form pwdresult">
        	<h4>아이디/비밀번호 찾기</h4>
            <form class="findPwdChange">
            <input type="hidden" id="id2" name="id2">
            <input type="hidden" id="mno" name="mno">
            	<div class="row" style="float: none; margin:0 auto;">
                	<div class="col-lg-10 col-md-6" style="float: none; margin:0 auto;">
                        <div class="checkout__input">
                            <label for="pwd">바꿀 비밀번호</label>
                        	<input type="password" name="pwd" id="pwd">
                        </div>
                        <div class="checkout__input">
                        	<label for="pwd2">비밀번호 확인</label>
                        	<input type="password" name="pwd2" id="pwd2">
                        </div>
                        <div class="checkout__input">
	                    	<button type="submit" class="site-btn">변경하기</button>
                        </div>
                	</div>
            	</div>
        	</form>
    	</div>
	</div>
</div>
<jsp:include page="/template/shop/js.jsp"></jsp:include>
</body>
</html>