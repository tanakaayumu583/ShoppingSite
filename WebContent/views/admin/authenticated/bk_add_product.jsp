<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<title>Home</title>
<%@include file="../../header.html"%>
<container>
<div>
	<h2>商品追加</h2>
	<div></div>
	<form action="/ShoppingSite/jp.co.aforce.servlet/Add_product" enctype="multipart/form-data" method="post">
		<p>
			<input type="text" name="name" placeholder="商品名">
		</p>
		<p>
			<input type="text" name="description" placeholder="説明">
		</p>
		<p>
			<input type="text" name="price" placeholder="価格">
		</p>
		<p>
			<input type="file" name="pict">
		</p>

		<div class="button">
			<input id="login" type="submit" value="登録">
		</div>
	</form>
</div>
</container>
<%@include file="../../footer.html"%>