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
		$.ajax({
			url:"adminGetCategoryBot",
			data:"ctno="+selected,
			success:function(r){
				var tag = "";
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
	var i = 0;
	$("#delete").click(function(){
		//var src = $(".pimage").attr("src");
		//console.log(src);
		var d = $(this).children("input[type=hidden]").val();
		$("#frmUpdate").append("<input type='hidden' name='dImage' value='"+d+"'></td>");
		$(".pimage"+d).remove();
		$(this).remove();
		i++;
	});
}); 
</script>
</head>

<body>
	<jsp:include page="/template/admin/header.jsp" />
	<jsp:include page="/template/admin/sidebar.jsp" />
	<main id="main" class="main">

		<div class="pagetitle">
			<h1>상품 정보 수정</h1>
			<nav>
				<ol class="breadcrumb">
					<li class="breadcrumb-item"><a href="admin">Home</a></li>
					<li class="breadcrumb-item">상품관리</li>
					<li class="breadcrumb-item active">상품 정보 수정</li>
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
						<form action="productUpdate.do" method="post" id="frmUpdate" enctype="multipart/form-data">
							<table class="table">
								<tr>
									<th>상품명</th>
									<td>
										<input type="hidden" name="pno" value="${dto.product.pno }">
										<input type="text" name="pname" value="${dto.product.pname }">
									</td>
									<td colspan="4"></td>
								</tr>
								<tr>
									<th>상품 이미지</th>
									<td class="img_td">
									<c:forEach var="f" items="${Filelist }">
									<!-- fileDown.do?fno=${f.fno}&pno=${f.pno} -->
										<img src="shop/img/product/${f.path }" class="pimage${f.fno }"><i class="ri-delete-bin-2-line" id="delete"><input type="hidden" value="${f.fno }"></i>
									</c:forEach>
									</td>

									<td id="file_form" colspan="2">
										<p>
											<input type="file" name="file">
											<button type="button" id="plus">+</button>
											<button type="button" id="minus">-</button>
										</p>
									</td>

									<td colspan="2"></td>
								</tr>
								<tr>
									<th>상품분류</th>
									<td>
										<select name="ctno" id="ctno">
											<c:forEach var="i" items="${cateTop }">
												<option value="${i.ctno }" <c:if test="${i.ctno == dto.categoryTop.ctno }">selected</c:if>>${i.ctname }</option>
											</c:forEach>
										</select>
									</td>

									<td>
										<select name="cbno" id="cbno">
											<option>----</option>
											<c:forEach var="i" items="${cateBot }">
												<c:if test="${i.ctno == dto.categoryTop.ctno }">
													<option value="${i.cbno }" <c:if test="${i.cbno == dto.categoryBot.cbno }">selected</c:if>>${i.cbname }</option>
												</c:if>
											</c:forEach>
										</select>
									</td>
									<td colspan="4"></td>
								</tr>

								<tr>
									<th style="vertical-align: top;">상품디테일</th>
									<td colspan="5"><textarea name="detail" id="content" cols="130" rows="20">${dto.productDetail.detail} </textarea></td>
								</tr>
								<tr>
									<th>제조사</th>
									<td><input type="text" name="maker" value="${dto.productDetail.maker }"></td>
									<th>가격</th>
									<td><input type="text" name="price" value="${dto.productDetail.price }"></td>
									<th>수량</th>
									<td><input type="text" name="ea" value="${dto.productDetail.ea }"></td>
									
								</tr>
								<tr>
									<td colspan="6" style="text-align: right;border:none;">
										<button class="btnAdd cart-btn">수정하기</button>
										<a href="adminProductList">목록으로</a>
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