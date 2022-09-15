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
<!-- custom css -->
<style type="text/css">
	label{font-weight: bold;}
	.col-sm-10{padding-top:7px;}
</style>

<!-- jqeury -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript">
	$(function(){
		$(".frmAnswer").submit(function(e){
			e.preventDefault();
			var d = $(this).serialize();
			$.ajax({
				url:"qanswer.do",
				data:d,
				type:"post",
				success:function(r){
					if(r == '1'){
						alert('답변 등록 완료');
						location.reload();
					}else{
						alert('답변 등록 실패');
						$("input[name=qanswer]").focus();
					}
				}
			});
		})
	})
</script>
</head>

<body>
	<jsp:include page="/template/admin/header.jsp"/>
	<jsp:include page="/template/admin/sidebar.jsp"/>

	<main id="main" class="main">

		<div class="pagetitle">
			<h1>회원 문의 상세</h1>
			<nav>
				<ol class="breadcrumb">
					<li class="breadcrumb-item"><a href="/">Home</a></li>
					<li class="breadcrumb-item"><a href="qnaMain">문의내역 관리</a></li>
					<li class="breadcrumb-item active">회원 문의 상세</li>
				</ol>
			</nav>
		</div>
		<!-- End Page Title -->
		<!-- ------------------------------------------------------------------------------------------ -->
		<div class="container-fluid">
			<div class="row">
				<div class="col-lg-8">
					<div class="card">
						<div class="card-body">
							<h5 class="card-title" style="font-weight:bold;">${dto.qna.qtitle }</h5>
							<!-- General Form Elements -->
							<form class="frmAnswer">
								<div class="row mb-3">
									<label class="col-sm-2 col-form-label">작성자</label>
									<div class="col-sm-10">
										${dto.member.id }
									</div>
								</div>
								<div class="row mb-3">
									<label class="col-sm-2 col-form-label">내용</label>
									<div class="col-sm-10" style="min-height: 100px;">
										${dto.qna.qcontent }
									</div>
								</div>
								<hr>
								<div class="row mb-3">
										<c:choose>
											<c:when test="${dto.qna.qanswer == NULL }">
											<label class="col-sm-2 col-form-label">답변</label>
											<div class="col-sm-10">
												<textarea class="form-control" style="height: 100px" name="qanswer" id="qanswer"></textarea>
											</div>
											</c:when>
											<c:otherwise>
											<label class="col-sm-2 col-form-label">답변일</label>
											<div class="col-sm-10">${dto.qna.qadate }</div>
											<label class="col-sm-2 col-form-label">답변</label>
											<div class="col-sm-10">
												${dto.qna.qanswer }
											</div>
											</c:otherwise>
										</c:choose>
								</div>
								<div class="row mb-3">
									<label class="col-sm-9 col-form-label"></label>
									<div class="col-sm-3">
										<input type="hidden" name="qno" value="${dto.qna.qno }">
										<button type="submit" class="btn btn-primary">답변하기</button>
										<button type="button" class="btn btn-dark" onclick="location.href='qnaMain'">목록으로</button>
									</div>
								</div>

							</form>
							<!-- End General Form Elements -->

						</div>
					</div>

				</div>
			</div>
		</div>
	</main>
	<!-- End #main -->
	<jsp:include page="/template/admin/footer.jsp"></jsp:include>
	<a href="#" class="back-to-top d-flex align-items-center justify-content-center"><i class="bi bi-arrow-up-short"></i></a>
	<jsp:include page="/template/admin/js.jsp"></jsp:include>
</body>

</html>