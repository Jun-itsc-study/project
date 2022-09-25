<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- jquery -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script>
	$(function(){
		var type = "<c:out value='${type}'/>"; //cout?
		//type 찾아서 넣기
		if(type == null || type == ""){
			$("li").css("background-color","inherit")
			$("li").children().find("a").css("font-weight","normal");
			console.log("테스트")
		}else {
			$("li").css("background-color","inherit"); //inherit
			$("li").children("a").css("font-weight","normal");
			var t = "."+type;
			
			$(t).css("background-color","rgb(222,222,222)");
			$(t).children("a").css("font-weight","bold");
		}
	});
</script>

<div class="col-lg-4 col-md-5 order-md-1 order-2" style="max-width: 25%;">
	<div class="blog__sidebar">
		<div class="blog__sidebar__item">
			<h4>My Info</h4>
			<ul>
				<li class="cart"><a href="cart">장바구니</a></li>
				<li class="order"><a href="#">주문목록/배송조회</a></li>
				<li class="updateMember"><a href="updateMember">개인정보 확인/수정</a></li>
				<li class="updatePwd"><a href="updatePwd">비밀번호 변경</a></li>
				<li class="vipInfo"><a href="vipInfo">등급 혜택</a></li>
				<li class="qna"><a href="qnaList">문의 내역</a></li>
			</ul>
		</div>
	</div>
</div>