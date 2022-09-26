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
	$(function(){
		$(){}
	});
</script>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div id="container">
		<table class="board">
			<tr>
				<th>글번호</th>
				<th class="nname">제목</th>
				<th class="ncontent">글</th>
				<th class="ndate">작성일</th>
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
				<td>${dto.nno }</td>
				<td><a href="board.do?nno=${dto.nno }">${dto.nname }  </a></td>
				<td>${dto.ncontent}</td>
				<td>${dto.ndate }</td>
				<td><a href="deleteNotice.do?nno=${dto.nno }">삭제</a></td> <!-- 휴지통 이미지 넣어서 대처하기 -->
				<td><a href="updateNotice.do?nno=${dto.nno }">수정</a></td> <!-- 휴지통 이미지 넣어서 대처하기 -->
				
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