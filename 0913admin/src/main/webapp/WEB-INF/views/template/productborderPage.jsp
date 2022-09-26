<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
	#container{
		/* background-color: lime; */
	}
	.board{
		margin:20px auto;
		border-collapse: collapse;
	}
	.board th, .board td{
		padding: 10px;
		text-align: center;
	}
	.board th{
		border-top : 2px solid black;
		border-bottom : 2px solid black;
	}
	.board td{
		border-top : 1px solid black;
		border-bottom : 1px solid black;
	}
	.board tr:last-child > td {
		border-bottom : 2px solid black;
	}
	.title{
		width:500px;	
	}
	.writer{
		width:150px;	
	}
	.date{
		width:200px;
	}
	.page_bar{
		position:relative;
		text-align: center;
	}
	.page_bar a:link,.page_bar a:visited {
		color:black;
		text-decoration: none;
		font-size : 18px;
		margin-left: 10px;
		margin-right: 10px;
	}
	.page_bar a:hover{
		font-weight: bold;
		color:red;
	}
	.btn_writer{
		position:absolute;
		right:0px;
	}
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
function add_event_delete(){
		var d = "pno="+ $("#pno").val();
		console.log(d);
		$.ajax({
			url:"deleteProductBorder.do",
			data : d,
			type: "post",
			success:function(r){
				console.log(r);
				if(r == 1)
					alert("회원 정보 삭제 완료");
				else 
					alert("회원 정보 삭제 실패");
				location.reload();
			}
		});
}
</script>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div id="container">
		<table class="board">
			<tr>
				<th>글번호</th>
				<th>상품명</th>
				<th>대분류</th>
				<th>소분류</th>
				<th>이미지</th>
				<th>메이커</th>
				<th>수량</th>
				<th>가격</th>
			</tr>
	<!-- 게시판 기능 추가 기존 게시판에 있는 내용을 el과 jstl로 표현 -->
			<!--  
		<c:if test="${requestScope.list ==null}">
			<script>
				location.href="boardView.do?pageNo=1";
				
			</script>
		</c:if>
			-->
		<c:forEach var="dto" items="${requestScope.list }">
			<tr>
				<td  value="${dto.pno }">${dto.pno } <input id="pno" type="hidden" value="${dto.pno }"></td>
				<td><a href="board.do?pno=${dto.pno }">${dto.pname }  </a></td>
				<td>${dto.ctname}</td>
				<td>${dto.cbname }</td>
				<td>${dto.image }</td>
				<td>${dto.maker }</td>
				<td>${dto.ea }</td>
				<td>${dto.price }</td>
				<td><button onclick="add_event_delete()" class="delete">삭제</button></td> <!-- 휴지통 이미지 넣어서 대처하기 -->
				<td><a href="updateProductBorder.do?pno=${dto.pno }">수정</a></td> <!-- 휴지통 이미지 넣어서 대처하기 -->
				
			</tr>
		</c:forEach>
		<!--  
			<tr>
			<td colspan="7">
					<div class="page_bar">
						<c:if test="${pagging.previousPageGroup }">
							<a href="main.do?pageNo=${pagging.startPageOfPageGroup - 1 }">◀</a>
						</c:if>
						<c:forEach var="i" begin="${pagging.startPageOfPageGroup}" 
						end="${pagging.endPageOfPageGroup}">
							<a href="main.do?pageNo=${i }">${ i}</a>
						</c:forEach>
					
						<c:if test="${pagging.nextPageGroup }">
							<a href="main.do?pageNo=${pagging.endPageOfPageGroup + 1 }">▶</a>
						</c:if>
					</div>
			</tr>
			-->
		</table>
	</div>
</body>
</html>