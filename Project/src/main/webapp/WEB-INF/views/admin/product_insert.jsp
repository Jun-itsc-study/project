<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="utf-8">
<meta content="width=device-width, initial-scale=1.0" name="viewport">
<meta content="" name="description">
<meta content="" name="keywords">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
$(function(){
	$("#ctno").change(function(){
		var selected = $(this).find("option:selected").val();
		$("#cbno").html("<option>----</option>")
		console.log(selected);
		$.ajax({
			url:"adminGetCategoryBot",
			data:"ctno="+selected,
			success:function(r){
				var tag = "";
				console.log(r);
				for(i=0;i<r.length;i++){
					tag +="<option name='"+r[i].cbno+"' value='"+r[i].cbno+"'>"+r[i].cbname+"</option>";
				}
				$("#cbno").append(tag);
			}
		})
		
	});
	
	
	$(".btn").click(function() {
		var sel_ctno = $("#ctno").find("option:selected").val();
		var sel_cbno = $("#cbno").find("option:selected").val();
		console.log(sel_ctno);
		if(sel_ctno == '----' || sel_cbno == '----'){
		alert("* 표시는 반드시 입력하세요");
		return false;
		}
	});
	var count = 1;//첨부파일 태그 개수
	$("#plus").click(function(){
		if(count == 5) return;
		count++;
		$("#file_form").append("<p><input type='file' name='file'></p>");
	});
	$("#minus").click(function(){
		if(count == 1) return;
			$(this).parent().parent().children("p").last().remove();
		count--;
	});
	
	$("#delete").click(function(){
		var src = $(".pimage").attr("src");
		console.log(src);
		$(".img_td").children("img").remove();
		$("#frmUpdate").append("<input type='hidden' name='dImage' value='"+src+"'></td>");
		
		
	});
}); 
</script>
</head>

<body>
	<jsp:include page="/template/admin/header.jsp" />
	<jsp:include page="/template/admin/sidebar.jsp" />
	<main id="main" class="main">

		<div class="pagetitle">
			<h1>General Tables</h1>
			<nav>
				<ol class="breadcrumb">
					<li class="breadcrumb-item"><a href="/">Home</a></li>
					<li class="breadcrumb-item">회원문의 관리</li>
					<li class="breadcrumb-item active">회원 문의 목록</li>
				</ol>
			</nav>
		</div>
		<!-- End Page Title -->
		<!-- ------------------------------------------------------------------------------------------ -->
		<section class="section">
			<div class="row">
				<div class="col-lg-12">
					<div class="card">
						<div class="card-body">
							<form action="productInsert.do" method="post" enctype="multipart/form-data">
							<table class="table">
								<tr>
									<th>상품명</th>
									<td> <input type="text" name="pname"></td>
									<td colspan="4"></td>
								</tr>
								<tr>
									<th>상품 이미지</th>
									
									<td colspan="2" id="file_form">
										<p><input type="file" name="file"> 
										<button type="button" id="plus">+</button> <button type="button" id="minus">-</button></p>
									</td>
									<td><a href="#" id="delete">이미지삭제</a></td>
									<td colspan="2"></td>
								
								<tr>
								<tr>
									<th>상품분류</th>
									<td>
										<select name="ctno" id="ctno">
										<option>----</option>
											<c:forEach var="i" items="${cateTop }">
												<option value="${i.ctno }">${i.ctname }</option>
											</c:forEach>
										</select>
									</td>

									<td>
										<select name="cbno" id="cbno">
											<option>----</option>
										</select>
									</td>
									<td colspan="3"></td>
								</tr>

								<tr>
									<th style="vertical-align: top;">상품디테일</th>
									<td colspan="2"><textarea name="detail" id="detail" cols="80" rows="20"></textarea></td>
									<th>제조사</th>
									<td><input type="text" name="maker"></td>
									<td colspan="2"></td>
								</tr>
								<tr>
									<th>판매자</th>
									<td><input type="text" id="seller" name="seller"></td>
									<th>가격</th>
									<td><input type="text" name="price"></td>
									<th>수량</th>
									<td><input type="text" name="ea"></td>
								</tr>
								<tr>
									<td colspan="6" style="text-align: right;">
										<button type="submit" class="btnAdd">등록하기</button>
										<a href="location.href='adminProductList'">목록으로</a>
									</td>
								</tr>
							</table>
							</form>
						</div>
					</div>
				</div>
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