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
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript">

	$(function(){
		$(".btn_search").click(function() {
			var d = $(this).parent().serialize();
			console.log(d);
			$.ajax({
				url:"orderSearch.do",
				data :d,
				dataType:"json",
				type:"get",
				success:function(r){
					console.log(r);
					var tag = "";
				//	alert(r);
					for(i=0;i<r.length;i++){
						tag += "<tr>";
						/* tag += "<th scope="row">asdfasdf</th>"; */
						tag += '<td><a href="orderDetail?ono='+r[i].ordered.ono+'">'+r[i].ordered.ono+'</a></td>';
						tag += '<td>'+r[i].ordered.mno+'</td>';
						tag += '<td>'+r[i].ordered.dno+'</td>';
						tag += '<td>'+r[i].ordered.postno+'</td>';
						tag += '<td>'+r[i].ordered.address1+'</td>';
						tag += '<td>'+r[i].ordered.address2+'</td>';
						tag += '<td>'+r[i].ordered.oea+'</td>';
						tag += '<td>'+r[i].ordered.totalprice+'</td>';
						tag += '<td>'+r[i].ordered.odate+'</td>';
						tag += '</tr>';
					}
					$(".search_result").html(tag);
				}
			});
		});//btn_search click
	});
</script>	

</head>

<body>
<jsp:include page="/template/admin/header.jsp" />
	<jsp:include page="/template/admin/sidebar.jsp" />

	<main id="main" class="main">

		<div class="pagetitle">
			<h1>주문관리 페이지</h1>
		 	<nav>
				<ol class="breadcrumb">
					<li class="breadcrumb-item"><a href="admin">Home</a></li>
					<li class="breadcrumb-item">주문관리</li>
					<li class="breadcrumb-item active">주문목록</li>
				</ol>
			</nav>
		</div>
		<!-- End Page Title -->

		<section class="section">
			<div class="row">
				<!-- Search Bar -->
				<div class="col-sm-6 search">
					<div class="header search-bar">
						<form id="frm_search" class="search-form d-flex align-items-center">
							<select name="kind" id="kind" class="form-select" aria-label="Default select example">
								<option value="ono" selected>주문번호</option>
								<option value="mno">회원번호</option>
								<option value="dno">배송상태</option>
								<option value="odate">주문날짜</option>
							</select>
							<input type="text" name="search" placeholder="Search" title="Enter search keyword">
							<button type="button" class="btn_search" title="Search"> <i class="bi bi-search"></i></button>
						</form>
					</div>
				</div>
				<!-- 주문목록 Div -->
				<div class="col-lg-12">
					<div class="card">
						<div class="card-body">
							<h5 class="card-title">주문 목록 - 상품준비중(0) | 배송준비(1) | 배송 중(2) | 배송완료(3)</h5>
							<!-- Default Table -->
							<table class="table" style="text-align: center;">
								<thead>
									<tr>
										<!-- <th scope="col">#</th> -->
										<th scope="col" style="width:7%;">주문번호</th>
										<th scope="col" style="width:7%;">회원번호</th>
										<th scope="col" style="width:7%;">배송상태</th>
										<th scope="col" style="width:10%;">우편번호</th>
										<th scope="col" style="width:15%;">기본주소</th>
										<th scope="col" style="width:15%;">상세주소</th>
										<th scope="col" style="width:7%;">총갯수</th>
										<th scope="col" style="width:12%;">총금액</th>
										<th scope="col" style="width:20%;">주문날짜</th>
									</tr>
								</thead>
								<tbody class="search_result">
								<c:forEach var="obj" items="${list }">
									<%-- <c:set var="num" value="${num+1} }"/> --%>
									<tr>
										 <%-- <th scope="row">${num }</th> --%>
										<td><a href="orderDetail?ono=${obj.ordered.ono }">${obj.ordered.ono }</a></td>
										<td>${obj.ordered.mno }</td>
										<td>${obj.ordered.dno }</td>
										<td>${obj.ordered.postno }</td>
										<td>${obj.ordered.address1 }</td>
										<td>${obj.ordered.address2 }</td>
										<td>${obj.ordered.oea }</td>
										<td>${obj.ordered.totalprice }</td>
										<td>${obj.ordered.odate }</td>
									</tr>
								</c:forEach>
								</tbody>
							</table>
							<!-- End Default Table Example -->
						</div>
					</div>
				</div>
				<!-- End 주문목록 Div -->
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