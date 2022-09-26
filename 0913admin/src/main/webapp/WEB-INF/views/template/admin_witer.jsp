<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
<!-- <script src="https://cdn.ckeditor.com/ckeditor5/34.2.0/classic/ckeditor.js"></script> -->
<script src="/ckeditor.js"></script>
<script src="/UploadAdapter.js"></script>
<script>
	function uploadAdapterPlugin(editor){
		editor.plugins.get('FileRepository').createUploadAdapter = (loader) => {
	        return new UploadAdapter(loader)
	    }
	}
	
</script>
<body>
<form action="boardWrite.do" method="post">
<div id="container">
<div>
			<table>
				<tr>
					<th>제목</th>
					<td><input type="text" name="nname"></td>
				</tr>
				<tr>
					<th style="vertical-align: top;">내용</th><td><textarea name="ncontent" id="ncontent"></textarea></td>
				</tr>
				<tr>
					<td style="text-align: right;">
						<button class="btn">글쓰기</button>
						<a href="javascript:history.back();" class="btn">뒤로가기</a>
					</td>
				</tr>
				
			</table>
			</div>
 			 </div>
		</form>
</body>
</html>