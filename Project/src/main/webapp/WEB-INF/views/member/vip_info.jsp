<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="zxx">

<head>
<meta charset="UTF-8">
<meta name="description" content="Ogani Template">
<meta name="keywords" content="Ogani, unica, creative, html">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>등급별 혜택</title>
</head>

<body>
	<jsp:include page="/template/shop/header.jsp"></jsp:include>
	<jsp:include page="/template/shop/bar.jsp"></jsp:include>
	<jsp:include page="/template/shop/preloader.jsp"></jsp:include>
	<jsp:include page="/template/member/submenu.jsp"></jsp:include>
	
	<!-- Product Details Section Begin -->
	<section class="product-details spad">
		<div class="container">
			<div class="row">
				<jsp:include page="/template/member/sidebar.jsp"></jsp:include>
			
				<div class="col-lg-8 col-md-7 order-md-1 order-1" style="width:60%;float:none;">
					<div class="product__details__tab" style="float:none;padding-top:20px;">
						<ul class="nav nav-tabs" role="tablist">
						<c:forEach var="vip" items="${vip }" begin="0" end="2">
							<li class="nav-item" class="name">
							<c:choose>
								<c:when test="${vno == vip.vno }">
									<a class="nav-link active" data-toggle="tab" href="#v_${vip.vno }" id="v__${vip.vno }" role="tab" aria-selected="true">${vip.vname }<span>★</span></a>
								</c:when>
								<c:otherwise>
									<a class="nav-link" data-toggle="tab" href="#v_${vip.vno }" id="v__${vip.vno }" role="tab" aria-selected="false">${vip.vname }</a>
								</c:otherwise>
							</c:choose>
							</li>
						</c:forEach>
						</ul>
						<div class="tab-content">
						<c:forEach var="vip" items="${vip }" begin="0" end="2">
						<c:choose>
							<c:when test="${vno == vip.vno }">
								<div class="tab-pane active" id="v_${vip.vno }" role="tabpanel">
							</c:when>
							<c:otherwise>
								<div class="tab-pane" id="v_${vip.vno }" role="tabpanel">
							</c:otherwise>
						</c:choose>
								<div class="product__details__tab__desc" style="text-align: center;padding-top:80px;">
									<h6>${vip.vname }</h6>
									<p>적립률 : ${vip.vpercent }%</p>
									<p>달성조건 : ${vip.vcondition }</p>
									<c:choose>
										<c:when test="${vno < vip.vno }">
											<p>해당 등급까지 : ${vip.vcondition - total }</p>
										</c:when>
									</c:choose>
								</div>
							</div>
						</c:forEach>	
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- Product Details Section End -->
	<jsp:include page="/template/shop/footer.jsp"></jsp:include>
	<jsp:include page="/template/shop/js.jsp"></jsp:include>
</body>
</html>