<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="utf-8">
<meta content="width=device-width, initial-scale=1.0" name="viewport">

<title>Tables / General - NiceAdmin Bootstrap Template</title>
<meta content="" name="description">
<meta content="" name="keywords">

<!-- custom css -->
<style type="text/css">
	.search{padding-bottom: 10px;}
	.search-bar{background-color: inherit !important;box-shadow: none !important;display: inline;}
	.form-select{width:30% !important;margin-right: 3px;}
	.search-form{width:60% !important;}
	.btnAdd, .btnList{border:none; background-color:inherit;}
	.btnList{padding-left:0px;padding-top:6px;}
	#main{min-height:82vh;}
	th:nth-last-child(2),th:nth-last-child(4) {width:8%;}
	th:nth-last-child(5){width:16%;}
	th:last-child {width:5%;}
</style>
 	<!-- jquery -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <!-- 주소검색 -->
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
function add_event_update(){
	var arr = "dno=" + $("#dnostatus").val();
	arr += "&ono=" + $("#ono_update").text();
	console.log(arr);
	$.ajax({
		url:"updateOrderDNO.do",
		data : arr,
		type: "post",
		success:function(r){
			if(r == 1)
				alert("배송 상태 수정 완료");
			else 
				alert("배송 상태 수정 실패");
			location.reload();
		}
	});
}
function updateAddress() {
	console.log("418259");

	var d = "postno=" + $("#postno").val();
	d += "&address1=" + $("#address1").val();
	d += "&address2=" + $("#address2").val();
	d += "&ono=" + $("#ono_update").text();
	$.ajax({
		url : "updateOrderAddress.do",
		type : "POST",
		data : d,
		success : function(r) {
			if (r == 1) {
				alert("수정 완료");
				location.reload();
			} else {
				alert("수정 실패. 입력란을 다시 확인해주세요");
			}
		}
	});
};
$(function(){
	$(".findA").click(function() {
		var d = $(this).parent().parent();
		new daum.Postcode({
			oncomplete : function(data) {
				console.log(d.parent().parent().find(
						"input[id=postno]").val());
				d.find("input[id=postno]").val(
						data.zonecode);
				d.find("input[id=address1]").val(
						data.address);
				d.find("input[id=address2]").val("");
				d.find("input[id=address2]").focus();
			}
		}).open();
	});//주소
})
</script>
</head>

<body>
<jsp:include page="/template/admin/header.jsp" />
	<jsp:include page="/template/admin/sidebar.jsp" />

	<main id="main" class="main">

		<div class="pagetitle">
			<h1>주문 상세 정보 페이지</h1>
			<nav>
				<ol class="breadcrumb">
					<li class="breadcrumb-item"><a href="admin">Home</a></li>
					<li class="breadcrumb-item">주문관리</li>
					<li class="breadcrumb-item active">주문 상세정보</li>
				</ol>
			</nav>
		</div>
		<section class="section">
				<div class="col-lg-12">
					<div class="card">
						<div class="card-body">
							<h5 class="card-title">주문 상세 목록</h5>
							<!-- Default Table -->
							<table class="table">
								<thead>
									<tr>
										<!-- <th scope="col">#</th> -->
										<th scope="col">주문번호</th>
										<th scope="col">상품번호</th>
										<th scope="col">상품명</th>
										<th scope="col">가격</th>
										<th scope="col">개수 </th>
										<th scope="col">금액</th>
									</tr>
								</thead>
								<tbody class="search_result">
								<c:forEach var="obj" items="${list }">
									<tr>
										<td id="ono_update">${obj.ordered.ono }</td>
										<td>${obj.orderDetail.pno }</td>
										<td><%-- ${obj.ordered.pname } --%></td>
										<td>${obj.orderDetail.pprice }</td>
										<td>${obj.orderDetail.pcount }</td>
										<td>${obj.orderDetail.ptotalprice }</td>
									</tr>
								</c:forEach>
								</tbody>
							</table>
							<!-- End Default Table Example -->
							<!-- 주문 상세 정보 테이블 -->
							<table class="table">
								<thead>
									<tr>
										<th scope="col" style="width:7%;">회원번호</th>
										<th scope="col" colspan="2" style="width:17%;">우편번호 </th>
										<th scope="col" style="width:13%;">기본주소 </th>
										<th scope="col" style="width:13%;">상세주소 </th>
										<th scope="col" style="width:10%;"> </th>
										<th scope="col" style="width:10%;">총금액</th>
										<th scope="col" style="width:10%;">배송상태</th>
										<th scope="col" style="width:20%;" colspan="2">비고</th>
									</tr>
								</thead>
								<tbody class="search_result">
								
									<tr>
										<td>${list[0].ordered.mno }</td> 
										<td colspan="2"><input id="postno" type="text" value="${list[0].ordered.postno }" style="width:70%"><button class="btn findA"><i class="bi bi-search"></i></button></td>
										<td><input id="address1" type="text" value="${list[0].ordered.address1 }"></td>
										<td><input id="address2" type="text" value="${list[0].ordered.address2 }"></td>
										<td><button type=button onclick="updateAddress()" class="btnUpdate btnList"><i class="ri-edit-line"></i>주소 수정</button></td> 
										<td>${list[0].ordered.totalprice }</td>
										<td>${list[0].ordered.dno }</td> 
										<td>
										<select name="dno"  id="dnostatus">
											<option value="1" > 배송준비(1) </option>
											<option value="2" > 배송중(2) </option>
											<option value="3" > 완료(3) </option>
										</select>
										</td> 
										<td>
										<button type="button" onclick="add_event_update();" class="btnUpdate btnList"><i class="ri-edit-line"></i>배송수정</button>
										</td>
									</tr>
								
								</tbody>
							</table>
							<!-- End 주문 상세 정보 테이블 -->
						<!-- 주문 주소 변경 div-->
					</div>
				</div>
				<!-- End 주문 주소 변경 -->
			</div>
		</section>
	</main>
	<!-- End #main -->

	<!-- Footer -->
	<jsp:include page="/template/admin/footer.jsp"></jsp:include>

	<a href="#" class="back-to-top d-flex align-items-center justify-content-center"><i class="bi bi-arrow-up-short"></i></a>

	<jsp:include page="/template/admin/js.jsp"></jsp:include>
</body>
</html>