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

<!-- jqeury -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript">
//①
	function add_event_update(){
		$(".btnUpdate").click(function(){
			var arr = $(this).parent().parent().find("input");
			var d = "";
			$.each(arr,function(i,obj){
				d += $(obj).attr("name") + "=" + $(obj).val() + "&";
			});
			$.ajax({
				url:"memberUpdate.do",
				data : d,
				type: "post",
				success:function(r){
					if(r == 1)
						alert("회원 정보 수정 완료");
					else 
						alert("회원 정보 수정 실패");
					location.reload();
				}
			});
		});
	}//add event update
	function add_event_delete(){
		$(".btnDelete").click(function(){
			var d = "mno="+ $(this).parent().parent().find("input[name=mno]").val();
			$.ajax({
				url:"memberDelete.do",
				data : d,
				type: "post",
				success:function(r){
					if(r == 1)
						alert("회원 정보 삭제 완료");
					else 
						alert("회원 정보 삭제 실패");
					location.reload();
				}
			});
		});
	}//add event delete
	$(function(){
		//$(".regiMember").hide();
		//add_event_add();
		add_event_update();
		add_event_delete();
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
						tag += '<td><input type="text" class="form-control" name="id" value="'+r[i].member.id+'" readonly="readonly"></td>';
						tag += '<td><input type="text" class="form-control" name="pwd" value="'+r[i].member.pwd+'"></td>';
						tag += '<td><input type="text" class="form-control" name="name" value="'+r[i].member.name+'"></td>';
						tag += '<td><input type="date" class="form-control" name="birth" value="'+r[i].member.birth+'"></td>';
						tag += '<td><input type="text" class="form-control" name="tel" value="'+r[i].member.tel+'"></td>';
						tag += '<td><input type="text" class="form-control" name="address" value="'+r[i].member.address+'"></td>';
						tag += '<td><input type="text" class="form-control" name="vno" value="'+r[i].member.vno+'"></td>';
						tag += '<td><input type="text" class="form-control" name="vname" value="'+r[i].vip.vname+'"></td>';
						tag += '<td><input type="text" class="form-control" name="mileage" value="'+r[i].member.mileage+'"></td>';
						tag += '<td><button type="button" class="btnUpdate btnList"><i class="ri-edit-line"></i></button>';
						tag += '<button type="button" class="btnDelete btnList"><i class="ri-delete-bin-2-line"></i></button>';
						tag += '</td>';
						tag += '</tr>';
					}
					$(".search_result").html(tag);
					//add_event_add();
					add_event_update();
					add_event_delete();
				}
			});
		});//btn_search click
		$("input[name=tel]").change(function(){
    		var size = $(this).val().length;
    		var d = $(this).val();
    		if(size == 3 || size == 8){
    			$(this).val(d+"-");
	  		}
    	}); //전화번호 자동 - 추가
		//②
	});
</script>
</head>
<body>
	<jsp:include page="/template/admin/header.jsp" />
	<jsp:include page="/template/admin/sidebar.jsp" />

	<main id="main" class="main">

		<div class="pagetitle">
			<h1>회원관리 페이지</h1>
			<nav>
				<ol class="breadcrumb">
					<li class="breadcrumb-item"><a href="admin">Home</a></li>
					<li class="breadcrumb-item">회원관리</li>
					<li class="breadcrumb-item active">회원정보</li>
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
								<option value="name">이름</option>
								<option value="birth">생년월일</option>
								<option value="tel">전화번호</option>
								<option value="address">주소</option>
								<option value="vno">등급번호</option>
								<option value="mileage">마일리지</option>
							</select>
							<input type="text" name="search" placeholder="Search" title="Enter search keyword">
							<button type="button" class="btn_search" title="Search"> <i class="bi bi-search"></i></button>
						</form>
					</div>
				</div>
				<!-- ③ -->
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
										<th scope="col">비밀번호</th>
										<th scope="col">이름</th>
										<th scope="col">생년월일</th>
										<th scope="col">전화번호</th>
										<th scope="col">주소</th>
										<th scope="col">등급번호</th>
										<th scope="col">등급</th>
										<th scope="col">마일리지</th>
										<th scope="col">비고</th>
									</tr>
								</thead>
								<tbody class="search_result">
								<c:forEach var="obj" items="${list }">
									<tr>
										<th scope="row"><input type="hidden" name="mno" value="${obj.member.mno }">${obj.member.mno }</th>
										<td><input type="text" class="form-control" name="id" value="${obj.member.id }" readonly="readonly"></td>
										<td><input type="text" class="form-control" name="pwd" value="${obj.member.pwd }"></td>
										<td><input type="text" class="form-control" name="name" value="${obj.member.name }"></td>
										<td><input type="date" class="form-control" name="birth" value="${obj.member.birth }"></td>
										<td><input type="text" class="form-control" name="tel" value="${obj.member.tel }"></td>
										<td><input type="text" class="form-control" name="address" value="${obj.member.address }"></td>
										<td><input type="text" class="form-control" name="vno" value="${obj.member.vno }"></td>
										<td><input type="text" class="form-control" name="vname" value="${obj.vip.vname }"></td>
										<td><input type="text" class="form-control" name="mileage" value="${obj.member.mileage }"></td>
										<td>
											<button type="button" class="btnUpdate btnList"><i class="ri-edit-line"></i></button>
											<button type="button" class="btnDelete btnList"><i class="ri-delete-bin-2-line"></i></button>
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

<!-- 
①번위치 임시 삭제
/* function add_event_add(){
		$(".btnAdd").click(function(){
			var arr = $(this).parent().parent().find("input");
			var d = "";
			$.each(arr,function(i,obj){
				d += $(obj).attr("name") + "=" + $(obj).val() + "&";
			});
			$.ajax({
				url:"memberInsert.do",
				data : d,
				type: "post",
				success:function(r){
					if(r == 1)
						alert("회원 정보 추가 완료");
					else 
						alert("회원 정보 추가 실패");
					location.reload();
				}
			});
		});
	} //add event add */

②번위치 임시 삭제
/* var status = 0;
		$(".btn_show").click(function(){
			if(status == 0) {
				$(".regiMember").show();
				console.log(status);
				status = 1;
				console.log(status);
				
			}
			else {
				$(".regiMember").hide();
				console.log(status);
				status = 0;
				console.log(status);
			}
		})//btn_show */
		
③번위치 임시 삭제
<div class="col-lg-5" style="position: relative;">
					<div class="search-bar" style="position: absolute; bottom: 10px;">
						<button class="btn_show btn btn-secondary">회원 등록</button>
					</div>
				</div>
				-->
				<!-- End Search Bar -->
				<!-- 회원등록 Div -->
				<!-- 
				<div class="col-lg-12 regiMember">
					<div class="card">
						<div class="card-body">
							<h5 class="card-title">회원 등록</h5>
							<table class="table">
								<thead>
									<tr>
										<th scope="col">아이디</th>
										<th scope="col">비밀번호</th>
										<th scope="col">이름</th>
										<th scope="col">생년월일</th>
										<th scope="col">전화번호</th>
										<th scope="col">주소</th>
										<th scope="col">마일리지</th>
										<th scope="col"><i class="bi bi-caret-down"></i></th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td><input type="text" class="form-control" name="id"></td>
										<td><input type="text" class="form-control" name="pwd"></td>
										<td><input type="text" class="form-control" name="name"></td>
										<td><input type="date" class="form-control" name="birth"></td>
										<td><input type="text" class="form-control" name="tel"></td>
										<td><input type="text" class="form-control" name="address"></td>
										<td><input type="text" class="form-control" name="mileage" value="0"></td>
										<td><button type="button" class="btnAdd"><i class="bi bi-person-plus"></i></button></td>
									</tr>
								</tbody>
							</table>
						</div>
					</div>
				</div>
				-->
				<!-- End 회원등록 Div -->
 -->