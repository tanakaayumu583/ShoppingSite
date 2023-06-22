<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.util.List"%>
<%@ page import="javax.servlet.http.HttpSession"%>
<%
List<jp.co.aforce.bean.ProductBean> list = (List<jp.co.aforce.bean.ProductBean>) session
		.getAttribute("search_product_list");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Home</title>
<%@include file="../../../../css/admin/product_list.css"%>
</head>
<body>
	<main>
		<jsp:include page="../header_admin.jsp" />
		<container>
		<div class="p-facility_list o-box is-main-content">
			<h2 class="o-title_member-search">商品追加</h2>
			<!-- ▼商品リスト -->
			<form class="product_add_form"
				action="/ShoppingSite/jp.co.aforce.servlet/Add_product"
				enctype="multipart/form-data" method="post">
				<table>
					<tbody>
						<tr>
							<th>商品名</th>
							<td><textarea name="name"></textarea></td>
						</tr>
						<tr>
							<th>商品説明</th>
							<td><textarea name="description"></textarea></td>
						</tr>
						<tr>
							<th>値段</th>
							<td><textarea name="price"></textarea></td>
						</tr>
						<tr>
							<th>商品画像</th>
							<span><label><input type="file" name="pict">ファイルを選択</label>
								<span>※選択できる画像は１枚までです</span> </span>
						</tr>
					</tbody>
				</table>
				<div class="button">
					<input id="login" type="submit" value="登録">
				</div>
			</form>
			<!-- ▲商品リスト -->
		</div>
		</container>
	</main>

	<%@include file="../../footer.html"%>