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
	th:nth-last-child(2){width:30%;}
	th:last-child {width:5%;}
</style>

<!-- jqeury -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript">
	function add_event_update(){
		$(".btnUpdate").click(function(){
			var arr = $(this).parent().parent().find("input");
			var d = "";
			$.each(arr,function(i,obj){
				d += $(obj).attr("name") + "=" + $(obj).val() + "&";
			});
			$.ajax({
				url:"mileageUpdate.do",
				data : d,
				type: "post",
				success:function(r){
					if(r == 1)
						alert("마일리지 정보 변경 완료");
					else 
						alert("마일리지 정보 변경 실패");
					location.reload();
				}
			});
		});
	}//add event update
	$(function(){
		add_event_update();
		$(".btn_search").click(function() {
			var d = $(this).parent().serialize();
			$.ajax({
				url:"memberSearch.do",
				data : d,
				dataType:"json",
				type:"get",
				success:function(r){
					var tag = "";
					alert(r[0]);
					for(i=0;i<r.length;i++){
						tag += "<tr>";
						tag += '<th scope="row"><input type="hidden" name="mno" value="'+r[i].member.mno+'">'+r[i].member.mno+'</td>';
						tag += '<td>'+r[i].member.id+'<input type="hidden" name="vno" value="'+r[i].member.vno+'"></td>';
						tag += '<td><input type="text" class="form-control" name="mileage" value="'+r[i].member.mileage+'" readonly="readonly"></td>';
						tag += '<td><input type="text" class="form-control" name="totalmileage" value="'+r[i].member.totalmileage+'" readonly="readonly"></td>';
						tag += '<td><input type="number" class="form-control" name="cmile"></td>';
						tag += '<td><input type="text" class="form-control" name="mlog"></td>';
						tag += '<td><button type="button" class="btnUpdate btnList"><i class="ri-edit-line"></i></button></td>';
						tag += '</tr>';
					}
					$(".search_result").html(tag);
					add_event_update();
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
			<h1>마일리지 관리</h1>
			<nav>
				<ol class="breadcrumb">
					<li class="breadcrumb-item"><a href="admin">Home</a></li>
					<li class="breadcrumb-item">회원관리</li>
					<li class="breadcrumb-item active">마일리지 관리</li>
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
								<option value="id" selected>아이디</option>
							</select>
							<input type="text" name="search" placeholder="Search" title="Enter search keyword">
							<button type="button" class="btn_search" title="Search"> <i class="bi bi-search"></i></button>
						</form>
					</div>
				</div>
				<!-- 회원목록 Div -->
				<div class="col-lg-12">
					<div class="card">
						<div class="card-body">
							<h5 class="card-title">회원 목록</h5>
							<!-- Default Table -->
							<table class="table">
								<thead>
									<tr>
										<th scope="col">#</th>
										<th scope="col">아이디</th>
										<th scope="col">보유마일리지</th>
										<th scope="col">누적마일리지</th>
										<th scope="col">변경마일리지</th>
										<th scope="col">변경사유</th>
										<th scope="col">비고</th>
									</tr>
								</thead>
								<tbody class="search_result">
								<c:forEach var="obj" items="${list }">
									<tr>
										<th scope="row"><input type="hidden" name="mno" value="${obj.member.mno }">${obj.member.mno }</th>
										<th scope="row">${obj.member.id }</th>
										<td><input type="text" class="form-control" name="mileage" value="${obj.member.mileage }" readonly="readonly"></td>
										<td><input type="text" class="form-control" name="totalmileage" value="${obj.member.totalmileage }" readonly="readonly"></td>
										<td><input type="number" class="form-control" name="cmile"></td>
										<td><input type="text" class="form-control" name="mlog"></td>
										<td>
											<button type="button" class="btnUpdate btnList"><i class="ri-edit-line"></i></button>
										</td>
									</tr>
								</c:forEach>
								</tbody>
							</table>
							<!-- End Default Table Example -->
						</div>
					</div>
				</div>
				<!-- End 회원목록 Div -->
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