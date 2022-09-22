<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- jquery -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

<script>
	$(function(){
		var type = "<c:out value='${type}'/>"; //cout?
		//type 찾아서 넣기
		if(type == null || type == ""){
			$(".dashboard").removeClass("collapsed");
			$(".qna").addClass("collapsed");
		}else {
			if(type != 'qna') {
				$("."+type).addClass("active");
				$("."+type).closest("ul").parent().children(".nav-link").removeClass("collapsed");
				$("."+type).closest("ul").addClass("show");
				$("."+type).closest("ul").parent().children(".nav-link").attr("aria-expanded","true");
				$(".qna").addClass("collapsed");
			}
			else $(".qna").removeClass("collapsed");
			
			$(".dashboard").addClass("collapsed");
		}
	});

</script>

<!-- ======= Sidebar ======= -->
<aside id="sidebar" class="sidebar">

	<ul class="sidebar-nav" id="sidebar-nav">
		<!-- Dashboard Nav -->
		<li class="nav-item">
			<a class="nav-link dashboard" href="admin">
				<i class="bi bi-grid"></i> <span>Dashboard</span>
			</a>
		</li>
		<!-- End Dashboard Nav -->

		<!-- 회원관리 Nav -->
		<li class="nav-item">
			<a class="nav-link collapsed" data-bs-target="#member-nav" data-bs-toggle="collapse" href="#">
				<i class="bi bi-person"></i><span>회원관리</span><i class="bi bi-chevron-down ms-auto"></i>
			</a>
			<ul id="member-nav" class="nav-content collapse " data-bs-parent="#sidebar-nav">
				<li>
					<a href="memberManage" class="memberManage"> <i class="bi bi-circle"></i><span>회원 목록</span></a>
				</li>
				<li>
					<a href="vipManage" class="vipManage"> <i class="bi bi-circle"></i><span>등급 혜택 관리</span></a>
				</li>
				<li>
					<a href="mileageManage" class="mileageManage"> <i class="bi bi-circle"></i><span>마일리지 관리</span></a>
				</li>
			</ul>
		</li>
		<!-- End 회원관리 Nav -->

		<!-- 주문관리 Nav -->
		<li class="nav-item">
			<a class="nav-link collapsed" data-bs-target="#order-nav" data-bs-toggle="collapse" href="#"> 
				<i class="bi bi-cart-check"></i><span>주문 관리</span><i class="bi bi-chevron-down ms-auto"></i>
			</a>
			<ul id="order-nav" class="nav-content collapse " data-bs-parent="#sidebar-nav">
				<li>
					<a href="#"> <i class="bi bi-circle"></i><span>주문 목록</span></a>
				</li>
				<li>
					<a href="#"> <i class="bi bi-circle"></i><span>배송 관리</span></a>
				</li>
			</ul>
		</li>
		<!-- End 주문관리 Nav -->

		<!-- 상품관리 Nav -->
		<li class="nav-item">
			<a class="nav-link collapsed" data-bs-target="#product-nav" data-bs-toggle="collapse" href="#">
				<i class="bi bi-cart4"></i><span>상품 관리</span><i class="bi bi-chevron-down ms-auto"></i>
			</a>
			<ul id="product-nav" class="nav-content collapse " data-bs-parent="#sidebar-nav">
				<li>
					<a href="#"> <i class="bi bi-circle"></i><span>상품 전체 목록</span></a>
				</li>
				<li>
					<a href="#"> <i class="bi bi-circle"></i><span>상품 등록</span></a>
				</li>
				<li>
					<a href="#"> <i class="bi bi-circle"></i><span>행사품목 관리</span></a>
				</li>
				<li>
					<a href="#"> <i class="bi bi-circle"></i><span>재고 관리</span></a>
				</li>
			</ul>
		</li>
		<!-- End 상품관리 Nav -->
		
		<!-- 문의내역 관리 Nav -->
		<li class="nav-item">
			<a class="nav-link collapsed qna" href="qnaMain"> <i class="bi bi-question-circle"></i> <span>문의내역 관리</span></a>
      	</li>
		<!-- End 문의내역 관리 Nav -->

		<!-- 공지사항 관리 Nav -->
		<li class="nav-item">
			<a class="nav-link collapsed" data-bs-target="#notice-nav" data-bs-toggle="collapse" href="#"> 
				<i class="bi bi-card-list"></i><span>공지사항 관리</span><i class="bi bi-chevron-down ms-auto"></i>
			</a>
			<ul id="notice-nav" class="nav-content collapse " data-bs-parent="#sidebar-nav">
				<li>
					<a href="noticeList" class="noticeList"> <i class="bi bi-circle"></i><span>공지사항 전체목록</span></a>
				</li>
				<li>
					<a href="noticeWrite" class="noticeWrite"> <i class="bi bi-circle"></i><span>공지사항 등록</span></a>
				</li>
			</ul>
		</li>
		<!-- End 공지사항 관리 Nav -->
	</ul>
</aside>
<!-- End Sidebar-->