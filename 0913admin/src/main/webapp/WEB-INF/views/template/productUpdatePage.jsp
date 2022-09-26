<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">

	#container{
		/* background-color: lime; */
		border: 1px solid black;
		width: 1500px;
		margin:0 auto;
	}
	#container table{
		width:1500px;
		border-collapse: collapse;
		margin:0 auto;
		
	}
	#container th{
		/* width:150px; */
		padding:5px;
	}
	#container td{
		width: 300px;
		padding:5px;
		height: 40px;
		text-align: center;
	}
	#container input{
		width: 100%;
		height:40px;
		box-sizing:border-box;
		border-width : 1px;
		border-radius: 5px;
	}
	.btn{
		text-decoration: none;
		background-color: #e8e8e8;
		width: 80px;
		padding:5px 0px;
		font-weight:normal;
		border : 1px solid #585858;
		color : black;
		font-size:14px;
		box-sizing: border-box;
	}
	.btn:hover{
		background-color: #282828;
		color:#FFFFFF
	}
	.ck-editor__editable_inline {
    	min-height: 500px;
	}
</style>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>
<!-- <script src="https://cdn.ckeditor.com/ckeditor5/34.2.0/classic/ckeditor.js"></script> -->
<script src="/ckeditor.js"></script>
<script src="/UploadAdapter.js"></script>
<script>
	function uploadAdapterPlugin(editor){
		editor.plugins.get('FileRepository').createUploadAdapter = (loader) => {
	        return new UploadAdapter(loader)
	    }
	}
	$(function(){
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
		var editor;
		ClassicEditor.create($("#content")[0],{
			extraPlugins:[uploadAdapterPlugin]
		})
		.then(editor => {
			console.log("에디터 초기화 완료",editor);
			myEditor = editor;
		}).catch(error =>{
			console.log(error);
		});
	});
	$(function(){
		$("#delete").click(function(){
			var src = $(".pimage").attr("src");
			console.log(src);
			$(".img_td").children("img").remove();
			$("#frmUpdate").append("<input type='hidden' name='dImage' value='"+src+"'></td>");
			
			
		});
		
	});
</script>
<body>
<form action="productUpdate.do" method="post" id="frmUpdate">
<div id="container">
<div>
			

			<table>
		
				<tr>
					<th>상품명</th>
					<td><input type="hidden" name="pno" value="${requestScope.dto.pno }">
					
					<input type="text" name="pname" value="${requestScope.dto.pname }"></td>
				</tr>
				<tr>
					<th>상품 이미지</th>
					<td class="img_td"><img class="pimage" name="image" src="${requestScope.dto.image}"></td>
					
					<td colspan="2" id="file_form">
						<p><input type="file" name="file"> 
						<button type="button" id="plus">+</button> <button type="button" id="minus">-</button></p>
					</td>
					
					<td><a href="#" id="delete">이미지삭제</a></td>
				</tr>
				<tr>
					<th style="vertical-align: top;">상품디테일</th>
					<td><textarea name="detail" id="ncontent">${requestScope.dto.detail} </textarea></td>
					<th>메이커</th>
					<td><input type="text" name="maker" value="${requestScope.dto.maker }"></td>
				</tr>
				<tr>
					<th>가격</th>
					<td><input type="text" name="price" value="${requestScope.dto.price }"></td>
					<th>수량</th>
					<td><input type="text" name="ea" value="${requestScope.dto.ea }"></td>
				</tr>
				<tr>
					<td style="text-align: right;">
						<button class="btn">수정하기</button>
						<a href="javascript:history.back();" class="btn">뒤로가기</a>
					</td>
				</tr>
				
			</table>
			</div>
 			 </div>
		</form>
</body>
</html>