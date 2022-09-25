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
		width: 1200px;
		margin:0 auto;
	}
	#container table{
		width:1200px;
		border-collapse: collapse;
		margin:0 auto;
		
	}
	#container th{
		/* width:150px; */
		padding:5px;
	}
	#container td{
		width: 500px;
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
</head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
$(function(){
	$("#ctno").change(function(){
		var selected = $(this).find("option:selected").val();
		console.log(selected);
				$("#cbno").html("<option>----</option>")
		$.ajax({
			url:"productSelect.do",
			data:"selected="+selected,
			success:function(r){
				var tag = "";
				for(i=0;i<r.length;i++){
				console.log(r[i].cbname);
				
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
	var editor;
	ClassicEditor.create($("#detail")[0],{
		extraPlugins:[uploadAdapterPlugin]
	})
	.then(editor => {
		console.log("에디터 초기화 완료",editor);
		myEditor = editor;
	}).catch(error =>{
		console.log(error);
	});
	
	$("#delete").click(function(){
		var src = $(".pimage").attr("src");
		console.log(src);
		$(".img_td").children("img").remove();
		$("#frmUpdate").append("<input type='hidden' name='dImage' value='"+src+"'></td>");
		
		
	});
}); 
//function(){}
</script>
<!-- <script src="https://cdn.ckeditor.com/ckeditor5/34.2.0/classic/ckeditor.js"></script> -->
<script src="/ckeditor.js"></script>
<script src="/UploadAdapter.js"></script>

<body>
<div id="container">
<div>
<form action="productInsert.do" method="post" enctype="multipart/form-data">
			<table>
				<tr>
					<th>상품명</th>
					<td><input type="text" name="pname"></td>
				</tr>
				<tr>
					 <th>상품 이미지</th>
					<td class="img_td">
					<c:forEach var="f" items="${Filelist }">
                      <a href="fileDown.do?fno=${f.fno}&pno=${f.pno}">
                     ${f.fileName}</a><br>
                     <c:if test="${f.type =='image' }">
                        <img src="fileDown.do?fno=${f.fno}&pno=${f.pno}" class="pimage">
                     </c:if> 
               		</c:forEach> 
               </td>
					<td colspan="2" id="file_form">
						<p><input type="file" name="file"> 
						<button type="button" id="plus">+</button> <button type="button" id="minus">-</button></p>
					</td>
					
					<td><a href="#" id="delete">이미지삭제</a></td>
				
				<tr>
				<td>* 상품</td>
					<td><select name="ctno" id="ctno"><!--onchange="change(this.value);"  -->
						<option>----</option>
						<c:forEach var="dto" items="${requestScope.list }">
						<option value="${dto.ctno }"> 
							${dto.ctname }
						</option>
						</c:forEach>
					</select>
					</td>
					
					<td><select name="cbno" id="cbno">
						<option>----</option>
						
					</select>
					</td>
				</tr>
				
				<tr>
					<th style="vertical-align: top;">상품 정보</th><td><textarea name="detail" id="detail"></textarea></td>
				</tr>
				 <tr>
					<th>판매자 :</th>
					<td><input type="text" placeholder="수량을 입력하세요" id="seller" name="seller"></td>
					<th>maker :</th>
					<td><input type="text" placeholder="가격을 입력하세요" id="maker" name="maker"></td>
				</tr> 
				 <tr>
					<th>가격 :</th>
					<td><input type="text" placeholder="가격을 입력하세요" id="price" name="price"></td>
					<th>수량 :</th>
					<td><input type="text" placeholder="수량을 입력하세요" id="ea" name="ea"></td>
				</tr> 
				
				<tr>
					<td style="text-align: right;">
						<button class="btn" type="submit">상품등록</button>
						<a href="location.href='adminProductList'">목록으로</a>
					</td>
				</tr>
			</table>
		</form>
			</div>
 			 </div>
</body>
</html>