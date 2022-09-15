<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 페이지 회원관리</title>

<!-- jqeury -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<script>
	function add_event_add(){
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
	}
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
	}
	function add_event_delete(){
		$(".btnDelete").click(function(){
			var d = "id="+ $(this).parent().parent().find("input[name=id]").val();
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
	}
		
	$(function(){
		add_event_add();
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
					for(i=0;i<r.length;i++){
						tag += "<tr>";
						tag += '<td><input type="text" name="mno" value="'+r[i].mno+'" readonly></td>';
						tag += '<td><input type="text" name="id" value="'+r[i].id+'"></td>';
						tag += '<td><input type="text" name="pwd" value="'+r[i].pwd+'"></td>';
						tag += '<td><input type="text" name="name" value="'+r[i].name+'"></td>';
						tag += '<td><input type="text" name="birth" value="'+r[i].birth+'"></td>';
						tag += '<td><input type="text" name="tel" value="'+r[i].tel+'"></td>';
						tag += '<td><input type="text" name="address" value="'+r[i].address+'"></td>';
						tag += '<td><input type="text" name="vno" value="'+r[i].vno+'"></td>';
						tag += '<td><input type="text" name="vname" value="'+r[i].vname+'"></td>';
						tag += '<td><input type="text" name="mileage" value="'+r[i].mileage+'"></td>';
						tag += '<td><button type="button" class="btnUpdate">수정</button>';
						tag += '<button type="button" class="btnDelete">삭제</button>';
						tag += '</td>';
						tag += '</tr>';
					}
					$(".search_result").html(tag);
					add_event_add();
					add_event_update();
					add_event_delete();
				}
			});
		});//btn_search click
		
		//생년월일로 검색 시 입력 창을 date로 변경, 그 외에 text로 변경
		$("#kind").change(function(){
			if($(this).val() == 'birth') $("input[name=search]").attr("type","date");
			else $("input[name=search]").attr("type","text");
		});
	});
</script>
<body>
<%-- <jsp:include page="/template/admin/header.jsp"/>
<jsp:include page="/template/admin/sidebar.jsp"/> --%>
<div class="result">
	<form id="frm_search">
		<select name="kind" id="kind">
			<option value="mno">회원번호</option>
			<option value="id">아이디</option>
			<option value="name">이름</option>
			<option value="birth">생년월일</option>
			<option value="tel">전화번호</option>
			<option value="address">주소</option>
			<option value="vno">등급번호</option>
			<option value="vname">등급</option>
			<option value="mileage">마일리지</option>
		</select>
		<input type="text" name="search">
		<button type="button" class="btn_search">검색</button>
		
	</form>
	<form>
	<table>
	<thead>
	<tr>
		<th>아이디</th>
		<th>암호</th>
		<th>이름</th>
		<th>생년월일</th>
		<th>전화번호</th>
		<th>주소</th>
		<th>마일리지</th>
		<th>비고</th>
	</tr>
	</thead>
	<tbody>
		<tr>
		<td><input type="text" name="id"></td>
		<td><input type="text" name="pwd"></td>
		<td><input type="text" name="name"></td>
		<td><input type="date" name="birth"></td>
		<td><input type="text" name="tel"></td>
		<td><input type="text" name="address"></td>
		<td><input type="text" name="mileage"></td>
		<td><button type="button" class="btnAdd">추가</button></td>
		</tr>
	</tbody>
	</table>
	</form>
	
	<table>
	<thead>
	<tr>
		<th>회원번호</th>
		<th>아이디</th>
		<th>암호</th>
		<th>이름</th>
		<th>생년월일</th>
		<th>전화번호</th>
		<th>주소</th>
		<th>등급번호</th>
		<th>등급</th>
		<th>마일리지</th>
		<th>비고</th>
	</tr>
	</thead>
	<tbody class="search_result">
	<c:forEach var="obj" items="${requestScope.list }">
		<tr>
		<td><input type="text" name="mno" value="${obj.mno }" readonly></td>
		<td><input type="text" name="id" value="${obj.id }"></td>
		<td><input type="text" name="pwd" value="${obj.pwd }"></td>
		<td><input type="text" name="name" value="${obj.name }"></td>
		<td><input type="date" name="birth" value="${obj.birth }"></td>
		<td><input type="text" name="tel" value="${obj.tel }"></td>
		<td><input type="text" name="address" value="${obj.address }"></td>
		<td><input type="text" name="vno" value="${obj.vno }"></td>
		<td><input type="text" name="vname" value="${obj.vname }"></td>
		<td><input type="text" name="mileage" value="${obj.mileage }"></td>
		
		<td><button type="button" class="btnUpdate">수정</button>
		<button type="button" class="btnDelete">삭제</button>
		</td>
		</tr>
	</c:forEach>
	</tbody>
	</table>
	</div>
<jsp:include page="/template/admin/js.jsp"></jsp:include>
</body>
</html>