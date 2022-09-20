<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- jquery -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

<script>
	$(function(){
		var type = "<c:out value='${type}'/>"; //cout?
		//type 찾아서 넣기
		if(type == null || type == ""){
			$(".breadcrumb__option").removeAttr("span");
			$("h2").text("My Page");
			$(".breadcrumb__option").hide();
		}else {
			$(".breadcrumb__option").show();	 
			$(".breadcrumb__option").removeAttr("span");

			if(type == "updateMember"){
				$(".hname").text("회원정보 수정");
				$(".breadcrumb__option").append("<span>회원정보 수정</span>");
			}else if(type == "updatePwd"){
				$(".hname").text("비밀번호 수정");
				$(".breadcrumb__option").append("<span>비밀번호 수정</span>");
			}else if(type == "vipInfo"){
				$(".hname").text("등급 혜택");
				$(".breadcrumb__option").append("<span>등급 혜택</span>");
			}
		}
	});
</script>

<!-- Breadcrumb Section Begin -->
<section class="breadcrumb-section set-bg" data-setbg="shop/img/breadcrumb.jpg">
	<div class="container">
		<div class="row">
			<div class="col-lg-12 text-center">
				<div class="breadcrumb__text">
					<h2 class="hname"></h2>
					<div class="breadcrumb__option">
						<a href="/">Home</a> <a href="memberInfo">My Page</a>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>
<!-- Breadcrumb Section End -->