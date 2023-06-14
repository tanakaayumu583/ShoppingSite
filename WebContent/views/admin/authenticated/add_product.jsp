<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<title>Home</title>
<%@include file="../../header.html"%>
<container>
<div>
	<h2>Home</h2>
	<div>home</div>
	<form action="/ShoppingSite/jp.co.aforce.servlet/Add_product"
		method="post">
		<p>
			<input type="text" name="name" placeholder="商品名">
		</p>
		<p>
			<input type="text" name="description" placeholder="説明">
		</p>
		<div class="button">
			<input id="login" type="submit" value="登録">
		</div>
	</form>
</div>
</container>
<%@include file="../../footer.html"%>