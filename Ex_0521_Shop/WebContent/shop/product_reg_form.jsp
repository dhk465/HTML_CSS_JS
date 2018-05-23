<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script>
	function checkData(f){
		let category = f.category.value;
		let p_num = f.p_num.value;
		let p_name = f.p_name.value;
		let p_company = f.p_company.value;
		let p_price = f.p_price.value;
		let p_saleprice = f.p_saleprice.value;
		let p_content = f.p_content.value;
		let p_image_s = f.p_image_s.value;
		let p_image_l = f.p_image_l.value;
		
		// TODO 유효성 체크
		
		f.submit();
	}
</script>
<style>
	table {
		border: 1px solid #000;
		border-collapse: collapse;
	}
</style>
</head>
<body>
	<jsp:include page="index.jsp"></jsp:include>
	<form name="f" method="POST" action="insert.do" enctype="multipart/form-data">
		<table align="center" width="600">
			<tr>
				<td>제품 카테고리</td>
				<td>
					<select name="category">
						<option value="com001">컴퓨터</option>
						<option value="ele002">가전제품</option>
						<option value="sp003">스포츠</option>
					</select>
				</td>	
			</tr>
			
			<tr>
				<td>제품번호</td>
				<td>
					<input name="p_num">
				</td>
			</tr>
			<tr>
				<td>제품이름</td>
				<td>
					<input name="p_name">
				</td>
			</tr>
			<tr>
				<td>제조사</td>
				<td>
					<input name="p_company">
				</td>
			</tr>
			<tr>
				<td>가격</td>
				<td>
					<input name="p_price">
				</td>
			</tr>
			<tr>
				<td>할인가</td>
				<td>
					<input name="p_saleprice">
				</td>
			</tr>
			<tr>
				<td>제품설명</td>
				<td>
					<textarea name="p_content" cols="50"></textarea>
				</td>
			</tr>
			<tr>
				<td>제품사진 (미리보기)</td>
				<td>
					<input name="p_image_s" type="file">
				</td>
			</tr>
			<tr>
				<td>제품사진 (상세보기)</td>
				<td>
					<input name="p_image_l" type="file">
				</td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<input type="button" value="상품등록" onclick="checkData(this.form);">
					<input type="reset" value="취소">
				</td>
			</tr>
		</table>
	</form>
</body>
</html>